package com.ats.adminpanel.controller;


public class CompleteTaskBean {
	
	int taskId;
	int devStatus;
	String  actualReqHrs;
	
	String endTimeStamp;
	
	String endDate;
	
	
	
	public String getEndTimeStamp() {
		return endTimeStamp;
	}
	public void setEndTimeStamp(String endTimeStamp) {
		this.endTimeStamp = endTimeStamp;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public int getTaskId() {
		return taskId;
	}
	public void setTaskId(int taskId) {
		this.taskId = taskId;
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
	@Override
	public String toString() {
		return "CompleteTaskBean [taskId=" + taskId + ", devStatus=" + devStatus + ", actualReqHrs=" + actualReqHrs
				+ ", endTimeStamp=" + endTimeStamp + ", endDate=" + endDate + "]";
	}
	
	

}
