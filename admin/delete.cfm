<cfset request.wirebox.getInstance("CarService").deleteCar(url.carID)/>

<cflocation url="/admin/cars.cfm?alert=Car deleted successfully&alertType=success"/>
