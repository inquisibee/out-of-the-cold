<cfinclude template="/authenticate.cfm"/>

<cfquery name="qryCars" datasource="cartracker">
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
</cfquery>

<cfinclude template="/includes/cfml/header.cfm"/>
<cfoutput>
<!-- Area Chart -->
<div class="card border-0 shadow mb-4">
	<div class="card-header border-0 py-3 d-flex flex-row align-items-center justify-content-between">
		<h6 class="m-0 font-weight-bold text-primary">Cars</h6><a href="edit.cfm" class="btn btn-sm btn-info">New Car</a>
		<!-- Card Header Dropdown -->
	</div>
	<div class="card-body">
		<div class="row mb-2">
			<div class="col-md-2 border-bottom">Car Make/Model</div>
			<div class="col-md-2 border-bottom">Year</div>
			<div class="col-md-2 border-bottom">Color</div>
			<div class="col-md-2 border-bottom text-right">Listing</div>
			<div class="col-md-2 border-bottom text-right">Sale</div>
			<div class="col-md-2 border-bottom"></div>
		</div>
		<cfloop query="#qryCars#">
			<div class="row mb-2">
				<div class="col-md-2"><a href="edit.cfm?carID=#qryCars.carID#">#qryCars.make# #qryCars.model#</a></div>
				<div class="col-md-2">#qryCars.year#</div>
				<div class="col-md-2">#qryCars.color#</div>
				<div class="col-md-2 text-right">$#qryCars.listPrice#</div>
				<div class="col-md-2 text-success text-right"><strong>$#qryCars.salePrice#</strong></div>
				<div class="col-md-2 text-right">
					<a href="edit.cfm?carID=#qryCars.carID#" class="btn btn-primary btn-sm">Edit</a>
					<a href="delete.cfm?carID=#qryCars.carID#" class="btn btn-danger btn-sm">Delete</a>
				</div>
			</div>
		</cfloop>
	</div>
</div>
</cfoutput>
<cfinclude template="/includes/cfml/footer.cfm"/>
