component extends="models.service.BaseService" singleton {

	public boolean function isAuthenticated ( event, rc, prc ) {

		// its simple now -- are we authenticated???
		if( !session.authenticated  ){
			return false;
		}
		return true;
	}

	public boolean function authenticate( event, rc, prc ){

		if ( structKeyExists(rc, 'username') and len(rc.username) and structKeyExists(rc, 'password') and len(rc.password) ){
			// TODOD add some real authentication
			session.authenticated = true;
		}
		return session.authenticated;
	}

}
