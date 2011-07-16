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
		<script type="text/javascript" src="${resource(dir:'js',file:'cookieplugin.js',plugin:'powertac-visualizer')}"></script>
		<!--[if IE]><script language="javascript" type= "${resource(dir:'js',file:'excanvas.min.js',plugin:'powertac-visualizer')}"></script><![endif]-->
		
		<!-- Cookies and jQueryUI -->
		<script type="text/javascript">
			$(document).ready(function($) {
			
				var active1=$.cookie("active1");
				if(active1 == "0") {
					active1 = 0;
				}
				var active2=$.cookie("active2");
				if(active2 == "0") {
					active2 = 0;
				}
				var active3=$.cookie("active3");
				if(active3 == "0") {
					active3 = 0;
				}
				// Accordions
				$("#overview").accordion({
					collapsible:'true',
					active: active1
				});
				
				$( "#overview" ).bind( "accordionchange", function(event, ui) {
					$.cookie("active1",$( "#overview" ).accordion( "option", "active"));
					active1=$.cookie("active1");
				});

				$("#info").accordion({
					collapsible:'true',
					active: active2
				});

				$( "#info" ).bind( "accordionchange", function(event, ui) {
					$.cookie("active2",$( "#info" ).accordion( "option", "active"));
					active2=$.cookie("active2");
				});

				$("#forecast").accordion({
					collapsible:'true',
					active: active3
				});

				$("#forecast").bind( "accordionchange", function(event, ui) {
					$.cookie("active3",$( "#forecast" ).accordion( "option", "active"));
					active3=$.cookie("active3");
				});
				
				// Tabs
				$(".tabs").tabs({ cookie: { expires: 365 }});
				
				// Flot code
				$(function () {
					<g:flotPlotData />
					<g:comparativeGraphFlotData />
					$(".tickLabels").css("position","static");		
				});
				//return false;
			});
			
			<!-- Yuan's autorefresh script -->
			//this variable sets the refresh frequency...
			var limit="0:5"

			if (document.images) {
				var parselimit = limit.split(":")
				parselimit = parselimit[0] * 60 + parselimit[1] * 1
			}

			function beginrefresh() {
				if (!document.images) {
					return
				}
				
				if (parselimit==1) {
					window.location.reload()
				} else {
					parselimit-=1
					curmin=Math.floor(parselimit/60)
					cursec=parselimit%60
					if (curmin != 0) {
						curtime = curmin + " minutes and " + cursec + " seconds left until page refresh!"
					} else {
						curtime = cursec + " seconds left until page refresh!"
					}
					window.status = curtime
					setTimeout("beginrefresh()",1000)
				}
			}

			window.onload = beginrefresh
			<!-- Yuan's autorefresh script end-->
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
