/**
* StoreFront
*/
component{

	property name="CarService" inject="id:carService";

	/**
	* index
	*/
	function index( event, rc, prc ){

		rc.arCars = variables.carService.findAllCars();

		event.setView( "storeFront/index" );
	}

	/**
	* cardetails
	*/
	function cardetails( event, rc, prc ){
		event.setView( "storeFront/cardetails" );
	}



}
