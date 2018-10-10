package com.ats.adminpanel.controller;

import java.text.SimpleDateFormat;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

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
import com.ats.adminpanel.model.PhaseType;
import com.ats.adminpanel.model.leave.ApplyLeave;
import com.ats.adminpanel.model.leave.GetApplyLeave;
import com.ats.adminpanel.model.tx.GetTech;
import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;

@Controller
@Scope("session")
public class LeaveController {
	RestTemplate restTemplate = new RestTemplate();
	MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
	List<Employee> empList;
	List<GetApplyLeave> leaveList;

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

			ApplyLeave info = restTemplate.postForObject(com.ats.adminpanel.common.Constants.url + "/saveLeave", leave,
					ApplyLeave.class);

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
			GetApplyLeave leaveDetail = restTemplate.postForObject(Constants.url + "/getAllLeaveListByLeaveId", map,
					GetApplyLeave.class);
			model.addObject("leaveDetail", leaveDetail);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

}
