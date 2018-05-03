package com.ats.adminpanel.model;

public class DevelopmentHrsProwise {

	private int taskId;

	private String moduleName;

	private String taskPlannedHrs;

	private String actualReqHrs;
	private int totalForms;

	public int getTaskId() {
		return taskId;
	}

	public void setTaskId(int taskId) {
		this.taskId = taskId;
	}

	public String getModuleName() {
		return moduleName;
	}

	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}

	public String getTaskPlannedHrs() {
		return taskPlannedHrs;
	}

	public void setTaskPlannedHrs(String taskPlannedHrs) {
		this.taskPlannedHrs = taskPlannedHrs;
	}

	public String getActualReqHrs() {
		return actualReqHrs;
	}

	public void setActualReqHrs(String actualReqHrs) {
		this.actualReqHrs = actualReqHrs;
	}

	public int getTotalForms() {
		return totalForms;
	}

	public void setTotalForms(int totalForms) {
		this.totalForms = totalForms;
	}

	@Override
	public String toString() {
		return "DevelopmentHrsProwise [taskId=" + taskId + ", moduleName=" + moduleName + ", taskPlannedHrs="
				+ taskPlannedHrs + ", actualReqHrs=" + actualReqHrs + ", totalForms=" + totalForms + "]";
	}

}
