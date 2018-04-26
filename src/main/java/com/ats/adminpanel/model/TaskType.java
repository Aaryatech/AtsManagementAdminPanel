package com.ats.adminpanel.model;


public class TaskType {
	
	
	private int taskTypeId;
	

	private String taskTypeName;
	
	private int taskType;
	
	private String taskPlannedHrs;
	
	private int isUsed;

	public int getTaskTypeId() {
		return taskTypeId;
	}

	public void setTaskTypeId(int taskTypeId) {
		this.taskTypeId = taskTypeId;
	}

	public String getTaskTypeName() {
		return taskTypeName;
	}

	public void setTaskTypeName(String taskTypeName) {
		this.taskTypeName = taskTypeName;
	}

	public int getTaskType() {
		return taskType;
	}

	public void setTaskType(int taskType) {
		this.taskType = taskType;
	}

	public String getTaskPlannedHrs() {
		return taskPlannedHrs;
	}

	public void setTaskPlannedHrs(String taskPlannedHrs) {
		this.taskPlannedHrs = taskPlannedHrs;
	}

	public int getIsUsed() {
		return isUsed;
	}

	public void setIsUsed(int isUsed) {
		this.isUsed = isUsed;
	}

	@Override
	public String toString() {
		return "TastType [taskTypeId=" + taskTypeId + ", taskTypeName=" + taskTypeName + ", taskType=" + taskType
				+ ", taskPlannedHrs=" + taskPlannedHrs + ", isUsed=" + isUsed + "]";
	}
	
	
	

}
