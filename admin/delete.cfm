<cfinclude template="/authenticate.cfm"/>

<cfscript>
	transaction {
		queryService = new Query();
		queryService.setDatasource('cartracker');
		queryService.addParam(name="carID", value="#url.carID#");

		// delete images
		queryService.setSQL("DELETE FROM Image WHERE carID = :carID");
		queryService.execute();

		// delete the car
		queryService.setSQL("DELETE FROM Car WHERE carID = :carID");
		queryService.execute();
	}
</cfscript>

<cflocation url="/admin/cars.cfm?alert=Car deleted successfully&alertType=success"/>
