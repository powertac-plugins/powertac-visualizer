package org.powertac.visualizer

/**
 * This class could extend the org.powertac.common.Broker if necessary, however,
 * such a thing would probably result in a lot of unused information.
 */
class Agent {
    
    String username
    BigDecimal balance = 0.0 //TODO: Check the brokers starting funds
    List cashHistory = []

    static constraints = {
    }
}
