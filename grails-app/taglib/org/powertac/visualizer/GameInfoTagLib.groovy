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
	
	/** 
	 * A simple tag for testing purposes
	 */
	def testTag = {
		out << "Test successful."
		for (customer in MessagingService.customers) {
			out << customer.name
		}
	}
    
    def gameInformation = {
        out << "<h3>Competition name:</h3>"
        out << MessagingService.competitionName
        out << "<h3>Competition id:</h3>"
        out << MessagingService.competitionId
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
			out << "<h3>Broker balance history:</h3>"
			out << "\n<div id=\"" + agent.username + "balanceHistoryGraph" + "\" style=\"width:450px; height:200px;\"></div>\n"
			
			out << "</div>\n"
		}
	}
	
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
			out << "More information incoming."
			
			out << "</div>\n"
		}
	}
	
	/**
	 * Weather report taglib
	 * TODO: Adjust the icons according to the possible values of weather report
	 */
	 def weatherReport = {
		out << "<h3>Current timeslot: </h3>\n"
		out << MessagingService.weatherReport.currentTimeslot
		out << "\n<h3>Temperature: </h3>"
		out << MessagingService.weatherReport.temperature
		out << "\n<h3>Wind speed: </h3>"
		out << MessagingService.weatherReport.windSpeed
		out << "\n<h3>Wind direction: </h3>"
		out << MessagingService.weatherReport.windDirection
		out << "\n<h3>Cloud cover: </h3>"
		out << MessagingService.weatherReport.cloudCover
	 }
}
