/**
 * Handler for Cars
 */
component {

	// Inject a base ORM service
	property name="ORMService"          inject="entityService";
	// Inject a virtual service
	property name="VirtualCarService"   inject="entityService:SimpleCar";
	// Inject a concrete service from the `models` folder
	property name="carService"          inject="id:SimpleCarService";

	// Syntax Highlight Utility
	property name="cbCodeHighlight"		inject="@cbCodeHighlight";

	/**
	* Executes before all handler actions
	*/
	any function preHandler( event, rc, prc, action, eventArguments ){
		// Load cbCodeHighlight assets + theme
		addAsset( variables.cbCodeHighlight.getCSSAssets() );
	}

    /**
     * Home
     */
    function index( event, rc, prc ) {
        event.setView( "security/index" );
    }

	function sqli( event, rc, prc ) {
		event.setView( 'security/sqli' );
	}

	function sqli-sanitize( event, rc, prc ) {
		event.setView( 'security/sqli-sanitize' );
	}

	function xss ( event, rc, prc ) {
		event.setView( 'security/xss' );
	}
}
