component{

	// Configure ColdBox Application
	function configure(){

		// coldbox directives
		coldbox = {
			//Application Setup
			appName 				= "Coming Out of the Cold",
			reinitPassword			= "",

			//Implicit Events
			defaultEvent			= "storefront.index",

			// Application Aspects
			handlerCaching 			= false,
			eventCaching			= false,
			autoMapModels 			= true
		};

		// environment settings, create a detectEnvironment() method to detect it yourself.
		// create a function with the name of the environment so it can be executed if that environment is detected
		// the value of the environment is a list of regex patterns to match the cgi.http_host.
		environments = {
			development = "^127\.,^localhost"
		};

	}

	/**
	* Development
	*/
	function development(){
		coldbox.handlersIndexAutoReload 	= true;
		coldbox.reinitPassword				= "";
		coldbox.customErrorTemplate 		= "/coldbox/system/includes/BugReport.cfm";
	}

}
