<g:if test="${MessagingService != NULL}">
	<g:render template="/layouts/noCompetition" plugin="powertac-visualizer"/>
</g:if>
<g:else>
	<g:render template="/layouts/main" plugin="powertac-visualizer"/>
</g:else>