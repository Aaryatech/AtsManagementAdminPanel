package com.ats.adminpanel.model;
 

public class GetPhaseTask {
	 
	private int tTaskPhaseId; 
	private int taskPhaseId; 
	private String taskDesc; 
	private String expStartDate; 
	private String expEndDate; 
	private String actualStartDate; 
	private String atcualEndDate; 
	private String expHrs; 
	private String actualHrs; 
	private int assignedTo; 
	private int projectId; 
	private String projectName; 
	private String empName; 
	private String phaseName;
	public int gettTaskPhaseId() {
		return tTaskPhaseId;
	}
	public void settTaskPhaseId(int tTaskPhaseId) {
		this.tTaskPhaseId = tTaskPhaseId;
	}
	public int getTaskPhaseId() {
		return taskPhaseId;
	}
	public void setTaskPhaseId(int taskPhaseId) {
		this.taskPhaseId = taskPhaseId;
	}
	public String getTaskDesc() {
		return taskDesc;
	}
	public void setTaskDesc(String taskDesc) {
		this.taskDesc = taskDesc;
	}
	public String getExpStartDate() {
		return expStartDate;
	}
	public void setExpStartDate(String expStartDate) {
		this.expStartDate = expStartDate;
	}
	public String getExpEndDate() {
		return expEndDate;
	}
	public void setExpEndDate(String expEndDate) {
		this.expEndDate = expEndDate;
	}
	public String getActualStartDate() {
		return actualStartDate;
	}
	public void setActualStartDate(String actualStartDate) {
		this.actualStartDate = actualStartDate;
	}
	public String getAtcualEndDate() {
		return atcualEndDate;
	}
	public void setAtcualEndDate(String atcualEndDate) {
		this.atcualEndDate = atcualEndDate;
	}
	public String getExpHrs() {
		return expHrs;
	}
	public void setExpHrs(String expHrs) {
		this.expHrs = expHrs;
	}
	public String getActualHrs() {
		return actualHrs;
	}
	public void setActualHrs(String actualHrs) {
		this.actualHrs = actualHrs;
	}
	 
	public int getAssignedTo() {
		return assignedTo;
	}
	public void setAssignedTo(int assignedTo) {
		this.assignedTo = assignedTo;
	}
	public int getProjectId() {
		return projectId;
	}
	public void setProjectId(int projectId) {
		this.projectId = projectId;
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
	public String getPhaseName() {
		return phaseName;
	}
	public void setPhaseName(String phaseName) {
		this.phaseName = phaseName;
	}
	@Override
	public String toString() {
		return "GetPhaseTask [tTaskPhaseId=" + tTaskPhaseId + ", taskPhaseId=" + taskPhaseId + ", taskDesc=" + taskDesc
				+ ", expStartDate=" + expStartDate + ", expEndDate=" + expEndDate + ", actualStartDate="
				+ actualStartDate + ", atcualEndDate=" + atcualEndDate + ", expHrs=" + expHrs + ", actualHrs="
				+ actualHrs + ", assignedTo=" + assignedTo + ", projectId=" + projectId + ", projectName=" + projectName
				+ ", empName=" + empName + ", phaseName=" + phaseName + "]";
	}
	
	

}
