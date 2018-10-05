package com.ats.adminpanel.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.ats.adminpanel.common.Constants;
import com.ats.adminpanel.model.PhaseType;
import com.ats.adminpanel.model.tx.Technology;

@Controller
public class TxController {

	RestTemplate restTemplate = new RestTemplate();
	MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

	@RequestMapping(value = "/showAddTechnology", method = RequestMethod.GET)
	public ModelAndView showAddTechnology(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("masters/addTech");

		List<PhaseType> phaseTypeList;

		List<Technology> techList;

		PhaseType[] phaseArray = restTemplate.getForObject(Constants.url + "masters/getAllPhaseTypeList",
				PhaseType[].class);

		phaseTypeList = new ArrayList<PhaseType>(Arrays.asList(phaseArray));

		model.addObject("phaseTypeList", phaseTypeList);

		Technology[] techArray = restTemplate.getForObject(Constants.url + "/getAllTechList", Technology[].class);

		techList = new ArrayList<Technology>(Arrays.asList(techArray));

		model.addObject("techList", techList);
		return model;

	}

	@RequestMapping(value = "/insertTechnology", method = RequestMethod.POST)
	public String insertTechnology(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("masters/addTech");

		try {
			Date now = new Date();

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

			String techId = request.getParameter("techId");
			String techName = request.getParameter("techName");
			String descTech = request.getParameter("descTech");
			String mPhaseId = request.getParameter("mPhaseId");

			Technology tech = new Technology();

			if (techId == "" || techId == null)
				tech.setTechId(0);
			else
				tech.setTechId(Integer.parseInt(techId));

			tech.setTechDate(sdf.format(now));

			tech.setIsUsed(1);
			tech.setmPhaseId(Integer.parseInt(mPhaseId));
			tech.setTechDesc(descTech);
			tech.setTechName(techName);

			Technology info = restTemplate.postForObject(com.ats.adminpanel.common.Constants.url + "/saveTechnology",
					tech, Technology.class);

			System.err.println("Project Insert Response " + info.toString());
		} catch (Exception e) {
			System.err.println("Exc in Proj Insert " + e.getMessage());
			e.printStackTrace();

		}

		return "redirect:/showAddTechnology";
	}

}
