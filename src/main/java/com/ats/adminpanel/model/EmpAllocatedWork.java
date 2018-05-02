package com.ats.adminpanel.model;

public class EmpAllocatedWork {
	private int taskId;

	private String projectName;

	private int no_of_days;

	
	
	private String taskPlannedHrs;

	
	
	
	public int getTaskId() {
		return taskId;
	}

	public void setTaskId(int taskId) {
		this.taskId = taskId;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getTaskPlannedHrs() {
		return taskPlannedHrs;
	}

	public void setTaskPlannedHrs(String taskPlannedHrs) {
		this.taskPlannedHrs = taskPlannedHrs;
	}

	public int getNo_of_days() {
		return no_of_days;
	}

	public void setNo_of_days(int no_of_days) {
		this.no_of_days = no_of_days;
	}

	@Override
	public String toString() {
		return "EmpAllocatedWorkReport [taskId=" + taskId + ", projectName=" + projectName + ", no_of_days="
				+ no_of_days + ", taskPlannedHrs=" + taskPlannedHrs + "]";
	}

}
