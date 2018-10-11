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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import com.ats.adminpanel.common.Constants;
import com.ats.adminpanel.common.DateConvertor;
import com.ats.adminpanel.model.EmpAllocatedWork;
import com.ats.adminpanel.model.Employee;
import com.ats.adminpanel.model.FormType;
import com.ats.adminpanel.model.Forms;
import com.ats.adminpanel.model.GetFormList;
import com.ats.adminpanel.model.GetModuleProject;
import com.ats.adminpanel.model.GetPhaseTask;
import com.ats.adminpanel.model.GetProjects;
import com.ats.adminpanel.model.GetTask;
import com.ats.adminpanel.model.Info;
import com.ats.adminpanel.model.LoginResponse;
import com.ats.adminpanel.model.Module;
import com.ats.adminpanel.model.PhaseTask;
import com.ats.adminpanel.model.PhaseType;
import com.ats.adminpanel.model.Project;
import com.ats.adminpanel.model.Task;
import com.ats.adminpanel.model.TaskType;
import com.ats.adminpanel.model.tx.CmplxOption;
import com.ats.adminpanel.model.tx.GetComplexity;
import com.ats.adminpanel.model.tx.Technology;

@Controller
public class ProjectController {
	RestTemplate restTemplate = new RestTemplate();
	MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
	List<GetProjects> projList = new ArrayList<GetProjects>();

	@RequestMapping(value = "/showAddProject", method = RequestMethod.GET)
	public ModelAndView showAddProject(HttpServletRequest request, HttpServletResponse response) {

		Constants.mainAct = 1;
		Constants.subAct = 13;

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

	@RequestMapping(value = "/editProject/{projectId}", method = RequestMethod.GET)
	public ModelAndView editProject(@PathVariable int projectId, HttpServletRequest request,
			HttpServletResponse response) {

		ModelAndView model = new ModelAndView("project/addproject");
		try {

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("projectId", projectId);
			Project editproject = restTemplate.postForObject(Constants.url + "masters/projectByProjectId", map,
					Project.class);
			if (editproject.getProjectStartDate() != "" && editproject.getProjectStartDate() != null)
				editproject.setProjectStartDate(DateConvertor.convertToDMY(editproject.getProjectStartDate()));
			if (editproject.getProjectEndDate() != "" && editproject.getProjectEndDate() != null)
				editproject.setProjectEndDate(DateConvertor.convertToDMY(editproject.getProjectEndDate()));
			if (editproject.getProjectExpEndDate() != "" && editproject.getProjectExpEndDate() != null)
				editproject.setProjectExpEndDate(DateConvertor.convertToDMY(editproject.getProjectExpEndDate()));

			List<Employee> empList;
			Employee[] empArray = restTemplate.getForObject(Constants.url + "masters/getAllEmpList", Employee[].class);

			empList = new ArrayList<Employee>(Arrays.asList(empArray));

			projList = new ArrayList<GetProjects>();

			GetProjects[] projArray = restTemplate.getForObject(Constants.url + "masters/getProjectList",
					GetProjects[].class);

			projList = new ArrayList<GetProjects>(Arrays.asList(projArray));

			model.addObject("projList", projList);
			model.addObject("editproject", editproject);
			model.addObject("empList", empList);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;

	}

	@RequestMapping(value = "/postProject", method = RequestMethod.POST)
	public String postProject(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("project/addproject");

		try {
			String projectId = request.getParameter("projectId");
			String projName = request.getParameter("proj_name");
			String projDesc = request.getParameter("desc");
			String refBy = request.getParameter("ref_by");
			String cost = request.getParameter("cost");
			String projAlloc = request.getParameter("proj_alloc");
			String startDate = request.getParameter("start_date");
			String endDate = request.getParameter("endDate");
			String projectExpEndDate = request.getParameter("projectExpEndDate");
			String devPer = request.getParameter("devPer");
			String compPer = request.getParameter("compPer");

			System.out.println("projectExpEndDate " + projectExpEndDate);
			int empAlloc = Integer.parseInt((projAlloc));

			Project proj = new Project();

			if (projectId == "" || projectId == null)
				proj.setProjectId(0);
			else
				proj.setProjectId(Integer.parseInt(projectId));

			proj.setProjectExpEndDate(DateConvertor.convertToYMD(projectExpEndDate));
			proj.setCompPer(compPer);
			proj.setDevPer(devPer);
			proj.setProjectAllocatedTo(empAlloc);
			proj.setProjectCost(cost);
			proj.setProjectDescription(projDesc);
			proj.setProjectName(projName);
			proj.setProjectStartDate(DateConvertor.convertToYMD(startDate));
			proj.setReferenceBy(refBy);
			proj.setStatus(0);

			if (endDate != "" && endDate != null)
				proj.setProjectEndDate(DateConvertor.convertToYMD(endDate));

			System.out.println("projectExpEndDate " + proj.getProjectExpEndDate());
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

		Constants.mainAct = 1;
		Constants.subAct = 14;

		ModelAndView model = new ModelAndView("modules/addmodule");

		try {
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
		
		PhaseType[] phaseArray = restTemplate.getForObject(Constants.url + "masters/getAllPhaseTypeList",
				PhaseType[].class);

		List<PhaseType> phaseTypeList = new ArrayList<PhaseType>(Arrays.asList(phaseArray));

		model.addObject("phaseTypeList", phaseTypeList);

		Technology[] techArray = restTemplate.getForObject(Constants.url + "/getAllTechList", Technology[].class);

		List<Technology> techList = new ArrayList<Technology>(Arrays.asList(techArray));

		model.addObject("techList", techList);
		
		}catch (Exception e) {
			e.getStackTrace();
		}

		return model;

	}
	 
	
	@RequestMapping(value = "/editModule/{moduleId}", method = RequestMethod.GET)
	public ModelAndView editModule(@PathVariable int moduleId, HttpServletRequest request, HttpServletResponse response) {
 
		ModelAndView model = new ModelAndView("modules/addmodule");

		try {
			
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map.add("moduleId", moduleId); 
			GetModuleProject editModule = restTemplate.postForObject(Constants.url + "masters/getModuleByModuleId",map,
					GetModuleProject.class);
			model.addObject("editModule", editModule);
			
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
		
		PhaseType[] phaseArray = restTemplate.getForObject(Constants.url + "masters/getAllPhaseTypeList",
				PhaseType[].class);

		List<PhaseType> phaseTypeList = new ArrayList<PhaseType>(Arrays.asList(phaseArray));

		model.addObject("phaseTypeList", phaseTypeList);

		Technology[] techArray = restTemplate.getForObject(Constants.url + "/getAllTechList", Technology[].class);

		List<Technology> techList = new ArrayList<Technology>(Arrays.asList(techArray));

		model.addObject("techList", techList);
		
		}catch (Exception e) {
			e.printStackTrace();
		}

		return model;

	}

	@RequestMapping(value = "/postModule", method = RequestMethod.POST)
	public String postModule(HttpServletRequest request, HttpServletResponse response) {

		String ret = new String();
		try {

			String projId = request.getParameter("proj_name");
			String modDesc = request.getParameter("module_desc");
			String modName = request.getParameter("mod_name");

			int intProjId = Integer.parseInt((projId));
			int techId = Integer.parseInt(request.getParameter("techId"));
			int phaseId = Integer.parseInt(request.getParameter("phaseId"));
			int flag = Integer.parseInt(request.getParameter("flag"));
			String moduleId = request.getParameter("moduleId") ;
			
			Module module = new Module();

			if(moduleId.equalsIgnoreCase("") || moduleId.equalsIgnoreCase(null)) {
				module.setModuleId(0);
			}
			else {
				module.setModuleId(Integer.parseInt(moduleId));
			}
			module.setModuleDesc(modDesc);
			module.setModuleName(modName);
			module.setProjectId(intProjId);
			module.setPhaseId(phaseId);
			module.setTechId(techId);
			
			
			Module moduleResponse = restTemplate.postForObject(
					com.ats.adminpanel.common.Constants.url + "masters/saveModule", module, Module.class);

			System.err.println("Module Insert Response " + moduleResponse.toString());
			
			if(flag==0) {
				ret="redirect:/showAddNewModule";
			}
			else {
				ret="redirect:/showAddNewForm/"+moduleResponse.getModuleId();
			}

		} catch (Exception e) {

			System.err.println("Exc in Module Insert " + e.getMessage());
			e.printStackTrace();

		}
		return ret;
	}
	
	@RequestMapping(value = "/deleteModule/{moduleId}", method = RequestMethod.GET)
	public String deleteModule(@PathVariable int moduleId,HttpServletRequest request, HttpServletResponse response) {

		 
		try {
 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map.add("moduleId", moduleId); 
			Info delete = restTemplate.postForObject(Constants.url + "masters/deleteModule", map, Info.class);

			System.err.println("Module delete Response " + delete);
			 
		} catch (Exception e) {

			System.err.println("Exc in Module Insert " + e.getMessage());
			e.printStackTrace();

		}
		return "redirect:/showAddNewModule";
	}

	List<GetComplexity> complexityList = new ArrayList<GetComplexity>();
	
	@RequestMapping(value = "/showAddNewForm/{moduleId}", method = RequestMethod.GET)
	public ModelAndView showAddNewForm(@PathVariable int moduleId,HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("form/addForm");
		try {
			
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map.add("moduleId", moduleId); 
			GetModuleProject getModuleProject = restTemplate.postForObject(Constants.url + "masters/getModuleByModuleId",map,
					GetModuleProject.class); 
			
			GetFormList[] getFormList = restTemplate.postForObject(Constants.url + "masters/getFormAndTaskListByModuleId",map,
					GetFormList[].class); 
			
			List<GetFormList> formListWTaskList = new ArrayList<GetFormList>(Arrays.asList(getFormList));
			model.addObject("formListWTaskList", formListWTaskList);
			
			List<FormType> formTypeList;

			FormType[] formTypeArray = restTemplate.getForObject(Constants.url + "masters/getAllFormType",
					FormType[].class);

			formTypeList = new ArrayList<FormType>(Arrays.asList(formTypeArray));

			model.addObject("formTypeList", formTypeList);

			List<TaskType> taskTypeList;

			TaskType[] taskTypeArray = restTemplate.getForObject(Constants.url + "masters/getAllTaskTypeList",
					TaskType[].class);

			taskTypeList = new ArrayList<TaskType>(Arrays.asList(taskTypeArray));
			
			map = new LinkedMultiValueMap<>();
			map.add("techId", getModuleProject.getTechId());
			map.add("phaseId", getModuleProject.getPhaseId()); 
			GetComplexity[] getComplexity = restTemplate.postForObject(Constants.url + "/getHeaderDetailCompByTechId",map,
					GetComplexity[].class);

			 complexityList = new ArrayList<GetComplexity>(Arrays.asList(getComplexity));
			
			map = new LinkedMultiValueMap<>();
			map.add("techId", getModuleProject.getTechId());
			map.add("mPhaseId", getModuleProject.getPhaseId()); 
			Employee[] employee = restTemplate.postForObject(Constants.url + "/masters/employeeByTechIdAndPhaseId",map,
					Employee[].class); 
			List<Employee> employeeList = new ArrayList<Employee>(Arrays.asList(employee)); 
			
			
			model.addObject("employeeList", employeeList);
			model.addObject("complexityList", complexityList);
			model.addObject("taskTypeList", taskTypeList);

			model.addObject("projName", getModuleProject.getProjectName());
			model.addObject("projId", getModuleProject.getProjectId());

			model.addObject("modName", getModuleProject.getModuleName());
			model.addObject("modId", getModuleProject.getModuleId());
			model.addObject("getModuleProject", getModuleProject);

			  
		} catch (Exception e) {

			System.err.println("Exce in showing add New Form Page " + e.getMessage());
			e.printStackTrace();
		}

		return model;

	}
	
	@RequestMapping(value = "/deleteTask/{taskId}/{moduleId}", method = RequestMethod.GET)
	public String deleteTask(@PathVariable int taskId,@PathVariable int moduleId,HttpServletRequest request, HttpServletResponse response) {

		 
		try {
			
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map.add("taskId", taskId); 
			Info info = restTemplate.postForObject(Constants.url + "masters/deleteTask",map,
					Info.class); 
			 System.out.println(info);
			  
		} catch (Exception e) {

			System.err.println("Exce in showing add New Form Page " + e.getMessage());
			e.printStackTrace();
		}

		return "redirect:/showAddNewForm/"+moduleId;

	}
	
	@RequestMapping(value = "/getPlanHoursByvalue", method = RequestMethod.GET)
	public @ResponseBody CmplxOption getPlanHoursByvalue(HttpServletRequest request,
			HttpServletResponse response) {
		
		CmplxOption cmplxOption = new CmplxOption();
		
		try {
			 
			int cmplxId = Integer.parseInt(request.getParameter("cmplxId"));
			int value = Integer.parseInt(request.getParameter("value"));
			
			for(int i = 0 ; i<complexityList.size() ; i++) {
				
				if(complexityList.get(i).getCmplxId()==cmplxId) {
					
					for(int j = 0 ; j<complexityList.get(i).getCmplxOptionList().size() ; j++) {
						
						if(value==complexityList.get(i).getCmplxOptionList().get(j).getCmplxOptId()) {
							
							cmplxOption = complexityList.get(i).getCmplxOptionList().get(j);
							break;
							 
						}
						
						
					}
					
				}
			}
			 
			 
		} catch (Exception e) {
			e.printStackTrace();
			 
		}

		return cmplxOption;
	}
	
	@RequestMapping(value = "/getEmpAllocatedWorkHours", method = RequestMethod.GET)
	public @ResponseBody EmpAllocatedWork getEmpAllocatedWorkHours(HttpServletRequest request,
			HttpServletResponse response) {
		
		EmpAllocatedWork empAllocatedWork = new EmpAllocatedWork();
		
		try {
			
			
			
			int empId = Integer.parseInt(request.getParameter("empId"));
			
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map.add("empId", empId);
			map.add("projectId", 0);

				empAllocatedWork = restTemplate.postForObject(Constants.url + "/getEmployeeAllocatedWorkById", map,
						EmpAllocatedWork.class);
				System.out.println("EmpConReportById []" + empAllocatedWork.toString());
			 
		} catch (Exception e) {
			e.printStackTrace();
			empAllocatedWork = new EmpAllocatedWork();
			empAllocatedWork.setTaskPlannedHrs("0");
		}

		return empAllocatedWork;
	}
	
	@RequestMapping(value = "/getEmpAllocatedWorkHoursByDate", method = RequestMethod.GET)
	public @ResponseBody EmpAllocatedWork getEmpAllocatedWorkHoursByDate(HttpServletRequest request,
			HttpServletResponse response) {
		
		EmpAllocatedWork empAllocatedWork = new EmpAllocatedWork();
		
		try {
			
			
			
			int empId = Integer.parseInt(request.getParameter("empId"));
			String date = request.getParameter("date") ;
			
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map.add("empId", empId);
			map.add("date",DateConvertor.convertToYMD(date)); 
				empAllocatedWork = restTemplate.postForObject(Constants.url + "/getEmpAllocatedWorkHoursByDate", map,
						EmpAllocatedWork.class);
				System.out.println("EmpConReportById []" + empAllocatedWork.toString());
			 
		} catch (Exception e) {
			e.printStackTrace();
			empAllocatedWork = new EmpAllocatedWork();
			empAllocatedWork.setTaskPlannedHrs("0");
		}

		return empAllocatedWork;
	}

	List<Task> responseTaskList;

	@RequestMapping(value = "/postForm", method = RequestMethod.POST)
	public String postNewFormAndTask(HttpServletRequest request, HttpServletResponse response) {
		System.err.println("Inside /postForm ");

		String projId = null;
		String projName = null;
		String modName = null;
		String modId = null;
		try {

			projId = request.getParameter("projId");
			projName = request.getParameter("projName");
			modName = request.getParameter("modName");
			modId = request.getParameter("modId");

			String formType = request.getParameter("form_type");
			String formName = request.getParameter("form_name");
			String formDesc = request.getParameter("form_desc");
			
			Forms form = new Forms();

			form.setFormDescription(formDesc);
			form.setFormName(formName);
			form.setFormTypeId(Integer.parseInt(formType));
			form.setModuleId(Integer.parseInt(modId));
			form.setProjectId(Integer.parseInt(projId));

			Forms formResponse = restTemplate
					.postForObject(com.ats.adminpanel.common.Constants.url + "masters/saveForm", form, Forms.class);
			 
			List<Task> postTaskList = new ArrayList<Task>();
			
			for(int i = 0 ; i<complexityList.size() ; i++) {
				
				int workType = Integer.parseInt(request.getParameter("workType"+complexityList.get(i).getCmplxId()));
				
				if(workType!=0) {
					
					int devpId = Integer.parseInt(request.getParameter("empId"+complexityList.get(i).getCmplxId()));
					String requiredHours = request.getParameter("requiredHours"+complexityList.get(i).getCmplxId());
					
					if(devpId!=0) {
						
						String allocationDate = request.getParameter("allocationDate"+complexityList.get(i).getCmplxId());
						
						
						for(int j=0 ; j<complexityList.get(i).getCmplxOptionList().size() ; j++) {
							
							if(complexityList.get(i).getCmplxOptionList().get(j).getCmplxOptId()==workType) {
							Task task = new Task(); 
							task.setProjectId(Integer.parseInt(projId));
							task.setModuleId(Integer.parseInt(modId));
							task.setFormId(formResponse.getFormId());
							task.setTaskName(formName + complexityList.get(i).getCmplxName() + complexityList.get(i).getCmplxOptionList().get(j).getCmplxOptName());
							task.setDeveloperId(devpId);
							task.setStartDate(DateConvertor.convertToYMD(allocationDate));
							task.setTaskTypeId(workType); 
							task.setTaskPlannedHrs(requiredHours);
							task.setDevStatus(1);
							postTaskList.add(task);
							}
						}
						
					}
					else {
						
						for(int j=0 ; j<complexityList.get(i).getCmplxOptionList().size() ; j++) {
							
							if(complexityList.get(i).getCmplxOptionList().get(j).getCmplxOptId()==workType) {
							Task task = new Task(); 
							task.setProjectId(Integer.parseInt(projId));
							task.setModuleId(Integer.parseInt(modId));
							task.setFormId(formResponse.getFormId());
							task.setTaskName(formName +" "+ complexityList.get(i).getCmplxName() +" "+ complexityList.get(i).getCmplxOptionList().get(j).getCmplxOptName()); 
							task.setTaskTypeId(workType); 
							task.setTaskPlannedHrs(requiredHours);
							task.setDevStatus(0);
							postTaskList.add(task);
							}
						}
						
					}
					
				}
				
			}
			
			System.err.println("Task List " + postTaskList.toString() + "size " + postTaskList.size());
			 responseTaskList = restTemplate.postForObject(com.ats.adminpanel.common.Constants.url + "masters/saveTask",
					postTaskList, List.class);
 

		} catch (Exception e) {

			System.err.println("Exc in postNewFormAndTask  " + e.getMessage());
			e.printStackTrace();

		}
		return "redirect:/showAddNewForm/"+modId;
	}

	@RequestMapping(value = "/projectManagementTask/{projectId}", method = RequestMethod.GET)
	public ModelAndView editEmp(@PathVariable int projectId, HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("project/projectManagementTask");
		try {
			HttpSession session = request.getSession();
			LoginResponse login = (LoginResponse) session.getAttribute("UserDetail");
			System.out.println("user Id " + login.getEmployee().getEmpId());
			String projectName = null;

			for (int i = 0; i < projList.size(); i++) {
				if (projList.get(i).getProjectId() == projectId)
					projectName = projList.get(i).getProjectName();
			}
			model.addObject("projectName", projectName);
			model.addObject("projectId", projectId);

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("projectId", projectId);
			GetPhaseTask[] getPhaseTask = restTemplate
					.postForObject(Constants.url + "/masters/getPhaseTaskListByProjectId", map, GetPhaseTask[].class);
			List<GetPhaseTask> getPhaseTaskList = new ArrayList<GetPhaseTask>(Arrays.asList(getPhaseTask));
			model.addObject("getPhaseTaskList", getPhaseTaskList);

			Employee[] Employee = restTemplate.getForObject(Constants.url + "/masters/getAllEmpList", Employee[].class);
			List<Employee> empList = new ArrayList<Employee>(Arrays.asList(Employee));
			model.addObject("empList", empList);

			PhaseType[] phaseType = restTemplate.getForObject(Constants.url + "/masters/getAllPhaseTypeList",
					PhaseType[].class);
			List<PhaseType> phaseTypeList = new ArrayList<PhaseType>(Arrays.asList(phaseType));
			model.addObject("phaseTypeList", phaseTypeList);

		} catch (Exception e) {
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

			if (tTaskPhaseId == "" || tTaskPhaseId == null)
				insert.settTaskPhaseId(0);
			else
				insert.settTaskPhaseId(Integer.parseInt(tTaskPhaseId));
			insert.setTaskPhaseId(phaseId);
			insert.setTaskDesc(desc);
			insert.setExpStartDate(DateConvertor.convertToYMD(expectedStartDate));
			if (actualStartDate != "" && actualStartDate != null)
				insert.setActualStartDate(DateConvertor.convertToYMD(actualStartDate));
			insert.setExpEndDate(DateConvertor.convertToYMD(expectedEndDate));
			if (actualStartDate != "" && actualStartDate != null)
				insert.setAtcualEndDate(DateConvertor.convertToYMD(actualEndDate));
			insert.setExpHrs(expectedHours);
			insert.setActualHrs(actualdHours);
			insert.setAssignedTo(empId);
			insert.setProjectId(projectId);

			PhaseTask res = restTemplate.postForObject(
					com.ats.adminpanel.common.Constants.url + "masters/savePhaseTask", insert, PhaseTask.class);

			System.err.println("resss " + res.toString());
		} catch (Exception e) {
			System.err.println("Exc in Proj Insert " + e.getMessage());
			e.printStackTrace();

		}

		return "redirect:/projectManagementTask/" + projectId;
	}

	@RequestMapping(value = "/editPhaseTask/{tTaskPhaseId}/{projectId}", method = RequestMethod.GET)
	public ModelAndView editPhaseTask(@PathVariable int tTaskPhaseId, @PathVariable int projectId,
			HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("project/projectManagementTask");
		try {
			HttpSession session = request.getSession();
			LoginResponse login = (LoginResponse) session.getAttribute("UserDetail");
			System.out.println("user Id " + login.getEmployee().getEmpId());
			String projectName = null;

			for (int i = 0; i < projList.size(); i++) {
				if (projList.get(i).getProjectId() == projectId)
					projectName = projList.get(i).getProjectName();
			}
			model.addObject("projectName", projectName);
			model.addObject("projectId", projectId);

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("projectId", projectId);
			GetPhaseTask[] getPhaseTask = restTemplate
					.postForObject(Constants.url + "/masters/getPhaseTaskListByProjectId", map, GetPhaseTask[].class);
			List<GetPhaseTask> getPhaseTaskList = new ArrayList<GetPhaseTask>(Arrays.asList(getPhaseTask));
			model.addObject("getPhaseTaskList", getPhaseTaskList);

			Employee[] Employee = restTemplate.getForObject(Constants.url + "/masters/getAllEmpList", Employee[].class);
			List<Employee> empList = new ArrayList<Employee>(Arrays.asList(Employee));
			model.addObject("empList", empList);

			PhaseType[] phaseType = restTemplate.getForObject(Constants.url + "/masters/getAllPhaseTypeList",
					PhaseType[].class);
			List<PhaseType> phaseTypeList = new ArrayList<PhaseType>(Arrays.asList(phaseType));
			model.addObject("phaseTypeList", phaseTypeList);

			map = new LinkedMultiValueMap<String, Object>();
			map.add("tTaskPhaseId", tTaskPhaseId);
			PhaseTask phaseTask = restTemplate.postForObject(Constants.url + "/masters/phaseTaskById", map,
					PhaseTask.class);
			model.addObject("phaseTask", phaseTask);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

	@RequestMapping(value = "/ongoingProjecList", method = RequestMethod.GET)
	public ModelAndView ongoingProjecList(HttpServletRequest request, HttpServletResponse response) {

		Constants.mainAct = 3;
		Constants.subAct = 36;

		ModelAndView model = new ModelAndView("project/ongoingProjecList");

		try {

			List<GetProjects> projList;

			GetProjects[] projArray = restTemplate.getForObject(Constants.url + "masters/ongoingProjectList",
					GetProjects[].class);
			projList = new ArrayList<GetProjects>(Arrays.asList(projArray));
			System.out.println("projList " + projList);
			model.addObject("projList", projList);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;

	}

	@RequestMapping(value = "/projectCostReport", method = RequestMethod.GET)
	public ModelAndView projectCostReport(HttpServletRequest request, HttpServletResponse response) {

		Constants.mainAct = 3;
		Constants.subAct = 37;

		ModelAndView model = new ModelAndView("project/projectCostReport");

		try {

			List<GetProjects> projList;

			GetProjects[] projArray = restTemplate.getForObject(Constants.url + "masters/ongoingProjectList",
					GetProjects[].class);
			projList = new ArrayList<GetProjects>(Arrays.asList(projArray));
			System.out.println("projList " + projList);
			model.addObject("projList", projList);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;

	}

}
