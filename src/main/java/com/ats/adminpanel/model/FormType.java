package com.ats.adminpanel.model;
 

public class FormType {


	private int formTypeId;

	private String formTypeName;
	
	
	private int isUsed;

	public int getFormTypeId() {
		return formTypeId;
	}

	public void setFormTypeId(int formTypeId) {
		this.formTypeId = formTypeId;
	}

	public String getFormTypeName() {
		return formTypeName;
	}

	public void setFormTypeName(String formTypeName) {
		this.formTypeName = formTypeName;
	}

	public int getIsUsed() {
		return isUsed;
	}

	public void setIsUsed(int isUsed) {
		this.isUsed = isUsed;
	}

	@Override
	public String toString() {
		return "FormType [formTypeId=" + formTypeId + ", formTypeName=" + formTypeName + ", isUsed=" + isUsed + "]";
	}
	
	
	
	 
}
