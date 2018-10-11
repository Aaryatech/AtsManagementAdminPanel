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
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.ats.adminpanel.common.Constants;
import com.ats.adminpanel.model.Employee;
import com.ats.adminpanel.model.LoginResponse;
import com.ats.adminpanel.model.leave.ApplyLeave;
import com.ats.adminpanel.model.leave.GetApplyLeave;
import com.ats.adminpanel.model.leave.GetShortLeave;
import com.ats.adminpanel.model.leave.ShortLeave;

@Controller
@Scope("session")
public class LeaveController {
	RestTemplate restTemplate = new RestTemplate();
	MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
	List<Employee> empList;
	List<GetApplyLeave> leaveList;

	List<GetShortLeave> shortLeaveList;

	@RequestMapping(value = "/showAddLeave", method = RequestMethod.GET)
	public ModelAndView showAddLeave(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("masters/addLeave");
		try {
			HttpSession session = request.getSession();
			LoginResponse login = (LoginResponse) session.getAttribute("UserDetail");

			System.out.println("user Id " + login.getEmployee().getEmpId());

			model.addObject("login", login.getEmployee());

			Employee[] empArray = restTemplate.getForObject(Constants.url + "masters/getAllEmpListByType",
					Employee[].class);

			empList = new ArrayList<Employee>(Arrays.asList(empArray));
			model.addObject("empList", empList);

			map.add("empId", login.getEmployee().getEmpId());

			GetApplyLeave[] leaveArray = restTemplate.postForObject(Constants.url + "/getAllLeaveListByEmpId", map,
					GetApplyLeave[].class);

			leaveList = new ArrayList<GetApplyLeave>(Arrays.asList(leaveArray));
			model.addObject("leaveList", leaveList);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

	@RequestMapping(value = "/insertLeave", method = RequestMethod.POST)
	public String insertLeave(HttpServletRequest request, HttpServletResponse response) {

		// ModelAndView model = new ModelAndView("masters/addLeave");

		try {

			HttpSession session = request.getSession();
			LoginResponse login = (LoginResponse) session.getAttribute("UserDetail");
			System.out.println("user Id " + login.getEmployee().getEmpId());
			Date now = new Date();

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String leaveId = request.getParameter("leaveId");
			int sendTo = Integer.parseInt(request.getParameter("sendTo"));
			String fromDate = request.getParameter("fromDate");
			String toDate = request.getParameter("toDate");
			float totalNoOfDays = Float.parseFloat(request.getParameter("totalNoOfDays"));

			String empRemark = request.getParameter("empRemark");
			int payLeave = Integer.parseInt(request.getParameter("payLeave"));

			int type = Integer.parseInt(request.getParameter("type"));

			ApplyLeave leave = new ApplyLeave();

			if (leaveId == "" || leaveId == null)
				leave.setLeaveId(0);
			else
				leave.setLeaveId(Integer.parseInt(leaveId));

			leave.setDate(sdf.format(now));

			leave.setIsUsed(1);
			leave.setApproveRemark(null);
			leave.setEmpRemark(empRemark);
			leave.setFromDate(fromDate);
			leave.setToDate(toDate);
			leave.setPayLeave(payLeave);
			leave.setStatus(0);
			leave.setEmpId(login.getEmployee().getEmpId());
			leave.setSendTo(sendTo);
			leave.setType(type);
			leave.setNoOfDays(totalNoOfDays);

			ApplyLeave info = restTemplate.postForObject(Constants.url + "/saveLeave", leave, ApplyLeave.class);

			System.err.println("Project Insert Response " + info.toString());
		} catch (Exception e) {
			System.err.println("Exc in Proj Insert " + e.getMessage());
			e.printStackTrace();

		}

		return "redirect:/showAddLeave";
	}

	@RequestMapping(value = "/showApproveLeave", method = RequestMethod.GET)
	public ModelAndView showApproveLeave(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("masters/approveLeave");
		try {
			HttpSession session = request.getSession();
			LoginResponse login = (LoginResponse) session.getAttribute("UserDetail");

			System.out.println("user Id " + login.getEmployee().getEmpId());

			Employee[] empArray = restTemplate.getForObject(Constants.url + "masters/getAllEmpListByType",
					Employee[].class);

			empList = new ArrayList<Employee>(Arrays.asList(empArray));
			model.addObject("empList", empList);

			map.add("empId", login.getEmployee().getEmpId());

			GetApplyLeave[] leaveArray = restTemplate.postForObject(Constants.url + "/getAllLeaveListBySendTo", map,
					GetApplyLeave[].class);

			leaveList = new ArrayList<GetApplyLeave>(Arrays.asList(leaveArray));
			model.addObject("leaveList", leaveList);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

	@RequestMapping(value = "/leaveDetails/{leaveId}", method = RequestMethod.GET)
	public ModelAndView editEmp(@PathVariable int leaveId, HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("masters/detailApprove");
		try {

			map.add("leaveId", leaveId);
			GetApplyLeave leaveDetail = restTemplate.postForObject(Constants.url + "/getLeaveByLeaveId", map,
					GetApplyLeave.class);
			model.addObject("leaveDetail", leaveDetail);
			System.out.println("leaveDetail" + leaveDetail.toString());

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

	@RequestMapping(value = "/approveLeave", method = RequestMethod.POST)
	public String approveLeave(HttpServletRequest request, HttpServletResponse response) {

		// ModelAndView model = new ModelAndView("masters/addLeave");

		try {

			HttpSession session = request.getSession();
			LoginResponse login = (LoginResponse) session.getAttribute("UserDetail");
			System.out.println("user Id " + login.getEmployee().getEmpId());
			Date now = new Date();

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String leaveId = request.getParameter("leaveId");

			String empId = request.getParameter("empId");
			/*
			 * int sendTo = Integer.parseInt(request.getParameter("sendTo"));
			 */ String fromDate = request.getParameter("fromDate");
			String toDate = request.getParameter("toDate");
			float totalNoOfDays = Float.parseFloat(request.getParameter("totalNoOfDays"));

			String empRemark = request.getParameter("empRemark");
			String appRemark = request.getParameter("appRemark");
			int payLeave = Integer.parseInt(request.getParameter("payLeave"));
			int status = Integer.parseInt(request.getParameter("status"));

			int type = Integer.parseInt(request.getParameter("type"));

			ApplyLeave leave = new ApplyLeave();

			if (leaveId == "" || leaveId == null)
				leave.setLeaveId(0);
			else
				leave.setLeaveId(Integer.parseInt(leaveId));

			leave.setDate(sdf.format(now));

			leave.setIsUsed(1);
			leave.setApproveRemark(appRemark);
			leave.setEmpRemark(empRemark);
			leave.setFromDate(fromDate);
			leave.setToDate(toDate);
			leave.setPayLeave(payLeave);
			leave.setStatus(status);
			leave.setEmpId(Integer.parseInt(empId));
			leave.setSendTo(login.getEmployee().getEmpId());
			leave.setType(type);
			leave.setNoOfDays(totalNoOfDays);

			ApplyLeave info = restTemplate.postForObject(Constants.url + "/saveLeave", leave, ApplyLeave.class);

			System.err.println("Project Insert Response " + info.toString());
		} catch (Exception e) {
			System.err.println("Exc in Proj Insert " + e.getMessage());
			e.printStackTrace();

		}

		return "redirect:/showApproveLeave";
	}

	@RequestMapping(value = "/showShortLeave", method = RequestMethod.GET)
	public ModelAndView showShortLeave(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("masters/addShortLeave");
		try {
			HttpSession session = request.getSession();
			LoginResponse login = (LoginResponse) session.getAttribute("UserDetail");

			System.out.println("user Id " + login.getEmployee().getEmpId());

			model.addObject("login", login.getEmployee());

			Employee[] empArray = restTemplate.getForObject(Constants.url + "masters/getAllEmpListByType",
					Employee[].class);

			empList = new ArrayList<Employee>(Arrays.asList(empArray));
			model.addObject("empList", empList);

			map.add("empId", login.getEmployee().getEmpId());

			GetShortLeave[] leaveArray = restTemplate.postForObject(Constants.url + "/getAllShortLeaveByEmpId", map,
					GetShortLeave[].class);

			shortLeaveList = new ArrayList<GetShortLeave>(Arrays.asList(leaveArray));
			model.addObject("shortLeaveList", shortLeaveList);

			System.out.println("shortLeaveList" + shortLeaveList.toString());

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

	@RequestMapping(value = "/insertShortLeave", method = RequestMethod.POST)
	public String insertShortLeave(HttpServletRequest request, HttpServletResponse response) {

		try {

			HttpSession session = request.getSession();
			LoginResponse login = (LoginResponse) session.getAttribute("UserDetail");
			System.out.println("user Id " + login.getEmployee().getEmpId());

			String shortLeaveId = request.getParameter("shortLeaveId");
			int sendTo = Integer.parseInt(request.getParameter("sendTo"));
			float hours = Float.parseFloat(request.getParameter("hours"));
			// int empId = Integer.parseInt(request.getParameter("empId"));

			String empRemark = request.getParameter("empRemark");
			String date = request.getParameter("date");

			ShortLeave leave = new ShortLeave();

			if (shortLeaveId == "" || shortLeaveId == null)
				leave.setShortLeaveId(0);
			else
				leave.setShortLeaveId(Integer.parseInt(shortLeaveId));

			leave.setDate(date);

			leave.setIsUsed(1);
			leave.setApproveRemark(null);
			leave.setEmpRemark(empRemark);
			leave.setHours(hours);
			leave.setStatus(0);
			leave.setEmpId(login.getEmployee().getEmpId());
			leave.setSendTo(sendTo);

			ShortLeave info = restTemplate.postForObject(Constants.url + "/saveShortLeave", leave, ShortLeave.class);

			System.err.println("Project Insert Response " + info.toString());
		} catch (Exception e) {
			System.err.println("Exc in Proj Insert " + e.getMessage());
			e.printStackTrace();

		}

		return "redirect:/showShortLeave";
	}

	@RequestMapping(value = "/showApproveShortLeave", method = RequestMethod.GET)
	public ModelAndView showApproveShortLeave(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("masters/approveShortLeave");
		try {
			HttpSession session = request.getSession();
			LoginResponse login = (LoginResponse) session.getAttribute("UserDetail");

			System.out.println("user Id " + login.getEmployee().getEmpId());

			Employee[] empArray = restTemplate.getForObject(Constants.url + "masters/getAllEmpListByType",
					Employee[].class);

			empList = new ArrayList<Employee>(Arrays.asList(empArray));
			model.addObject("empList", empList);

			map.add("empId", login.getEmployee().getEmpId());

			GetShortLeave[] leaveArray = restTemplate.postForObject(Constants.url + "/getAllShortLeaveListBySendTo",
					map, GetShortLeave[].class);

			shortLeaveList = new ArrayList<GetShortLeave>(Arrays.asList(leaveArray));
			model.addObject("shortLeaveList", shortLeaveList);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

	@RequestMapping(value = "/shortLeaveDetails/{shortLeaveId}", method = RequestMethod.GET)
	public ModelAndView shortLeaveDetails(@PathVariable int shortLeaveId, HttpServletRequest request,
			HttpServletResponse response) {

		ModelAndView model = new ModelAndView("masters/approveShortLeave");
		try {

			Employee[] empArray = restTemplate.getForObject(Constants.url + "masters/getAllEmpListByType",
					Employee[].class);

			empList = new ArrayList<Employee>(Arrays.asList(empArray));
			model.addObject("empList", empList);

			GetShortLeave[] leaveArray = restTemplate.postForObject(Constants.url + "/getAllShortLeaveListBySendTo",
					map, GetShortLeave[].class);

			shortLeaveList = new ArrayList<GetShortLeave>(Arrays.asList(leaveArray));
			model.addObject("shortLeaveList", shortLeaveList);

			map.add("shortLeaveId", shortLeaveId);
			GetShortLeave leaveDetail = new GetShortLeave();
			leaveDetail = restTemplate.postForObject(Constants.url + "/getShortLeaveByLeaveId", map,
					GetShortLeave.class);
			model.addObject("leaveDetail", leaveDetail);
			System.out.println("leaveDetail" + leaveDetail.toString());

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

	@RequestMapping(value = "/approveShortLeave", method = RequestMethod.POST)
	public String approveShortLeave(HttpServletRequest request, HttpServletResponse response) {

		try {
			HttpSession session = request.getSession();
			LoginResponse login = (LoginResponse) session.getAttribute("UserDetail");
			System.out.println("user Id " + login.getEmployee().getEmpId());

			String shortLeaveId = request.getParameter("shortLeaveId");
			int sendTo = Integer.parseInt(request.getParameter("sendTo"));
			float hours = Float.parseFloat(request.getParameter("hours"));
			int status = Integer.parseInt(request.getParameter("status"));

			String empRemark = request.getParameter("empRemark");
			String appRemark = request.getParameter("appRemark");
			String date = request.getParameter("date");

			ShortLeave leave = new ShortLeave();

			if (shortLeaveId == "" || shortLeaveId == null)
				leave.setShortLeaveId(0);
			else
				leave.setShortLeaveId(Integer.parseInt(shortLeaveId));

			leave.setDate(date);

			leave.setIsUsed(1);

			leave.setEmpRemark(empRemark);
			leave.setHours(hours);
			leave.setStatus(status);
			leave.setEmpId(login.getEmployee().getEmpId());
			leave.setSendTo(sendTo);
			leave.setApproveRemark(appRemark);

			ShortLeave info = restTemplate.postForObject(Constants.url + "/saveShortLeave", leave, ShortLeave.class);

			System.err.println("Project Insert Response " + info.toString());

		} catch (Exception e) {
			System.err.println("Exc in Proj Insert " + e.getMessage());
			e.printStackTrace();

		}

		return "redirect:/showShortLeave";
	}

}
