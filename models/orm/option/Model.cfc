component persistent="true" entityname="Model" table="Model" extends="CarTracker.models.orm.option.Base" {
	// primary key
	property name="ModelID" column="ModelID" fieldtype="id" generator="increment";
	// non-relational columns
	property name="_Make" formula="SELECT m.LongName FROM Make m WHERE m.MakeID = MakeID";
	// one-to-one
	
	// one-to-many
	
	// many-to-one
	property name="Make" column="MakeID" fieldtype="many-to-one" cfc="CarTracker.models.orm.option.Make" fkcolumn="MakeID";
	// many-to-many
	
	// calculated properties
	
	// object constraints
	
	// methods
	public Model function init() {
		return this;
	}
} 