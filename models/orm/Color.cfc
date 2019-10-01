component entityName="Color" table="Color" persistent="true" extends="models.orm.BaseORMBean" {
	// primary key
	property name="ColorID" column="ColorID" fieldtype="id" generator="increment";

	// non-relational columns
	property name="LongName" column="LongName" ormtype="string";
	property name="ShortName" column="ShortName" ormtype="string";
	property name="Active" column="Active" ormtype="boolean" default="1";


}
