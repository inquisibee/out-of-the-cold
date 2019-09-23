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
	this.datasource="cartracker";


	// application start
	public boolean function onApplicationStart(){
		return true;
	}

	// request start
	public boolean function onRequestStart( String targetPage ){
		return true;
	}

	public void function onApplicationEnd( struct appScope ){
	}

	public void function onSessionStart(){
		param name="session.authenticated" default="false";
	}

	public void function onSessionEnd( struct sessionScope, struct appScope ){
	}

	public boolean function onMissingTemplate( template ){
		return true;
	}

}
