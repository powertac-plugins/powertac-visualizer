<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
		<title>Visualizer - work version</title>
		<link type="text/css" href="css/style.css" rel="stylesheet" />
		<link type="text/css" href="css/south-street/jquery-ui-1.8.13.custom.css" rel="stylesheet" />
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.13/jquery-ui.min.js"></script>
		<script type="text/javascript" src="js/jquery.flot.min.js"></script>
		<!--[if IE]><script language="javascript" type="text/javascript" src="js/excanvas.min.js"></script><![endif]-->
	
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
		<!-- Header = logo + some powertac info -->
		<div id="header">
			<div id="logo">
				<img src="images/header-small.png"/>
			</div>
		</div>
		
		<div id="content">
		<!-- Game general info -->
			<div id="info" class="accordion">
			<h3><a href="#">Game info</a></h3>
				<div>     
                                      <g:gameInformation />
				</div>
			</div>
			
			<div id="left-panel">
				<div id="overview" class="accordion">
					<h3><a href="#">Broker overview</a></h3>
					<div>
					<p> Quick broker overview. Additional info will be shown in addition to icons.</p>
						<div class="broker_img">
							<div class="image">
								<img src="images/brokers/broker-1.png" height="64px" width="64px"></img>
								<div>Broker 1</div>
							</div>
							<div class="image">
								<img src="images/brokers/broker-2.png" height="64px" width="64px"></img>
								<div>Broker 2</div>
							</div>
							<div class="image">
								<img src="images/brokers/broker-3.png" height="64px" width="64px"></img>
								<div>Broker 3</div>
							</div>
							<div class="image">
								<img src="images/brokers/broker-4.png" height="64px" width="64px"></img>
								<div>Broker 4</div>
							</div>
						</div>
						<div class="broker_img">
							<div class="image">
								<img src="images/brokers/broker-5.png" height="64px" width="64px"></img>
								<div>Broker 5</div>
							</div>
							<div class="image">
								<img src="images/brokers/broker-6.png" height="64px" width="64px"></img>
								<div>Broker 6</div>
							</div>
							<div class="image">
								<img src="images/brokers/broker-7.png" height="64px" width="64px"></img>
								<div>Broker 7</div>
							</div>
							<div class="image">
								<img src="images/brokers/broker-8.png" height="64px" width="64px"></img>
								<div>Broker 8</div>
							</div>
						</div>
					</div>
				</div>
				
				<div id="forecast" class="accordion">
					<h3><a href="#">Weather information</a></h3>
					<div>
						<div>
							<h2>Weather forecast:</h2><br>
							<img src="images/weather/sunny.png" height="64px" width="64px"></img>
							<img src="images/weather/cloudy2.png" height="64px" width="64px"></img>
							<img src="images/weather/overcast.png" height="64px" width="64px"></img>
							<img src="images/weather/sunny_night.png" height="64px" width="64px"></img>
							<img src="images/weather/cloudy2_night.png" height="64px" width="64px"></img>
						</div>
						<div>
							<h2>Wind direction:</h2>
							<img src="images/wind/n.png"></img>
							<img src="images/wind/ne.png"></img>
							<img src="images/wind/e.png"></img>
							<img src="images/wind/se.png"></img>
							<img src="images/wind/s.png"></img>
							<img src="images/wind/sw.png"></img>
							<img src="images/wind/w.png"></img>
							<img src="images/wind/nw.png"></img>
						</div>
					</div>
				</div>
			</div>
			
			<div id="right-panel">
			<div id="details" style="position: relative;">
					<!--<h3><a href="#">Details window</a></h3>-->
					<div id="tabs">
					<ul>
						<li><a href="#agent_1">Broker One</a></li>
						<li><a href="#agent_2">Broker Two</a></li>
						<li><a href="#agent_3">Broker Three</a></li>
					</ul>
						<div id="agent_1">
							<h1>Broker One</h1>
							<br>
							<div id="graph1" style="width:450px; height:200px;"> </div>
							<br>
							<h2>Portfolio:</h2>
							<h3>Total income:</h3> 16001 $
							<h3>Energy bought:</h3> 15.6 MW
							<h3>Energy sold:</h3> 14.9 MW
						</div>
						<div id="agent_2">
							<h2>Broker Two</h2>
							<br>
							<div id="graph2" style="width:450px; height:200px;"></div>
							<br>
							<h2>Portfolio:</h2>
							<h3>Total income:</h3> 17500 $
							<h3>Energy bought:</h3> 16.3 MW
							<h3>Energy sold:</h3> 15.1 MW
						</div>
						<div id="agent_3">
							<h2>Broker Three</h2>
							<br>
							<div id="graph3" style="width:450px; height:200px;"></div>
							<br>
							<h2>Portfolio:</h2>
							<h3>Total income:</h3> 19600 $
							<h3>Energy bought:</h3> 17.1 MW
							<h3>Energy sold:</h3> 16.9 MW
						</div>
						<!-- Begin flot code -->
						<script id="source" language="javascript" type="text/javascript">

						</script>
						<!-- End flot code -->
					</div>
				</div>
			</div>
		</div>
 
	</body>
</html>
