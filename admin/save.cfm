<cfset action = application.services.carService.saveCar( formScope = form )/>
<cflocation url="/admin/cars.cfm?alert=Car #action# successfully&alertType=success"/>
