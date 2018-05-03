package com.ats.adminpanel.model;

public class ProjectPhaseTracking {

	private int tTaskPhaseId;

	private String taskDesc;

	private String empName;

	private String expStartDate;

	private String expEndDate;

	private String actualStartDate;

	private String atcualEndDate;

	private String expHrs;

	private String actualHrs;

	public int gettTaskPhaseId() {
		return tTaskPhaseId;
	}

	public void settTaskPhaseId(int tTaskPhaseId) {
		this.tTaskPhaseId = tTaskPhaseId;
	}

	public String getTaskDesc() {
		return taskDesc;
	}

	public void setTaskDesc(String taskDesc) {
		this.taskDesc = taskDesc;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
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

	@Override
	public String toString() {
		return "ProjectPhaseTracking [tTaskPhaseId=" + tTaskPhaseId + ", taskDesc=" + taskDesc + ", empName=" + empName
				+ ", expStartDate=" + expStartDate + ", expEndDate=" + expEndDate + ", actualStartDate="
				+ actualStartDate + ", atcualEndDate=" + atcualEndDate + ", expHrs=" + expHrs + ", actualHrs="
				+ actualHrs + "]";
	}

}
