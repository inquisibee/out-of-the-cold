component extends="models.service.BaseService" singleton {

	public void function checkAuthentication () {

		if( cgi.script_name eq "/login.cfm" or !findNoCase('/admin', cgi.script_name) ){
			return;
		}

		// if we aren't authenticated but we are trying to authenticate
		if( !session.authenticated and !structKeyExists(form, 'username') and !structKeyExists(form, 'password') ){
			location( url="/login.cfm?redirectURL=#cgi.script_name#" ); // establish a variable that will keep track of where they came from
		} else if ( structKeyExists(form, 'username') and len(form.username) and structKeyExists(form, 'password') and len(form.password) ){
			// TODOD add some real authentication
			session.authenticated = true;
			// if we have a place to redirct to
			if( structKeyExists(form, 'redirectURL') and len(form.redirectURL) ){
				location( url="#form.redirectURL#");
			}
		} else if( structKeyExists(form, 'username') and !len(form.username) and structKeyExists(form, 'password') and !len(form.password) ){
			location( url="/login.cfm?redirectURL=#cgi.script_name#" );
		}

	}

}
