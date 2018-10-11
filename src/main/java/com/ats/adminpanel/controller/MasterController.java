package com.ats.adminpanel.controller;

import java.text.SimpleDateFormat;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
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
import com.ats.adminpanel.model.Employee;
import com.ats.adminpanel.model.GetFormList;
import com.ats.adminpanel.model.GetProjects;
import com.ats.adminpanel.model.GetSupportTask;
import com.ats.adminpanel.model.GetTask;
import com.ats.adminpanel.model.Info;
import com.ats.adminpanel.model.LoginResponse;
import com.ats.adminpanel.model.PhaseType;
import com.ats.adminpanel.model.SupportTask;
import com.ats.adminpanel.model.Task;
import com.ats.adminpanel.model.TaskType;
import com.ats.adminpanel.model.leave.GetLeaveCount;
import com.ats.adminpanel.model.tx.GetTech;
import com.ats.adminpanel.model.Module;

@Controller
@Scope("session")
public class MasterController {

	RestTemplate rest = new RestTemplate();
	List<GetTask> taskList = new ArrayList<GetTask>();
	List<PhaseType> phaseTypeList;
	List<GetTech> techList;
	List<Module> moduleList;

	@RequestMapping(value = "/addEmployee", method = RequestMethod.GET)
	public ModelAndView addEmployee(HttpServletRequest request, HttpServletResponse response) {

		Constants.mainAct = 1;
		Constants.subAct = 11;

		ModelAndView model = new ModelAndView("masters/addEmployee");
		try {
			HttpSession session = request.getSession();
			LoginResponse login = (LoginResponse) session.getAttribute("UserDetail");

			System.out.println("user Id " + login.getEmployee().getEmpId());

			PhaseType[] phaseArray = rest.getForObject(Constants.url + "masters/getAllPhaseTypeList",
					PhaseType[].class);

			phaseTypeList = new ArrayList<PhaseType>(Arrays.asList(phaseArray));

			model.addObject("phaseTypeList", phaseTypeList);

			GetTech[] techArray = rest.getForObject(Constants.url + "/getAllTechPhaseList", GetTech[].class);

			techList = new ArrayList<GetTech>(Arrays.asList(techArray));

			model.addObject("techList", techList);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

	@RequestMapping(value = "/insertEmployee", method = RequestMethod.POST)
	public String insertEmployee(HttpServletRequest request, HttpServletResponse response) {

		try {
			HttpSession session = request.getSession();
			LoginResponse login = (LoginResponse) session.getAttribute("UserDetail");
			System.out.println("user Id " + login.getEmployee().getEmpId());

			String empName = request.getParameter("empName");
			String empId = request.getParameter("empId");
			String empMo = request.getParameter("empMo");
			String empEdu = request.getParameter("empEdu");
			String birthDate = request.getParameter("birthDate");
			String empDesg = request.getParameter("empDesg");
			String empExperience = request.getParameter("empExperience");
			String joiningDate = request.getParameter("joiningDate");
			float perHour = Float.parseFloat(request.getParameter("perHour"));

			int empType = Integer.parseInt(request.getParameter("empType"));
			String password = request.getParameter("password");

			String fromDate = request.getParameter("fromDate");
			String toDate = request.getParameter("toDate");
			float sickLeave = Float.parseFloat(request.getParameter("sickLeave"));

			float causalLeave = Float.parseFloat(request.getParameter("causalLeave"));
			int mPhaseId = Integer.parseInt(request.getParameter("mPhaseId"));
			int techId = Integer.parseInt(request.getParameter("techId"));

			Employee employee = new Employee();
			if (empId == "" || empId == null)
				employee.setEmpId(0);
			else
				employee.setEmpId(Integer.parseInt(empId));
			employee.setEmpName(empName);
			employee.setEmpDesignation(empDesg);
			employee.setEmpEdu(empEdu);
			employee.setEmpMobile(empMo);
			employee.setEmpBirthdate(birthDate);
			employee.setEmpPrevExp(empExperience);
			employee.setEmpJoiningDate(joiningDate);
			employee.setEmpPerHrRate(perHour);
			employee.setEmpType(empType);
			employee.setEmpPwd(password);
			employee.setIsUsed(1);
			employee.setFromDate(fromDate);
			employee.setToDate(toDate);
			employee.setCausalLeave(causalLeave);
			employee.setSickLeave(sickLeave);
			employee.setmPhaseId(mPhaseId);
			employee.setTechId(techId);

			Employee res = rest.postForObject(Constants.url + "/masters/saveEmployee", employee, Employee.class);

			System.out.println("res " + res);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/allEmployeeList";
	}

	@RequestMapping(value = "/allEmployeeList", method = RequestMethod.GET)
	public ModelAndView allEmployeeList(HttpServletRequest request, HttpServletResponse response) {

		Constants.mainAct = 1;
		Constants.subAct = 12;

		ModelAndView model = new ModelAndView("masters/empList");
		try {
			HttpSession session = request.getSession();
			LoginResponse login = (LoginResponse) session.getAttribute("UserDetail");

			System.out.println("user Id " + login.getEmployee().getEmpId());

			Employee[] Employee = rest.getForObject(Constants.url + "/masters/getAllEmpList", Employee[].class);
			List<Employee> empList = new ArrayList<Employee>(Arrays.asList(Employee));

			GetLeaveCount[] getLeaveCountList = rest.getForObject(Constants.url + "/getCountForSickLeave",
					GetLeaveCount[].class);
			List<GetLeaveCount> countSickList = new ArrayList<GetLeaveCount>(Arrays.asList(getLeaveCountList));

			getLeaveCountList = rest.getForObject(Constants.url + "/getCountForCasualLeave", GetLeaveCount[].class);
			List<GetLeaveCount> countCausalList = new ArrayList<GetLeaveCount>(Arrays.asList(getLeaveCountList));

			for (int j = 0; j < empList.size(); j++) {

				for (int i = 0; i < countSickList.size(); i++) {
					countSickList.get(i).getLeaveCount();
					if (countSickList.get(i).getEmpId() == empList.get(j).getEmpId()) {
						float sickCount = empList.get(j).getSickLeave() - countSickList.get(i).getLeaveCount();

						System.out.println("Sick count--------------" + sickCount);
						empList.get(j).setUsedSickLeave(sickCount);

					}

				}
			}

			for (int j = 0; j < empList.size(); j++) {

				for (int i = 0; i < countCausalList.size(); i++) {

					if (countCausalList.get(i).getEmpId() == empList.get(j).getEmpId()) {
						float casualCount = empList.get(j).getSickLeave() - countCausalList.get(i).getLeaveCount();

						System.out.println("casualCount count--------------" + casualCount);
						empList.get(j).setUsedCasualLeave(casualCount);

					}

				}
			}
			model.addObject("empList", empList);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

	@RequestMapping(value = "/editEmp/{empId}", method = RequestMethod.GET)
	public ModelAndView editEmp(@PathVariable int empId, HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("masters/addEmployee");
		try {
			HttpSession session = request.getSession();
			LoginResponse login = (LoginResponse) session.getAttribute("UserDetail");
			System.out.println("user Id " + login.getEmployee().getEmpId());

			PhaseType[] phaseArray = rest.getForObject(Constants.url + "masters/getAllPhaseTypeList",
					PhaseType[].class);

			phaseTypeList = new ArrayList<PhaseType>(Arrays.asList(phaseArray));

			model.addObject("phaseTypeList", phaseTypeList);

			GetTech[] techArray = rest.getForObject(Constants.url + "/getAllTechPhaseList", GetTech[].class);

			techList = new ArrayList<GetTech>(Arrays.asList(techArray));

			model.addObject("techList", techList);

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("empId", empId);
			Employee editEmployee = rest.postForObject(Constants.url + "/masters/employeeByEmpId", map, Employee.class);
			model.addObject("editEmployee", editEmployee);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

	@RequestMapping(value = "/deleteEmp/{empId}", method = RequestMethod.GET)
	public String deleteEmp(@PathVariable int empId, HttpServletRequest request, HttpServletResponse response) {

		try {
			HttpSession session = request.getSession();
			LoginResponse login = (LoginResponse) session.getAttribute("UserDetail");
			System.out.println("user Id " + login.getEmployee().getEmpId());

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("empId", empId);
			Info info = rest.postForObject(Constants.url + "/masters/deleteEmployee", map, Info.class);

			System.out.println("info " + info);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/allEmployeeList";
	}

	@RequestMapping(value = "/formListForAssignTask", method = RequestMethod.GET)
	public ModelAndView formListForAssignTask(HttpServletRequest request, HttpServletResponse response) {

		Constants.mainAct = 2;
		Constants.subAct = 21;

		ModelAndView model = new ModelAndView("masters/formListForAssignTask");
		try

		{

			GetProjects[] projArray = rest.getForObject(Constants.url + "masters/getProjectList", GetProjects[].class);

			List<GetProjects> projList = new ArrayList<GetProjects>(Arrays.asList(projArray));

			model.addObject("projList", projList);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

	@RequestMapping(value = "/getFormListByProjectId", method = RequestMethod.GET)
	@ResponseBody
	public List<GetFormList> getFormListByProjectId(HttpServletRequest request, HttpServletResponse response) {

		List<GetFormList> getFormList = new ArrayList<GetFormList>();
		try {

			int projectId = Integer.parseInt(request.getParameter("projectId"));
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("projectId", projectId);
			GetFormList[] getForm = rest.postForObject(Constants.url + "masters/getFormListByProjectId", map,
					GetFormList[].class);

			getFormList = new ArrayList<GetFormList>(Arrays.asList(getForm));

		} catch (Exception e) {
			e.printStackTrace();
		}

		return getFormList;
	}

	@RequestMapping(value = "/assignTask/{formId}", method = RequestMethod.GET)
	public ModelAndView assignTask(@PathVariable int formId, HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("masters/assignTask");
		try {
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("formId", formId);
			GetTask[] task = rest.postForObject(Constants.url + "masters/taskByFormId", map, GetTask[].class);
			taskList = new ArrayList<GetTask>(Arrays.asList(task));
			model.addObject("taskList", taskList);

			TaskType[] taskTypeArray = rest.getForObject(Constants.url + "masters/getAllTaskTypeList",
					TaskType[].class);
			List<TaskType> taskTypeList = new ArrayList<TaskType>(Arrays.asList(taskTypeArray));
			model.addObject("taskTypeList", taskTypeList);

			Employee[] Employee = rest.getForObject(Constants.url + "/masters/getAllEmpList", Employee[].class);
			List<Employee> empList = new ArrayList<Employee>(Arrays.asList(Employee));

			model.addObject("empList", empList);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

	@RequestMapping(value = "/submitAssignTask", method = RequestMethod.POST)
	public String submitAssignTask(HttpServletRequest request, HttpServletResponse response) {

		try {
			HttpSession session = request.getSession();
			LoginResponse login = (LoginResponse) session.getAttribute("UserDetail");
			System.out.println("user Id " + login.getEmployee().getEmpId());

			String[] checkbox = request.getParameterValues("select_to_approve");

			for (int i = 0; i < taskList.size(); i++) {
				for (int j = 0; j < checkbox.length; j++) {
					if (Integer.parseInt(checkbox[j]) == taskList.get(i).getTaskId()) {
						taskList.get(i).setTaskDescription(request.getParameter("desc" + taskList.get(i).getTaskId()));
						taskList.get(i).setTaskSpRemarks(request.getParameter("remark" + taskList.get(i).getTaskId()));
						taskList.get(i)
								.setTaskPlannedHrs(request.getParameter("planHours" + taskList.get(i).getTaskId()));
						taskList.get(i).setDeveloperId(
								Integer.parseInt(request.getParameter("devlpr" + taskList.get(i).getTaskId())));
						String testerId = request.getParameter("tester" + taskList.get(i).getTaskId());
						if (testerId == "" || testerId == null)
							taskList.get(i).setTesterId(0);
						else
							taskList.get(i).setTesterId(Integer.parseInt(testerId));
						taskList.get(i).setDevStatus(1);
						taskList.get(i).setAssignedBy(login.getEmployee().getEmpId());
					}
				}
			}

			System.out.println("taskList " + taskList);

			List<Task> assign = rest.postForObject(Constants.url + "masters/saveTask", taskList, List.class);

			System.out.println("assign " + assign);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/assignTask/" + taskList.get(0).getFormId();
	}

	@RequestMapping(value = "/assignSpecialTask", method = RequestMethod.GET)
	public ModelAndView assignSpecialTask(HttpServletRequest request, HttpServletResponse response) {

		Constants.mainAct = 2;
		Constants.subAct = 22;

		ModelAndView model = new ModelAndView("masters/assignSpecialTask");
		try {

			GetProjects[] projArray = rest.getForObject(Constants.url + "masters/getProjectList", GetProjects[].class);

			List<GetProjects> projList = new ArrayList<GetProjects>(Arrays.asList(projArray));

			model.addObject("projList", projList);

			Employee[] Employee = rest.getForObject(Constants.url + "/masters/getAllEmpList", Employee[].class);
			List<Employee> empList = new ArrayList<Employee>(Arrays.asList(Employee));

			model.addObject("empList", empList);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

	@RequestMapping(value = "/viewAllSpecialTask", method = RequestMethod.GET)
	public ModelAndView viewAllSpecialTask(HttpServletRequest request, HttpServletResponse response) {

		Constants.mainAct = 2;
		Constants.subAct = 23;

		ModelAndView model = new ModelAndView("masters/viewAllSpecialTask");
		try {

			GetProjects[] projArray = rest.getForObject(Constants.url + "masters/getProjectList", GetProjects[].class);

			List<GetProjects> projList = new ArrayList<GetProjects>(Arrays.asList(projArray));

			model.addObject("projList", projList);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

	@RequestMapping(value = "/getSpecialTaskList", method = RequestMethod.GET)
	@ResponseBody
	public List<Task> getSpecialTaskList(HttpServletRequest request, HttpServletResponse response) {

		List<Task> getTaskList = new ArrayList<Task>();
		try {

			int projectId = Integer.parseInt(request.getParameter("projectId"));
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("projectId", projectId);
			Task[] getTask = rest.postForObject(Constants.url + "masters/getSpecialTaskList", map, Task[].class);

			getTaskList = new ArrayList<Task>(Arrays.asList(getTask));

		} catch (Exception e) {
			e.printStackTrace();
		}

		return getTaskList;
	}

	@RequestMapping(value = "/submitAssignSpecialTask", method = RequestMethod.POST)
	public String submitAssignSpecialTask(HttpServletRequest request, HttpServletResponse response) {

		try {
			HttpSession session = request.getSession();
			LoginResponse login = (LoginResponse) session.getAttribute("UserDetail");
			System.out.println("user Id " + login.getEmployee().getEmpId());

			String taskId = request.getParameter("taskId");
			int projectId = Integer.parseInt(request.getParameter("projectId"));
			String taskName = request.getParameter("taskName");
			String taskDisc = request.getParameter("taskDisc");
			String taskHours = request.getParameter("taskHours");
			int devlprId = Integer.parseInt(request.getParameter("devlprId"));
			List<Task> insertList = new ArrayList<Task>();

			Task insert = new Task();
			if (taskId == "" || taskId == null)
				insert.setTaskId(0);
			else
				insert.setTaskId(Integer.parseInt(taskId));
			insert.setProjectId(projectId);
			insert.setModuleId(1);
			insert.setFormId(1);
			insert.setTaskName(taskName);
			insert.setTaskDescription(taskDisc);
			insert.setTaskPlannedHrs(taskHours);
			insert.setDeveloperId(devlprId);
			insert.setTaskTypeId(10);
			insert.setAssignedBy(login.getEmployee().getEmpId());
			insert.setDevStatus(1);
			insertList.add(insert);

			List<Task> assign = rest.postForObject(Constants.url + "masters/saveTask", insertList, List.class);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/assignSpecialTask";
	}

	@RequestMapping(value = "/editSpecialTask/{taskId}", method = RequestMethod.GET)
	public ModelAndView editSpecialTask(@PathVariable int taskId, HttpServletRequest request,
			HttpServletResponse response) {

		ModelAndView model = new ModelAndView("masters/assignSpecialTask");
		try {

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("taskId", taskId);

			Task task = rest.postForObject(Constants.url + "masters/getTaskById", map, Task.class);
			model.addObject("task", task);

			GetProjects[] projArray = rest.getForObject(Constants.url + "masters/getProjectList", GetProjects[].class);

			List<GetProjects> projList = new ArrayList<GetProjects>(Arrays.asList(projArray));

			model.addObject("projList", projList);

			Employee[] Employee = rest.getForObject(Constants.url + "/masters/getAllEmpList", Employee[].class);
			List<Employee> empList = new ArrayList<Employee>(Arrays.asList(Employee));

			model.addObject("empList", empList);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

	@RequestMapping(value = "/insertSupportTask", method = RequestMethod.GET)
	public ModelAndView insertSupportTask(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("masters/insertSupportTask");
		try {
			HttpSession session = request.getSession();
			LoginResponse login = (LoginResponse) session.getAttribute("UserDetail");

			System.out.println("user Id " + login.getEmployee().getEmpId());

			GetProjects[] projArray = rest.getForObject(Constants.url + "masters/getProjectList", GetProjects[].class);
			List<GetProjects> projList = new ArrayList<GetProjects>(Arrays.asList(projArray));
			model.addObject("projList", projList);

			List<Employee> empList;
			Employee[] empArray = rest.getForObject(Constants.url + "masters/getAllEmpList", Employee[].class);

			empList = new ArrayList<Employee>(Arrays.asList(empArray));
			model.addObject("empList", empList);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

	@RequestMapping(value = "/submitSupportTask", method = RequestMethod.POST)
	public String submitSupportTask(HttpServletRequest request, HttpServletResponse response) {

		try {
			HttpSession session = request.getSession();
			LoginResponse login = (LoginResponse) session.getAttribute("UserDetail");
			System.out.println("user Id " + login.getEmployee().getEmpId());

			int projectId = Integer.parseInt(request.getParameter("projectId"));
			String suppId = request.getParameter("suppId");
			String workDate = request.getParameter("workDate");
			String taskHours = request.getParameter("taskHours");
			String disc = request.getParameter("disc");
			String takeAway = request.getParameter("takeAway");
			String moduleId = request.getParameter("moduleId");
			int empId = Integer.parseInt(request.getParameter("empId"));

			Date date = new Date();
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");

			SupportTask supportTask = new SupportTask();
			if (suppId.equalsIgnoreCase("") || suppId.equalsIgnoreCase(null))
				supportTask.setSuppId(0);
			else
				supportTask.setSuppId(Integer.parseInt(suppId));
			supportTask.setProjectId(projectId);
			supportTask.setEmpId(empId);
			supportTask.setWorkDate(DateConvertor.convertToYMD(workDate));
			supportTask.setDescription(disc);
			supportTask.setRequiredHrs(taskHours);
			supportTask.setTakeAway(takeAway);
			supportTask.setModuleName(moduleId);
			supportTask.setDate(sf.format(date));

			SupportTask res = rest.postForObject(Constants.url + "/masters/saveSupportTask", supportTask,
					SupportTask.class);

			System.out.println("res " + res);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/insertSupportTask";
	}

	@RequestMapping(value = "/viewSupportTaskByEmpId", method = RequestMethod.GET)
	@ResponseBody
	public List<GetSupportTask> viewSupportTaskByEmpId(HttpServletRequest request, HttpServletResponse response) {

		List<GetSupportTask> viewSupportTaskByEmpId = new ArrayList<>();
		try {
			HttpSession session = request.getSession();
			LoginResponse login = (LoginResponse) session.getAttribute("UserDetail");

			String fromDate = request.getParameter("fromDate");
			String ymdFromDate = DateConvertor.convertToYMD(fromDate);
			String toDate = request.getParameter("toDate");
			String ymdToDate = DateConvertor.convertToYMD(toDate);

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map.add("empId", login.getEmployee().getEmpId());
			map.add("fromDate", ymdFromDate);
			map.add("toDate", ymdToDate);

			GetSupportTask[] supportTask = rest.postForObject(Constants.url + "/masters/getSupportTaskByEmpId", map,
					GetSupportTask[].class);

			viewSupportTaskByEmpId = new ArrayList<GetSupportTask>(Arrays.asList(supportTask));

			for (int i = 0; i < viewSupportTaskByEmpId.size(); i++)

			{
				String date = viewSupportTaskByEmpId.get(i).getWorkDate();
				viewSupportTaskByEmpId.get(i).setWorkDate(DateConvertor.convertToDMY(date));
			}
			System.err.println(viewSupportTaskByEmpId.toString());

		} catch (Exception e) {
			e.printStackTrace();
		}

		return viewSupportTaskByEmpId;
	}

	@RequestMapping(value = "/editSupport/{suppId}", method = RequestMethod.GET)
	public ModelAndView editSupport(@PathVariable int suppId, HttpServletRequest request,
			HttpServletResponse response) {

		ModelAndView model = new ModelAndView("masters/insertSupportTask");
		try {
			HttpSession session = request.getSession();
			LoginResponse login = (LoginResponse) session.getAttribute("UserDetail");
			System.out.println("user Id " + login.getEmployee().getEmpId());

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("suppId", suppId);
			GetSupportTask editSupport = rest.postForObject(Constants.url + "/masters/getSupportTaskBySuppId", map,
					GetSupportTask.class);
			model.addObject("editSupport", editSupport);
			String date = DateConvertor.convertToDMY(editSupport.getWorkDate());
			model.addObject("date", date);

			GetProjects[] projArray = rest.getForObject(Constants.url + "masters/getProjectList", GetProjects[].class);
			List<GetProjects> projList = new ArrayList<GetProjects>(Arrays.asList(projArray));
			model.addObject("projList", projList);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

	@RequestMapping(value = "/getModuleByProjectId", method = RequestMethod.GET)
	public @ResponseBody List<Module> getModuleByProjectId(HttpServletRequest request, HttpServletResponse response) {
		try {
			System.out.println("in method");

			String projectId = request.getParameter("projectId");
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("projectId", projectId);

			Module[] moduleListArray = rest.postForObject(Constants.url + "masters/moduleByProjectId", map,
					Module[].class);

			moduleList = new ArrayList<Module>(Arrays.asList(moduleListArray));

			System.out.println("getCmplxHrsList" + moduleListArray.toString());

		} catch (Exception e) {
			e.printStackTrace();
		}

		return moduleList;
	}

}
