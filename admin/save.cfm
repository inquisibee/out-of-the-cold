<cfset results = request.wirebox.getInstance("CarService").saveCar( formScope = form )/>
<cflocation url="/admin/cars.cfm?alert=Car #results.action# successfully&alertType=success"/>
