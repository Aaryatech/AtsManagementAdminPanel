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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.ats.adminpanel.common.Constants;
import com.ats.adminpanel.model.FormType;
import com.ats.adminpanel.model.Info;
import com.ats.adminpanel.model.PhaseType;
import com.ats.adminpanel.model.tx.Complexity;
import com.ats.adminpanel.model.tx.GetComplexity;
import com.ats.adminpanel.model.tx.GetTech;
import com.ats.adminpanel.model.tx.Technology;

@Controller
public class TxController {

	List<PhaseType> phaseTypeList;

	List<GetTech> techList;
	List<FormType> formList;

	List<GetComplexity> compList;

	RestTemplate restTemplate = new RestTemplate();
	MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

	@RequestMapping(value = "/showAddTechnology", method = RequestMethod.GET)
	public ModelAndView showAddTechnology(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("masters/addTech");
		try {
			PhaseType[] phaseArray = restTemplate.getForObject(Constants.url + "masters/getAllPhaseTypeList",
					PhaseType[].class);

			phaseTypeList = new ArrayList<PhaseType>(Arrays.asList(phaseArray));

			model.addObject("phaseTypeList", phaseTypeList);

			GetTech[] techArray = restTemplate.getForObject(Constants.url + "/getAllTechPhaseList", GetTech[].class);

			techList = new ArrayList<GetTech>(Arrays.asList(techArray));

			model.addObject("techList", techList);

		} catch (Exception e) {
			e.printStackTrace();
		}

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

	@RequestMapping(value = "/editTech/{techId}", method = RequestMethod.GET)
	public ModelAndView editEmp(@PathVariable int techId, HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("masters/addTech");
		try {

			PhaseType[] phaseArray = restTemplate.getForObject(Constants.url + "masters/getAllPhaseTypeList",
					PhaseType[].class);

			phaseTypeList = new ArrayList<PhaseType>(Arrays.asList(phaseArray));
			model.addObject("phaseTypeList", phaseTypeList);

			map.add("techId", techId);
			Technology editTech = restTemplate.postForObject(Constants.url + "/techByTechId", map, Technology.class);
			model.addObject("editTech", editTech);

			GetTech[] techArray = restTemplate.getForObject(Constants.url + "/getAllTechPhaseList", GetTech[].class);

			techList = new ArrayList<GetTech>(Arrays.asList(techArray));

			model.addObject("techList", techList);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

	@RequestMapping(value = "/deleteTech/{techId}", method = RequestMethod.GET)
	public String deleteEmp(@PathVariable int techId, HttpServletRequest request, HttpServletResponse response) {

		try {

			map.add("techId", techId);
			Info info = restTemplate.postForObject(Constants.url + "/deleteTech", map, Info.class);

			System.out.println("info " + info);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/showAddTechnology";
	}

	@RequestMapping(value = "/showAddComplexity", method = RequestMethod.GET)
	public ModelAndView showAddComplexity(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("masters/addComplexity");
		try {
			PhaseType[] phaseArray = restTemplate.getForObject(Constants.url + "masters/getAllPhaseTypeList",
					PhaseType[].class);

			phaseTypeList = new ArrayList<PhaseType>(Arrays.asList(phaseArray));

			model.addObject("phaseTypeList", phaseTypeList);

			GetTech[] techArray = restTemplate.getForObject(Constants.url + "/getAllTechPhaseList", GetTech[].class);

			techList = new ArrayList<GetTech>(Arrays.asList(techArray));

			model.addObject("techList", techList);

			FormType[] formArray = restTemplate.getForObject(Constants.url + "masters/getAllFormType",
					FormType[].class);

			formList = new ArrayList<FormType>(Arrays.asList(formArray));

			model.addObject("formList", formList);

			GetComplexity[] compArray = restTemplate.getForObject(Constants.url + "/getAllComplexityList",
					GetComplexity[].class);

			compList = new ArrayList<GetComplexity>(Arrays.asList(compArray));

			model.addObject("compList", compList);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;

	}

	@RequestMapping(value = "/insertComplexity", method = RequestMethod.POST)
	public String insertComplexity(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("masters/addComplexity");

		try {
			Date now = new Date();

			int cmplxId = 0;

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

			String techId = request.getParameter("techId");

			String formTypeId = request.getParameter("formTypeId");

			String cmplxName = request.getParameter("cmplxName");
			String mPhaseId = request.getParameter("mPhaseId");

			Complexity comp = new Complexity();

			try {
				cmplxId = Integer.parseInt(request.getParameter("cmplxId"));

			} catch (Exception e) {
				// TODO: handle exception
				cmplxId = 0;
			}

			comp.setTechId(Integer.parseInt(techId));
			comp.setCmplxId(cmplxId);
			comp.setFormTypeId(Integer.parseInt(formTypeId));
			comp.setmPhaseId(Integer.parseInt(mPhaseId));

			comp.setIsUsed(1);
			comp.setCmplxDate(sdf.format(now));
			comp.setCmplxName(cmplxName);

			Complexity info = restTemplate.postForObject(com.ats.adminpanel.common.Constants.url + "/saveComplexity",
					comp, Complexity.class);
			System.out.println("Complexity Insertion " + info.toString());

		} catch (Exception e) {
			System.err.println("Exc in Proj Insert " + e.getMessage());
			e.printStackTrace();

		}

		return "redirect:/showAddComplexity";
	}

	@RequestMapping(value = "/editComp/{cmplxId}", method = RequestMethod.GET)
	public ModelAndView editComp(@PathVariable int cmplxId, HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("masters/addComplexity");
		try {

			PhaseType[] phaseArray = restTemplate.getForObject(Constants.url + "masters/getAllPhaseTypeList",
					PhaseType[].class);

			phaseTypeList = new ArrayList<PhaseType>(Arrays.asList(phaseArray));
			model.addObject("phaseTypeList", phaseTypeList);

			FormType[] formArray = restTemplate.getForObject(Constants.url + "masters/getAllFormType",
					FormType[].class);

			formList = new ArrayList<FormType>(Arrays.asList(formArray));

			model.addObject("formList", formList);

			GetTech[] techArray = restTemplate.getForObject(Constants.url + "/getAllTechPhaseList", GetTech[].class);

			techList = new ArrayList<GetTech>(Arrays.asList(techArray));

			model.addObject("techList", techList);

			GetComplexity[] compArray = restTemplate.getForObject(Constants.url + "/getAllComplexityList",
					GetComplexity[].class);

			compList = new ArrayList<GetComplexity>(Arrays.asList(compArray));

			model.addObject("compList", compList);

			map.add("cmplxId", cmplxId);
			GetComplexity editCmplx = restTemplate.postForObject(Constants.url + "/compByCmplxId", map,
					GetComplexity.class);
			model.addObject("editCmplx", editCmplx);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

	@RequestMapping(value = "/deleteComp/{cmplxId}", method = RequestMethod.GET)
	public String deleteComp(@PathVariable int cmplxId, HttpServletRequest request, HttpServletResponse response) {

		try {

			map.add("cmplxId", cmplxId);
			Info info = restTemplate.postForObject(Constants.url + "/deleteComplexity", map, Info.class);

			System.out.println("info " + info);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/showAddComplexity";
	}

	@RequestMapping(value = "/showAddComplexOption", method = RequestMethod.GET)
	public ModelAndView showAddComplexOption(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("masters/addComplexOption");
		try {
			PhaseType[] phaseArray = restTemplate.getForObject(Constants.url + "masters/getAllPhaseTypeList",
					PhaseType[].class);

			phaseTypeList = new ArrayList<PhaseType>(Arrays.asList(phaseArray));

			model.addObject("phaseTypeList", phaseTypeList);

			GetTech[] techArray = restTemplate.getForObject(Constants.url + "/getAllTechPhaseList", GetTech[].class);

			techList = new ArrayList<GetTech>(Arrays.asList(techArray));

			model.addObject("techList", techList);

			GetComplexity[] compArray = restTemplate.getForObject(Constants.url + "/getAllComplexityList",
					GetComplexity[].class);

			compList = new ArrayList<GetComplexity>(Arrays.asList(compArray));

			model.addObject("compList", compList);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;

	}

}
