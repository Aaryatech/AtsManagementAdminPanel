package com.ats.adminpanel.model.tx;

public class GetCmplxHrs {

	private int cmplxId;
	private String cmplxName;
	private int mPhaseId;
	private int techId;
	private int isUsed;
	private String cmplxDate;

	private int formTypeId;

	private String phaseName;
	private String techName;
	private String formTypeName;

	private int int2;
	private String varchar1;
	private String varchar2;

	private float allocatedHrs;
	private int cmplxOptId;
	private String cmplxOptName;

	public int getCmplxId() {
		return cmplxId;
	}

	public void setCmplxId(int cmplxId) {
		this.cmplxId = cmplxId;
	}

	public String getCmplxName() {
		return cmplxName;
	}

	public void setCmplxName(String cmplxName) {
		this.cmplxName = cmplxName;
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

	public int getIsUsed() {
		return isUsed;
	}

	public void setIsUsed(int isUsed) {
		this.isUsed = isUsed;
	}

	public String getCmplxDate() {
		return cmplxDate;
	}

	public void setCmplxDate(String cmplxDate) {
		this.cmplxDate = cmplxDate;
	}

	public int getFormTypeId() {
		return formTypeId;
	}

	public void setFormTypeId(int formTypeId) {
		this.formTypeId = formTypeId;
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

	public String getFormTypeName() {
		return formTypeName;
	}

	public void setFormTypeName(String formTypeName) {
		this.formTypeName = formTypeName;
	}

	public int getInt2() {
		return int2;
	}

	public void setInt2(int int2) {
		this.int2 = int2;
	}

	public String getVarchar1() {
		return varchar1;
	}

	public void setVarchar1(String varchar1) {
		this.varchar1 = varchar1;
	}

	public String getVarchar2() {
		return varchar2;
	}

	public void setVarchar2(String varchar2) {
		this.varchar2 = varchar2;
	}

	public float getAllocatedHrs() {
		return allocatedHrs;
	}

	public void setAllocatedHrs(float allocatedHrs) {
		this.allocatedHrs = allocatedHrs;
	}

	public int getCmplxOptId() {
		return cmplxOptId;
	}

	public void setCmplxOptId(int cmplxOptId) {
		this.cmplxOptId = cmplxOptId;
	}

	public String getCmplxOptName() {
		return cmplxOptName;
	}

	public void setCmplxOptName(String cmplxOptName) {
		this.cmplxOptName = cmplxOptName;
	}

	@Override
	public String toString() {
		return "GetCmplxHrs [cmplxId=" + cmplxId + ", cmplxName=" + cmplxName + ", mPhaseId=" + mPhaseId + ", techId="
				+ techId + ", isUsed=" + isUsed + ", cmplxDate=" + cmplxDate + ", formTypeId=" + formTypeId
				+ ", phaseName=" + phaseName + ", techName=" + techName + ", formTypeName=" + formTypeName + ", int2="
				+ int2 + ", varchar1=" + varchar1 + ", varchar2=" + varchar2 + ", allocatedHrs=" + allocatedHrs
				+ ", cmplxOptId=" + cmplxOptId + ", cmplxOptName=" + cmplxOptName + "]";
	}

}
