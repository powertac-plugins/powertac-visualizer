package org.powertac.visualizer

import org.powertac.common.interfaces.VisualizationProxy

class MessagingService implements org.powertac.common.interfaces.VisualizationListener {

    static transactional = true

    def visualizationProxyService

    /**
     * Register the visualizer service with the Visualizer proxy
     */
    void init(/*PluginConfig pluginConfig*/) {
        visualizationProxyService?.registerVisualizationListener(this)
		log.info "Registering the visualizer with the visualizerProxy"
    }

    @Override
    public void receiveMessage(msg) {
		log.info "New message received"
    }
	
}
