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
  
<html>
  <head>
    <title>Visualizer - wip</title>
    <link type="text/css" href="css/style.css" rel="stylesheet" />
    <link type="text/css" href="css/smoothness/jquery-ui-1.8.9.custom.css" rel="stylesheet" />
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.9/jquery-ui.min.js"></script>
    <script type="text/javascript" src="js/jquery.flot.min.js"></script>
    <!--[if IE]><script language="javascript" type="text/javascript" src="js/excanvas.min.js"></script><![endif]-->

  <!-- jQueryUI -->
  <script type="text/javascript">
    $(function(){
      // Accordions
      $(".accordion").accordion({ header: "h3", alwaysopen: "false", collapsible: "true" });

      // Tabs
      $('#tabs').tabs();

      // Progressbar
      $("#progressbar").progressbar({
              value: 68
      });
    });
  </script>

  <!-- Interactivity -->
  <script type="text/javascript">
    $(document).ready(function() {
      $('#agent_1').hide();
      $('#agent_2').hide();
      $('#agent_3').hide();
    });
  </script>

</head>
<body>

  <!-- Vertical element 1 -->
  <!-- Header = logo + info -->
  <div id="header">
    <div id="logo">
      <img src="images/header-small.png"/>
    </div>
    <div id="info">
      <h1>Game info</h1>
    </div>
  </div>

  <!-- Vertical element 2 -->
  <!-- Content = Details + Overview -->
  <div id="content">
    <div id="overview">
      <h1>Overview window</h1>
      <div class="underline"></div>
      <!--<a href="#" onclick="showBrokerOne()"><img src="images/broker-icon.png"></img></a>
      <a href="#" onclick="showBrokerTwo()"><img src="images/broker-icon.png"></img></a>-->
      <input type="button" id="button1" value="Show agent one" />
      <script>
          $("#button1").click(function () {
                  $('#agent_2').hide();
                  $('#agent_3').hide();
                  $('#agent_1').show("slow");
          });
      </script>
      <input type="button" id="button2" value="Show agent two" />
      <script>
          $("#button2").click(function () {
                  $('#agent_1').hide();
                  $('#agent_3').hide();
                  $('#agent_2').show("slow");
          });
      </script>
      <input type="button" id="button3" value="Show agent three" />
      <script>
          $("#button3").click(function () {
                  $('#agent_1').hide();
                  $('#agent_2').hide();
                  $('#agent_3').show("slow");
          });
      </script>

    </div>
    <div id="details" style="position: relative;">
      <h1>Details window</h1>
      <div class="underline"></div>
      <div id="agent_1" style="height:90%; width:99%; position:absolute; margin-top:50px;">
        <h2 style="padding:5px;">Some additonal broker info for the first time.</h2>
        <br>
        <div id="graph1" style="width:460px; height:200px;"></div>
      </div>
      <div id="agent_2" style="height:90%; width:99%; position:absolute; margin-top:50px;">
        <h2 style="padding:5px;">Some additonal broker info - second time.</h2>
        <br>
        <div id="graph2" style="width:460px; height:200px;"></div>
      </div>
      <div id="agent_3" style="height:90%; width:99%; position:absolute; margin-top:50px;">
        <h2 style="padding:5px;">Some additonal broker info - final time.</h2>
        <br>
        <div id="graph3" style="width:460px; height:200px; position:relative;"></div>
      </div>
      <!-- Begin flot code -->
      <script id="source" language="javascript" type="text/javascript">
          $(function () {
              var data1 = []
              for (var i = 0; i < 15; i += 0.5) {
                      data1.push([i, Math.sin(i)]);
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
      </script>
      <!-- End flot code -->
    </div>
  </div>

  <!-- Vertical element 3 -->
  <!-- Footer for additonal info -->
  <div id="footer">
    <h1>Footer: installed plugins</h1>
    <ul>
      <g:set var="pluginManager"
             value="${applicationContext.getBean('pluginManager')}"></g:set>

      <g:each var="plugin" in="${pluginManager.userPlugins}">
        <g:if test="${plugin.name.contains('powertac')}">
          <li>${plugin.name} - ${plugin.version}</li>
        </g:if>
      </g:each>
    </ul>
  </div>

</body>
</html>
