package com.ats.adminpanel.model;
 
public class DevloperListFromTask {
	
	 
	private int developerId; 
	private String developerName;
	public int getDeveloperId() {
		return developerId;
	}
	public void setDeveloperId(int developerId) {
		this.developerId = developerId;
	}
	public String getDeveloperName() {
		return developerName;
	}
	public void setDeveloperName(String developerName) {
		this.developerName = developerName;
	}
	@Override
	public String toString() {
		return "DevloperListFromTask [developerId=" + developerId + ", developerName=" + developerName + "]";
	}
	
	

}
