package com.ats.adminpanel.model;
 

public class PhaseType { 
	
	private int mPhaseId; 
	private String phaseName; 
	private int orderId; 
	private int isUsed;
	public int getmPhaseId() {
		return mPhaseId;
	}
	public void setmPhaseId(int mPhaseId) {
		this.mPhaseId = mPhaseId;
	}
	public String getPhaseName() {
		return phaseName;
	}
	public void setPhaseName(String phaseName) {
		this.phaseName = phaseName;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getIsUsed() {
		return isUsed;
	}
	public void setIsUsed(int isUsed) {
		this.isUsed = isUsed;
	}
	@Override
	public String toString() {
		return "PhaseType [mPhaseId=" + mPhaseId + ", phaseName=" + phaseName + ", orderId=" + orderId + ", isUsed="
				+ isUsed + "]";
	}
	
	

}
