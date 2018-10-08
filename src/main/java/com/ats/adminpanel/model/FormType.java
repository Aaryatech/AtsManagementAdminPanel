package com.ats.adminpanel.model;
 

public class FormType {


	private int formTypeId;

	private String formTypeName;
	
	
	private int isUsed;
	
	
	private int mPhaseId;
	private int techId;

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

	public int getmPhaseId() {
		return mPhaseId;
	}

	public void setmPhaseId(int mPhaseId) {
		this.mPhaseId = mPhaseId;
	}

	public int getTechId() {
		return techId;
	}

	public void setTechId(int techId) {
		this.techId = techId;
	}

	@Override
	public String toString() {
		return "FormType [formTypeId=" + formTypeId + ", formTypeName=" + formTypeName + ", isUsed=" + isUsed
				+ ", mPhaseId=" + mPhaseId + ", techId=" + techId + "]";
	}
	
	 
}
