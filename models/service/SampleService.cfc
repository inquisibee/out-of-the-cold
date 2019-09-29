component extends="models.service.BaseService" singleton {

	this.variable1 = "brown";
	variables.variable1 = "blue";

	variables.baseVariable1 = "hotdog";

	public string function getPublicVariable1(){
		return this.variable1;
	}

	public string function getPrivateVariable1(){
		return variables.variable1;
	}

	public string function getPrivateBaseVariable1(){
		return variables.baseVariable1;
	}
}
