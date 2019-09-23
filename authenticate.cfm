<cfif !session.authenticated and !structKeyExists(form, 'username') and !structKeyExists(form, 'password')>
	<cflocation url="login.cfm"/>
<cfelseif structKeyExists(form, 'username') and len(form.username) and structKeyExists(form, 'password') and len(form.password)>
	<!--- // TODO Add some real authentication please ... --->
	<cfset session.authenticated = true>
	<cfif structKeyExists(form, 'redirectURL') and len(form.redirectURL)>
		<cflocation url="#form.redirectURL#"/>
	</cfif>
<cfelseif structKeyExists(form, 'username') and !len(form.username) and structKeyExists(form, 'password') and !len(form.password)>
	<cflocation url="login.cfm"/>
</cfif>
