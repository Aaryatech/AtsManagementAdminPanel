package com.ats.adminpanel.model.tx;

public class CmplxOption {

	private int cmplxOptId;
	private int cmplxId;
	private String cmplxOptName;
	private float allocatedHrs;

	private int isUsed;
	private String cmplxOptDate;

	private int int1;
	private int int2;

	private String varchar1;
	private String varchar2;

	public int getCmplxOptId() {
		return cmplxOptId;
	}

	public void setCmplxOptId(int cmplxOptId) {
		this.cmplxOptId = cmplxOptId;
	}

	public int getCmplxId() {
		return cmplxId;
	}

	public void setCmplxId(int cmplxId) {
		this.cmplxId = cmplxId;
	}

	public String getCmplxOptName() {
		return cmplxOptName;
	}

	public void setCmplxOptName(String cmplxOptName) {
		this.cmplxOptName = cmplxOptName;
	}

	public float getAllocatedHrs() {
		return allocatedHrs;
	}

	public void setAllocatedHrs(float allocatedHrs) {
		this.allocatedHrs = allocatedHrs;
	}

	public int getIsUsed() {
		return isUsed;
	}

	public void setIsUsed(int isUsed) {
		this.isUsed = isUsed;
	}

	public String getCmplxOptDate() {
		return cmplxOptDate;
	}

	public void setCmplxOptDate(String cmplxOptDate) {
		this.cmplxOptDate = cmplxOptDate;
	}

	public int getInt1() {
		return int1;
	}

	public void setInt1(int int1) {
		this.int1 = int1;
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

	@Override
	public String toString() {
		return "CmplxOption [cmplxOptId=" + cmplxOptId + ", cmplxId=" + cmplxId + ", cmplxOptName=" + cmplxOptName
				+ ", allocatedHrs=" + allocatedHrs + ", isUsed=" + isUsed + ", cmplxOptDate=" + cmplxOptDate + ", int1="
				+ int1 + ", int2=" + int2 + ", varchar1=" + varchar1 + ", varchar2=" + varchar2 + "]";
	}

}
