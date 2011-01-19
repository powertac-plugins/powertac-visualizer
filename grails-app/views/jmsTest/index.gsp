%{--
  - Copyright 2009-2010 the original author or authors.
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
  <title>Welcome</title>
  <meta name="layout" content="main"/>
</head>
<body>

<h1>JMS Testing Controller</h1>

<div class="clear"></div>
<g:if test="${flash.message}">
  <div class="message">${flash.message}</div>
</g:if>

<div id="content-box">

  <div class="section section-last">
    <div class="section-header">
      Send JMS test messages
    </div>
    <ul>
      <li><g:link action="sendCompetition">Find or create competition -&gt; JMS</g:link> </li>
      <li><g:link action="sendBroker">Find or create broker -&gt; JMS</g:link> </li>
      <li><g:link action="sendProduct">Find or create product -&gt; JMS</g:link> </li>
      <li><g:link action="sendTimeslot">Find or create timeslot -&gt; JMS</g:link> </li>
      <li><g:link action="sendShout">Create a new shout instance and send it to JMS</g:link> </li>
    </ul>

  </div>
</div>

</body>
</html>
