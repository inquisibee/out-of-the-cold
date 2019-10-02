/**
* Authentication
*/
component{

	property name="Security" inject="id:security";

	/**
	* index
	*/
	function index( event, rc, prc ){
		if( variables.security.authenticate( event, rc, prc ) ){
			relocate( 'manager.index');
		} else {
			rc.message = "Authentication failed, please try anything.";
			relocate( event = 'authentication.login', queryString = "message=#encodeForURL(rc.message)#" );
		}
		//event.setView( "Authentication/index" );
	}

	/**
	* login
	*/
	function login( event, rc, prc ){
		event.setView( "Authentication/login" );
	}

}
