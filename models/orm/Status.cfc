component entityName="Status" table="Status" persistent="true" extends="models.orm.BaseORMBean" {
	// primary key
	property name="StatusID" column="StatusID" fieldtype="id" generator="increment";

	// non-relational columns
	property name="LongName" column="LongName" ormtype="string";
	property name="ShortName" column="ShortName" ormtype="string";
	property name="Active" column="Active" ormtype="boolean" default="1";


}
