package org.powertac.visualizer

class GameInfoTagLib {
    
    def MessagingService
	def agent
    
    def gameInformation = {
        out << "<h3>Competition name:</h3>"
        out << MessagingService.competitionName
        out << "<h3>Competition id:</h3>"
        out << MessagingService.competitionId
    }
	
	def simpleTag = {
		out << "Generic 2."
	}
	
	def agentListTabs = {
		out << "<ul>"
		for (agent in MessagingService.agents) {
			out << "<li><a href="
			out << "#"
			out << agent.username
			out << "\">"
			out << agent.username
			out << "</a></li>"
		}
		out << "</ul>"
	}
	
	def agentListTabContent = {
		for (agent in MessagingService.agents) {
			out << "<div id=\""
			out << agent.username
			out << "\">"
			
			out << "More information incoming."
			
			out << "</div>\n"
		}
	}
}
