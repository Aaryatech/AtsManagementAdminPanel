package com.ats.adminpanel.model;

import java.util.Date;

public class Task {
	

	private int taskId;
	
	private int projectId;
	
	private int moduleId;
	
	private int formId;
	
	private int taskTypeId;
	
	private String taskName;
	
	private String taskDescription;
	
	private String taskSpRemarks;
	
	private String taskPlannedHrs;
	 
	private int developerId;
	
	private int testerId;
	
	private int assignedBy;
	
	private Date startDate;
	
	private String startDatetime;
	
	private String devComplPer;
	
	private Date endDate;
	
	private String endDatetime;
	
	private int devStatus;
	
	private String actualReqHrs;
	
	private int testerStatus;
	
	private String remarksByDev;

	public int getTaskId() {
		return taskId;
	}

	public void setTaskId(int taskId) {
		this.taskId = taskId;
	}

	public int getProjectId() {
		return projectId;
	}

	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}

	public int getModuleId() {
		return moduleId;
	}

	public void setModuleId(int moduleId) {
		this.moduleId = moduleId;
	}

	public int getFormId() {
		return formId;
	}

	public void setFormId(int formId) {
		this.formId = formId;
	}

	public int getTaskTypeId() {
		return taskTypeId;
	}

	public void setTaskTypeId(int taskTypeId) {
		this.taskTypeId = taskTypeId;
	}

	public String getTaskName() {
		return taskName;
	}

	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}

	public String getTaskDescription() {
		return taskDescription;
	}

	public void setTaskDescription(String taskDescription) {
		this.taskDescription = taskDescription;
	}

	public String getTaskSpRemarks() {
		return taskSpRemarks;
	}

	public void setTaskSpRemarks(String taskSpRemarks) {
		this.taskSpRemarks = taskSpRemarks;
	}

	public String getTaskPlannedHrs() {
		return taskPlannedHrs;
	}

	public void setTaskPlannedHrs(String taskPlannedHrs) {
		this.taskPlannedHrs = taskPlannedHrs;
	}

	public int getDeveloperId() {
		return developerId;
	}

	public void setDeveloperId(int developerId) {
		this.developerId = developerId;
	}

	public int getTesterId() {
		return testerId;
	}

	public void setTesterId(int testerId) {
		this.testerId = testerId;
	}

	public int getAssignedBy() {
		return assignedBy;
	}

	public void setAssignedBy(int assignedBy) {
		this.assignedBy = assignedBy;
	}
	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public String getStartDatetime() {
		return startDatetime;
	}

	public void setStartDatetime(String startDatetime) {
		this.startDatetime = startDatetime;
	}

	public String getDevComplPer() {
		return devComplPer;
	}

	public void setDevComplPer(String devComplPer) {
		this.devComplPer = devComplPer;
	}
	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getEndDatetime() {
		return endDatetime;
	}

	public void setEndDatetime(String endDatetime) {
		this.endDatetime = endDatetime;
	}

	public int getDevStatus() {
		return devStatus;
	}

	public void setDevStatus(int devStatus) {
		this.devStatus = devStatus;
	}

	public String getActualReqHrs() {
		return actualReqHrs;
	}

	public void setActualReqHrs(String actualReqHrs) {
		this.actualReqHrs = actualReqHrs;
	}

	public int getTesterStatus() {
		return testerStatus;
	}

	public void setTesterStatus(int testerStatus) {
		this.testerStatus = testerStatus;
	}

	public String getRemarksByDev() {
		return remarksByDev;
	}

	public void setRemarksByDev(String remarksByDev) {
		this.remarksByDev = remarksByDev;
	}

	@Override
	public String toString() {
		return "Task [taskId=" + taskId + ", projectId=" + projectId + ", moduleId=" + moduleId + ", formId=" + formId
				+ ", taskTypeId=" + taskTypeId + ", taskName=" + taskName + ", taskDescription=" + taskDescription
				+ ", taskSpRemarks=" + taskSpRemarks + ", taskPlannedHrs=" + taskPlannedHrs + ", developerId="
				+ developerId + ", testerId=" + testerId + ", assignedBy=" + assignedBy + ", startDate=" + startDate
				+ ", startDatetime=" + startDatetime + ", devComplPer=" + devComplPer + ", endDate=" + endDate
				+ ", endDatetime=" + endDatetime + ", devStatus=" + devStatus + ", actualReqHrs=" + actualReqHrs
				+ ", testerStatus=" + testerStatus + ", remarksByDev=" + remarksByDev + "]";
	}
	
	
	
	

}
