<cfinclude template="/authenticate.cfm"/>

<cfscript>

if( !CSRFverifyToken(form.token, session.csrfToken) ){
	throw("Invalid token");
}

for( formField in form ){
	if( IsSimpleValue(form[formField]) ){
		try{
			form[formField] = canonicalize(form[formField], true, true);
		} catch ( any e ){
			writeLog( file="encodingErrors", text="#formField# - #left(catch.logMessage, Find(' in', cfcatch.logMessage))#", type="error", application="true");
			// reset this variable so that its not harmful
			form[formField] = "";
		}
	}
}

validationErrors = [];

// make sure all number fields are numbers
for( numberField in ["carID","makeID","modelID","colorID","categoryID"] ){
	if( structKeyExists(form, numberField) and len(form[numberField]) and not isValid("regex", form[numberField], "^[0-9]+$") ){
		arrayAppend(validationErrors, numberField & ' contains invalid characters');
	}
}

if( arrayLen(validationErrors) ){
	throw("The following errors have occurred - please go back and make changes<br/>" & arrayToList(validationErrors, '<br/>'));
}

transaction {
	// are we adding a new make»
	if( len(form.newMake) ){
		makeQuery = new Query();
		makeQuery.setDatasource('cartracker');
		event.setValue('makeID', getNewID('make'));
		makeQuery.addParam(name="longName", value="#form.newMake#");
		makeQuery.addParam(name="makeID", value="#form.makeID#", cfsqltype="cf_sql_integer");
		makeQuery.setSQL("INSERT INTO Make(makeID, longName) VALUES(:makeID, :longName)");
		makeQuery.execute();
	}

	// are we adding a new model
	if( len(form.newModel) ){
		modelQuery = new Query();
		modelQuery.setDatasource('cartracker');
		event.setValue('modelID', getNewID('model'));
		modelQuery.addParam(name="longName", value="#form.newmodel#");
		modelQuery.addParam(name="modelID", value="#form.modelID#");
		modelQuery.addParam(name="makeID", value="#form.makeID#");
		modelQuery.setSQL("INSERT INTO Model(modelID, makeID, longName) VALUES(:modelID, :makeID, :longName)");
		modelQuery.execute();

	}

	// are we adding a new color
	if( len(form.newColor) ){
		colorQuery = new Query();
		colorQuery.setDatasource('cartracker');
		event.setValue('colorID', getNewID('color'));
		colorQuery.addParam(name="longName", value="#form.newcolor#");
		colorQuery.addParam(name="colorID", value="#form.colorID#", cfsqltype="cf_sql_integer");
		colorQuery.setSQL("INSERT INTO Color(colorID, longName) VALUES(:colorID, :longName)");
		colorQuery.execute();
	}

	// main query service for inserting or updating the car
	queryService = new Query();
	queryService.setDatasource('cartracker');

	// set standard parameters for all fields
	queryService.addParam(name="makeID", value="#form.makeID#");
	queryService.addParam(name="modelID", value="#form.modelID#");
	queryService.addParam(name="colorID", value="#form.colorID#");
	queryService.addParam(name="stockNumber", value="#form.stockNumber#");
	queryService.addParam(name="description", value="#form.description#");
	queryService.addParam(name="categoryID", value="#form.categoryID#");
	queryService.addParam(name="year", value="#form.year#");
	queryService.addParam(name="listPrice", value="#form.listPrice#", cfsqltype="cf_sql_integer");
	queryService.addParam(name="salePrice", value="#form.salePrice#", cfsqltype="cf_sql_integer");
	queryService.addParam(name="acquisitionDate", value="#dateFormat(now(), 'yyyy-mm-dd')#");
	queryService.addParam(name="statusID", value="1");

	// determine if we are doing an insert or update
	if( len(form.carID) and form.carID neq 0 ){
		queryService.addParam(name="carID", value="#form.carID#");
		queryService.setSQL("UPDATE Car set makeID = :makeID, modelID = :modelID, categoryID = :categoryID, year = :year, listPrice = :listPrice, salePrice = :salePrice, acquisitionDate = :acquisitionDate, colorID = :colorID, stockNumber = :stockNumber, statusID = :statusID, description = :description WHERE carID = :carID ");
		action = 'saved';
	} else {
		queryService.addParam(name="carID", value="#getNewID('car')#");
		queryService.setSQL("INSERT INTO Car ( carID, makeID, modelID, categoryID, year, listPrice, salePrice, acquisitionDate, colorID, stockNumber, statusID, description ) VALUES ( :carID, :makeID, :modelID, :categoryID, :year, :listPrice, :salePrice, :acquisitionDate, :colorID, :stockNumber, :statusID, :description )");
		action = 'added';
	}
	queryService.execute();

	private function getNewID( required string tableName){
		var queryService = new Query();
		queryService.setDatasource('cartracker');
		queryService.setSQL("SELECT MAX(#arguments.tableName#ID) AS newID FROM #ucase(left(arguments.tableName,1))##right(arguments.tableName, len(arguments.tableName) -1)#");
		return queryService.execute().getResult().newID + 1;
	}
}
</cfscript>
<cflocation url="/admin/cars.cfm?alert=Car #action# successfully&alertType=success"/>
