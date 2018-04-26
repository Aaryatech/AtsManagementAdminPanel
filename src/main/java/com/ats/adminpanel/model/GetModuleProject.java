package com.ats.adminpanel.model;


public class GetModuleProject {
	
	
	private int moduleId;
	
	private int projectId;
	 
	private String moduleName;
	
	private String moduleDesc;
	
	String projectName;
	
	

	public int getModuleId() {
		return moduleId;
	}

	public void setModuleId(int moduleId) {
		this.moduleId = moduleId;
	}

	public int getProjectId() {
		return projectId;
	}

	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}

	public String getModuleName() {
		return moduleName;
	}

	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}

	public String getModuleDesc() {
		return moduleDesc;
	}

	public void setModuleDesc(String moduleDesc) {
		this.moduleDesc = moduleDesc;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	@Override
	public String toString() {
		return "GetModuleProject [moduleId=" + moduleId + ", projectId=" + projectId + ", moduleName=" + moduleName
				+ ", moduleDesc=" + moduleDesc + ", projectName=" + projectName + "]";
	}

	

}
