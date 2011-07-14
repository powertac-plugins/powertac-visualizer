package org.powertac.visualizer

/**
 * Tag library that is used to generate the dynamic information from
 * MessagingService.groovy to the _main.gsp of the visualizer plugin
 */
 
 /**
  * IMPORTANT NOTE: Don't forget to escape quotes (") and dollar signs ($).
  */
class GameInfoTagLib {
    
    def MessagingService
	
	def agent
	def customer
	
	Integer stupidCounter = 0
	
	String cloudIcon = ""
	
	/** 
	 * A simple tag for testing purposes
	 */
	def testTag = {
		out << "Test successful."
		for (customer in MessagingService.customers) {
			out << customer.name
		}
	}
    
	/**
	 * Tag for competition information in the header
	 */
    def gameInformation = {
        out << "\n<h3>Competition name:</h3>"
        out << MessagingService.competitionName
        out << "\n<h3>Competition id:</h3>"
        out << MessagingService.competitionId
    }
	
	/**
	 * Taglibs for broker overview, broker list and a comparative graph
	 */
	def overviewBrokerList = {
		for (agent in MessagingService.agents) {
			out << "\n<h3>" + agent.username + "</h3>"
			out << "\nCash position: " + agent.balance
		}
	}
	
	def comparativeGraphFlotData = {
		out << "\n\$.plot(\$(\"#brokerComparativeGraph\"), ["
		for (agent in MessagingService.agents) {
			out << "\n{label: \"" + agent.username + "\", "
			out << "data: " + agent.username + "balanceHistory" + "}"
			if (stupidCounter + 1 < MessagingService.agents.size()) {
				out << ","
				stupidCounter += 1
			}
			stupidCounter = 0
		}
		out << "\n], {"
		out << "\nseries: {"
		out << "\n	lines: {show: true}"
		out << "\n}"
		out << "});"
	}
	
	def overviewComparativeGraph = {
		out << "<div>&nbsp;</div>"
		out << "<h3>Broker cash position comparison:</h3><br />"
		out << "\n<div id=\"brokerComparativeGraph\" style=\"width:420px; height:250px;\"></div>\n"
	}
	
	/**
	 * This taglib will generate agent tabs in the visualizer
	 */
	def agentListTabs = {
		out << "<ul>\n"
		for (agent in MessagingService.agents) {
			out << "<li><a href="
			out << "#"
			out << agent.username
			out << "\">"
			out << agent.username
			out << "</a></li>"
		}
		out << "</ul>\n"
	}
	/**
	 * Content (graphs and other info) for the agent tabs in the visualizer
	 */
	def agentListTabContent = {
		for (agent in MessagingService.agents) {
			out << "<div id=\""
			out << agent.username
			out << "\">"
			
			/**
			 * TODO: Here goes agent info stuff, flot code is combined also with
			 * the flotPlotData tag below
			 */
			out << "\n<h3>Broker cash position:</h3> "
			out << agent.balance
			out << "<div>&nbsp;</div>"
			out << "\n<h3>Broker cash position history:</h3>"
			out << "\n<div id=\"" + agent.username + "balanceHistoryGraph" + "\" style=\"width:450px; height:300px;\"></div>\n"
			
			out << "\n<p>&nbsp;</p>"
			out << "\n<b>Current balancing quantity: </b>" + agent.balancingQuantity + "<br />"
			out << "\n<b>Balancing quantity mean: </b>" + agent.balancingQuantityMean + "<br />"
			out << "\n<p>&nbsp;</p>"
			out << "\n<h3>Balancing quantity history:</h3>"
			out << "\n<div id=\"" + agent.username + "balancingQuantityHistoryGraph" + "\" style=\"width:450px; height:200px;\"></div>\n"
			out << "\n<p>&nbsp;</p>"
			out << "\n<b>Current balancing charge: </b>" + agent.balancingCharge + "<br />"
			out << "\n<b>Balancing charge mean: </b>" + agent.balancingChargeMean + "<br />"
			
			out << "</div>\n"
		}
	}
	
	
	/**
	 * Tag for generating flot javascript code, watch for special characters
	 */
	def flotPlotData = {

		for (agent in MessagingService.agents) {
			out << "var " + agent.username + "balanceHistory = \n"
			out << agent.balanceHistory
			out << ";\n\n"
			
			out << "\$.plot(\$(\"" + "#" + agent.username + "balanceHistoryGraph" + "\"), [\n"
			out << "	{\n"
			out << "		data: " + agent.username + "balanceHistory,\n"
			out << "		lines: { show: true }\n"
			out << "	}\n"
			out << "]);\n"
			
			out << "var " + agent.username + "balancingQuantityHistory = \n"
			out << agent.balancingQuantityHistory
			out << ";\n\n"
			
			out << "\$.plot(\$(\"" + "#" + agent.username + "balancingQuantityHistoryGraph" + "\"), [\n"
			out << "	{\n"
			out << "		data: " + agent.username + "balancingQuantityHistory,\n"
			out << "		lines: { show: true }\n"
			out << "	}\n"
			out << "]);\n"
		}

	}
	
	/**
	 * Taglibs for customer tabs
	 */
	def customerListTabs = {
		out << "<ul>\n"
		for (customer in MessagingService.customers) {
			out << "<li><a href="
			out << "#"
			out << customer.name
			out << "\">"
			out << customer.name
			out << "</a></li>"
		}
		out << "</ul>\n"
	}
	
	def customerListTabContent = {
		for (customer in MessagingService.customers) {
			out << "<div id=\""
			out << customer.name
			out << "\">"
			
			// TODO: Here goes customer info extraction.
			out << "\n<h3>Customer type: </h3>"
			out << customer.type
			out << "\n<h3>Population: </h3>"
			out << customer.population
			
			out << "</div>\n"
		}
	}
	
	/**
	 * Weather report taglib
	 * TODO: BIG NOTICE - due to the way grails works, there is no way to
	 * dynamically generate images via 'resource' tag. Therefore, links to the
	 * images here are static and WILL HAVE TO BE CHANGED once the visualizer
	 * becomes separate from the server.
	 */
	 def weatherReport = {
		out << "<h3>Current time:</h3>\n"
		out << "<div style=\"font-size:16px;\">"
		out << MessagingService.weatherReport.currentTimeslot.startInstant.toDate()
		out << "</div>"
		out << "\n<h3>Temperature:</h3>"
		out << "<div style=\"font-size:16px;\">"
		out << MessagingService.weatherReport.temperature
		out << "</div>"
		out << "\n<h3>Wind direction and speed:</h3>"
		def windDir = MessagingService.weatherReport.windDirection
		/**
		 * TODO: These are the directories that need to be taken care of.
		 */
		out << "<div style=\"font-size:16px;\">"
		out << "Direction: "
		if ((windDir > 22.5) & (windDir <= 67.5)) {
			out << "<img src=\"/powertac-server/plugins/powertac-visualizer-1.0/images/wind/sw.png\"/>"
		} else if ((windDir > 67.5) & (windDir <= 112.5)) {
			out << "<img src=\"/powertac-server/plugins/powertac-visualizer-1.0/images/wind/w.png\"/>"
		} else if ((windDir > 112.5) & (windDir <= 157.5)) {
			out << "<img src=\"/powertac-server/plugins/powertac-visualizer-1.0/images/wind/nw.png\"/>"
		} else if ((windDir > 157.5) & (windDir <= 202.5)) {
			out << "<img src=\"/powertac-server/plugins/powertac-visualizer-1.0/images/wind/n.png\"/>"
		} else if ((windDir > 202.5) & (windDir <= 247.5)) {
			out << "<img src=\"/powertac-server/plugins/powertac-visualizer-1.0/images/wind/ne.png\"/>"
		} else if ((windDir > 247.5) & (windDir <= 292.5)) {
			out << "<img src=\"/powertac-server/plugins/powertac-visualizer-1.0/images/wind/e.png\"/>"
		} else if ((windDir > 292.5) & (windDir <= 337.5)) {
			out << "<img src=\"/powertac-server/plugins/powertac-visualizer-1.0/images/wind/se.png\"/>"
		} else if ((windDir > 337.5) | (windDir <= 22.5)) {
			out << "<img src=\"/powertac-server/plugins/powertac-visualizer-1.0/images/wind/s.png\"/>"
		} else {
			out << "Unknown"
		}
		out << "(" + windDir + ")<br />"
		
		out << "Speed: " + MessagingService.weatherReport.windSpeed
		out << "</div>"
		
		out << "<div>"
		out << "\n<h3>Cloud cover:</h3>"
		
		def cloudCov = MessagingService.weatherReport.cloudCover
		if (cloudCov <= 0.1) {
			cloudIcon = cloudIcon + "sunny"
		} else if (cloudCov <= 0.3) {
			cloudIcon = cloudIcon + "cloudy1"
		} else if (cloudCov <= 0.5) {
			cloudIcon = cloudIcon + "cloudy2"
		} else if (cloudCov <= 0.7) {
			cloudIcon = cloudIcon + "cloudy3"
		} else if (cloudCov <= 0.9) {
			cloudIcon = cloudIcon + "cloudy4"
		} else if (cloudCov <= 1.0) {
			cloudIcon = cloudIcon + "overcast"
		}
		
		String time = MessagingService.weatherReport.currentTimeslot.startInstant.toDateTime().getHourOfDay()
		def hour = time.toInteger()
		if ((hour > 6) & (hour < 20)) {
			cloudIcon = cloudIcon + ".png"
		} else {
			cloudIcon = cloudIcon + "_night.png"
		}
		out << "<div style=\" height:64px; width:100% \">"
		out << "<img src=\"/powertac-server/plugins/powertac-visualizer-1.0/images/weather/" + cloudIcon + "\"/>"
		out << "</div>"
		out << "</div>"
		cloudIcon = ""
		out << "<div style=\"font-size:16px;\">"
		out << "Value: " + MessagingService.weatherReport.cloudCover
		out << "</div>"
	 }
}
