<cfset action = request.wirebox.getInstance("CarService").saveCar( formScope = form )/>
<cflocation url="/admin/cars.cfm?alert=Car #action# successfully&alertType=success"/>
