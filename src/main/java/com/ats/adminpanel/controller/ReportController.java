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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.ats.adminpanel.common.Constants;
import com.ats.adminpanel.common.DateConvertor;
import com.ats.adminpanel.model.DevelopmentHrsProwise;
import com.ats.adminpanel.model.EmpAllocatedWork;
import com.ats.adminpanel.model.EmpConReport;
import com.ats.adminpanel.model.EmpPerformance;
import com.ats.adminpanel.model.Employee;
import com.ats.adminpanel.model.GetTaskList;
import com.ats.adminpanel.model.PhaseTask;
import com.ats.adminpanel.model.PhaseType;
import com.ats.adminpanel.model.Project;
import com.ats.adminpanel.model.ProjectHours;
import com.ats.adminpanel.model.ProjectPhaseTracking;
import com.ats.adminpanel.model.RemainingTaskGraph;

@Controller
public class ReportController {

	EmpConReport empConReport = new EmpConReport();
	RestTemplate rest = new RestTemplate();
	EmpAllocatedWork empAllocatedWork = new EmpAllocatedWork();
	List<EmpPerformance> empPerformance = new ArrayList<EmpPerformance>();
	List<DevelopmentHrsProwise> developmentHrsProwiseList = null;

	List<ProjectPhaseTracking> projectPhaseTrackingList;

	@RequestMapping(value = "/viewEmpConsumptionReport", method = RequestMethod.GET)
	public ModelAndView viewEmpConsumptionReport(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("reports/empConsumption");

		RestTemplate restTemplate = new RestTemplate();
		Employee[] Employee = restTemplate.getForObject(Constants.url + "/masters/getAllEmpList", Employee[].class);
		List<Employee> empList = new ArrayList<Employee>(Arrays.asList(Employee));

		Project[] project = restTemplate.getForObject(Constants.url + "/masters/getAllProjectList", Project[].class);
		List<Project> projectList = new ArrayList<Project>(Arrays.asList(project));

		model.addObject("projectList", projectList);
		model.addObject("empList", empList);
		return model;

	}

	@RequestMapping(value = "/viewEmpAllocatedWorkReport", method = RequestMethod.GET)
	public ModelAndView viewEmpAllocatedWorkReport(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("reports/empAllocatedWork");

		RestTemplate restTemplate = new RestTemplate();
		Employee[] Employee = restTemplate.getForObject(Constants.url + "/masters/getAllEmpList", Employee[].class);
		List<Employee> empList = new ArrayList<Employee>(Arrays.asList(Employee));

		Project[] project = restTemplate.getForObject(Constants.url + "/masters/getAllProjectList", Project[].class);
		List<Project> projectList = new ArrayList<Project>(Arrays.asList(project));

		model.addObject("projectList", projectList);
		model.addObject("empList", empList);
		return model;

	}

	@RequestMapping(value = "/viewEmpPerformanceReport", method = RequestMethod.GET)
	public ModelAndView viewEmpPerformanceReport(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("reports/empPerformance");

		RestTemplate restTemplate = new RestTemplate();
		Employee[] Employee = restTemplate.getForObject(Constants.url + "/masters/getAllEmpList", Employee[].class);
		List<Employee> empList = new ArrayList<Employee>(Arrays.asList(Employee));

		Project[] project = restTemplate.getForObject(Constants.url + "/masters/getAllProjectList", Project[].class);
		List<Project> projectList = new ArrayList<Project>(Arrays.asList(project));

		model.addObject("projectList", projectList);
		model.addObject("empList", empList);
		return model;

	}

	@RequestMapping(value = "/viewDevelopmentHrsReport", method = RequestMethod.GET)
	public ModelAndView viewDevelopmentHrsReport(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("reports/devHrsProjectwise");

		RestTemplate restTemplate = new RestTemplate();

		Project[] project = restTemplate.getForObject(Constants.url + "/masters/getAllProjectList", Project[].class);
		List<Project> projectList = new ArrayList<Project>(Arrays.asList(project));

		model.addObject("projectList", projectList);

		return model;

	}

	@RequestMapping(value = "/viewProjectPhaseTrackingReport", method = RequestMethod.GET)
	public ModelAndView viewProjectPhaseTrackingReport(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("reports/projectPhaseTracking");
		try {
			RestTemplate restTemplate = new RestTemplate();
			PhaseType[] PhaseType = restTemplate.getForObject(Constants.url + "/masters/getAllPhaseTypeList",
					PhaseType[].class);
			List<PhaseType> phaseList = new ArrayList<PhaseType>(Arrays.asList(PhaseType));

			Project[] project = restTemplate.getForObject(Constants.url + "/masters/getAllProjectList",
					Project[].class);
			List<Project> projectList = new ArrayList<Project>(Arrays.asList(project));

			model.addObject("projectList", projectList);
			model.addObject("phaseList", phaseList);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;

	}

	@RequestMapping(value = "/findEmpConsumption", method = RequestMethod.GET)
	public @ResponseBody EmpConReport findEmpConsumption(HttpServletRequest request, HttpServletResponse response) {
		try {
			System.out.println("in method");
			empConReport = new EmpConReport();
			String empId = request.getParameter("empId");
			System.out.println("EmpID" + empId);

			String fromDate = request.getParameter("fromDate");
			System.out.println("fromDate" + fromDate);

			String toDate = request.getParameter("toDate");
			System.out.println("toDate" + toDate);

			int proId = Integer.parseInt(request.getParameter("proId"));
			System.out.println("ProjectID" + proId);

			RestTemplate restTemplate = new RestTemplate();

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

			if (proId != 0) {
				System.out.println("in if ");
				map.add("fromDate", fromDate);
				map.add("toDate", toDate);
				map.add("empId", empId);
				map.add("projectId", proId);
			} else {
				System.out.println("else");
				map.add("fromDate", DateConvertor.convertToYMD(fromDate));
				map.add("toDate", DateConvertor.convertToYMD(toDate));
				map.add("empId", empId);
				map.add("projectId", proId);
			}

			empConReport = restTemplate.postForObject(Constants.url + "/getDatewiseEmpCon", map, EmpConReport.class);

			System.out.println("EmpConReport []" + empConReport.toString());

		} catch (Exception e) {
			e.printStackTrace();
		}

		return empConReport;
	}

	@RequestMapping(value = "/findEmpAllocatedWork", method = RequestMethod.GET)
	public @ResponseBody EmpAllocatedWork findEmpAllocatedWork(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			empAllocatedWork = new EmpAllocatedWork();
			System.out.println("in method");

			String fromDate = null;
			String toDate = null;
			String projectId = null;

			String empId = request.getParameter("empId");
			System.out.println("EmpID" + empId);

			try {
				fromDate = request.getParameter("fromDate");
				System.out.println("fromDate" + fromDate);

				toDate = request.getParameter("toDate");
				System.out.println("toDate" + toDate);

			} catch (Exception e) {
				// TODO: handle exception
			}
			try {

				projectId = request.getParameter("projectId");
				System.out.println("ProjectID" + projectId);
			} catch (Exception e) {
				// TODO: handle exception
			}

			RestTemplate restTemplate = new RestTemplate();
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

			if (projectId == null) {
				map.add("fromDate", DateConvertor.convertToYMD(fromDate));
				map.add("toDate", DateConvertor.convertToYMD(toDate));
				map.add("empId", empId);

				empAllocatedWork = restTemplate.postForObject(Constants.url + "/getEmployeeAllocatedWork", map,
						EmpAllocatedWork.class);

				System.out.println("EmpConReport []" + empAllocatedWork.toString());
			} else {

				// datewise webapi

				map.add("empId", empId);
				map.add("projectId", projectId);

				empAllocatedWork = restTemplate.postForObject(Constants.url + "/getEmployeeAllocatedWorkById", map,
						EmpAllocatedWork.class);
				System.out.println("EmpConReportById []" + empAllocatedWork.toString());
			}
		} catch (Exception e) {
			e.printStackTrace();
			empAllocatedWork = new EmpAllocatedWork();
		}

		return empAllocatedWork;
	}

	@RequestMapping(value = "/findEmpPerformance", method = RequestMethod.GET)
	public @ResponseBody List<EmpPerformance> findEmpPerformance(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			System.out.println("in method");

			String empId = request.getParameter("empId");
			System.out.println("EmpID" + empId);
			empPerformance = new ArrayList<EmpPerformance>();
			String projectId = request.getParameter("projectId");
			System.out.println("ProjectID" + projectId);

			RestTemplate restTemplate = new RestTemplate();

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

			map.add("empId", empId);
			map.add("projectId", projectId);

			empPerformance = restTemplate.postForObject(Constants.url + "/getEmployeePerformance", map, List.class);

			System.out.println("empPerformance []" + empPerformance.toString());

		} catch (Exception e) {
			e.printStackTrace();
		}

		return empPerformance;
	}

	@RequestMapping(value = "/findDevHrsByProId", method = RequestMethod.GET)
	public @ResponseBody List<DevelopmentHrsProwise> findDevHrsByProId(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			System.out.println("in method");

			String projectId = request.getParameter("projectId");
			System.out.println("ProjectID" + projectId);

			RestTemplate restTemplate = new RestTemplate();

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

			map.add("projectId", projectId);

			developmentHrsProwiseList = restTemplate.postForObject(Constants.url + "/getDevelopmentHrsByProwise", map,
					List.class);

			System.out.println("DevelopmentHrsProwise []" + developmentHrsProwiseList.toString());

		} catch (Exception e) {
			e.printStackTrace();
		}

		return developmentHrsProwiseList;
	}

	@RequestMapping(value = "/findProjectPhaseTracking", method = RequestMethod.GET)
	public @ResponseBody List<ProjectPhaseTracking> findProjectPhaseTracking(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			System.out.println("in method");

			String phaseId = request.getParameter("phaseId");
			System.out.println("phaseId" + phaseId);

			String projectId = request.getParameter("projectId");
			System.out.println("ProjectID" + projectId);

			RestTemplate restTemplate = new RestTemplate();

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

			map.add("phaseId", phaseId);
			map.add("projectId", projectId);

			projectPhaseTrackingList = restTemplate.postForObject(Constants.url + "/getProjectPhaseTracking", map,
					List.class);

			System.out.println("projectPhaseTrackingList []" + projectPhaseTrackingList.toString());

		} catch (Exception e) {
			e.printStackTrace();
		}

		return projectPhaseTrackingList;
	}

	@RequestMapping(value = "/getInfoForEmployeeGraph", method = RequestMethod.GET)
	public @ResponseBody List<RemainingTaskGraph> getInfoForEmployeeGraph(HttpServletRequest request,
			HttpServletResponse response) {

		ModelAndView model = new ModelAndView("project/showEmployeeGraph");
		List<RemainingTaskGraph> remainingTaskGraphlist = null;
		try {

			RemainingTaskGraph[] res = rest.getForObject(Constants.url + "/getEmpRemainingHours",
					RemainingTaskGraph[].class);

			remainingTaskGraphlist = new ArrayList<RemainingTaskGraph>(Arrays.asList(res));
			model.addObject("enqInfo", remainingTaskGraphlist);

			System.out.println("res" + remainingTaskGraphlist.toString());

		} catch (Exception e) {
			e.printStackTrace();
		}

		return remainingTaskGraphlist;
	}

	@RequestMapping(value = "/getProjectHoursGraph", method = RequestMethod.GET)
	public @ResponseBody List<ProjectHours> getProjectHoursGraph(HttpServletRequest request,
			HttpServletResponse response) {

		ModelAndView model = new ModelAndView("project/showProjectsGraph");
		List<ProjectHours> projectHoursGraphlist = null;
		try {

			ProjectHours[] res = rest.getForObject(Constants.url + "/getProjectHours", ProjectHours[].class);

			projectHoursGraphlist = new ArrayList<ProjectHours>(Arrays.asList(res));
			model.addObject("enqInfo", projectHoursGraphlist);

			System.out.println("res" + projectHoursGraphlist.toString());

		} catch (Exception e) {
			e.printStackTrace();
		}

		return projectHoursGraphlist;
	}

}
