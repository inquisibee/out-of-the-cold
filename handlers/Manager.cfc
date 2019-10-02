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
		arMakes = variables.carService.findAllMakes();
		arModels = variables.carService.findAllModels();
		arColors = variables.carService.findAllColors();
		arCategories = variables.carService.findAllCategories();

		event.setView( "Manager/edit" );
	}

}
