/**
* Copyright Since 2005 Ortus Solutions, Corp
* www.ortussolutions.com
**************************************************************************************
*/
component{
	this.name = "A TestBox Runner Suite " & hash( getCurrentTemplatePath() );
	// any other application.cfc stuff goes below:
	this.sessionManagement = true;
	this.setClientCookies = true;

	// any mappings go here, we create one that points to the root called test.
	this.mappings[ "/tests" ] = getDirectoryFromPath( getCurrentTemplatePath() );

	// application start
	public boolean function onApplicationStart(){
		application.wirebox = new wirebox.system.ioc.Injector('config.Wirebox');
		return true;
	}

	// request start
	public boolean function onRequestStart( String targetPage ){
		if( structKeyExists(url, "reload") and url.reload ) {
			onApplicationStart();
		}
		// put services into request scope
		request.wirebox = new wirebox.system.ioc.Injector('config.Wirebox');
		// check the user
		request.wirebox.getInstance('Security').checkAuthentication();
		return true;
	}

	public void function onSessionStart(){
		param name="session.authenticated" default="false";
		if( !structKeyExists(session, 'csrfToken') ){
			session.csrfToken = createUUID(); // create a unique token for this user
		}
	}
}
