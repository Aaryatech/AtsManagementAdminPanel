package com.ats.adminpanel.model;

public class EmpConReport {

	private int taskId;

	private String projectName;

	private String actualReqHrs;

	private String taskPlannedHrs;

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getActualReqHrs() {
		return actualReqHrs;
	}

	public void setActualReqHrs(String actualReqHrs) {
		this.actualReqHrs = actualReqHrs;
	}

	public String getTaskPlannedHrs() {
		return taskPlannedHrs;
	}

	public void setTaskPlannedHrs(String taskPlannedHrs) {
		this.taskPlannedHrs = taskPlannedHrs;
	}

	public int getTaskId() {
		return taskId;
	}

	public void setTaskId(int taskId) {
		this.taskId = taskId;
	}

	@Override
	public String toString() {
		return "EmpConReport [taskId=" + taskId + ", projectName=" + projectName + ", actualReqHrs=" + actualReqHrs
				+ ", taskPlannedHrs=" + taskPlannedHrs + "]";
	}

}
