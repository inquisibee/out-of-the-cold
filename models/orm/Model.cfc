component entityName="Model" table="Model" persistent="true" extends="models.orm.BaseORMBean" {
	// primary key
	property name="ModelID" column="ModelID" fieldtype="id" generator="increment";

	// non-relational columns
	property name="LongName" column="LongName" ormtype="string";
	property name="ShortName" column="ShortName" ormtype="string";
	property name="Active" column="Active" ormtype="boolean" default="1";

	// many-to-one
	property name="Make" column="MakeID" fieldtype="many-to-one" cfc="CarTracker.models.orm.Make" fkcolumn="MakeID";

}
