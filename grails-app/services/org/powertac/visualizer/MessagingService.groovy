package org.powertac.visualizer

import org.powertac.common.interfaces.VisualizationListener
import org.powertac.common.interfaces.InitializationService
import org.powertac.common.Broker
import org.powertac.common.CashPosition
import org.powertac.common.Competition
import org.powertac.common.CustomerInfo
import org.powertac.common.WeatherReport

class MessagingService implements VisualizationListener, InitializationService {

    static transactional = true

    def visualizationProxyService
  
    def competitionName
    def competitionId
    def brokerList
	
	def splitString
	def word
	def concatString = ""
    
    List agents = []
	List customers = []
	
	WeatherReport weatherReport

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

    @Override
    public void receiveMessage(msg) {
        /**
         * Parse the initial message and collect information about brokers
		 * (agents) and other relevant info about the competition
         */
		 
		/**
		 * The following code is used to print the messages and their classes
		 * that the visualizer receives.
		 */ 
		// if (msg instanceof ArrayList) {
			// println "Arraylist -> "
			// for (i in msg) {
				// println "    ...of >> " + msg[0].getClass()
			// }
		// } else {
			// println "New message >> " + msg.getClass()
		// }
		
		/**
		 * Check the message types and parse them
		 */
		if (msg instanceof WeatherReport) {
			weatherReport = msg
		} else if (msg instanceof ArrayList) {
			/**
			 * There are a lot of messages sent as ArrayLists, they need to be
			 * parsed with care
			 * The usual procedure is to check the class of the first message
			 * and then parse the message accordingly
			 */
			 
			 if (msg[0] instanceof CustomerInfo) {
				for (customer in msg) {
					println "customer : " + customer.name
					splitString = customer.name.split()
					for (word in splitString) {
						concatString = concatString + word
					}
					def customerInstance = new Customer(name: concatString)
					concatString = ""
					customers.add(customerInstance)
					//customerInstance.save()
				}
			 }
			 
		} else if (msg instanceof Competition) {
            competitionName = msg.name
            competitionId = msg.id
            brokerList = msg.brokers
            for (broker in brokerList) {
                /** 
				 * TODO: Create an instance of agent for every broker in the 
				 * message
				 * ISSUE: Brokers are only strings, not broker instances
				 */
				splitString = broker.split()
				for (word in splitString) {
					concatString = concatString + word
				}
                def agentInstance = new Agent(username: concatString)
				concatString = ""
                agents.add(agentInstance)
				//agentInstance.save()
            }
        } 
    }

}
