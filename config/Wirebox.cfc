component extends="wirebox.system.ioc.config.Binder" {


	function configure(){

		wireBox = {

			// Scope registration, automatically register a wirebox injector instance on any CF scope
			// By default it registeres itself on application scope
			scopeRegistration = {
				enabled = true,
				scope   = "application", // server, cluster, session, application
				key		= "wireBox"
			},


			scanLocations = ["models","models.service"]
		};

	}


}
