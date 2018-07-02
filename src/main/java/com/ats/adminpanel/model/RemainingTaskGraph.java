package com.ats.adminpanel.model;

public class RemainingTaskGraph {

	private int developerId;

	private String empName;

	private float taskPlannedHrs;

	private float noOfDays;

	public int getDeveloperId() {
		return developerId;
	}

	public void setDeveloperId(int developerId) {
		this.developerId = developerId;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public float getTaskPlannedHrs() {
		return taskPlannedHrs;
	}

	public void setTaskPlannedHrs(float taskPlannedHrs) {
		this.taskPlannedHrs = taskPlannedHrs;
	}

	public float getNoOfDays() {
		return noOfDays;
	}

	public void setNoOfDays(float noOfDays) {
		this.noOfDays = noOfDays;
	}

	@Override
	public String toString() {
		return "RemainingTaskGraph [developerId=" + developerId + ", empName=" + empName + ", taskPlannedHrs="
				+ taskPlannedHrs + ", noOfDays=" + noOfDays + "]";
	}

}
