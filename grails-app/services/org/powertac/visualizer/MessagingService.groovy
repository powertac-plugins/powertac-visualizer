package org.powertac.visualizer

import org.powertac.common.interfaces.VisualizationListener
import org.powertac.common.interfaces.InitializationService
import org.powertac.common.BalancingTransaction
import org.powertac.common.Broker
import org.powertac.common.CashPosition
import org.powertac.common.Competition
import org.powertac.common.CustomerInfo
import org.powertac.common.WeatherReport
import org.powertac.common.command.CustomerBootstrapData
import org.powertac.common.command.SimStart
import org.powertac.common.msg.TimeslotUpdate

class MessagingService implements VisualizationListener, InitializationService
{
  static transactional = true

  def visualizationProxyService

  def competitionName
  def competitionId
  def brokerList

  def timeslotNum = 1

  List agents = []
  List customers = []

  WeatherReport weatherReport

  BigDecimal totalBalancingSum = 0.0
  BigDecimal totalChargingSum = 0.0

  //Boolean competitionRunning = false

  @Override
  void setDefaults() {
    /**
     * Can be empty
     */
  }

  @Override
  String initialize(Competition competition, List<String> completedInits) {
    this.init()
    return "Visualizer"
  }

  /**
   * Register the visualizer service with the Visualizer proxy
   */
  void init() {
    visualizationProxyService?.registerVisualizationListener(this)
    log.info ">>> Registering the visualizer with the visualizerProxy"
  }
  
  /**
   * A small bit of code here removes the spaces from the broker names, so 
   * that they don't break the web layout
   */
  String removeSpaces(name) {
    def spacelessName = ""

    def splitString = name.split()
    for (word in splitString) {
      spacelessName = spacelessName + word
    }
    return spacelessName
  }

  /**
   * This method returns the mean from the values in a ONE-dimensional field
   */
  BigDecimal getMeanSimple(list) {
    def sum = 0
    for (item in list) {
      sum += item
    }
    return (sum/list.size())
  }

  /**
   * This method returns the mean from the values in a TWO-dimensional field
   */
  BigDecimal getMeanAdvanced(list) {
    def sum = 0
    for (item in list) {
      sum += item[0]
    }
    return (sum/list.size())
  }

  /**
   * Parse the initial message and collect information about brokers
   * (agents) and other relevant info about the competition
   */
  @Override
  public void receiveMessage(msg) 
  {
    log.error("unknown message type $msg")
  }
  
  void receiveMessage (SimStart msg)
  {
    /**
     * Clear out the variables for starting of the simulation
     */
    totalBalancingSum = 0.0
    totalChargingSum = 0.0

    timeslotNum = 1;

    agents = []
    customers = []

    competitionName = ""
    competitionId = ""
    brokerList = []
  }

  void receiveMessage (WeatherReport msg) 
  {
    weatherReport = msg
  } 

  void receiveMessage (TimeslotUpdate msg) 
  {
    timeslotNum += 1
  } 

  void receiveMessage (CashPosition msg) 
  {
    for (agent in agents) {
      // JEC - why are we doing this for every incoming message??
      // There must be a better way
      if (agent.username == removeSpaces(message.broker.username)) {
        agent.balance = message.balance
        agent.balanceHistory.add([timeslotNum, agent.balance])
      }
    }
  }

  void receiveMessage (BalancingTransaction msg) 
  {
    for (agent in agents) {
      if (agent.username == removeSpaces(message.broker.username)) {
        /**
         * Process the balancing quantities
         */
        agent.balancingQuantity = message.quantity
        agent.balancingQuantityHistory.add([
          timeslotNum,
          agent.balancingQuantity
        ])
        agent.balancingQuantityMean = getMeanAdvanced(agent.balancingQuantityHistory)

        totalBalancingSum += message.quantity
        /**
         * Process the balancing charges
         */
        agent.balancingCharge = message.charge
        agent.balancingChargeHistory.add(agent.balancingCharge)
        agent.balancingChargeMean = getMeanSimple(agent.balancingChargeHistory)

        totalChargingSum += message.charge
      }
    }
  }

  void receiveMessage (Competition msg) 
  {
    competitionName = msg.name
    competitionId = msg.id
    brokerList = msg.brokers
    for (broker in brokerList) {
      def agentInstance = new Agent(username: removeSpaces(broker))
      agents.add(agentInstance)
    }
  }

  void receiveMessage (CustomerBootstrapData msg) 
  {
    def customer = msg.customer
    def customerInstance = new Customer(name: removeSpaces(customer.name))
    //println "customer : " + customerInstance.name
    customerInstance.type = customer.customerType
    customerInstance.population = customer.population
    customerInstance.multiContracting = customer.multiContracting
    customerInstance.canNegotiate = customer.canNegotiate
    customerInstance.powerTypes = customer.powerTypes
    customers.add(customerInstance)
  }

  /**
   * There are a lot of messages sent as ArrayLists, they need to be
   * parsed with care
   * The usual procedure is to check the class of the first message
   * and then parse the message accordingly
   */
  void receiveMessage (ArrayList msg)
  {
    // recursively parse contained messages by class
    for (message in msg) {
      receiveMessage(msg)
    }
  }
}
