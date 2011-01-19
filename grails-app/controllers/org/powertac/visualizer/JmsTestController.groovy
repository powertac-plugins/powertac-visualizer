package org.powertac.visualizer

import grails.converters.XML
import org.powertac.common.Competition

class JmsTestController {

  def jmsMessageService

  def index = {
  }

  def sendCompetition = {
    jmsMessageService.sendTestMessage (new Competition(name: 'testCompetition').save() as XML)
  }
}
