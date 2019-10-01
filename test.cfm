// index.cfm
<cfscript>
	/*sampleService = createObject('component', 'models.service.SampleService');
	writeOutput("<br/>public variable: ");
	writeDump(sampleService.getPublicVariable1());
	writeOutput("<br/>private variable: ");
	writeDump(sampleService.getPrivateVariable1());
	writeOutput("<br/>public variable direct: ");
	writeDump(sampleService.variable1);
	writeOutput("<br/>base public variable: ");
	writeDump(sampleService.getPublicBaseVariable1());
	writeOutput("<br/>base private variable: ");
	writeDump(sampleService.getPrivateBaseVariable1());
	writeOutput("<br/>");*/


	// get a particular instance of the car bean
	carArray = entityLoad("Car", 11);
	writeDump(carArray);
</cfscript>
