package org.powertac.visualizer

class JmsStatsController {

  def jmsBrokerManagementService

  def index = {
    redirect (action: 'stats', params: params)
  }

  def stats = {
    [stats: jmsBrokerManagementService.getStats()]
  }

  def reset = {
    jmsBrokerManagementService.deleteTopicsAndQueues()
    jmsBrokerManagementService.initTopicsAndQueues()
    flash.message = 'Topics and Queues reset'
    redirect action: 'index'
  }
}
