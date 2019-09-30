
component extends="testbox.system.BaseSpec"{


	// set local variable for the CarService
	variables.carService = request.wirebox.getInstance("CarService");
	variables.carID = 9999999;

	function beforeAll(){
		// make sure the car isn't defined yet
		deleteCar(variables.carID);
		// create the car record
		addCar(variables.carID);
	}

	function afterAll(){
		deleteCar(variables.carID);
	}

	private query function getRandomAttributes(){
		var queryService = new Query();
		queryService.setDatasource("carTracker");
		queryService.setSQL("
			SELECT
				(SELECT makeID FROM Make LIMIT 1) as makeID,
				(SELECT modelID FROM Model LIMIT 1) as modelID,
				(SELECT categoryID FROM Category LIMIT 1) as categoryID,
				(SELECT colorID FROM Color LIMIT 1) as colorID,
				(SELECT statusID FROM Status LIMIT 1) as statusID
			FROM
				Car
			LIMIT 1
		");
		return queryService.execute().getResult();
	}

	private void function addCar( string carID = '9999999'){
		// get some random data to use in the insert
		var randomAttributes = getRandomAttributes();
		// create a sample car with a very unique ID
		var queryService = new Query();
		queryService.setDatasource("carTracker");
		queryService.addParam(name="carID", value="#arguments.carID#");
		queryService.addParam(name="makeID", value="#randomAttributes.makeID#");
		queryService.addParam(name="modelID", value="#randomAttributes.modelID#");
		queryService.addParam(name="categoryID", value="#randomAttributes.categoryID#");
		queryService.addParam(name="colorID", value="#randomAttributes.colorID#");
		queryService.addParam(name="statusID", value="#randomAttributes.statusID#");
		queryService.setSQL("
			INSERT INTO Car (CarID, MakeID, ModelID, ColorID, CategoryID, Description, Year, ListPrice, AcquisitionDate, StatusID, CreatedDate, Active)
			VALUES( :carID, :makeID, :modelID, :colorID, :categoryID, 'This is a car', 2018, 12000, now(), :statusID, now(), 1)
		");
		queryService.execute();
	}

	private void function deleteCar( required numeric carID ){
		var queryService = new Query();
		queryService.setDatasource("carTracker");
		queryService.addParam(name="carID", value="#arguments.carID#");
		queryService.setSQL("DELETE FROM Car WHERE carID = :carID");
		queryService.execute();
	}


	function run(){

		describe("The CarService component should", function(){

			it("initialize correctly", function(){
				expect(1).toBe(1);
			});

			it("return the test car.", function(){
				var carQry = variables.carService.getCar(variables.carID);
				// make sure we get back one record
				expect(carQry.recordCount).toBe(1);
				// make sure we get back the record we expected
				expect(carQry.carID).toBe(variables.carID);
			});

			it("create a car", function(){
				// get some random data
				var randomAttributes = getRandomAttributes();
				var formStruct = {
					"carID" = "",
					"makeID" = randomAttributes.makeID,
					"modelID" = randomAttributes.modelID,
					"categoryID" = randomAttributes.categoryID,
					"colorID" = randomAttributes.colorID,
					"statusID" = randomAttributes.statusID,
					"description" = "I am a brand new car guy",
					"year" = 2019,
					"listPrice" = 23000,
					"salePrice" = 21000,
					"acquisitionDate" = now(),
					"createdDate" = now(),
					"active" = 1,
					"stockNumber" = "19213120",
					"token" = CSRFGenerateToken(session.csrfToken, true)
				};
				var results = variables.carService.saveCar( formScope = formStruct);

				// make sure its a valid id
				expect(results).toBeStruct(0);
				expect(results).toHaveKey("carID");
				expect(results).toHaveKey("action");
				expect(results.carID).toBeGT(0);
				expect(results.action).toBe("added");
				// make sure we delete this
				deleteCar(results.carID);
			});

			it("get an existing car", function(){
				var carQry = variables.carService.getCar(variables.carID);

				expect(carQry.recordCount).toBe(1);
				expect(carQry.carID).toBe(variables.carID);

			});

			it("update an exiting car", function(){
				var carQry = variables.carService.getCar(variables.carID);
				var newDescription = 'I am all updated and what not';
				var formStruct = {
					"carID" = variables.carID,
					"makeID" = carQry.makeID,
					"modelID" = carQry.modelID,
					"categoryID" = carQry.categoryID,
					"colorID" = carQry.colorID,
					"statusID" = carQry.statusID,
					"description" = newDescription,
					"year" = carQry.year,
					"listPrice" = carQry.listPrice,
					"salePrice" = carQry.listPrice - 100,
					"acquisitionDate" = carQry.acquisitionDate,
					"createdDate" = carQry.createdDate,
					"active" = carQry.active,
					"stockNumber" = carQry.stockNumber,
					"token" = CSRFGenerateToken(session.csrfToken, true)
				};
				// save car
				var updatedCar = variables.carService.saveCar( formScope = formStruct );

				expect(updatedCar).toBeStruct();
				expect(updatedCar).toHaveKey("carID");
				expect(updatedCar).toHaveKey("action");
				expect(updatedCar.carID).toBe(variables.carID);
				expect(updatedCar.action).toBe("saved");

				// get the car back
				var updatedCarQry = variables.carService.getCar(variables.carID);
				// make sure the description has been updated
				expect(updatedCarQry.description).toBe(newDescription);
			});

			it("delete an existing car", function(){
				variables.carService.deleteCar(variables.carID);
				// try and get the car
				var carQry = variables.carService.getCar(variables.carID);
				expect(carQry.recordCount).toBe(0);

			});

		});

	}




}
