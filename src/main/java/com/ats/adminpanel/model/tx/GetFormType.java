package com.ats.adminpanel.model.tx;

public class GetFormType {
	private int formTypeId;

	private String formTypeName;

	private int isUsed;

	private int mPhaseId;
	private int techId;

	private String phaseName;
	private String techName;

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

	public String getPhaseName() {
		return phaseName;
	}

	public void setPhaseName(String phaseName) {
		this.phaseName = phaseName;
	}

	public String getTechName() {
		return techName;
	}

	public void setTechName(String techName) {
		this.techName = techName;
	}

	@Override
	public String toString() {
		return "GetFormType [formTypeId=" + formTypeId + ", formTypeName=" + formTypeName + ", isUsed=" + isUsed
				+ ", mPhaseId=" + mPhaseId + ", techId=" + techId + ", phaseName=" + phaseName + ", techName="
				+ techName + "]";
	}

}
