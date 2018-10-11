package com.ats.adminpanel.model.leave;

public class GetShortLeave {
	private int shortLeaveId;
	private String date;
	private String approveDate;
	private int status;
	private float hours;
	private int empId;
	private String empRemark;
	private String approveRemark;
	private int sendTo;
	private int isUsed;

	private String empName;

	public int getShortLeaveId() {
		return shortLeaveId;
	}

	public void setShortLeaveId(int shortLeaveId) {
		this.shortLeaveId = shortLeaveId;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getApproveDate() {
		return approveDate;
	}

	public void setApproveDate(String approveDate) {
		this.approveDate = approveDate;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public float getHours() {
		return hours;
	}

	public void setHours(float hours) {
		this.hours = hours;
	}

	public int getEmpId() {
		return empId;
	}

	public void setEmpId(int empId) {
		this.empId = empId;
	}

	public String getEmpRemark() {
		return empRemark;
	}

	public void setEmpRemark(String empRemark) {
		this.empRemark = empRemark;
	}

	public String getApproveRemark() {
		return approveRemark;
	}

	public void setApproveRemark(String approveRemark) {
		this.approveRemark = approveRemark;
	}

	public int getSendTo() {
		return sendTo;
	}

	public void setSendTo(int sendTo) {
		this.sendTo = sendTo;
	}

	public int getIsUsed() {
		return isUsed;
	}

	public void setIsUsed(int isUsed) {
		this.isUsed = isUsed;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	@Override
	public String toString() {
		return "GetShortLeave [shortLeaveId=" + shortLeaveId + ", date=" + date + ", approveDate=" + approveDate
				+ ", status=" + status + ", hours=" + hours + ", empId=" + empId + ", empRemark=" + empRemark
				+ ", approveRemark=" + approveRemark + ", sendTo=" + sendTo + ", isUsed=" + isUsed + ", empName="
				+ empName + "]";
	}
}
