package com.ats.adminpanel.model;
 

public class DevloperListFromTask {
	
	private int taskId;
	private int developerId; 
	private String developerName; 
	private float actualReqHrs; 
	private float empPerHrRate; 
	private float devlopementCost;
	
	public int getTaskId() {
		return taskId;
	}
	public void setTaskId(int taskId) {
		this.taskId = taskId;
	}
	public int getDeveloperId() {
		return developerId;
	}
	public void setDeveloperId(int developerId) {
		this.developerId = developerId;
	}
	public String getDeveloperName() {
		return developerName;
	}
	public void setDeveloperName(String developerName) {
		this.developerName = developerName;
	}
	
	public float getActualReqHrs() {
		return actualReqHrs;
	}
	public void setActualReqHrs(float actualReqHrs) {
		this.actualReqHrs = actualReqHrs;
	}
	public float getEmpPerHrRate() {
		return empPerHrRate;
	}
	public void setEmpPerHrRate(float empPerHrRate) {
		this.empPerHrRate = empPerHrRate;
	}
	public float getDevlopementCost() {
		return devlopementCost;
	}
	public void setDevlopementCost(float devlopementCost) {
		this.devlopementCost = devlopementCost;
	}
	@Override
	public String toString() {
		return "DevloperListFromTask [taskId=" + taskId + ", developerId=" + developerId + ", developerName="
				+ developerName + ", actualReqHrs=" + actualReqHrs + ", empPerHrRate=" + empPerHrRate
				+ ", devlopementCost=" + devlopementCost + "]";
	}
	
	

}
