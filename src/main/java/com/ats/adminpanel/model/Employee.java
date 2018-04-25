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
	private float empPerHrRate; 
	private int empType;
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
	@Override
	public String toString() {
		return "Employee [empId=" + empId + ", empName=" + empName + ", empMobile=" + empMobile + ", empEdu=" + empEdu
				+ ", empBirthdate=" + empBirthdate + ", empDesignation=" + empDesignation + ", empPwd=" + empPwd
				+ ", empPrevExp=" + empPrevExp + ", empJoiningDate=" + empJoiningDate + ", isUsed=" + isUsed
				+ ", empPerHrRate=" + empPerHrRate + ", empType=" + empType + "]";
	}
	
	

}
