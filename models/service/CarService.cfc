component extends="models.service.BaseService" {

	public query function getCar( required string carID ){
		return createObject("component", "models.service.CarDAO").listByID( carID = arguments.carID );
	}

	public query function getCars(){
		return createObject("component", "models.service.CarDAO").listAll();
	}

	public void function deleteCar( required string carID ){
		createObject("component", "models.service.CarDAO").delete( carID = arguments.carID );
	}

	public string function saveCar( required struct formScope ){
		return createObject("component", "models.service.carDAO").save( formScope = arguments.formScope );
	}


	// helper data functions
	public query function getMakes(){
		return createObject("component", "models.service.carDAO").listMakes();
	}

	public query function getModels(){
		return createObject("component", "models.service.carDAO").listModels();
	}

	public query function getColors(){
		return createObject("component", "models.service.carDAO").listColors();
	}

	public query function getCategories(){
		return createObject("component", "models.service.carDAO").listCategories();
	}

	public query function getImagesForCar( required string carID ){
		return createObject("component", "models.service.carDAO").listImagesByCarID( carID = arguments.carID );
	}
}
