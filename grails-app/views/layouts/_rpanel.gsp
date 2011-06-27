<div id="right-panel">
  <div id="details" style="position: relative;">
    <div id="tabs">
      <ul>
        <g:each var="agent" in="${agents}">
          <li><a href=${agent.username}>${agent.username}</a></li>
        </g:each>
      </ul>
      <g:each var="agent" in="${agents}">
        <div id="${agent.username}">
          <h1>${agent.username}</h1>
          <br>
          <div id="graph1" style="width:450px; height:200px;"></div>
          <br>
          <h2>Portfolio:</h2>
          Details incoming...
        </div>
      </g:each>
    </div>
  </div>
</div>