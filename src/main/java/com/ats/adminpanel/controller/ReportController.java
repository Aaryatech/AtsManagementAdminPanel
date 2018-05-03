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
import com.ats.adminpanel.model.ProjectPhaseTracking;

@Controller
public class ReportController {

	EmpConReport empConReport = new EmpConReport();
	EmpAllocatedWork empAllocatedWork = new EmpAllocatedWork();
	EmpPerformance empPerformance = new EmpPerformance();
	List<DevelopmentHrsProwise> developmentHrsProwiseList =null;

	List<ProjectPhaseTracking> projectPhaseTrackingList ;

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

			String empId = request.getParameter("empId");
			System.out.println("EmpID" + empId);

			String fromDate = request.getParameter("fromDate");
			System.out.println("fromDate" + fromDate);

			String toDate = request.getParameter("toDate");
			System.out.println("toDate" + toDate);

			String proId = request.getParameter("proId");
			System.out.println("ProjectID" + proId);

			RestTemplate restTemplate = new RestTemplate();

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

			map.add("fromDate", DateConvertor.convertToYMD(fromDate));
			map.add("toDate", DateConvertor.convertToYMD(toDate));
			map.add("empId", empId);

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
			System.out.println("in method");

			String fromDate = null;
			String toDate = null;
			String proId = null;

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

				proId = request.getParameter("proId");
				System.out.println("ProjectID" + proId);
			} catch (Exception e) {
				// TODO: handle exception
			}

			RestTemplate restTemplate = new RestTemplate();
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

			if (proId == null) {
				map.add("fromDate", DateConvertor.convertToYMD(fromDate));
				map.add("toDate", DateConvertor.convertToYMD(toDate));
				map.add("empId", empId);

				empAllocatedWork = restTemplate.postForObject(Constants.url + "/getDatewiseEmpCon", map,
						EmpAllocatedWork.class);

				System.out.println("EmpConReport []" + empAllocatedWork.toString());
			} else {

				// datewise webapi

				map.add("empId", empId);
				map.add("projectId", proId);

				empAllocatedWork = restTemplate.postForObject(Constants.url + "Test/getEmployeeAllocatedWorkById", map,
						EmpAllocatedWork.class);

				System.out.println("EmpConReportById []" + empAllocatedWork.toString());

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return empAllocatedWork;
	}

	@RequestMapping(value = "/findEmpPerformance", method = RequestMethod.GET)
	public @ResponseBody EmpPerformance findEmpPerformance(HttpServletRequest request, HttpServletResponse response) {
		try {
			System.out.println("in method");

			String empId = request.getParameter("empId");
			System.out.println("EmpID" + empId);

			String projectId = request.getParameter("projectId");
			System.out.println("ProjectID" + projectId);

			RestTemplate restTemplate = new RestTemplate();

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

			map.add("empId", empId);
			map.add("projectId", projectId);

			empPerformance = restTemplate.postForObject(Constants.url + "/getEmployeePerformance", map,
					EmpPerformance.class);

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

}
