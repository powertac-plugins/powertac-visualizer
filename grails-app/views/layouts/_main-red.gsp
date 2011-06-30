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
			<div id="tabs">
				<g:agentListTabs />
				<g:agentListTabContent />
			</div>
		</div>
	</div>


</body>
</html>
