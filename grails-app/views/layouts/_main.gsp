<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
		<title>PowerTAC Visualizer</title>
		<link type="text/css" href="${resource(dir:'css',file:'style.css',plugin:'powertac-visualizer')}" rel="stylesheet" />
        <link type="text/css" href="${resource(dir:'css/south-street/',file:'jquery-ui-1.8.13.custom.css',plugin:'powertac-visualizer')}" rel="stylesheet" />
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.13/jquery-ui.min.js"></script>
        <script type="text/javascript" src="${resource(dir:'js',file:'jquery.flot.min.js',plugin:'powertac-visualizer')}"></script>
		<!--[if IE]><script language="javascript" type= "${resource(dir:'js',file:'excanvas.min.js',plugin:'powertac-visualizer')}"></script><![endif]-->
	
		<script type="text/javascript">
		$(document).ready(function($) {
			// Accordions
			$(".accordion").accordion({
				collapsible:'true'
			});

			// Tabs
			$(".tabs").tabs();
			
			// Flot code
			$(function () {
				<g:flotPlotData />
				<g:comparativeGraphFlotData />
				$(".tickLabels").css("position","static");		
			});
			//return false;
		});
		</script>	
	</head>
	
	<body>
		<div id="content">
			<div id="info" class="accordion">
				<h3><a href="#">Game info</a></h3>
					<div id="info-content">
						<div id="logo">
							<img src="${resource(dir:'images',file:'header-small.png',plugin:'powertac-visualizer')}"/>
						</div>
						<div style="float:right; text-align:right;">
							<g:gameInformation />
						</div>
				  </div>
			</div>

			<div id="left-panel">
				<div id="overview" class="accordion">
					<h3><a href="#">Broker overview</a></h3>
					<div>
						<g:overviewBrokerList />
						<g:overviewComparativeGraph />
					</div>
				</div>

				<div id="forecast" class="accordion">
					<h3><a href="#">Weather report</a></h3>
					<div>
						<g:weatherReport />
					</div>
				</div>
			</div>
			
			<div id="right-panel">
				<div id="details" style="position: relative;">
					<div class="tabs">
						<g:agentListTabs />
						<g:agentListTabContent />
					</div>
					<div class="tabs">
						<g:customerListTabs />
						<g:customerListTabContent />
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
