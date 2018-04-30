package com.ats.adminpanel;

import java.io.IOException;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.ats.adminpanel.common.Constants;
import com.ats.adminpanel.common.DateConvertor;
import com.ats.adminpanel.model.GetTask;
import com.ats.adminpanel.model.GetTaskList;
import com.ats.adminpanel.model.LoginResponse;
import com.ats.adminpanel.model.Task;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	RestTemplate rest = new RestTemplate();

	List<GetTask> assignedTask = new ArrayList<GetTask>();
	List<GetTask> inprogress = new ArrayList<GetTask>();
	List<GetTask> completed = new ArrayList<GetTask>();
	GetTaskList assignedTaskDetails = new GetTaskList();
	GetTaskList inprogressTaskDetails = new GetTaskList();
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "login";
	}

	@RequestMapping("/loginProcess")
	public ModelAndView helloWorld(HttpServletRequest request, HttpServletResponse res) throws IOException {

		String name = request.getParameter("username");
		String password = request.getParameter("userpassword");

		ModelAndView mav = new ModelAndView("login");

		res.setContentType("text/html");
		try {
			System.out.println("Login Process " + name);
			System.out.println("password " + password);

			if (name.equalsIgnoreCase("") || password.equalsIgnoreCase("") || name == null || password == null) {

				mav = new ModelAndView("login");
			} else {

				String pass = "1234";
				RestTemplate rest = new RestTemplate();
				MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
				map.add("empMobile", name);
				map.add("empPwd", password);
				LoginResponse loginResponse = rest.postForObject(Constants.url + "/masters/login", map,
						LoginResponse.class);
				System.out.println("loginResponse" + loginResponse);

				if (loginResponse.isError() == false) {
					mav = new ModelAndView("home");
					HttpSession session = request.getSession();
					session.setAttribute("employee", loginResponse.getEmployee());
					session.setAttribute("UserDetail", loginResponse);

				} else {

					mav = new ModelAndView("login");
					System.out.println("Invalid login credentials");

				}

			}
		} catch (Exception e) {
			System.out.println("HomeController Login API Excep:  " + e.getMessage());
			e.printStackTrace();
		}

		return mav;

	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		System.out.println("User Logout");

		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping(value = "/homePage", method = RequestMethod.GET)
	public ModelAndView viewBill(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("project/homePage");
		List<GetTask> getTaskList = new ArrayList<GetTask>();
		try {

			// int developerId = Integer.parseInt(request.getParameter("developerId"));
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("developerId", "1");
			GetTask[] taskList = rest.postForObject(Constants.url + "masters/allTaskByDeveloperId", map,
					GetTask[].class);

			getTaskList = new ArrayList<GetTask>(Arrays.asList(taskList));

			System.out.println("task list size " + getTaskList.size());
			assignedTask.clear();
			inprogress.clear();
			completed.clear();

			// System.out.println("getTaskList ----"+getTaskList);

			for (int i = 0; i < getTaskList.size(); i++) {
				if (getTaskList.get(i).getDevStatus() == 1) {

					assignedTask.add(getTaskList.get(i));

					System.out.println("Assigned Task ----" + assignedTask.add(getTaskList.get(i)));
				} else if (getTaskList.get(i).getDevStatus() == 2) {

					inprogress.add(getTaskList.get(i));
				} else if (getTaskList.get(i).getDevStatus() == 3) {

					completed.add(getTaskList.get(i));
				}

			}
			model.addObject("assignedCount", assignedTask.size());
			model.addObject("inprogressCount", inprogress.size());
			model.addObject("completedCount", completed.size());

		} catch (Exception e) {
			e.printStackTrace();
		}
		return model;

	}

	@RequestMapping(value = "/showAssignedTask", method = RequestMethod.GET)
	public ModelAndView assignedTask(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("project/assignedTaskList");

		model.addObject("assignedTask", assignedTask);
		return model;

	}
	
	@RequestMapping(value = "/startAssignTask/{taskId}", method = RequestMethod.GET)
	public String startAssignTask(@PathVariable int taskId) {

		 

		Date date = new Date();

		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

		DateFormat dateTimeFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String strDate = dateFormat.format(date);
		String strDateTime = dateTimeFormat.format(date);
		System.out.println(" str date " + strDate);

		System.out.println(" str date time " + strDateTime);
		 
		
		RestTemplate restTemplate = new RestTemplate();
	 

		assignedTaskDetails.setStartDate(strDate);
		assignedTaskDetails.setStartDatetime(strDateTime);
		assignedTaskDetails.setDevStatus(2);
		List<GetTaskList> update = new ArrayList<GetTaskList>();
		update.add(assignedTaskDetails);
		System.out.println("update" + update);
		
		List<Task> res = restTemplate.postForObject(Constants.url + "/masters/saveTask", update,
				List.class);
		
		System.out.println("res " + res);
		
		

		return "redirect:/homePage";

	}

	@RequestMapping(value = "/assignedTaskDetails/{taskId}", method = RequestMethod.GET)
	public ModelAndView assignedTaskDetails(@PathVariable int taskId) {
		ModelAndView model = new ModelAndView("project/assignedTaskDetails");
		RestTemplate restTemplate = new RestTemplate();
		MultiValueMap<String, Object> vars = new LinkedMultiValueMap<String, Object>();

		vars.add("taskId", taskId);

		  assignedTaskDetails = restTemplate.postForObject(Constants.url + "/masters/getTaskDetailsByTaskId", vars,
				GetTaskList.class);
		// masters/getTaskDetailsByTaskId
		model.addObject("taskList", assignedTaskDetails);
		return model;
	}

	/*
	 * @RequestMapping(value = "/showTaskDeatils", method = RequestMethod.GET)
	 * public ModelAndView showtaskDeatils(HttpServletRequest request,
	 * HttpServletResponse response) {
	 * 
	 * ModelAndView model = new ModelAndView("project/taskDetails"); return model;
	 * 
	 * }
	 */

	@RequestMapping(value = "/showInprogessPage", method = RequestMethod.GET)
	public ModelAndView showInprogessPage(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("project/inprogressList");

		model.addObject("inprogress", inprogress);
		return model;

	}

	@RequestMapping(value = "/inprogressTaskDetails/{taskId}", method = RequestMethod.GET)
	public ModelAndView inprogressTaskDetails(@PathVariable int taskId) {
		ModelAndView model = new ModelAndView("project/inprogressTaskDetails");

		RestTemplate restTemplate = new RestTemplate();
		MultiValueMap<String, Object> vars = new LinkedMultiValueMap<String, Object>();

		vars.add("taskId", taskId);

		  inprogressTaskDetails = restTemplate.postForObject(Constants.url + "/masters/getTaskDetailsByTaskId", vars,
				GetTaskList.class);
		// masters/getTaskDetailsByTaskId
		model.addObject("taskList", inprogressTaskDetails);
		return model;
	}
	
	@RequestMapping(value = "/updateTaskDevlopment", method = RequestMethod.POST)
	public String updateTaskDevlopment(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			String devPer = request.getParameter("dstatus");
			String remark = request.getParameter("remark");
			
			Date date = new Date();

			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

			DateFormat dateTimeFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			String endDate = dateFormat.format(date);
			String endDateTime = dateTimeFormat.format(date);
			System.out.println(" endDate " + endDate);

			System.out.println(" endDateTime " + endDateTime);
			 
			
			RestTemplate restTemplate = new RestTemplate();
			
			inprogressTaskDetails.setStartDate(DateConvertor.convertToYMD(inprogressTaskDetails.getStartDate()));
			
		 if(devPer.equals("100"))
		 {
			 inprogressTaskDetails.setDevStatus(3); 
			 inprogressTaskDetails.setEndDate(endDate);
			 inprogressTaskDetails.setEndDatetime(endDateTime); 
			 inprogressTaskDetails.setDevComplPer(devPer);
			 inprogressTaskDetails.setRemarksByDev(remark);
		 }
		 else
		 {
			 inprogressTaskDetails.setDevComplPer(devPer);
			 inprogressTaskDetails.setRemarksByDev(remark);
		 }
			List<GetTaskList> update = new ArrayList<GetTaskList>();
			update.add(inprogressTaskDetails);
			System.out.println("update" + update);
			
			List<Task> res = restTemplate.postForObject(Constants.url + "/masters/saveTask", update,
					List.class);
			
			System.out.println("res " + res);
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		 
		return "redirect:/homePage";

	}
	
	
	@RequestMapping(value = "/showForwardPage", method = RequestMethod.GET)
	public ModelAndView showForwardPage(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("project/forwardList");

		model.addObject("inprogress", inprogress);
		return model;

	}



	@RequestMapping(value = "/forwardTaskDetails/{taskId}", method = RequestMethod.GET)
	public ModelAndView forwardTaskDetails(@PathVariable int taskId) {
		ModelAndView model = new ModelAndView("project/inprogressTaskDetails");

		RestTemplate restTemplate = new RestTemplate();
		MultiValueMap<String, Object> vars = new LinkedMultiValueMap<String, Object>();

		vars.add("taskId", taskId);

		GetTaskList taskList = restTemplate.postForObject(Constants.url + "/masters/getTaskDetailsByTaskId", vars,
				GetTaskList.class);
		// masters/getTaskDetailsByTaskId
		model.addObject("taskList", taskList);
		return model;
	}

	@RequestMapping(value = "/showCompletedPage", method = RequestMethod.GET)
	public ModelAndView showCompletedPage(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("project/completed");

		model.addObject("completed", completed);
		return model;

	}

}
