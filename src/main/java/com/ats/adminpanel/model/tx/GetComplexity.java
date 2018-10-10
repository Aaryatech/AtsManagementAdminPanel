package com.ats.adminpanel.model.tx;

import java.util.List; 
public class GetComplexity {

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
	
	List<CmplxOption> cmplxOptionList;

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

	public List<CmplxOption> getCmplxOptionList() {
		return cmplxOptionList;
	}

	public void setCmplxOptionList(List<CmplxOption> cmplxOptionList) {
		this.cmplxOptionList = cmplxOptionList;
	}

	@Override
	public String toString() {
		return "GetComplexity [cmplxId=" + cmplxId + ", cmplxName=" + cmplxName + ", mPhaseId=" + mPhaseId + ", techId="
				+ techId + ", isUsed=" + isUsed + ", cmplxDate=" + cmplxDate + ", formTypeId=" + formTypeId
				+ ", phaseName=" + phaseName + ", techName=" + techName + ", formTypeName=" + formTypeName + ", int2="
				+ int2 + ", varchar1=" + varchar1 + ", varchar2=" + varchar2 + ", cmplxOptionList=" + cmplxOptionList
				+ "]";
	}

}
