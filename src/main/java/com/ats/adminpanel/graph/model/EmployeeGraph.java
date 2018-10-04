package com.ats.adminpanel.graph.model;

import java.util.List;
  
public class EmployeeGraph {

	List<ProjectList> projectList;
	 
	List<EmployeeListWithActualHrs> employeeListWithActualHrsList;

	public List<ProjectList> getProjectList() {
		return projectList;
	}

	public void setProjectList(List<ProjectList> projectList) {
		this.projectList = projectList;
	}

	public List<EmployeeListWithActualHrs> getEmployeeListWithActualHrsList() {
		return employeeListWithActualHrsList;
	}

	public void setEmployeeListWithActualHrsList(List<EmployeeListWithActualHrs> employeeListWithActualHrsList) {
		this.employeeListWithActualHrsList = employeeListWithActualHrsList;
	}

	@Override
	public String toString() {
		return "EmployeeGraph [projectList=" + projectList + ", employeeListWithActualHrsList="
				+ employeeListWithActualHrsList + "]";
	}

}
