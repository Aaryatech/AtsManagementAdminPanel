package com.ats.adminpanel.model;

public class Leave {

	private int leaveId;

	private int empId;

	private String fromDate;

	private String toDate;

	private String remark;

	public int getLeaveId() {
		return leaveId;
	}

	public void setLeaveId(int leaveId) {
		this.leaveId = leaveId;
	}

	public int getEmpId() {
		return empId;
	}

	public void setEmpId(int empId) {
		this.empId = empId;
	}

	public String getFromDate() {
		return fromDate;
	}

	public void setFromDate(String fromDate) {
		this.fromDate = fromDate;
	}

	public String getToDate() {
		return toDate;
	}

	public void setToDate(String toDate) {
		this.toDate = toDate;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@Override
	public String toString() {
		return "Leaves [leaveId=" + leaveId + ", empId=" + empId + ", fromDate=" + fromDate + ", toDate=" + toDate
				+ ", remark=" + remark + "]";
	}

}
