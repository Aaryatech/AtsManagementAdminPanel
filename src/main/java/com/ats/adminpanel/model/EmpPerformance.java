package com.ats.adminpanel.model;

public class EmpPerformance {

	private int taskId;

	private int moduleId;

	private String taskName;

	private String moduleName;

	private String taskPlannedHrs;

	private String actualReqHrs;

	private String remarksByDev;

	public String getModuleName() {
		return moduleName;
	}

	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}

	public int getTaskId() {
		return taskId;
	}

	public void setTaskId(int taskId) {
		this.taskId = taskId;
	}

	public int getModuleId() {
		return moduleId;
	}

	public void setModuleId(int moduleId) {
		this.moduleId = moduleId;
	}

	public String getTaskName() {
		return taskName;
	}

	public void setTaskName(String taskName) {
		this.taskName = taskName;
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

	public String getRemarksByDev() {
		return remarksByDev;
	}

	public void setRemarksByDev(String remarksByDev) {
		this.remarksByDev = remarksByDev;
	}

	@Override
	public String toString() {
		return "EmpPerformance [taskId=" + taskId + ", moduleId=" + moduleId + ", taskName=" + taskName
				+ ", moduleName=" + moduleName + ", taskPlannedHrs=" + taskPlannedHrs + ", actualReqHrs=" + actualReqHrs
				+ ", remarksByDev=" + remarksByDev + "]";
	}

}
