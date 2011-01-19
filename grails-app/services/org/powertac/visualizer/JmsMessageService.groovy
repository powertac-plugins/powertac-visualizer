package org.powertac.visualizer

class JmsMessageService {

  static transactional = true

  static expose = ['jms']

  static final QUEUE_NAME = 'public.visualizerIn'

  @Queue(name = QUEUE_NAME)
  def handleIncomingMessage(String string) {
    if (log.isInfoEnabled()) log.info("Received new message:  ${xmlString}")
  }

  def sendTestMessage(String string) {
    if (log.isInfoEnabled()) log.info "Send message '$string' to ${queueNames}"
    sendQueueJMSMessage(QUEUE_NAME, string)
  }

}
