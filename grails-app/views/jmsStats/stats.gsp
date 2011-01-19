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
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <g:set var="entityName" value="${message(code: 'competition.label', default: 'Competition')}"/>
  <title><g:message code="default.stats.label" args="[entityName]" default="Competition Stats"/></title>
</head>
<body>
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
  <span class="menuButton"><g:link class="reset" action="reset">Reset JMS queues and topics</g:link></span>
</div>

<div class="body">
  <h1><g:message code="default.stats.label" args="[entityName]" default="JMS Stats"/></h1>
  <g:if test="${flash.message}">
    <div class="success">${flash.message}</div>
  </g:if>
  <div class="list">
    <table>
      <thead>
      <tr>

        <th>Key</th>
        <th>Value</th>
      </tr>
      </thead>
      <tbody>
      <g:each in="${stats?.keySet()}" status="i" var="stat">
        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

          <td>${stat}</td>

          <td>${stats[stat]}</td>

        </tr>
      </g:each>
      </tbody>
    </table>
  </div>
</div>
</body>
</html>
