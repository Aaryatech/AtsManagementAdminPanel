package com.ats.adminpanel.model.leave;

public class ApplyLeave {

	private int leaveId;

	private String date;
	private String fromDate;
	private String toDate;
	private String approveDate;
	private int type;
	private int status;
	private float noOfDays;
	private int empId;
	private int payLeave;

	private String empRemark;
	private String approveRemark;
	private int sendTo;

	private int isUsed;

	public int getLeaveId() {
		return leaveId;
	}

	public void setLeaveId(int leaveId) {
		this.leaveId = leaveId;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
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

	public String getApproveDate() {
		return approveDate;
	}

	public void setApproveDate(String approveDate) {
		this.approveDate = approveDate;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public float getNoOfDays() {
		return noOfDays;
	}

	public void setNoOfDays(float noOfDays) {
		this.noOfDays = noOfDays;
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

	public int getPayLeave() {
		return payLeave;
	}

	public void setPayLeave(int payLeave) {
		this.payLeave = payLeave;
	}

	@Override
	public String toString() {
		return "ApplyLeave [leaveId=" + leaveId + ", date=" + date + ", fromDate=" + fromDate + ", toDate=" + toDate
				+ ", approveDate=" + approveDate + ", type=" + type + ", status=" + status + ", noOfDays=" + noOfDays
				+ ", empId=" + empId + ", payLeave=" + payLeave + ", empRemark=" + empRemark + ", approveRemark="
				+ approveRemark + ", sendTo=" + sendTo + ", isUsed=" + isUsed + "]";
	}

}
