package com.ats.adminpanel.controller;
 

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import com.ats.adminpanel.common.Constants;
import com.ats.adminpanel.common.DateConvertor;
import com.ats.adminpanel.model.Employee;
import com.ats.adminpanel.model.FormType;
import com.ats.adminpanel.model.Forms;
import com.ats.adminpanel.model.GetModuleProject;
import com.ats.adminpanel.model.GetPhaseTask;
import com.ats.adminpanel.model.GetProjects;
import com.ats.adminpanel.model.LoginResponse;
import com.ats.adminpanel.model.Module;
import com.ats.adminpanel.model.PhaseTask;
import com.ats.adminpanel.model.PhaseType;
import com.ats.adminpanel.model.Project;
import com.ats.adminpanel.model.Task;
import com.ats.adminpanel.model.TaskType;

@Controller
public class ProjectController {
	RestTemplate restTemplate = new RestTemplate();
	MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
	List<GetProjects> projList = new ArrayList<GetProjects>();

	@RequestMapping(value = "/showAddProject", method = RequestMethod.GET)
	public ModelAndView showAddProject(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("project/addproject");

		List<Employee> empList;

		Employee[] empArray = restTemplate.getForObject(Constants.url + "masters/getAllEmpList", Employee[].class);

		empList = new ArrayList<Employee>(Arrays.asList(empArray));

		projList = new ArrayList<GetProjects>();

		GetProjects[] projArray = restTemplate.getForObject(Constants.url + "masters/getProjectList",
				GetProjects[].class);

		projList = new ArrayList<GetProjects>(Arrays.asList(projArray));

		model.addObject("projList", projList);

		model.addObject("empList", empList);

		return model;

	}

	@RequestMapping(value = "/postProject", method = RequestMethod.POST)
	public String postProject(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("project/addproject");

		try {

			String projName = request.getParameter("proj_name");
			String projDesc = request.getParameter("desc");
			String refBy = request.getParameter("ref_by");
			String cost = request.getParameter("cost");
			String projAlloc = request.getParameter("proj_alloc");
			String startDate = request.getParameter("start_date");

			int empAlloc = Integer.parseInt((projAlloc));

			Project proj = new Project();

			proj.setCompPer("");
			proj.setDevPer("");
			proj.setProjectAllocatedTo(empAlloc);
			proj.setProjectCost(cost);
			proj.setProjectDescription(projDesc); 
			proj.setProjectName(projName);
			proj.setProjectStartDate(DateConvertor.convertToYMD(startDate));
			proj.setReferenceBy(refBy);
			proj.setStatus(0);

			Project info = restTemplate.postForObject(com.ats.adminpanel.common.Constants.url + "masters/saveProject",
					proj, Project.class);

			System.err.println("Project Insert Response " + info.toString());
		} catch (Exception e) {
			System.err.println("Exc in Proj Insert " + e.getMessage());
			e.printStackTrace();

		}

		return "redirect:/showAddProject";
	}

	@RequestMapping(value = "/showAddNewModule", method = RequestMethod.GET)
	public ModelAndView showAddNewModule(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("modules/addmodule");

		List<GetModuleProject> modAndProjList;

		List<GetProjects> projList;

		GetProjects[] projArray = restTemplate.getForObject(Constants.url + "masters/getProjectList",
				GetProjects[].class);

		projList = new ArrayList<GetProjects>(Arrays.asList(projArray));

		model.addObject("projList", projList);

		GetModuleProject[] modProjArray = restTemplate.getForObject(Constants.url + "masters/getModuleProject",
				GetModuleProject[].class);

		modAndProjList = new ArrayList<GetModuleProject>(Arrays.asList(modProjArray));

		model.addObject("modAndProjList", modAndProjList);

		return model;

	}

	@RequestMapping(value = "/postModule", method = RequestMethod.POST)
	public String postModule(HttpServletRequest request, HttpServletResponse response) {

		try {

			String projId = request.getParameter("proj_name");
			String modDesc = request.getParameter("module_desc");
			String modName = request.getParameter("mod_name");

			int intProjId = Integer.parseInt((projId));
			Module module = new Module();

			module.setModuleDesc(modDesc);
			module.setModuleName(modName);
			module.setProjectId(intProjId);

			Module moduleResponse = restTemplate.postForObject(
					com.ats.adminpanel.common.Constants.url + "masters/saveModule", module, Module.class);

			System.err.println("Module Insert Response " + moduleResponse.toString());

		} catch (Exception e) {

			System.err.println("Exc in Module Insert " + e.getMessage());
			e.printStackTrace();

		}
		return "redirect:/showAddNewModule";
	}

	@RequestMapping(value = "/showAddNewForm/{projId}/{projName}/{modName}/{modId}", method = RequestMethod.GET)
	public ModelAndView showAddNewForm(HttpServletRequest request, HttpServletResponse response,
			@PathVariable int projId, @PathVariable String projName, @PathVariable String modName,
			@PathVariable int modId) {

		ModelAndView model = new ModelAndView("form/addNewForm");
		try {
			List<FormType> formTypeList;

			FormType[] formTypeArray = restTemplate.getForObject(Constants.url + "masters/getAllFormType",
					FormType[].class);

			formTypeList = new ArrayList<FormType>(Arrays.asList(formTypeArray));

			model.addObject("formTypeList", formTypeList);

			List<TaskType> taskTypeList;

			TaskType[] taskTypeArray = restTemplate.getForObject(Constants.url + "masters/getAllTaskTypeList",
					TaskType[].class);

			taskTypeList = new ArrayList<TaskType>(Arrays.asList(taskTypeArray));

			model.addObject("taskTypeList", taskTypeList);

			model.addObject("projName", projName);
			model.addObject("projId", projId);

			model.addObject("modName", modName);
			model.addObject("modId", modId);
			
			model.addObject("taskList", responseTaskList);
			

		} catch (Exception e) {

			System.err.println("Exce in showing add New Form Page " + e.getMessage());
			e.printStackTrace();
		}

		return model;

	}
	List<Task> responseTaskList;

	@RequestMapping(value = "/postForm", method = RequestMethod.POST)
	public String postNewFormAndTask(HttpServletRequest request, HttpServletResponse response) {
System.err.println("Inside /postForm ");

String projId = null ;
String projName=null;
String modName=null; 
String modId=null;
		try {

			 projId = request.getParameter("projId");
			 projName = request.getParameter("projName");
			 modName = request.getParameter("modName");
			 modId = request.getParameter("modId");

			String formType = request.getParameter("form_type");
			String formName = request.getParameter("form_name");
			String formDesc = request.getParameter("form_desc");
			String uiComp = request.getParameter("ui_comp");

			String webSerComp = request.getParameter("web_serv_comp");
			String consumComp = request.getParameter("consume_comp");
			String unitTestComp = request.getParameter("unit_test_comp");
			String spFunComp = request.getParameter("sp_func_comp");

			Forms form = new Forms();

			form.setFormDescription(formDesc);
			form.setFormName(formName);
			form.setFormTypeId(Integer.parseInt(formType));
			form.setModuleId(Integer.parseInt(modId));
			form.setProjectId(Integer.parseInt(projId));

			Forms formResponse = restTemplate
					.postForObject(com.ats.adminpanel.common.Constants.url + "masters/saveForm", form, Forms.class);
			List<Task> postTaskList = new ArrayList<Task>();
			
			
			if (formResponse != null && formResponse.getFormId() > 0) {

				if (Integer.parseInt(uiComp) != 0) {
					String taskName = request.getParameter("uicname");
					Task task = new Task();

					task.setProjectId(Integer.parseInt(projId));
					task.setModuleId(Integer.parseInt(modId));
					task.setFormId(formResponse.getFormId());
					task.setTaskName(formName +" "+ "UI " +taskName);
					
					task.setTaskTypeId(Integer.parseInt(uiComp));


					postTaskList.add(task);
				}

				if (Integer.parseInt(webSerComp) != 0) {
					String taskName = request.getParameter("webcomname");

					Task task = new Task();

					task.setProjectId(Integer.parseInt(projId));
					task.setModuleId(Integer.parseInt(modId));
					task.setFormId(formResponse.getFormId());
					task.setTaskName(formName +" "+ "WEB SERVICE " +taskName);
					task.setTaskTypeId(Integer.parseInt(webSerComp));

					postTaskList.add(task);

				}
				if (Integer.parseInt(consumComp) != 0) {
					String taskName = request.getParameter("conscompname");

					Task task = new Task();

					task.setProjectId(Integer.parseInt(projId));
					task.setModuleId(Integer.parseInt(modId));
					task.setFormId(formResponse.getFormId());
					task.setTaskName(formName + " " + "CONSUME " +taskName);
					task.setTaskTypeId(Integer.parseInt(consumComp));

					postTaskList.add(task);

				}

				if (Integer.parseInt(unitTestComp) != 0) {
					String taskName = request.getParameter("testcomname");

					Task task = new Task();

					task.setProjectId(Integer.parseInt(projId));
					task.setModuleId(Integer.parseInt(modId));
					task.setFormId(formResponse.getFormId());
					task.setTaskName(formName + " "+ "UNIT TESTING " +taskName);
					task.setTaskTypeId(Integer.parseInt(unitTestComp));
					postTaskList.add(task);

				}

				if (Integer.parseInt(spFunComp) != 0) {
					String taskName = request.getParameter("spcompname");

					Task task = new Task();

					task.setProjectId(Integer.parseInt(projId));
					task.setModuleId(Integer.parseInt(modId));
					task.setFormId(formResponse.getFormId());
					task.setTaskName(formName +" "+ "SPECIAL FUNCTION "+taskName);
					task.setTaskTypeId(Integer.parseInt(spFunComp));

					postTaskList.add(task);

				}

			}
			
			responseTaskList= restTemplate.postForObject(com.ats.adminpanel.common.Constants.url + "masters/saveTask", postTaskList, List.class);
			
			System.err.println("Task List " +postTaskList.toString());

		} catch (Exception e) {

			System.err.println("Exc in postNewFormAndTask  " + e.getMessage());
			e.printStackTrace();

		}
		return "redirect:/showAddNewForm/"+projId+"/"+projName+"/"+modName+"/"+modId;
	}
	
	
	@RequestMapping(value = "/projectManagementTask/{projectId}", method = RequestMethod.GET)
	public ModelAndView editEmp(@PathVariable int projectId, HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("project/projectManagementTask");
		try
		{
			HttpSession session = request.getSession();
			LoginResponse login = (LoginResponse) session.getAttribute("UserDetail"); 
			System.out.println("user Id "+ login.getEmployee().getEmpId());
			String projectName=null;
			
			for(int i = 0 ; i<projList.size();i++)
			{
				if(projList.get(i).getProjectId()==projectId)
					projectName = projList.get(i).getProjectName();
			}
			model.addObject("projectName", projectName); 
			model.addObject("projectId", projectId);
			
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("projectId", projectId);
			GetPhaseTask[] getPhaseTask = restTemplate.postForObject(Constants.url + "/masters/getPhaseTaskListByProjectId",map,
					GetPhaseTask[].class); 
			List<GetPhaseTask> getPhaseTaskList = new ArrayList<GetPhaseTask>(Arrays.asList(getPhaseTask)); 
			model.addObject("getPhaseTaskList", getPhaseTaskList); 
			
			Employee[] Employee = restTemplate.getForObject(Constants.url + "/masters/getAllEmpList", 
					Employee[].class); 
			List<Employee> empList = new ArrayList<Employee>(Arrays.asList(Employee)); 
			model.addObject("empList", empList);
			
			PhaseType[] phaseType = restTemplate.getForObject(Constants.url + "/masters/getAllPhaseTypeList", 
					PhaseType[].class); 
			List<PhaseType> phaseTypeList = new ArrayList<PhaseType>(Arrays.asList(phaseType)); 
			model.addObject("phaseTypeList", phaseTypeList);
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return model;
	}
	
	@RequestMapping(value = "/insertPhaseTask", method = RequestMethod.POST)
	public String insertPhaseTask(HttpServletRequest request, HttpServletResponse response) {

		 
		int projectId = Integer.parseInt(request.getParameter("projectId"));
		try {

			
			String tTaskPhaseId = request.getParameter("tTaskPhaseId");
			int phaseId = Integer.parseInt(request.getParameter("phaseId"));
			
			String desc = request.getParameter("desc");
			String expectedStartDate = request.getParameter("expectedStartDate");
			String actualStartDate = request.getParameter("actualStartDate");
			String expectedEndDate = request.getParameter("expectedEndDate");
			String actualEndDate = request.getParameter("actualEndDate");
			String expectedHours = request.getParameter("expectedHours");
			String actualdHours = request.getParameter("actualdHours");

			int empId = Integer.parseInt(request.getParameter("empId"));

			PhaseTask insert = new PhaseTask();

			if(tTaskPhaseId=="" || tTaskPhaseId==null)
				insert.settTaskPhaseId(0);
			else
				insert.settTaskPhaseId(Integer.parseInt(tTaskPhaseId));
			insert.setTaskPhaseId(phaseId);
			insert.setTaskDesc(desc);
			insert.setExpStartDate(DateConvertor.convertToYMD(expectedStartDate));
			if(actualStartDate!="" || actualStartDate!=null)
				insert.setActualStartDate(DateConvertor.convertToYMD(actualStartDate));
			insert.setExpEndDate(DateConvertor.convertToYMD(expectedEndDate));
			if(actualStartDate!="" || actualStartDate!=null)
				insert.setAtcualEndDate(DateConvertor.convertToYMD(actualEndDate));
			insert.setExpHrs(expectedHours);
			insert.setActualHrs(actualdHours);
			insert.setAssignedTo(empId);
			insert.setProjectId(projectId);

			PhaseTask res = restTemplate.postForObject(com.ats.adminpanel.common.Constants.url + "masters/savePhaseTask",
					insert, PhaseTask.class); 
			
			
			System.err.println("resss " + res.toString());
		} catch (Exception e) {
			System.err.println("Exc in Proj Insert " + e.getMessage());
			e.printStackTrace();

		}

		return "redirect:/projectManagementTask/"+projectId;
	}
	
	@RequestMapping(value = "/editPhaseTask/{tTaskPhaseId}/{projectId}", method = RequestMethod.GET)
	public ModelAndView editPhaseTask(@PathVariable int tTaskPhaseId,@PathVariable int projectId, HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("project/projectManagementTask");
		try
		{
			HttpSession session = request.getSession();
			LoginResponse login = (LoginResponse) session.getAttribute("UserDetail"); 
			System.out.println("user Id "+ login.getEmployee().getEmpId());
			String projectName=null;
			
			for(int i = 0 ; i<projList.size();i++)
			{
				if(projList.get(i).getProjectId()==projectId)
					projectName = projList.get(i).getProjectName();
			}
			model.addObject("projectName", projectName); 
			model.addObject("projectId", projectId);
			
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("projectId", projectId);
			GetPhaseTask[] getPhaseTask = restTemplate.postForObject(Constants.url + "/masters/getPhaseTaskListByProjectId",map,
					GetPhaseTask[].class); 
			List<GetPhaseTask> getPhaseTaskList = new ArrayList<GetPhaseTask>(Arrays.asList(getPhaseTask)); 
			model.addObject("getPhaseTaskList", getPhaseTaskList); 
			
			Employee[] Employee = restTemplate.getForObject(Constants.url + "/masters/getAllEmpList", 
					Employee[].class); 
			List<Employee> empList = new ArrayList<Employee>(Arrays.asList(Employee)); 
			model.addObject("empList", empList);
			
			PhaseType[] phaseType = restTemplate.getForObject(Constants.url + "/masters/getAllPhaseTypeList", 
					PhaseType[].class); 
			List<PhaseType> phaseTypeList = new ArrayList<PhaseType>(Arrays.asList(phaseType)); 
			model.addObject("phaseTypeList", phaseTypeList);
			
			
			map = new LinkedMultiValueMap<String, Object>();
			map.add("tTaskPhaseId", tTaskPhaseId);
			PhaseTask phaseTask = restTemplate.postForObject(Constants.url + "/masters/phaseTaskById",map,
					PhaseTask.class);
			model.addObject("phaseTask", phaseTask);
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		return model;
	}

}
