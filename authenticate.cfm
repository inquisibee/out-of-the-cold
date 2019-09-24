<cfscript>
	// if we aren't authenticated but we are trying to authenticate
	if( !session.authenticated and !structKeyExists(form, 'username') and !structKeyExists(form, 'password') ){
		location( url="/login.cfm?redirectURL=#cgi.script_name#" );
	} else if ( structKeyExists(form, 'username') and len(form.username) and structKeyExists(form, 'password') and len(form.password) ){
		// TODOD add some real authentication
		session.authenticated = true;
		// if we have a place to redirct to
		if( structKeyExists(form, 'redirectURL') and len(form.redirectURL) ){
			location( url="#form.redirectURL#");
		}
	}
</cfscript>
