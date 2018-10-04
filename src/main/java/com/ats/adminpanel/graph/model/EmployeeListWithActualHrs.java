package com.ats.adminpanel.graph.model;

import java.util.List;

public class EmployeeListWithActualHrs {

	private int empId;
	private String empName;

	List<ActualHrs> actualHrsList;

	public int getEmpId() {
		return empId;
	}

	public void setEmpId(int empId) {
		this.empId = empId;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}
 
	public List<ActualHrs> getActualHrsList() {
		return actualHrsList;
	}

	public void setActualHrsList(List<ActualHrs> actualHrsList) {
		this.actualHrsList = actualHrsList;
	}

	@Override
	public String toString() {
		return "EmployeeListWithActualHrs [empId=" + empId + ", empName=" + empName + ", actualHrsList=" + actualHrsList
				+ "]";
	}

}
