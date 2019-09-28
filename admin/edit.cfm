<cfparam name="url.carID" default="0"/>

<cfquery name="getCar" datasource="cartracker">
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
	WHERE carID = <cfqueryparam value="#URL.carID#" cfsqltype="cf_sql_integer"/>
</cfquery>

<!--- // images --->
<cfquery name="getImages" datasource="cartracker">
	SELECT *
	FROM Image
	WHERE carID = <cfqueryparam value="#URL.carID#" cfsqltype="cf_sql_integer"/>
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
					<form action="save.cfm" method="post">
						<input type="hidden" name="carID" value="#encodeForHTMLAttribute(getCar.carID)#"/>
						<input type="hidden" name="token" type="hidden" value="#CSRFGenerateToken(session.csrfToken, true)#"/>
						<div class="form-group">
							<label for="make">Make</label>
							<select name="makeID" id="make" class="custom-select customizeable">
								<option value="">--Select--</option>
								<cfloop query="#getMakes#">
									<option value="#encodeForHTMLAttribute(getMakes.makeID)#"<cfif getCar.makeID eq getMakes.makeID> selected="selected"</cfif>>#encodeForHTML(getMakes.longName)#</option>
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
									<option value="#encodeForHTMLAttribute(getModels.modelID)#"<cfif getCar.modelID eq getModels.modelID> selected="selected"</cfif>>#encodeForHTML(getModels.longName)#</option>
								</cfloop>
								<option value="other">Other</option>
							</select>
							<input type="text" class="form-control form-text d-none" name="newmodel" id="newmodel"/>
						</div>
						<div class="form-group">
							<label for="category">Category</label>
							<select name="categoryID" id="category" class="custom-select">
								<option value="">--Select--</option>
								<cfloop query="#getCategories#">
									<option value="#encodeForHTMLAttribute(getCategories.categoryID)#"<cfif getCar.categoryID eq getCategories.categoryID> selected="selected"</cfif>>#encodeForHTML(getCategories.longName)#</option>
								</cfloop>
								<option value="other">Other</option>
							</select>
							<input type="text" class="form-control form-text d-none" name="newmodel" id="newmodel"/>
						</div>
						<div class="form-group">
							<label for="year">Year</label>
							<input type="text" class="form-control" name="year" id="year" value="#encodeForHTMLAttribute(getCar.year)#"/>
						</div>
						<div class="form-group">
							<label for="color">Color</label>
							<select name="colorID" id="color" class="custom-select customizeable">
								<option value="">--Select--</option>
								<cfloop query="#getColors#">
									<option value="#encodeForHTMLAttribute(getColors.colorID)#"<cfif getCar.colorID eq getColors.colorID> selected="selected"</cfif>>#encodeForHTML(getColors.longName)#</option>
								</cfloop>
								<option value="other">Other</option>
							</select>
							<input type="text" class="form-control form-text d-none" name="newcolor" id="newcolor"/>
						</div>
						<div class="form-group">
							<label for="stockNumber">Stock Number</label>
							<input type="text" class="form-control" name="stockNumber" id="stockNumber" value="#encodeForHTMLAttribute(getCar.stockNumber)#"/>
						</div>
						<div class="form-group">
							<label for="listPrice">List Price</label>
							<input type="text" class="form-control" name="listPrice" id="listPrice" value="#encodeForHTMLAttribute(getCar.listPrice)#"/>
						</div>
						<div class="form-group">
							<label for="salePrice">Sale Price</label>
							<input type="text" class="form-control" name="salePrice" id="salePrice" value="#encodeForHTMLAttribute(getCar.salePrice)#"/>
						</div>
						<div class="form-group">
							<label for="description">Description:</label>
							<textarea id="description" name="description" class="rich-text">#encodeForHTMLAttribute(getCar.description)#</textarea>
						</div>
						<div class="form-group text-right">
							<a class="btn btn-sm btn-danger" id="cancel" href="/admin/cars.cfm">Cancel</a>
							<button type="submit" class="btn btn-sm btn-primary">Save</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</cfoutput>

<cfinclude template="/includes/cfml/footer.cfm"/>
