package com.ats.adminpanel.model;
 

public class LoginResponse {
	
	private boolean error;
	private String msg;
	private Employee employee;
	public boolean isError() {
		return error;
	}
	public void setError(boolean error) {
		this.error = error;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Employee getEmployee() {
		return employee;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	@Override
	public String toString() {
		return "LoginResponse [error=" + error + ", msg=" + msg + ", employee=" + employee + "]";
	}
	
	

}
