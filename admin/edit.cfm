<cfparam name="url.carID" default="0"/>

<cfscript>
	qryCar = request.wirebox.getInstance("CarService").getCar(url.carID);
	qryImages = request.wirebox.getInstance("CarService").getImagesForCar(url.carID);
	qryMakes = request.wirebox.getInstance("CarService").getMakes();
	qryModels = request.wirebox.getInstance("CarService").getModels();
	qryColors = request.wirebox.getInstance("CarService").getColors();
	qryCategories = request.wirebox.getInstance("CarService").getCategories();
</cfscript>

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
						<input type="hidden" name="carID" value="#encodeForHTMLAttribute(qryCar.carID)#"/>
						<input type="hidden" name="token" type="hidden" value="#CSRFGenerateToken(session.csrfToken, true)#"/>
						<div class="form-group">
							<label for="make">Make</label>
							<select name="makeID" id="make" class="custom-select customizeable">
								<option value="">--Select--</option>
								<cfloop query="#qryMakes#">
									<option value="#encodeForHTMLAttribute(qryMakes.makeID)#"<cfif qryCar.makeID eq qryMakes.makeID> selected="selected"</cfif>>#encodeForHTML(qryMakes.longName)#</option>
								</cfloop>
								<option value="other">Other</option>
							</select>
							<input type="text" class="form-control form-text d-none" name="newmake" id="newmake"/>
						</div>
						<div class="form-group">
							<label for="make">Model</label>
							<select name="modelID" id="model" class="custom-select customizeable">
								<option value="">--Select--</option>
								<cfloop query="#qryModels#">
									<option value="#encodeForHTMLAttribute(qryModels.modelID)#"<cfif qryCar.modelID eq qryModels.modelID> selected="selected"</cfif>>#encodeForHTML(qryModels.longName)#</option>
								</cfloop>
								<option value="other">Other</option>
							</select>
							<input type="text" class="form-control form-text d-none" name="newmodel" id="newmodel"/>
						</div>
						<div class="form-group">
							<label for="category">Category</label>
							<select name="categoryID" id="category" class="custom-select">
								<option value="">--Select--</option>
								<cfloop query="#qryCategories#">
									<option value="#encodeForHTMLAttribute(qryCategories.categoryID)#"<cfif qryCar.categoryID eq qryCategories.categoryID> selected="selected"</cfif>>#encodeForHTML(qryCategories.longName)#</option>
								</cfloop>
								<option value="other">Other</option>
							</select>
							<input type="text" class="form-control form-text d-none" name="newmodel" id="newmodel"/>
						</div>
						<div class="form-group">
							<label for="year">Year</label>
							<input type="text" class="form-control" name="year" id="year" value="#encodeForHTMLAttribute(qryCar.year)#"/>
						</div>
						<div class="form-group">
							<label for="color">Color</label>
							<select name="colorID" id="color" class="custom-select customizeable">
								<option value="">--Select--</option>
								<cfloop query="#qryColors#">
									<option value="#encodeForHTMLAttribute(qryColors.colorID)#"<cfif qryCar.colorID eq qryColors.colorID> selected="selected"</cfif>>#encodeForHTML(qryColors.longName)#</option>
								</cfloop>
								<option value="other">Other</option>
							</select>
							<input type="text" class="form-control form-text d-none" name="newcolor" id="newcolor"/>
						</div>
						<div class="form-group">
							<label for="stockNumber">Stock Number</label>
							<input type="text" class="form-control" name="stockNumber" id="stockNumber" value="#encodeForHTMLAttribute(qryCar.stockNumber)#"/>
						</div>
						<div class="form-group">
							<label for="listPrice">List Price</label>
							<input type="text" class="form-control" name="listPrice" id="listPrice" value="#encodeForHTMLAttribute(qryCar.listPrice)#"/>
						</div>
						<div class="form-group">
							<label for="salePrice">Sale Price</label>
							<input type="text" class="form-control" name="salePrice" id="salePrice" value="#encodeForHTMLAttribute(qryCar.salePrice)#"/>
						</div>
						<div class="form-group">
							<label for="description">Description:</label>
							<textarea id="description" name="description" class="rich-text">#encodeForHTMLAttribute(qryCar.description)#</textarea>
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
