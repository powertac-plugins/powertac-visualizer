<!--
IMPORTANT:

This file is for code reference only, DO NOT use it for anything else as it will
not be updated at all.
-->

<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
		<title>PowerTAC Visualizer - work in progress</title>
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
			$("#tabs").tabs();
			
			// Progressbar
			$("#progressbar").progressbar({
				value: 68 
			});
			
			// Flot code
			$(function () {
				var data1 = []
				for (var i = 0; i < 15; i += 0.5) {
						data1.push([i, i]);
				}
					
				var data2 = []
				for (var i = 0; i < 15; i += 0.5) {
					data2.push([i, Math.sqrt(i * 10)]);
				}
					
				var data3 = []
				for (var i = 0; i < 15; i += 0.5) {
					data3.push([i, Math.cos(i)]);
				}
					
				$.plot($("#graph1"), [
					{
						data: data1,
						lines: { show: true }
					}
				]);
					
				$.plot($("#graph2"), [
					{
						data: data2,
						lines: { show: true }
					}
				]);
					
				$.plot($("#graph3"), [
					{
						data: data3,
						lines: { show: true }
					}
				]);
					
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
						<div style="float:left">
							<g:gameInformation />
						</div>
				  </div>
			</div>

			<div id="left-panel">
				<div id="overview" class="accordion">
					<h3><a href="#">Broker overview</a></h3>
						<div>
							<p> Quick broker overview. Additional info will be shown in addition to icons.</p>
							<div class="broker_img">
								<div class="image">
									<img src="${resource(dir:'images/brokers/',file:'broker-1.png',plugin:'powertac-visualizer')}" height="64px" width="64px"></img>
									<div>Broker 1</div>
								</div>
							<div class="image">
									<img src="${resource(dir:'images/brokers/',file:'broker-2.png',plugin:'powertac-visualizer')}" height="64px" width="64px"></img>
									<div>Broker 2</div>
							</div>
							<div class="image">
								<img src="${resource(dir:'images/brokers/',file:'broker-3.png',plugin:'powertac-visualizer')}" height="64px" width="64px"></img>
								<div>Broker 3</div>
							</div>
							<div class="image">
								<img src="${resource(dir:'images/brokers/',file:'broker-4.png',plugin:'powertac-visualizer')}" height="64px" width="64px"></img>
								<div>Broker 4</div>
							</div>
						</div>
							<div class="broker_img">
								<div class="image">
									<img src="${resource(dir:'images/brokers/',file:'broker-5.png',plugin:'powertac-visualizer')}" height="64px" width="64px"></img>
									<div>Broker 5</div>
								</div>
								<div class="image">
									<img src="${resource(dir:'images/brokers/',file:'broker-6.png',plugin:'powertac-visualizer')}" height="64px" width="64px"></img>
									<div>Broker 6</div>
								</div>
								<div class="image">
									<img src="${resource(dir:'images/brokers/',file:'broker-7.png',plugin:'powertac-visualizer')}" height="64px" width="64px"></img>
									<div>Broker 7</div>
								</div>
								<div class="image">
									<img src="${resource(dir:'images/brokers/',file:'broker-8.png',plugin:'powertac-visualizer')}" height="64px" width="64px"></img>
									<div>Broker 8</div>
								</div>
							</div>
						</div>
				</div>

				<div id="forecast" class="accordion">
					<h3><a href="#">Weather report</a></h3>
					<div>
						<div>
							<h2>Weather forecast:</h2><br>
							<img src="${resource(dir:'images/weather/',file:'sunny.png',plugin:'powertac-visualizer')}" height="64px" width="64px"></img>
							<img src="${resource(dir:'images/weather/',file:'cloudy2.png',plugin:'powertac-visualizer')}" height="64px" width="64px"></img>
							<img src="${resource(dir:'images/weather/',file:'overcast.png',plugin:'powertac-visualizer')}" height="64px" width="64px"></img>
							<img src="${resource(dir:'images/weather/',file:'sunny_night.png',plugin:'powertac-visualizer')}" height="64px" width="64px"></img>
							<img src="${resource(dir:'images/weather/',file:'cloudy2_night.png',plugin:'powertac-visualizer')}" height="64px" width="64px"></img>
						</div>
						<div>
							<h2>Wind direction:</h2>
							<img src="${resource(dir:'images/wind/',file:'n.png',plugin:'powertac-visualizer')}"></img>
							<img src="${resource(dir:'images/wind/',file:'ne.png',plugin:'powertac-visualizer')}"></img>
							<img src="${resource(dir:'images/wind/',file:'e.png',plugin:'powertac-visualizer')}"></img>
							<img src="${resource(dir:'images/wind/',file:'se.png',plugin:'powertac-visualizer')}"></img>
							<img src="${resource(dir:'images/wind/',file:'s.png',plugin:'powertac-visualizer')}"></img>
							<img src="${resource(dir:'images/wind/',file:'sw.png',plugin:'powertac-visualizer')}"></img>
							<img src="${resource(dir:'images/wind/',file:'w.png',plugin:'powertac-visualizer')}"></img>
							<img src="${resource(dir:'images/wind/',file:'nw.png',plugin:'powertac-visualizer')}"></img>
						</div>
					</div>
				</div>
			</div>
			
			<div id="right-panel">
				<div id="details" style="position: relative;">
					<div id="tabs">
						<g:agentListTabs />
						<g:agentListTabContent />
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
