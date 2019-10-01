/**
********************************************************************************
Copyright 2005-2007 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
www.coldboxframework.com | www.luismajano.com | www.ortussolutions.com
********************************************************************************
*/
component {

	// Application properties
	this.name = "Coming out of the Cold";
	this.sessionManagement = true;
	this.sessionTimeout = createTimespan( 0, 0, 30, 0 );
	this.setClientCookies = true;
	this.loginStorage = "session";
	this.datasource = "cartracker";

	// STATIC PROPERTY, DO NOT CHANGE UNLESS THIS IS NOT THE ROOT OF YOUR APP
	APP_ROOT_PATH = getDirectoryFromPath( getCurrentTemplatePath() );

	// CREATE APP MAPPINGS
	this.mappings["/CarTracker"] 	= APP_ROOT_PATH;

	// ORM Settings
	this.ormenabled = true;
	this.ormsettings = {
		cfclocation : "models/orm",
		datasource : "CarTracker",
		// Logging is on so you can see and debug any issues
		logsql : true,
		flushAtRequestEnd : false,
		autoManageSession : false
	};

	// application start
	public boolean function onApplicationStart(){
		this.wirebox = new wirebox.system.ioc.Injector('config.Wirebox');
		return true;
	}

	// request start
	public boolean function onRequestStart( String targetPage ){
		if( structKeyExists(url, "reload") and url.reload ) {
			onApplicationStart();
		}
		this.wirebox = new wirebox.system.ioc.Injector('config.Wirebox');
		ormReload();
		// put services into request scope
		request.wirebox = application.wirebox;
		// check the user
		request.wirebox.getInstance('Security').checkAuthentication();
		return true;
	}

	public void function onApplicationEnd( struct appScope ){
	}

	public void function onSessionStart(){
		param name="session.authenticated" default="false";
		if( !structKeyExists(session, 'csrfToken') ){
			session.csrfToken = createUUID(); // create a unique token for this user
		}
	}

	public void function onSessionEnd( struct sessionScope, struct appScope ){
	}

	public boolean function onMissingTemplate( template ){
		return true;
	}

}
