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

	// COLDBOX STATIC PROPERTY, DO NOT CHANGE UNLESS THIS IS NOT THE ROOT OF YOUR COLDBOX APP
	COLDBOX_APP_ROOT_PATH = getDirectoryFromPath( getCurrentTemplatePath() );
	// The web server mapping to this application. Used for remote purposes or static purposes
	COLDBOX_APP_MAPPING = "";
	// COLDBOX PROPERTIES
	COLDBOX_CONFIG_FILE = "";
	// COLDBOX APPLICATION KEY OVERRIDE
	COLDBOX_APP_KEY = "";

	// CREATE APP MAPPINGS
	this.mappings["/CarTracker"] 	= COLDBOX_APP_ROOT_PATH;

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
		application.cbBootstrap = new coldbox.system.Bootstrap(
			COLDBOX_CONFIG_FILE,
			COLDBOX_APP_ROOT_PATH,
			COLDBOX_APP_KEY,
			COLDBOX_APP_MAPPING
		);
		application.cbBootstrap.loadColdbox();
		return true;
	}

	// request start
	public boolean function onRequestStart( String targetPage ){
		// ORM REload Checks
		if ( structKeyExists( URL, "ormReload" ) ) {
			ormReload();
		}

		// Bootstrap Reinit
		if ( not structKeyExists( application, "cbBootstrap" ) ) {
			lock name="coldbox.bootstrap.#this.name#" type="exclusive" timeout="5" throwonTimeout=true {
				structDelete( application, "cbBootStrap" );
				onApplicationStart();
			}
		}

		// Process ColdBox Request
		application.cbBootstrap.onRequestStart( arguments.targetPage );

		return true;
	}

	public void function onApplicationEnd( struct appScope ){
		arguments.appScope.cbBootStrap.onApplicationEnd( argumentCollection = arguments );
	}

	public void function onSessionStart(){
		param name="session.authenticated" default="false";
		application.cbBootStrap.onSessionStart();
		if( !structKeyExists(session, 'csrfToken') ){
			session.csrfToken = createUUID(); // create a unique token for this user
		}
	}

	public void function onSessionEnd( struct sessionScope, struct appScope ){
		arguments.appScope.cbBootStrap.onSessionEnd( argumentCollection = arguments );
	}

	public boolean function onMissingTemplate( template ){
		return application.cbBootstrap.onMissingTemplate( argumentCollection = arguments );
	}

}
