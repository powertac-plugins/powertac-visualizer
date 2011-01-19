<%--
  Sidebar navigation rendering
  User: cblock
  Date: 06.01.11
  Time: 19:09
--%>

<div class="user-box">
  <ul>
    %{--<g:isLoggedIn>
      <li>Logged in as <g:link controller="register" class="user"><g:loggedInUserInfo field="userRealName"></g:loggedInUserInfo></g:link>.</li>
      <li><g:link controller="logout"><g:message code="auth.logout"/></g:link></li>
    </g:isLoggedIn>

    <g:isNotLoggedIn>
    <li><g:message code="auth.welcome.anonymous"/> <g:link controller="login" action="auth" class="user"><g:message code="auth.login"/></g:link></li>
    </g:isNotLoggedIn>--}%
    Welcome Guest!
  </ul>
</div>

<div class="link-box">
  <ul>
    <li>Quick Start</li>
    <li><a href="${createLink(uri: '/')}" class="dashboard" title="Dashboard">Dashboard</a></li>
    <li><g:link controller="info" action="gettingstarted">Getting Started</g:link></li>
    <li><g:link controller="info" action="downloads">Downloads</g:link></li>
    <li><g:link controller="info" action="getinvolved">Get involved</g:link></li>
  </ul>
</div>

%{--<g:ifAllGranted role="ROLE_ADMIN">--}%
<div class="link-box">
  <ul>
    <li>Admin Area</li>

    %{--<li><g:link controller="person" class="agents" title="Agents">Agents</g:link></li>
<li><g:link controller="role" class="roles" title="Agents">Agent Roles</g:link></li>
<li><g:link controller="announcement" class="announcements" title="Agents">Public Announcements</g:link></li>--}%
    <li><g:link controller="runtimeLogging" class="logging" title="Agents">Adjust Logging</g:link></li>
    <li><g:link controller="jmsStats" class="logging" title="JMS Status">View JMS Status</g:link></li>
  </ul>
</div>
%{--</g:ifAllGranted>--}%

<div class="link-box">
  <ul>
    <li>Controllers</li>
    <li><g:link controller="jmsTest" class="quotesntrades" title="JMS Test">JMS Test</g:link></li>
  </ul>
</div>
