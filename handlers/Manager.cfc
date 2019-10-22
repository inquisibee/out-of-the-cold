/**
* Manager
*/
component{

	property name="CarService" inject="id:carService";
	property name="Security" inject="id:security";

	function preHandler( event, rc, prc ){
		if( !variables.security.isAuthenticated( event, rc, prc ) ){
			relocate( 'authentication.login' );
		}
	}

	/**
	* index
	*/
	function index( event, rc, prc ){
		rc.arCars = variables.carService.findAllCars();
		event.setView( "Manager/index" );
	}

	/**
	* edit
	*/
	function edit( event, rc, prc ){

		rc.car = variables.carService.findCarByID(url.carID);
		rc.arMakes = variables.carService.findAllMakes();
		rc.arModels = variables.carService.findAllModels();
		rc.arColors = variables.carService.findAllColors();
		rc.arCategories = variables.carService.findAllCategories();

		event.setView( "Manager/edit" );
	}

}
