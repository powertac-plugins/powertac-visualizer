package org.powertac.visualizer

import grails.converters.XML
import java.security.SecureRandom
import org.powertac.common.enumerations.BuySellIndicator
import org.powertac.common.enumerations.OrderType
import org.powertac.common.enumerations.ProductType
import org.powertac.common.*

class JmsTestController {

  private static final SecureRandom random = new SecureRandom()
  def jmsService

  def index = {
  }

  def sendCompetition = {
    def competition = Competition.findByName('test')
    if (!competition) competition = new Competition(name: 'test', current: true, enabled: true).save()
    String competitionXml = competition as XML
    jmsService.send('public.visualizerIn', competitionXml, 'standard', null)
    flash.message = "Competition created and sent to JMS queue"
    redirect(action: '')
  }

  def sendBroker = {
    def competition = Competition.findByName('test')
    if (!competition) {
      flash.message = "Create and send competition first"
    } else {
      def broker = Broker.findByCompetitionAndUserName(competition, 'testBroker')
      if (!broker) broker = new Broker(competition: competition, userName: 'testBroker', apiKey: 'testApiKey-which-needs-to-be-longer-than-32-characters').save()
      String xmlString = broker as XML
      jmsService.send('public.visualizerIn', xmlString, 'standard', null)
      flash.message = "Broker created and sent to JMS queue"
    }
    redirect(action: '')
  }

  def sendProduct = {
    def competition = Competition.findByName('test')
    if (!competition) {
      flash.message = "Create and send competition first"
    } else {
      def product = Product.findByCompetition(competition)
      if (!product) product = new Product(competition: competition, productType: ProductType.Future).save()
      String xmlString = product as XML
      jmsService.send('public.visualizerIn', xmlString, 'standard', null)
      flash.message = 'Product created and sent to JMS queue'
    }
    redirect(action: '')
  }

  def sendTimeslot = {
    def competition = Competition.findByName('test')
    if (!competition) {
      flash.message = "Create and send competition first"
    } else {
      def timeslot = Timeslot.findByCompetition(competition)
      if (!timeslot) timeslot = new Timeslot(competition: competition, serialNumber: 0, enabled: true, current: true).save()
      String xmlString = timeslot as XML
      jmsService.send('public.visualizerIn', xmlString, 'standard', null)
      flash.message = 'Timeslot created and sent to JMS queue'
    }
    redirect(action: '')
  }

  def sendShout = {
    def competition = Competition.findByName('test')
    if (!competition) {
      flash.message = "Create and send competition first"
    } else {
      def timeslot = Timeslot.findByCompetition(competition)
      def product = Product.findByCompetition(competition)
      def broker = Broker.findByCompetition(competition)
      if (!timeslot || !product || broker) {
        flash.message = "Make sure that you have created a competition, product, timeslot, and broker before trying to send a shout"
      } else {
        def shout = new Shout(competition: competition, product: product, timeslot: timeslot, broker: broker, quantity: random.nextDouble(), buySellIndicator: (random.nextBoolean() ? BuySellIndicator.SELL : BuySellIndicator.BUY), orderType: OrderType.LIMIT, transactionId: IdGenerator.createId(), latest: true, shoutId: IdGenerator.createId()).save()
        def xmlString = shout as XML
        jmsService.send('public.visualizerIn', xmlString, 'standard', null)
        flash.message = 'Shout created and sent to JMS queue'
      }
      redirect(action: '')
    }
  }
}
