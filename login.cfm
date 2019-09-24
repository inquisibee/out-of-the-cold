<cfoutput>
<cfinclude template="/includes/cfml/header.cfm"/>
<!-- Area Chart -->
<div class="card border-0 shadow mb-4">
	<div class="card-header border-0 py-3 d-flex flex-row align-items-center justify-content-between">
		<h6 class="m-0 font-weight-bold text-primary">Available Cars</h6>
		<!-- Card Header Dropdown -->
	</div>
	<div class="card-body">
		<form action="authenticate.cfm" method="post">
			<input type="hidden" name="redirectURL" value="#(structKeyExists(url, 'redirectURL')) ? url.redirectURL : '/admin/cars.cfm'#" />
			<div class="row mb-2">
				<div class="col-md-2">Username</div>
				<div class="col-md-2"><input type="text" name="username"/></div>
			</div>
			<div class="row mb-2">
				<div class="col-md-2">Password</div>
				<div class="col-md-2"><input type="password" name="password"/></div>
			</div>
			<div class="row mb-2">
				<div class="col-md-12 text-right">
					<button type="submit" class="btn btn-sm btn-primary">Login</button>
				</div>
			</div>
		</form>
	</div>
</div>
<cfinclude template="/includes/cfml/footer.cfm"/>
</cfoutput>
