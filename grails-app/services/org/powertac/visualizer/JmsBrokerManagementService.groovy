/*
 * Copyright 2009-2010 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an
 *
 * "AS IS" BASIS,  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
 *
 * either express or implied. See the License for the specific language
 * governing permissions and limitations under the License.
 */

package org.powertac.visualizer

import javax.jms.JMSException
import javax.management.MBeanServerConnection
import javax.management.MBeanServerInvocationHandler
import javax.management.ObjectName
import javax.management.remote.JMXConnector
import javax.management.remote.JMXConnectorFactory
import javax.management.remote.JMXServiceURL
import org.apache.activemq.broker.jmx.BrokerViewMBean
import org.apache.activemq.broker.jmx.QueueViewMBean
import org.apache.activemq.broker.jmx.TopicViewMBean
import org.codehaus.groovy.grails.commons.ConfigurationHolder

class JmsBrokerManagementService {

  boolean transactional = true
  def config = ConfigurationHolder.config

  def getStats() {
    def stats = [:]
    JMXServiceURL url = new JMXServiceURL(config.powertac.jmx.broker.url)
    JMXConnector connector = JMXConnectorFactory.connect(url, null)
    connector.connect()
    MBeanServerConnection connection = connector.getMBeanServerConnection()
    ObjectName name = new ObjectName("org.apache.activemq:BrokerName=localhost,Type=Broker")
    BrokerViewMBean mbean = (BrokerViewMBean) MBeanServerInvocationHandler.newProxyInstance(connection, name, BrokerViewMBean.class, true)
    stats.brokerId = "${mbean.getBrokerId()} - ${mbean.getBrokerName()}"
    stats.totalMessageCount = "Total message count: ${mbean.getTotalMessageCount()}"
    stats.totalConsumerCount = "Total number of consumers: ${mbean.getTotalConsumerCount()}"
    stats.totalNumberOfQueues = "Total number of Queues: ${mbean.getQueues().length} "
    stats.totalNumberOfTopics = "Total number of Topics: ${mbean.getTopics().length} "

    for (ObjectName queueName: mbean.getQueues()) {
      QueueViewMBean queueMbean = (QueueViewMBean) MBeanServerInvocationHandler.newProxyInstance(connection, queueName, QueueViewMBean.class, true)
      stats["Queue: ${queueMbean.name}".toString()] = "Size: ${queueMbean.queueSize}, # consumers: ${queueMbean.consumerCount}, # enqueued msg: ${queueMbean.enqueueCount}, # dequeued msg: ${queueMbean.dequeueCount}"
    }

    for (ObjectName topicName: mbean.getTopics()) {
      TopicViewMBean topicBean = (TopicViewMBean) MBeanServerInvocationHandler.newProxyInstance(connection, topicName, TopicViewMBean.class, true)
      stats["Topic: ${topicBean.name}".toString()] = "Size: ${topicBean.queueSize}, # consumers: ${topicBean.consumerCount}, # enqueued msg: ${topicBean.enqueueCount}, # dequeued msg: ${topicBean.dequeueCount}"
    }
    return stats
  }


  def deleteTopicsAndQueues() throws JMSException {
    try {
      BrokerViewMBean mbean = getMBean()

      for (ObjectName queueName: mbean.getQueues()) {
        log.debug "Trying to remove queue: ${queueName.getKeyProperty('Destination')}"
        mbean.removeQueue (queueName.getKeyProperty('Destination'))
      }

      for (ObjectName topicName: mbean.getTopics()) {
        log.debug "Trying to remove topic: ${topicName.getKeyProperty('Destination')}"
        mbean.removeTopic(topicName.getKeyProperty('Destination'))
      }
    } catch (Exception e) {
      log.error ("Failed to delete topics and queues: ${e.getMessage()}", e)
      throw new JMSException("Failed to delete topics and queues: ${e.getMessage()}, ${e.getCause()}")
    }
  }

  def initTopicsAndQueues() throws JMSException {
    try {
      BrokerViewMBean mbean = getMBean()

      mbean.addQueue ('public.visualizerIn')

    } catch (Exception e) {
      throw new JMSException("Failed to initialize topics and queues: ${e.getMessage()}, ${e.getCause()}")
    }
  }

  private BrokerViewMBean getMBean() throws JMSException {
    try {
      JMXServiceURL url = new JMXServiceURL(config.powertac.jmx.broker.url)
      JMXConnector connector = JMXConnectorFactory.connect(url, null)
      connector.connect()
      MBeanServerConnection connection = connector.getMBeanServerConnection()
      ObjectName name = new ObjectName("org.apache.activemq:BrokerName=localhost,Type=Broker")
      BrokerViewMBean mbean = (BrokerViewMBean) MBeanServerInvocationHandler.newProxyInstance(connection, name, BrokerViewMBean.class, true)
      return mbean
    } catch (Exception e) {
      throw new JMSException("Failed to create JMX M topics and queues: ${e.getMessage()}, ${e.getCause()}")
    }
  }

}
