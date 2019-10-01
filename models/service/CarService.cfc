component extends="models.service.BaseService" singleton {

	property name="CarDAO" inject="id:carDAO";

	public Car function getCar( required string carID ){
		return variables.carDAO.listByID( carID = arguments.carID );
	}

	public array function getCars(){
		return variables.carDAO.listAll();
	}

	public void function deleteCar( required string carID ){
		variables.carDAO.delete( carID = arguments.carID );
	}

	public struct function saveCar( required struct formScope ){
		return variables.carDAO.save( formScope = arguments.formScope );
	}


	// helper data functions
	public array function getMakes(){
		return variables.carDAO.listMakes();
	}

	public array function getModels(){
		return variables.carDAO.listModels();
	}

	public array function getColors(){
		return variables.carDAO.listColors();
	}

	public array function getCategories(){
		return variables.carDAO.listCategories();
	}

	public array function getImagesForCar( required string carID ){
		return variables.carDAO.listImagesByCarID( carID = arguments.carID );
	}

	// ORM functions
	public models.orm.Car function findCarByID( required string carID ){
		return variables.carDAO.findCarByID( arguments.carID );
	}

	public array function findAllCars(){
		return variables.carDAO.findAllCars();
	}

	public array function findAllMakes(){
		return variables.carDAO.findAllMakes();
	}

	public array function findAllModels(){
		return variables.carDAO.findAllModels();
	}

	public array function findAllColors(){
		return variables.carDAO.findAllColors();
	}

	public array function findAllCategories(){
		return variables.carDAO.findAllCategories();
	}
}
