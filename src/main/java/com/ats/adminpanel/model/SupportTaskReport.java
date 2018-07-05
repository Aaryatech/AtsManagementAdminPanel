package com.ats.adminpanel.model;

public class SupportTaskReport {

	private int suppId;

	private String projectName;
	private int projectId;
	private String empName;
	private int empId;

	private String requiredHrs;

	public int getSuppId() {
		return suppId;
	}

	public void setSuppId(int suppId) {
		this.suppId = suppId;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getRequiredHrs() {
		return requiredHrs;
	}

	public void setRequiredHrs(String requiredHrs) {
		this.requiredHrs = requiredHrs;
	}

	public int getProjectId() {
		return projectId;
	}

	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}

	public int getEmpId() {
		return empId;
	}

	public void setEmpId(int empId) {
		this.empId = empId;
	}

	@Override
	public String toString() {
		return "SupportTaskReport [suppId=" + suppId + ", projectName=" + projectName + ", projectId=" + projectId
				+ ", empName=" + empName + ", empId=" + empId + ", requiredHrs=" + requiredHrs + "]";
	}

}
