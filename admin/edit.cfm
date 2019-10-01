<cfparam name="url.carID" default="0"/>

<cfscript>
	car = request.wirebox.getInstance("CarService").findCarByID(url.carID);
	arMakes = request.wirebox.getInstance("CarService").findAllMakes();
	arModels = request.wirebox.getInstance("CarService").findAllModels();
	arColors = request.wirebox.getInstance("CarService").findAllColors();
	arCategories = request.wirebox.getInstance("CarService").findAllCategories();
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
						<input type="hidden" name="carID" value="#encodeForHTMLAttribute(car.getCarID())#"/>
						<input type="hidden" name="token" type="hidden" value="#CSRFGenerateToken(session.csrfToken, true)#"/>
						<div class="form-group">
							<label for="make">Make</label>
							<select name="makeID" id="make" class="custom-select customizeable">
								<option value="">--Select--</option>
								<cfloop array="#arMakes#" index="make">
									<option value="#encodeForHTMLAttribute(make.getMakeID())#"<cfif !isNull(car.getMake()) and car.getMake().getMakeID() eq make.getMakeID()> selected="selected"</cfif>>#encodeForHTML(make.getLongName())#</option>
								</cfloop>
								<option value="other">Other</option>
							</select>
							<input type="text" class="form-control form-text d-none" name="newmake" id="newmake"/>
						</div>
						<div class="form-group">
							<label for="make">Model</label>
							<select name="modelID" id="model" class="custom-select customizeable">
								<option value="">--Select--</option>
								<cfloop array="#arModels#" index="model">
									<option value="#encodeForHTMLAttribute(model.getModelID())#"<cfif !isNull(car.getModel()) and car.getModel().getModelID() eq model.getModelID()> selected="selected"</cfif>>#encodeForHTML(model.getLongName())#</option>
								</cfloop>
								<option value="other">Other</option>
							</select>
							<input type="text" class="form-control form-text d-none" name="newmodel" id="newmodel"/>
						</div>
						<div class="form-group">
							<label for="category">Category</label>
							<select name="categoryID" id="category" class="custom-select">
								<option value="">--Select--</option>
								<cfloop array="#arCategories#" index="category">
									<option value="#encodeForHTMLAttribute(category.getCategoryID())#"<cfif !isNull(car.getCategory()) and car.getCategory().getCategoryID() eq category.getCategoryID()> selected="selected"</cfif>>#encodeForHTML(category.getLongName())#</option>
								</cfloop>
								<option value="other">Other</option>
							</select>
							<input type="text" class="form-control form-text d-none" name="newCategory" id="newCategory"/>
						</div>
						<div class="form-group">
							<label for="year">Year</label>
							<input type="text" class="form-control" name="year" id="year" value="#encodeForHTMLAttribute(car.getYear())#"/>
						</div>
						<div class="form-group">
							<label for="color">Color</label>
							<select name="colorID" id="color" class="custom-select customizeable">
								<option value="">--Select--</option>
								<cfloop array="#arColors#" index="color">
									<option value="#encodeForHTMLAttribute(color.getColorID())#"<cfif !isNull(car.getColor()) and car.getColor().getColorID() eq color.getColorID()> selected="selected"</cfif>>#encodeForHTML(color.getLongName())#</option>
								</cfloop>
								<option value="other">Other</option>
							</select>
							<input type="text" class="form-control form-text d-none" name="newcolor" id="newcolor"/>
						</div>
						<div class="form-group">
							<label for="stockNumber">Stock Number</label>
							<input type="text" class="form-control" name="stockNumber" id="stockNumber" value="#encodeForHTMLAttribute(car.getStockNumber())#"/>
						</div>
						<div class="form-group">
							<label for="listPrice">List Price</label>
							<input type="text" class="form-control" name="listPrice" id="listPrice" value="#encodeForHTMLAttribute(car.getListPrice())#"/>
						</div>
						<div class="form-group">
							<label for="salePrice">Sale Price</label>
							<input type="text" class="form-control" name="salePrice" id="salePrice" value="#encodeForHTMLAttribute(car.getSalePrice())#"/>
						</div>
						<div class="form-group">
							<label for="description">Description:</label>
							<textarea id="description" name="description" class="rich-text">#encodeForHTMLAttribute(car.getDescription())#</textarea>
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
