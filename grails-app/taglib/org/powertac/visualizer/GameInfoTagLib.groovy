package org.powertac.visualizer

class GameInfoTagLib {
    
    def MessagingService
    
    def gameInformation = {
        out << "<h3>Competition name:</h3>"
        out << MessagingService.competitionName
        out << "<h3>Competition id:</h3>"
        out << MessagingService.competitionId
    }
}
