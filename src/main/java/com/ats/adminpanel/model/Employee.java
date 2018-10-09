package com.ats.adminpanel.model;

public class Employee {

	private int empId;
	private String empName;
	private String empMobile;
	private String empEdu;
	private String empBirthdate;
	private String empDesignation;
	private String empPwd;
	private String empPrevExp;
	private String empJoiningDate;
	private int isUsed;
	private int totalLeaves;
	private float empPerHrRate;
	private int empType;

	private String fromDate;

	private String toDate;

	private float sickLeave;

	private float causalLeave;

	private int techId;

	private int mPhaseId;

	public int getEmpId() {
		return empId;
	}

	public void setEmpId(int empId) {
		this.empId = empId;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getEmpMobile() {
		return empMobile;
	}

	public void setEmpMobile(String empMobile) {
		this.empMobile = empMobile;
	}

	public String getEmpEdu() {
		return empEdu;
	}

	public void setEmpEdu(String empEdu) {
		this.empEdu = empEdu;
	}

	public String getEmpBirthdate() {
		return empBirthdate;
	}

	public void setEmpBirthdate(String empBirthdate) {
		this.empBirthdate = empBirthdate;
	}

	public String getEmpDesignation() {
		return empDesignation;
	}

	public void setEmpDesignation(String empDesignation) {
		this.empDesignation = empDesignation;
	}

	public String getEmpPwd() {
		return empPwd;
	}

	public void setEmpPwd(String empPwd) {
		this.empPwd = empPwd;
	}

	public String getEmpPrevExp() {
		return empPrevExp;
	}

	public void setEmpPrevExp(String empPrevExp) {
		this.empPrevExp = empPrevExp;
	}

	public String getEmpJoiningDate() {
		return empJoiningDate;
	}

	public void setEmpJoiningDate(String empJoiningDate) {
		this.empJoiningDate = empJoiningDate;
	}

	public int getIsUsed() {
		return isUsed;
	}

	public void setIsUsed(int isUsed) {
		this.isUsed = isUsed;
	}

	public float getEmpPerHrRate() {
		return empPerHrRate;
	}

	public void setEmpPerHrRate(float empPerHrRate) {
		this.empPerHrRate = empPerHrRate;
	}

	public int getEmpType() {
		return empType;
	}

	public void setEmpType(int empType) {
		this.empType = empType;
	}

	public int getTotalLeaves() {
		return totalLeaves;
	}

	public void setTotalLeaves(int totalLeaves) {
		this.totalLeaves = totalLeaves;
	}

	public String getFromDate() {
		return fromDate;
	}

	public void setFromDate(String fromDate) {
		this.fromDate = fromDate;
	}

	public String getToDate() {
		return toDate;
	}

	public void setToDate(String toDate) {
		this.toDate = toDate;
	}

	public float getSickLeave() {
		return sickLeave;
	}

	public void setSickLeave(float sickLeave) {
		this.sickLeave = sickLeave;
	}

	public float getCausalLeave() {
		return causalLeave;
	}

	public void setCausalLeave(float causalLeave) {
		this.causalLeave = causalLeave;
	}

	public int getTechId() {
		return techId;
	}

	public void setTechId(int techId) {
		this.techId = techId;
	}

	public int getmPhaseId() {
		return mPhaseId;
	}

	public void setmPhaseId(int mPhaseId) {
		this.mPhaseId = mPhaseId;
	}

	@Override
	public String toString() {
		return "Employee [empId=" + empId + ", empName=" + empName + ", empMobile=" + empMobile + ", empEdu=" + empEdu
				+ ", empBirthdate=" + empBirthdate + ", empDesignation=" + empDesignation + ", empPwd=" + empPwd
				+ ", empPrevExp=" + empPrevExp + ", empJoiningDate=" + empJoiningDate + ", isUsed=" + isUsed
				+ ", totalLeaves=" + totalLeaves + ", empPerHrRate=" + empPerHrRate + ", empType=" + empType
				+ ", fromDate=" + fromDate + ", toDate=" + toDate + ", sickLeave=" + sickLeave + ", causalLeave="
				+ causalLeave + ", techId=" + techId + ", mPhaseId=" + mPhaseId + "]";
	}

}
