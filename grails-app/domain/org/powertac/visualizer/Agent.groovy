package org.powertac.visualizer

/**
 * This class could extend the org.powertac.common.Broker if necessary, however,
 * such a thing would probably result in a lot of unused information.
 */
class Agent {
    
    String username
    BigDecimal balance = 0.0
    List balanceHistory = []
	
	BigDecimal balancingQuantity
	BigDecimal balancingQuantityMean
	List balancingQuantityHistory = []
	
	BigDecimal balancingCharge
	BigDecimal balancingChargeMean
	List balancingChargeHistory = []

    static constraints = {
    }
}
