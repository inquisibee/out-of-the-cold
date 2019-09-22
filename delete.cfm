<cfscript>
	transaction {
		queryService = new Query();
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
</cfscript>

<cflocation url="admin.cfm?alert=Car deleted successfully&alertType=success"/>
