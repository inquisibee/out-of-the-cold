<cfset getCars = request.services.carDAO.getAll()/>

<cfoutput>
<cfinclude template="/includes/cfml/header.cfm"/>
<!-- Area Chart -->
<div class="card border-0 shadow mb-4">
	<div class="card-header border-0 py-3 d-flex flex-row align-items-center justify-content-between">
		<h6 class="m-0 font-weight-bold text-primary">Available Cars</h6>
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
		<cfloop query="#getCars#">
			<div class="row mb-2">
				<div class="col-md-2"><a href="/cardetails.cfm?carID=#encodeForURL(getCars.carID)#">#encodeForHTML(getCars.make)# #encodeForHTML(getCars.model)#</a></div>
				<div class="col-md-2">#encodeForHTML(getCars.year)#</div>
				<div class="col-md-2">#encodeForHTML(getCars.color)#</div>
				<div class="col-md-2 text-right">$#encodeForHTML(getCars.listPrice)#</div>
				<div class="col-md-2 text-success text-right"><strong>$#encodeForHTML(getCars.salePrice)#</strong></div>
				<div class="col-md-2 text-right"><a href="/cardetails.cfm?carID=#encodeForURL(getCars.carID)#" class="btn btn-primary btn-sm">View</a></div>
			</div>
		</cfloop>
	</div>
</div>
<cfinclude template="/includes/cfml/footer.cfm"/>
</cfoutput>
