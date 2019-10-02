<cfoutput>
<!-- Area Chart -->
<div class="card border-0 shadow mb-4">
	<div class="card-header border-0 py-3 d-flex flex-row align-items-center justify-content-between">
		<h6 class="m-0 font-weight-bold text-primary">Available Cars</h6>
		<!-- Card Header Dropdown -->
	</div>

	<div class="card-body">
		<cfif structKeyExists(rc, "message")>
			<div class="alert alert-warning">#encodeForHTML(decodeFromURL(rc.message))#</div>
		</cfif>
		<form action="#event.buildLink('authentication.index')#" method="post">
			<input type="hidden" name="redirectURL" value="" />
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
</cfoutput>
