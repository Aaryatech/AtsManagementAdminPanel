package com.ats.adminpanel.model.proj;

public class ProjTaskDetail {

	
	private int taskId;
	
	private String startDate;
	
	private int devStatus;
	
	private String taskName;
	
	private String formName;
	
	private String empName;
	
	private String moduleName;
	
	private String techName;
	
	private String projName;
	
	
	
	
	private float assignHr;
	
	private float planHr;
	
	private float actualHr;
	
	private float empTaskCost;
	
	
	

	public String getProjName() {
		return projName;
	}

	public void setProjName(String projName) {
		this.projName = projName;
	}

	public int getTaskId() {
		return taskId;
	}

	public void setTaskId(int taskId) {
		this.taskId = taskId;
	}
	
	
	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public int getDevStatus() {
		return devStatus;
	}

	public void setDevStatus(int devStatus) {
		this.devStatus = devStatus;
	}

	public String getTaskName() {
		return taskName;
	}

	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}

	public String getFormName() {
		return formName;
	}

	public void setFormName(String formName) {
		this.formName = formName;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getModuleName() {
		return moduleName;
	}

	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}

	public String getTechName() {
		return techName;
	}

	public void setTechName(String techName) {
		this.techName = techName;
	}

	public float getAssignHr() {
		return assignHr;
	}

	public void setAssignHr(float assignHr) {
		this.assignHr = assignHr;
	}

	public float getPlanHr() {
		return planHr;
	}

	public void setPlanHr(float planHr) {
		this.planHr = planHr;
	}

	public float getActualHr() {
		return actualHr;
	}

	public void setActualHr(float actualHr) {
		this.actualHr = actualHr;
	}

	public float getEmpTaskCost() {
		return empTaskCost;
	}

	public void setEmpTaskCost(float empTaskCost) {
		this.empTaskCost = empTaskCost;
	}

	@Override
	public String toString() {
		return "ProjTaskDetail [taskId=" + taskId + ", startDate=" + startDate + ", devStatus=" + devStatus
				+ ", taskName=" + taskName + ", formName=" + formName + ", empName=" + empName + ", moduleName="
				+ moduleName + ", techName=" + techName + ", projName=" + projName + ", assignHr=" + assignHr
				+ ", planHr=" + planHr + ", actualHr=" + actualHr + ", empTaskCost=" + empTaskCost + "]";
	}
	
	
}
