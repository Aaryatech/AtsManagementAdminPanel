package com.ats.adminpanel.model;



public class Forms {
	
	
	
	private int formId;
	
	private int projectId;
	
	private int moduleId;
	
	private int formTypeId;
	
	private String formName;
	
	private String formDescription;

	public int getFormId() {
		return formId;
	}

	public void setFormId(int formId) {
		this.formId = formId;
	}

	public int getProjectId() {
		return projectId;
	}

	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}

	public int getModuleId() {
		return moduleId;
	}

	public void setModuleId(int moduleId) {
		this.moduleId = moduleId;
	}

	public int getFormTypeId() {
		return formTypeId;
	}

	public void setFormTypeId(int formTypeId) {
		this.formTypeId = formTypeId;
	}

	public String getFormName() {
		return formName;
	}

	public void setFormName(String formName) {
		this.formName = formName;
	}

	public String getFormDescription() {
		return formDescription;
	}

	public void setFormDescription(String formDescription) {
		this.formDescription = formDescription;
	}

	@Override
	public String toString() {
		return "Forms [formId=" + formId + ", projectId=" + projectId + ", moduleId=" + moduleId + ", formTypeId="
				+ formTypeId + ", formName=" + formName + ", formDescription=" + formDescription + "]";
	}
	
	

}
