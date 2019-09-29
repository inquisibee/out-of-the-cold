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

	public string function save( required struct formScope ){

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
			if( structKeyExists(arguments.formScope, numberField) and len(arguments.formScope[numberField]) and not isValid("regex", arguments.formScope[numberField], "^[0-9]+$") ){
				arrayAppend(validationErrors, numberField & ' contains invalid characters');
			}
		}

		if( arrayLen(validationErrors) ){
			throw("The following errors have occurred - please go back and make changes<br/>" & arrayToList(validationErrors, '<br/>'));
		}

		transaction {
			// are we adding a new make»
			if( len(arguments.formScope.newMake) ){
				var makeQuery = new Query();
				makeQuery.setDatasource('cartracker');
				event.setValue('makeID', getNewID('make'));
				makeQuery.addParam(name="longName", value="#arguments.formScope.newMake#");
				makeQuery.addParam(name="makeID", value="#arguments.formScope.makeID#", cfsqltype="cf_sql_integer");
				makeQuery.setSQL("INSERT INTO Make(makeID, longName) VALUES(:makeID, :longName)");
				makeQuery.execute();
			}

			// are we adding a new model
			if( len(arguments.formScope.newModel) ){
				var modelQuery = new Query();
				modelQuery.setDatasource('cartracker');
				event.setValue('modelID', getNewID('model'));
				modelQuery.addParam(name="longName", value="#arguments.formScope.newmodel#");
				modelQuery.addParam(name="modelID", value="#arguments.formScope.modelID#");
				modelQuery.addParam(name="makeID", value="#arguments.formScope.makeID#");
				modelQuery.setSQL("INSERT INTO Model(modelID, makeID, longName) VALUES(:modelID, :makeID, :longName)");
				modelQuery.execute();

			}

			// are we adding a new color
			if( len(arguments.formScope.newColor) ){
				var colorQuery = new Query();
				colorQuery.setDatasource('cartracker');
				event.setValue('colorID', getNewID('color'));
				colorQuery.addParam(name="longName", value="#arguments.formScope.newcolor#");
				colorQuery.addParam(name="colorID", value="#arguments.formScope.colorID#", cfsqltype="cf_sql_integer");
				colorQuery.setSQL("INSERT INTO Color(colorID, longName) VALUES(:colorID, :longName)");
				colorQuery.execute();
			}

			// main query service for inserting or updating the car
			var queryService = new Query();
			queryService.setDatasource('cartracker');

			// set standard parameters for all fields
			queryService.addParam(name="makeID", value="#arguments.formScope.makeID#");
			queryService.addParam(name="modelID", value="#arguments.formScope.modelID#");
			queryService.addParam(name="colorID", value="#arguments.formScope.colorID#");
			queryService.addParam(name="stockNumber", value="#arguments.formScope.stockNumber#");
			queryService.addParam(name="description", value="#arguments.formScope.description#");
			queryService.addParam(name="categoryID", value="#arguments.formScope.categoryID#");
			queryService.addParam(name="year", value="#arguments.formScope.year#");
			queryService.addParam(name="listPrice", value="#arguments.formScope.listPrice#", cfsqltype="cf_sql_integer");
			queryService.addParam(name="salePrice", value="#arguments.formScope.salePrice#", cfsqltype="cf_sql_integer");
			queryService.addParam(name="acquisitionDate", value="#dateFormat(now(), 'yyyy-mm-dd')#");
			queryService.addParam(name="statusID", value="1");

			// determine if we are doing an insert or update
			if( len(arguments.formScope.carID) and arguments.formScope.carID neq 0 ){
				queryService.addParam(name="carID", value="#arguments.formScope.carID#");
				queryService.setSQL("UPDATE Car set makeID = :makeID, modelID = :modelID, categoryID = :categoryID, year = :year, listPrice = :listPrice, salePrice = :salePrice, acquisitionDate = :acquisitionDate, colorID = :colorID, stockNumber = :stockNumber, statusID = :statusID, description = :description WHERE carID = :carID ");
				var action = 'saved';
			} else {
				queryService.addParam(name="carID", value="#getNewID('car')#");
				queryService.setSQL("INSERT INTO Car ( carID, makeID, modelID, categoryID, year, listPrice, salePrice, acquisitionDate, colorID, stockNumber, statusID, description ) VALUES ( :carID, :makeID, :modelID, :categoryID, :year, :listPrice, :salePrice, :acquisitionDate, :colorID, :stockNumber, :statusID, :description )");
				var action = 'added';
			}
			queryService.execute();

			return action;
		}
	}

	private function getNewID( required string tableName){
		var queryService = new Query();
		queryService.setDatasource('cartracker');
		queryService.setSQL("SELECT MAX(#arguments.tableName#ID) AS newID FROM #ucase(left(arguments.tableName,1))##right(arguments.tableName, len(arguments.tableName) -1)#");
		return queryService.execute().getResult().newID + 1;
	}

	public void function delete( required string carID ){

		transaction {
			var queryService = new Query();
			queryService.setDatasource('cartracker');
			queryService.addParam(name="carID", value="#url.carID#");

			// delete images
			queryService.setSQL("DELETE FROM Image WHERE carID = :carID");
			queryService.execute();

			// delete features
			queryService.setSQL("DELETE FROM CarFeature WHERE carID = :carID");
			queryService.execute();

			// delete workflow
			queryService.setSQL("DELETE FROM Workflow WHERE carID = :carID");
			queryService.execute();

			// delete the car
			queryService.setSQL("DELETE FROM Car WHERE carID = :carID");
			queryService.execute();
		}
	}

}
