component extends="models.service.BaseDAO" singleton {

	public query function listByID( required string carID ){
		var queryService = new Query();
		queryService.setDatasource('cartracker');
		queryService.addParam(name="carID", value="#arguments.carID#");
		queryService.setSQL("
			SELECT
				c.*,
				ma.longName as make,
				mo.longName as model,
				co.longName as color
			FROM Car c
			JOIN Make ma ON c.makeID = ma.makeID
			JOIN Model mo ON c.modelID = mo.modelID
			JOIN Color co ON c.colorID = co.colorID
			WHERE carID = :carID
		");

		return queryService.execute().getResult();
	}

	public query function listAll(){

		var queryService = new Query();
		queryService.setDatasource('cartracker');
		queryService.setSQL("
			SELECT
				c.*,
				ma.longName as make,
				mo.longName as model,
				co.longName as color
			FROM Car c
			INNER JOIN Make ma ON c.makeID = ma.makeID
			INNER JOIN Model mo ON c.modelID = mo.modelID
			INNER JOIN Color co ON c.colorID = co.colorID
			ORDER BY c.saleprice;
		");

		return queryService.execute().getResult();
	}

	public query function listMakes(){

		var queryService = new Query();
		queryService.setDatasource('cartracker');
		queryService.setSQL("
			SELECT
				*
			FROM Make
			ORDER BY longName;
		");

		return queryService.execute().getResult();
	}

	public query function listModels(){

		var queryService = new Query();
		queryService.setDatasource('cartracker');
		queryService.setSQL("
			SELECT
				*
			FROM Model
			ORDER BY longName;
		");

		return queryService.execute().getResult();
	}

	public query function listColors(){

		var queryService = new Query();
		queryService.setDatasource('cartracker');
		queryService.setSQL("
			SELECT
				*
			FROM Color
			ORDER BY longName;
		");

		return queryService.execute().getResult();
	}

	public query function listCategories(){

		var queryService = new Query();
		queryService.setDatasource('cartracker');
		queryService.setSQL("
			SELECT
				*
			FROM Category
			ORDER BY longName;
		");

		return queryService.execute().getResult();
	}

	public query function listImagesByCarID( required string carID ){

		var queryService = new Query();
		queryService.setDatasource('cartracker');
		queryService.addParam(name="carID", value="#arguments.carID#");
		queryService.setSQL("
			SELECT
				*
			FROM Image
			WHERE carID = :carID
			ORDER BY path;
		");

		return queryService.execute().getResult();
	}

	public struct function save( required struct formScope ){

		if( !CSRFverifyToken(arguments.formScope.token, session.csrfToken) ){
			throw("Invalid token");
		}

		for( var formField in arguments.formScope ){
			if( IsSimpleValue(arguments.formScope[formField]) ){
				try{
					arguments.formScope[formField] = canonicalize(arguments.formScope[formField], true, true);
				} catch ( any e ){
					writeLog( file="encodingErrors", text="#formField# - #left(catch.logMessage, Find(' in', cfcatch.logMessage))#", type="error", application="true");
					// reset this variable so that its not harmful
					arguments.formScope[formField] = "";
				}
			}
		}

		var validationErrors = [];

		// make sure all number fields are numbers
		for( var numberField in ["carID","makeID","modelID","colorID","categoryID"] ){
			if( structKeyExists(arguments.formScope, numberField) and len(arguments.formScope[numberField]) and arguments.formScope[numberField] neq 'other' and not isValid("regex", arguments.formScope[numberField], "^[0-9]+$") ){
				arrayAppend(validationErrors, numberField & ' contains invalid characters');
			}
		}

		if( arrayLen(validationErrors) ){
			throw("The following errors have occurred - please go back and make changes<br/>" & arrayToList(validationErrors, '<br/>'));
		}

		// default some values for making new
		if( !structKeyExists(arguments.formScope, "newMake") ){
			arguments.formScope.newMake = '';
		}
		if( !structKeyExists(arguments.formScope, "newModel") ){
			arguments.formScope.newModel = '';
		}
		if( !structKeyExists(arguments.formScope, "newColor") ){
			arguments.formScope.newColor = '';
		}

		// are we adding a new make
		if( len(arguments.formScope.newMake) ){
			transaction {
				var make = entityNew("Make");
				make.setLongName(arguments.formScope.newMake);
				entitySave(make);
				transactionCommit();
			}
		} else {
			var make = entityLoad("Make", arguments.formScope.makeID, true);
		}

		// are we adding a new model
		if( len(arguments.formScope.newModel) ){
		  transaction {
		    var model = entityNew("Model");
		    model.setLongName(arguments.formScope.newModel);
			model.setMake(make);
		    entitySave(model);
		    transactionCommit();
		  }
		} else {
		  var model = entityLoad("Model", arguments.formScope.modelID, true);
		}

		// are we adding a new color
		if( len(arguments.formScope.newColor) ){
		  transaction {
		    var color = entityNew("Color");
		    color.setLongName(arguments.formScope.newColor);
		    entitySave(color);
		    transactionCommit();
		  }
		} else {
		  var color = entityLoad("Color", arguments.formScope.colorID, true);
		}

		// are we adding a new category»
		if( len(arguments.formScope.newCategory) ){
		  transaction {
		    var category = entityNew("Category");
		    category.setLongName(arguments.formScope.newCategory);
		    entitySave(category);
		    transactionCommit();
		  }
		} else {
		  var category = entityLoad("Category", arguments.formScope.categoryID, true);
		}

		// just get the approved status
		var status = entityLoad("Status", 1, true);

		// determine if we are doing an insert or update
		if( len(arguments.formScope.carID) and arguments.formScope.carID neq 0 ){
			var car = findCarByID(arguments.formScope.carID);
			var action = 'saved';
		} else {
			var car = entityNew("Car");
			var action = 'added';
		}

		// set standard parameters for all fields
		car.setMake(make);
		car.setModel(model);
		car.setColor(color);
		car.setCategory(category);
		car.setStatus(status);

		car.setStockNumber(arguments.formScope.stockNumber);
		car.setDescription(arguments.formScope.description);
		car.setYear(arguments.formScope.year);
		car.setListPrice(arguments.formScope.listPrice);
		car.setSalePrice(arguments.formScope.salePrice);
		car.setAcquisitionDate(dateFormat(now(), 'yyyy-mm-dd'));

		transaction {
			entitySave(car);
			transactionCommit();
		}

		return { "carID" = car.getCarID(), "action" = action };
	}

	private function getNewID( required string tableName){
		var queryService = new Query();
		queryService.setDatasource('cartracker');
		queryService.setSQL("SELECT MAX(#arguments.tableName#ID) AS newID FROM #ucase(left(arguments.tableName,1))##right(arguments.tableName, len(arguments.tableName) -1)#");
		return queryService.execute().getResult().newID + 1;
	}

	public void function delete( required string carID ){

		transaction {
			entityDelete(entityLoad("Car", arguments.carID, true));
			transactionCommit();
		}
	}

	public models.orm.Car function findCarByID( required string carID ){
		var carArray = entityLoad("Car", arguments.carID);
		return (arrayLen(carArray) eq 1) ? carArray[1] : entityNew("Car");
	}

	public array function findAllCars(){
		return ormExecuteQuery("from Car", false, { maxResults = 50 });
	}

	public array function findAllMakes(){
		return ormExecuteQuery("from Make", false, { maxResults = 50 });
	}

	public array function findAllModels(){
		return ormExecuteQuery("from Model", false, { maxResults = 50 });
	}

	public array function findAllColors(){
		return ormExecuteQuery("from Color", false, { maxResults = 50 });
	}

	public array function findAllCategories(){
		return ormExecuteQuery("from Category", false, { maxResults = 50 });
	}

	public array function findAllStatuses(){
		return ormExecuteQuery("from Status", false, { maxResults = 50 });
	}

}
