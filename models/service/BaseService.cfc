component extends="models.service.Base" singleton {

	this.baseVariable1 = "purple";
	variables.baseVariable1 = "orange";

	public string function getPublicBaseVariable1(){
		return this.baseVariable1;
	}

	public string function getPrivateBaseVariable1(){
		variables.baseVariable1 = "hockey";
		return variables.baseVariable1;
	}

}
