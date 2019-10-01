<cfparam name="url.carID" default="12"/>

<cfset car = request.wirebox.getInstance("CarService").findCarByID(url.carID)/>

<cfinclude template="/includes/cfml/header.cfm"/>

<!-- Area Chart -->
<cfoutput>
	<div class="card border-0 shadow mb-4">
		<div class="card-header border-0 py-3 d-flex flex-row align-items-center justify-content-between">
			<h6 class="m-0 font-weight-bold text-primary">Car Details</h6><a href="index.cfm" class="btn btn-sm btn-primary">Back to listings</a>
			<!-- Card Header Dropdown -->
		</div>

		<div class="card-body">
			<cfif !isNull(car.getCarID())>
				<div class="row">
					<div class="col-md-6">
						<div id="carousel" class="carousel slide" data-ride="carousel">
							<ol class="carousel-indicators">
								<cfloop from="1" to="#arrayLen(car.getImages())#" index="itm">
									<li data-target="##carouselExampleIndicators" data-slide-to="#itm#-1"#itm eq 1 ? 'class="active"' : ''#></li>
								</cfloop>
							</ol>
							<div class="carousel-inner">
								<cfif !arrayLen(car.getImages())>
									<div class="carousel-item active">
										<img class="d-block w-100" src="/includes/images/cars/placeholderCar.png" alt=""/>
									</div>
								</cfif>
								<cfloop from="1" to="#arrayLen(car.getImages())#" index="itm">
									<div class="carousel-item #itm eq 1 ? 'active' : ''#">
										<img class="d-block w-100" src="#encodeForHTMLAttribute(car.getImages()[itm].getPath())#" alt=""/>
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
						<h3>#encodeForHTML(car.getYear())# #encodeForHTML(car.getMake().getLongName())# #encodeForHTML(car.getModel().getLongName())#</h3>
						<strong>#encodeForHTML(car.getColor().getLongName())#</strong><br/>
						<strong>#encodeForHTML(car.getTransmission())#</strong><br/>
						<div class="alert alert-success text-center"><strong>$#encodeForHTML(car.getSalePrice())#</strong></div>
						Stock No: #encodeForHTML(car.getStockNumber())#<br/>
						<blockquote>#car.getDescription()#</blockquote>
					</div>
				</div>
			<cfelse>
				<h1>Sorry, that car is not available :(</h1>
			</cfif>

		</div>
	</div>
</cfoutput>

<cfinclude template="/includes/cfml/footer.cfm"/>
