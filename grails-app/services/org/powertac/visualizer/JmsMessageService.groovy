package org.powertac.visualizer

import grails.plugin.jms.Queue
import grails.converters.XML

class JmsMessageService {

  static transactional = true

  static expose = ['jms']

  def jmsService

  @Queue(name = 'public.visualizerIn')
  def handleIncomingMessage(String string) {
    println 'Received raw message: ' + string
    def parsingResult = XML.parse (string)
    println "Parsing object with name property: ${parsingResult?.name}"
  }
}
