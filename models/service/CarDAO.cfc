component extends="models.service.BaseDAO" singleton {

	public query function getCar( required string carID ){
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

	public query function getAll(){
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

}
