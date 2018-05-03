package com.ats.adminpanel.model;

import java.util.Date;

public class Project {
	
	
	
	private int projectId;
	
	private String projectName;
	
	private String projectDescription;
	
	private String referenceBy;
	
	private String projectCost;
	
	private int projectAllocatedTo;
	
	private String projectStartDate;
	
	private String devPer;
	
	private String compPer;
	 
	private int status;
	
	private String projectEndDate;
	
	private String projectExpEndDate;

	public int getProjectId() {
		return projectId;
	}

	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getProjectDescription() {
		return projectDescription;
	}

	public void setProjectDescription(String projectDescription) {
		this.projectDescription = projectDescription;
	}

	
	
	public String getReferenceBy() {
		return referenceBy;
	}

	public void setReferenceBy(String referenceBy) {
		this.referenceBy = referenceBy;
	}

	public String getProjectCost() {
		return projectCost;
	}

	public void setProjectCost(String projectCost) {
		this.projectCost = projectCost;
	}

	public int getProjectAllocatedTo() {
		return projectAllocatedTo;
	}

	public void setProjectAllocatedTo(int projectAllocatedTo) {
		this.projectAllocatedTo = projectAllocatedTo;
	}
	
	public String getDevPer() {
		return devPer;
	}

	public void setDevPer(String devPer) {
		this.devPer = devPer;
	}

	public String getCompPer() {
		return compPer;
	}

	public void setCompPer(String compPer) {
		this.compPer = compPer;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	

	public String getProjectStartDate() {
		return projectStartDate;
	}

	public void setProjectStartDate(String projectStartDate) {
		this.projectStartDate = projectStartDate;
	}

	public String getProjectEndDate() {
		return projectEndDate;
	}

	public void setProjectEndDate(String projectEndDate) {
		this.projectEndDate = projectEndDate;
	}

	public String getProjectExpEndDate() {
		return projectExpEndDate;
	}

	public void setProjectExpEndDate(String projectExpEndDate) {
		this.projectExpEndDate = projectExpEndDate;
	}

	@Override
	public String toString() {
		return "Project [projectId=" + projectId + ", projectName=" + projectName + ", projectDescription="
				+ projectDescription + ", referenceBy=" + referenceBy + ", projectCost=" + projectCost
				+ ", projectAllocatedTo=" + projectAllocatedTo + ", projectStartDate=" + projectStartDate + ", devPer="
				+ devPer + ", compPer=" + compPer + ", status=" + status + ", projectEndDate=" + projectEndDate
				+ ", projectExpEndDate=" + projectExpEndDate + "]";
	}
	
	
	
	
	

}
