package com.ats.adminpanel.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import com.ats.adminpanel.common.Constants;
import com.ats.adminpanel.model.Employee;
import com.ats.adminpanel.model.FormType;
import com.ats.adminpanel.model.GetModuleProject;
import com.ats.adminpanel.model.GetProjects;
import com.ats.adminpanel.model.Module;
import com.ats.adminpanel.model.Project;
import com.ats.adminpanel.model.TaskType;

@Controller
public class ProjectController {
	RestTemplate restTemplate = new RestTemplate();
	MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

	@RequestMapping(value = "/showAddProject", method = RequestMethod.GET)
	public ModelAndView showAddProject(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("project/addproject");

		List<Employee> empList;

		Employee[] empArray = restTemplate.getForObject(Constants.url + "masters/getAllEmpList", Employee[].class);

		empList = new ArrayList<Employee>(Arrays.asList(empArray));

		List<GetProjects> projList;

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
			proj.setProjectEndDate("");
			proj.setProjectName(projName);
			proj.setProjectStartDate(startDate);
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
			Module module=new Module();
			
			module.setModuleDesc(modDesc);
			module.setModuleName(modName);
			module.setProjectId(intProjId);

			Module moduleResponse = restTemplate.postForObject(com.ats.adminpanel.common.Constants.url + "masters/saveModule",
					module, Module.class);

			System.err.println("Module Insert Response " + moduleResponse.toString());
			
		} catch (Exception e) {
			
			System.err.println("Exc in Module Insert " + e.getMessage());
			e.printStackTrace();

		}
		return "redirect:/showAddNewModule";
	}

	@RequestMapping(value = "/showAddNewForm/{projId}/{projName}", method = RequestMethod.GET)
	public ModelAndView showAddNewForm(HttpServletRequest request, HttpServletResponse response,
			@PathVariable int projId,@PathVariable String projName) {

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
		
		
		}catch (Exception e) {
			
			System.err.println("Exce in showing add New Form Page " +e.getMessage());
			e.printStackTrace();
		}

		return model;

	}

}
