<cfinclude template="/authenticate.cfm"/>

<cfparam name="url.carID" default="0"/>

<cfquery name="qryCar" datasource="cartracker">
	SELECT
		c.*,
		ma.makeID,
		ma.longName as make,
		mo.longName as model,
		mo.modelID,
		co.colorID,
		co.longName as color
	FROM Car c
	JOIN Make ma ON c.makeID = ma.makeID
	JOIN Model mo ON c.modelID = mo.modelID
	JOIN Color co ON c.colorID = co.colorID
	WHERE carID = #URL.carID#
</cfquery>

<!--- // images --->
<cfquery name="getImages" datasource="cartracker">
	SELECT *
	FROM Image
	WHERE carID = #URL.carID#
</cfquery>


<cfquery name="getMakes" datasource="cartracker">
	SELECT *
	FROM Make
	ORDER BY longName
</cfquery>

<cfquery name="getModels" datasource="cartracker">
	SELECT *
	FROM Model
	ORDER BY longName
</cfquery>

<cfquery name="getColors" datasource="cartracker">
	SELECT *
	FROM Color
	ORDER BY longName
</cfquery>

<cfquery name="getCategories" datasource="cartracker">
	SELECT *
	FROM Category
	ORDER BY longName
</cfquery>

<cfinclude template="/includes/cfml/header.cfm"/>

<!-- Area Chart -->
<cfoutput>
	<div class="card border-0 shadow mb-4">
		<div class="card-header border-0 py-3 d-flex flex-row align-items-center justify-content-between">
			<h6 class="m-0 font-weight-bold text-primary">Car Details</h6><a href="/admin/cars.cfm" class="btn btn-sm btn-primary">Back to Manager</a>
			<!-- Card Header Dropdown -->
		</div>

		<div class="card-body">
			<div class="row">
				<div class="col-md-12">
					<form action="save.cfm" method="post" id="car">
						<input type="hidden" name="carID" value="#qryCar.carID#"/>
						<div class="form-group">
							<label for="make">Make</label>
							<select name="makeID" id="make" class="custom-select customizeable">
								<option value="">--Select--</option>
								<cfloop query="#getMakes#">
									<option value="#getMakes.makeID#"<cfif qryCar.makeID eq getMakes.makeID> selected="selected"</cfif>>#getMakes.longName#</option>
								</cfloop>
								<option value="other">Other</option>
							</select>
							<input type="text" class="form-control form-text d-none" name="newmake" id="newmake"/>
						</div>
						<div class="form-group">
							<label for="make">Model</label>
							<select name="modelID" id="model" class="custom-select customizeable">
								<option value="">--Select--</option>
								<cfloop query="#getModels#">
									<option value="#getModels.modelID#"<cfif qryCar.modelID eq getModels.modelID> selected="selected"</cfif>>#getModels.longName#</option>
								</cfloop>
								<option value="other">Other</option>
							</select>
							<input type="text" class="form-control form-text d-none" name="newmodel" id="newmodel"/>
						</div>
						<div class="form-group">
							<label for="category">Category</label>
							<select name="categoryID" id="category" class="custom-select customizeable">
								<option value="">--Select--</option>
								<cfloop query="#getCategories#">
									<option value="#getCategories.categoryID#"<cfif qryCar.categoryID eq getCategories.categoryID> selected="selected"</cfif>>#getCategories.longName#</option>
								</cfloop>
								<option value="other">Other</option>
							</select>
							<input type="text" class="form-control form-text d-none" name="newcategory" id="newcategory"/>
						</div>
						<div class="form-group">
							<label for="year">Year</label>
							<input type="text" class="form-control" name="year" id="year" value="#qryCar.year#"/>
						</div>
						<div class="form-group">
							<label for="color">Color</label>
							<select name="colorID" id="color" class="custom-select customizeable">
								<option value="">--Select--</option>
								<cfloop query="#getColors#">
									<option value="#getColors.colorID#"<cfif qryCar.colorID eq getColors.colorID> selected="selected"</cfif>>#getColors.longName#</option>
								</cfloop>
								<option value="other">Other</option>
							</select>
							<input type="text" class="form-control form-text d-none" name="newcolor" id="newcolor"/>
						</div>
						<div class="form-group">
							<label for="stockNumber">Stock Number</label>
							<input type="text" class="form-control" name="stockNumber" id="stockNumber" value="#qryCar.stockNumber#"/>
						</div>
						<div class="form-group">
							<label for="listPrice">List Price</label>
							<input type="text" class="form-control" name="listPrice" id="listPrice" value="#qryCar.listPrice#"/>
						</div>
						<div class="form-group">
							<label for="salePrice">Sale Price</label>
							<input type="text" class="form-control" name="salePrice" id="salePrice" value="#qryCar.salePrice#"/>
						</div>
						<div class="form-group">
							<label for="description">Description:</label>
							<textarea id="description" name="description" class="rich-text">#qryCar.description#</textarea>
						</div>
						<div class="form-group text-right">
							<a class="btn btn-sm btn-danger" id="cancel" href="/admin/cars.cfm">Cancel</a>
							<button type="button" id="save" class="btn btn-sm btn-primary">Save</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</cfoutput>

<cfinclude template="/includes/cfml/footer.cfm"/>
