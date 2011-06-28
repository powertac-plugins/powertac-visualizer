package org.powertac.visualizer

import org.powertac.common.interfaces.VisualizationListener
import org.powertac.common.interfaces.InitializationService
import org.powertac.common.Competition
import org.powertac.common.Broker

class MessagingService implements VisualizationListener, InitializationService {

    static transactional = true

    def visualizationProxyService
  
    def competitionName
    def competitionId
    def brokers
    
	Agent agent
    List agents = []

    @Override
    void setDefaults() {
        // Can be empty
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
         * Parse the initial message and collect information about brokers (agents)
         * and other relevant info about the competition
         */
        //println ">>> New message"
        if (msg instanceof Competition) {
            //println ">>> Competition"
            competitionName = msg.name
            competitionId = msg.id
            brokers = msg.brokers
            for (broker in brokers) {
                // TODO: Create an instance of agent for every broker in the message
                def agent = new Agent(username: broker)
                agents.add(agent)
				agent.save()
            }
            
            println "--- <Brokers> ---"
            for (agent in agents) {
                println agent.username
                println agent.balance
            }
            println "--- </Brokers> ---"
        }
		
		//TODO: Other message instances parsing
    }

}
