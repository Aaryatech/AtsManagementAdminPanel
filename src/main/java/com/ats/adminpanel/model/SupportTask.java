package com.ats.adminpanel.model;
 

public class SupportTask {
	 
	private int suppId; 
	private int projectId; 
	private int empId; 
	private String moduleName; 
	private String workDate; 
	private String date; 
	private String description; 
	private String requiredHrs; 
	private String takeAway;
	public int getSuppId() {
		return suppId;
	}
	public void setSuppId(int suppId) {
		this.suppId = suppId;
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
	public String getModuleName() {
		return moduleName;
	}
	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}
	public String getWorkDate() {
		return workDate;
	}
	public void setWorkDate(String workDate) {
		this.workDate = workDate;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getRequiredHrs() {
		return requiredHrs;
	}
	public void setRequiredHrs(String requiredHrs) {
		this.requiredHrs = requiredHrs;
	}
	public String getTakeAway() {
		return takeAway;
	}
	public void setTakeAway(String takeAway) {
		this.takeAway = takeAway;
	}
	@Override
	public String toString() {
		return "SupportTask [suppId=" + suppId + ", projectId=" + projectId + ", empId=" + empId + ", moduleName="
				+ moduleName + ", workDate=" + workDate + ", date=" + date + ", description=" + description
				+ ", requiredHrs=" + requiredHrs + ", takeAway=" + takeAway + "]";
	}
	
	

}
