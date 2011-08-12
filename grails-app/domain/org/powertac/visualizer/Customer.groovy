package org.powertac.visualizer

import org.powertac.common.enumerations.CustomerType
import org.powertac.common.enumerations.PowerType
import org.powertac.common.CustomerInfo

/**
 * The visualizer class for storing and recalling customer information
 * 
 * TODO: Some graphs will probably be necessary for this class, use Agent.groovy
 * as a reference
 */
class Customer {

	String name
	CustomerType type
	Integer population
	
	Boolean multiContracting
	Boolean canNegotiate
	
	List<PowerType> powerTypes = []

  CustomerInfo customerInfo

  int powerUsageCounter = 0
  List powerUsageValues = []

    static constraints = {
    }
}
