package org.powertac.visualizer

import grails.converters.XML
import org.powertac.common.Competition

class JmsTestController {

  def jmsService

  def index = {
  }

  def sendCompetition = {
    def competition = Competition.findByName('test')
    if (!competition) competition = new Competition(name: 'test').save()
    String competitionXml = competition as XML
    jmsService.send('public.visualizerIn', competitionXml, 'standard', null)
    flash.message = "Competition created and sent to JMS queue"
    redirect (action: '')
  }
}
