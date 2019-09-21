/**
 * Handler for Cars
 */
component {

	// Inject a base ORM service
	property name="ORMService"          inject="entityService";
	// Inject a virtual service
	property name="VirtualCarService"   inject="entityService:SimpleCar";
	// Inject a concrete service from the `models` folder
	property name="carService"          inject="id:SimpleCarService";

	// Syntax Highlight Utility
	property name="cbCodeHighlight"		inject="@cbCodeHighlight";

	/**
	* Executes before all handler actions
	*/
	any function preHandler( event, rc, prc, action, eventArguments ){
		// Load cbCodeHighlight assets + theme
		addAsset( variables.cbCodeHighlight.getCSSAssets() );
	}

    /**
     * Home
     */
    function index( event, rc, prc ) {
        event.setView( "manager/index" );
    }

	function car( event, rc, prc ) {
		event.setView( "manager/car" );
	}

	function save( event, rc, prc ) {
		param name="rc.carID" default="0";
		param name="rc.newMake" default="";
		param name="rc.newModel" default="";
		param name="rc.newColor" default="";



		transaction {
			// are we adding a new make»
			if( len(rc.newMake) ){
				var makeQuery = new Query();
				makeQuery.setDatasource('cartracker');
				event.setValue('makeID', getNewID('make'));
				makeQuery.addParam(name="longName", value="#rc.newMake#");
				makeQuery.addParam(name="makeID", value="#rc.makeID#", cfsqltype="cf_sql_integer");
				makeQuery.setSQL("INSERT INTO Make(makeID, longName) VALUES(:makeID, :longName)");
				makeQuery.execute();
			}

			// are we adding a new model
			if( len(rc.newModel) ){
				var modelQuery = new Query();
				modelQuery.setDatasource('cartracker');
				event.setValue('modelID', getNewID('model'));
				modelQuery.addParam(name="longName", value="#rc.newmodel#");
				modelQuery.addParam(name="modelID", value="#rc.modelID#");
				modelQuery.addParam(name="makeID", value="#rc.makeID#");
				modelQuery.setSQL("INSERT INTO Model(modelID, makeID, longName) VALUES(:modelID, :makeID, :longName)");
				modelQuery.execute();

			}

			// are we adding a new color
			if( len(rc.newColor) ){
				var colorQuery = new Query();
				colorQuery.setDatasource('cartracker');
				event.setValue('colorID', getNewID('color'));
				colorQuery.addParam(name="longName", value="#rc.newcolor#");
				colorQuery.addParam(name="colorID", value="#rc.colorID#", cfsqltype="cf_sql_integer");
				colorQuery.setSQL("INSERT INTO Color(colorID, longName) VALUES(:colorID, :longName)");
				colorQuery.execute();
			}

			// main query service for inserting or updating the car
			var queryService = new Query();
			queryService.setDatasource('cartracker');

			// set standard parameters for all fields
			queryService.addParam(name="makeID", value="#rc.makeID#");
			queryService.addParam(name="modelID", value="#rc.modelID#");
			queryService.addParam(name="colorID", value="#rc.colorID#");
			queryService.addParam(name="stockNumber", value="#rc.stockNumber#");
			queryService.addParam(name="description", value="#rc.description#");
			queryService.addParam(name="categoryID", value="#rc.categoryID#");
			queryService.addParam(name="year", value="#rc.year#");
			queryService.addParam(name="listPrice", value="#rc.listPrice#", cfsqltype="cf_sql_integer");
			queryService.addParam(name="salePrice", value="#rc.salePrice#", cfsqltype="cf_sql_integer");
			queryService.addParam(name="acquisitionDate", value="#dateFormat(now(), 'yyyy-mm-dd')#");
			queryService.addParam(name="statusID", value="1");

			// determine if we are doing an insert or update
			if( len(rc.carID) and rc.carID neq 0 ){
				queryService.addParam(name="carID", value="#rc.carID#");
				queryService.setSQL("UPDATE Car set makeID = :makeID, modelID = :modelID, categoryID = :categoryID, year = :year, listPrice = :listPrice, salePrice = :salePrice, acqusitionDate = :acquisitionDate, colorID = :colorID, stockNumber = :stockNumber, statusID = :statusID, description = :description WHERE carID = :carID ");
				var action = 'saved';
			} else {
				queryService.addParam(name="carID", value="#getNewID('car')#");
				queryService.setSQL("INSERT INTO Car ( carID, makeID, modelID, categoryID, year, listPrice, salePrice, acquisitionDate, colorID, stockNumber, statusID, description ) VALUES ( :carID, :makeID, :modelID, :categoryID, :year, :listPrice, :salePrice, :acquisitionDate, :colorID, :stockNumber, :statusID, :description )");
				var action = 'added';
			}
			queryService.execute();
		}

		// return the user to the home page
		relocate( event="manager.index", queryString="alert=Car #action# successfully&alertType=success" );

	}

	function delete( event, rc, prc ){
		transaction {
			var queryService = new Query();
			queryService.setDatasource('cartracker');
			queryService.addParam(name="carID", value="#rc.carID#");

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

		// return the user to the home page
		relocate( event="manager.index", queryString="alert=Car deleted successfully&alertType=success" );
	}

	private function getNewID( required string tableName){
		var queryService = new Query();
		queryService.setDatasource('cartracker');
		queryService.setSQL("SELECT MAX(#arguments.tableName#ID) AS newID FROM #ucase(left(arguments.tableName,1))##right(arguments.tableName, len(arguments.tableName) -1)#");
		return queryService.execute().getResult().newID + 1;
	}
}
