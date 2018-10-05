package com.ats.adminpanel.model;

import java.util.List;
  
public class GetFormList {
	
	 
	private int formId; 
	private String formName; 
	private int projectId; 
	private String projectName; 
	private int moduleId; 
	private String moduleName; 
	private int form_type_id; 
	private String formTypeName;
	List<GetTask> taskList;
	
	public int getFormId() {
		return formId;
	}
	public void setFormId(int formId) {
		this.formId = formId;
	}
	public String getFormName() {
		return formName;
	}
	public void setFormName(String formName) {
		this.formName = formName;
	}
	public int getProjectId() {
		return projectId;
	}
	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	public int getModuleId() {
		return moduleId;
	}
	public void setModuleId(int moduleId) {
		this.moduleId = moduleId;
	}
	public String getModuleName() {
		return moduleName;
	}
	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}
	public int getForm_type_id() {
		return form_type_id;
	}
	public void setForm_type_id(int form_type_id) {
		this.form_type_id = form_type_id;
	}
	public String getFormTypeName() {
		return formTypeName;
	}
	public void setFormTypeName(String formTypeName) {
		this.formTypeName = formTypeName;
	}
	
	public List<GetTask> getTaskList() {
		return taskList;
	}
	public void setTaskList(List<GetTask> taskList) {
		this.taskList = taskList;
	}
	@Override
	public String toString() {
		return "GetFormList [formId=" + formId + ", formName=" + formName + ", projectId=" + projectId
				+ ", projectName=" + projectName + ", moduleId=" + moduleId + ", moduleName=" + moduleName
				+ ", form_type_id=" + form_type_id + ", formTypeName=" + formTypeName + ", taskList=" + taskList + "]";
	}
	
	
	

}
