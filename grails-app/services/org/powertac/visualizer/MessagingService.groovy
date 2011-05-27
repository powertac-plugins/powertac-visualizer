package org.powertac.visualizer

import org.powertac.common.interfaces.VisualizationListener
import org.powertac.common.interfaces.InitializationService
import org.powertac.common.Competition

class MessagingService implements VisualizationListener, InitializationService {

  static transactional = true

  def visualizationProxyService

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
    log.info "Registering the visualizer with the visualizerProxy"
  }

  @Override
  public void receiveMessage(msg) {
    log.info "New message received"
  }

}
