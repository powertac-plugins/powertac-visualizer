%{--
- Copyright 2010-2011 [Adis Mustedanagic / PowerTAC].
    -
- Licensed under the Apache License, Version 2.0 (the "License");
- you may not use this file except in compliance with the License.
    - You may obtain a copy of the License at
-
-  http://www.apache.org/licenses/LICENSE-2.0
-
- Unless required by applicable law or agreed to in writing, software
- distributed under the License is distributed on an
-
- "AS IS" BASIS,  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
-
- either express or implied. See the License for the specific language
- governing permissions and limitations under the License.
    --}%

<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
		<title>Visualizer - work version</title>
		<link type="text/css" href="${resource(dir:'css',file:'style.css',plugin:'powertac-visualizer')}" rel="stylesheet" />
                <link type="text/css" href="${resource(dir:'css/south-street/',file:'jquery-ui-1.8.13.custom.css',plugin:'powertac-visualizer')}" rel="stylesheet" />
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.13/jquery-ui.min.js"></script>
                <script type="text/javascript" src="${resource(dir:'js',file:'jquery.flot.min.js',plugin:'powertac-visualizer')}"></script>
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
		<div id="content">
		<!-- Game general info -->
			<div id="info" class="accordion">
			<h3><a href="#">Game info</a></h3>
				<div id="info-content">
					<div id="logo">
						<img src="${resource(dir:'images',file:'header-small.png',plugin:'powertac-visualizer')}"/>
					</div>
					<p>General information about the game, duration, etc.</p>
					<div style="float:left">
						<h3>Timeslots passed:</h3> 24
						<h3>Market closing time:</h3> No
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
					<h3><a href="#">Weather information</a></h3>
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
