<cfparam name="url.carID" default="12"/>

<cfset qryCar = request.wirebox.getInstance("CarService").getCar(url.carID)/>

<!--- // images --->
<cfquery name="getImages" datasource="cartracker">
	SELECT *
	FROM Image
	WHERE carID = <cfqueryparam value="#URL.carID#" cfsqltype="cf_sql_integer"/>
</cfquery>

<cfinclude template="/includes/cfml/header.cfm"/>

<!-- Area Chart -->
<cfoutput>
	<div class="card border-0 shadow mb-4">
		<div class="card-header border-0 py-3 d-flex flex-row align-items-center justify-content-between">
			<h6 class="m-0 font-weight-bold text-primary">Car Details</h6><a href="index.cfm" class="btn btn-sm btn-primary">Back to listings</a>
			<!-- Card Header Dropdown -->
		</div>

		<div class="card-body">
			<cfif qryCar.recordCount>
				<div class="row">
					<div class="col-md-6">
						<div id="carousel" class="carousel slide" data-ride="carousel">
							<ol class="carousel-indicators">
								<cfloop from="1" to="#getImages.recordCount#" index="itm">
									<li data-target="##carouselExampleIndicators" data-slide-to="#itm#-1"#itm eq 1 ? 'class="active"' : ''#></li>
								</cfloop>
							</ol>
							<div class="carousel-inner">
								<cfif !getImages.recordCount>
									<div class="carousel-item active">
										<img class="d-block w-100" src="/includes/images/cars/placeholderCar.png" alt=""/>
									</div>
								</cfif>
								<cfloop query="#getImages#">
									<div class="carousel-item #getImages.currentRow eq 1 ? 'active' : ''#">
										<img class="d-block w-100" src="#encodeForHTMLAttribute(getImages.path)#" alt=""/>
									</div>
								</cfloop>
								<a class="carousel-control-prev" href="##carousel" role="button" data-slide="prev">
									<span class="carousel-control-prev-icon" aria-hidden="true"></span>
									<span class="sr-only">Previous</span>
								</a>
								<a class="carousel-control-next" href="##carousel" role="button" data-slide="next">
									<span class="carousel-control-next-icon" aria-hidden="true"></span>
									<span class="sr-only">Next</span>
								</a>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<h3>#encodeForHTML(qryCar.year)# #encodeForHTML(qryCar.make)# #encodeForHTML(qryCar.model)#</h3>
						<strong>#encodeForHTML(qryCar.color)#</strong><br/>
						<strong>#encodeForHTML(qryCar.transmission)#</strong><br/>
						<div class="alert alert-success text-center"><strong>$#encodeForHTML(qryCar.salePrice)#</strong></div>
						Stock No: #encodeForHTML(qryCar.stockNumber)#<br/>
						<blockquote>#qryCar.description#</blockquote>
					</div>
				</div>
			<cfelse>
				<h1>Sorry, that car is not available :(</h1>
			</cfif>

		</div>
	</div>
</cfoutput>

<cfinclude template="/includes/cfml/footer.cfm"/>
