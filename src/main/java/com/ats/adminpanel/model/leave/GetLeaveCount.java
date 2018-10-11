package com.ats.adminpanel.model.leave;

public class GetLeaveCount {
	private int empId;
	private String empName;

	private int leaveCount;

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

	public int getLeaveCount() {
		return leaveCount;
	}

	public void setLeaveCount(int leaveCount) {
		this.leaveCount = leaveCount;
	}

	@Override
	public String toString() {
		return "GetLeaveCount [empId=" + empId + ", empName=" + empName + ", leaveCount=" + leaveCount + "]";
	}

}
