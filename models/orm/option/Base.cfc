component displayname="Base" mappedSuperclass="true" extends="CarTracker.models.orm.Base" {
	// primary key
	
	// non-relational columns
	property name="LongName" column="LongName" ormtype="string";
	property name="ShortName" column="ShortName" ormtype="string";
	property name="Active" column="Active" ormtype="boolean" default="1";
	// one-to-one
	
	// one-to-many
	
	// many-to-one
	
	// many-to-many
	
	// calculated properties
	
	// object constraints
	this.constraints = {
		"LongName" = { required=true, requiredMessage="Please enter a Name" }
	};
	
	// methods
	public Base function init() {
		return this;
	}
} 