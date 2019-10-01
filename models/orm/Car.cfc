component entityName="Car" table="Car" persistent="true" extends="models.orm.BaseORMBean" {

	// primary key
	property name="CarID" column="CarID" fieldtype="id" generator="increment";
	// non-relational columns
	property name="Description" column="Description" ormtype="string";
	property name="Year" column="Year" ormtype="integer";
	property name="ListPrice" column="ListPrice" ormtype="integer";
	property name="SalePrice" column="SalePrice" ormtype="integer";
	property name="AcquisitionDate" column="AcquisitionDate" ormtype="date";
	property name="SaleDate" column="SaleDate" ormtype="date";
	property name="StockNumber" column="StockNumber" ormtype="string";
	property name="Rating" column="Rating" ormtype="float" notnull="false" default="0.00";
	property name="VIN" column="VIN" ormtype="string";
	property name="Fuel" column="Fuel" ormtype="string";
	property name="Engine" column="Engine" ormtype="string";
	property name="Transmission" column="Transmission" ormtype="string";
	property name="Mileage" column="Mileage" ormtype="integer";
	property name="IsSold" column="IsSold" ormtype="boolean" default="0";
	property name="Active" column="Active" ormtype="boolean" default="1";

	// one-to-many
	property name="Images" singularname="Image" fieldtype="one-to-many" cfc="CarTracker.models.orm.Image" fkcolumn="CarID" inverse="true" cascade="all-delete-orphan";

	// many-to-one
	property name="Status" column="StatusID" fieldtype="many-to-one" cfc="CarTracker.models.orm.Status" fkcolumn="StatusID" lazy="true";
	property name="Make" column="MakeID" fieldtype="many-to-one" cfc="CarTracker.models.orm.Make" fkcolumn="MakeID" lazy="true";
	property name="Model" column="ModelID" fieldtype="many-to-one" cfc="CarTracker.models.orm.Model" fkcolumn="ModelID" lazy="true";
	property name="Category" column="CategoryID" fieldtype="many-to-one" cfc="CarTracker.models.orm.Category" fkcolumn="CategoryID" lazy="true";
	property name="Color" column="ColorID" fieldtype="many-to-one" cfc="CarTracker.models.orm.Color" fkcolumn="ColorID" lazy="true";

}
