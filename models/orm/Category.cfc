component entityName="Category" table="Category" persistent="true" extends="models.orm.BaseORMBean" {
	// primary key
	property name="CategoryID" column="CategoryID" fieldtype="id" generator="increment";

	// non-relational columns
	property name="LongName" column="LongName" ormtype="string";
	property name="ShortName" column="ShortName" ormtype="string";
	property name="Active" column="Active" ormtype="boolean" default="1";


}
