component extends="models.service.BaseService" singleton {

	property name="CarDAO" inject="id:carDAO";

	public query function getCar( required string carID ){
		return variables.carDAO.listByID( carID = arguments.carID );
	}

	public query function getCars(){
		return variables.carDAO.listAll();
	}

	public void function deleteCar( required string carID ){
		variables.carDAO.delete( carID = arguments.carID );
	}

	public struct function saveCar( required struct formScope ){
		return variables.carDAO.save( formScope = arguments.formScope );
	}


	// helper data functions
	public query function getMakes(){
		return variables.carDAO.listMakes();
	}

	public query function getModels(){
		return variables.carDAO.listModels();
	}

	public query function getColors(){
		return variables.carDAO.listColors();
	}

	public query function getCategories(){
		return variables.carDAO.listCategories();
	}

	public query function getImagesForCar( required string carID ){
		return variables.carDAO.listImagesByCarID( carID = arguments.carID );
	}
}
