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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.ats.adminpanel.common.Constants;
import com.ats.adminpanel.model.FormType;
import com.ats.adminpanel.model.Info;
import com.ats.adminpanel.model.PhaseType;
import com.ats.adminpanel.model.tx.CmplxOption;
import com.ats.adminpanel.model.tx.Complexity;
import com.ats.adminpanel.model.tx.GetCmplxHrs;
import com.ats.adminpanel.model.tx.GetComplexity;
import com.ats.adminpanel.model.tx.GetComplexityOption;
import com.ats.adminpanel.model.tx.GetFormType;
import com.ats.adminpanel.model.tx.GetTech;
import com.ats.adminpanel.model.tx.Technology;

@Controller
public class TxController {

	List<PhaseType> phaseTypeList;

	List<GetFormType> formTypeList;
	List<GetCmplxHrs> getCmplxHrsList;

	List<GetTech> techList;
	List<FormType> formList;

	List<GetComplexity> compList;

	List<GetComplexityOption> compOptionList;
	List<CmplxOption> optList;
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
			map = new LinkedMultiValueMap<String, Object>();

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
			map = new LinkedMultiValueMap<String, Object>();

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

			map = new LinkedMultiValueMap<String, Object>();

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

	@RequestMapping(value = "/getComplexityData", method = RequestMethod.GET)
	public @ResponseBody List<GetComplexity> getComplexityData(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			System.out.println("in method");

			String[] phaseIdList = request.getParameterValues("mPhaseId");
			String[] techIdList = request.getParameterValues("techId");

			StringBuilder sb = new StringBuilder();

			System.out.println("phaseIdList" + phaseIdList);
			System.out.println("techIdList" + techIdList);

			for (int i = 0; i < phaseIdList.length; i++) {
				sb = sb.append(phaseIdList[i] + ",");

			}
			String items = sb.toString();
			items = items.substring(0, items.length() - 1);

			for (int i = 0; i < techIdList.length; i++) {
				sb = sb.append(techIdList[i] + ",");

			}
			String items1 = sb.toString();
			items1 = items1.substring(0, items1.length() - 1);

			RestTemplate restTemplate = new RestTemplate();

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

			map.add("phaseId", items);

			map.add("techId", items1);

			compList = restTemplate.postForObject(Constants.url + "/getCompByTechIdListAndPhaseIdList", map,
					List.class);

			System.out.println("compList" + compList.toString());

		} catch (Exception e) {
			e.printStackTrace();
		}

		return compList;
	}

	@RequestMapping(value = "/insertComplexOption", method = RequestMethod.POST)
	public String insertComplexOption(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("masters/addComplexOption");

		try {
			Date now = new Date();

			int cmplxOptId = 0;

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

			String cmplxId = request.getParameter("cmplxId");

			/*
			 * float allocatedHrs = Float.parseFloat(request.getParameter("allocatedHrs"));
			 */

			String cmplxOptName = request.getParameter("cmplxOptName");

			CmplxOption comp = new CmplxOption();
			List<CmplxOption> list = new ArrayList<>();
			/*
			 * try { cmplxOptId = Integer.parseInt(request.getParameter("cmplxOptId"));
			 * 
			 * } catch (Exception e) { // TODO: handle exception cmplxOptId = 0; }
			 */

			System.out.println("compList" + compList.toString());

			for (int j = 0; j < compList.size(); j++) {

				System.out.println("compListCmplxId" + compList.get(j).getCmplxId());

				comp = new CmplxOption();

				/* comp.setAllocatedHrs(allocatedHrs); */

				comp.setIsUsed(1);
				comp.setCmplxOptDate(sdf.format(now));
				comp.setCmplxOptName(cmplxOptName);

				float allocatedHrs = Float
						.parseFloat(request.getParameter("allocatedHrs" + compList.get(j).getCmplxId()));

				if (allocatedHrs > 0) {

					comp.setCmplxId(compList.get(j).getCmplxId());
					comp.setAllocatedHrs(allocatedHrs);

					list.add(comp);
				}

			}

			List<CmplxOption> info = restTemplate.postForObject(
					com.ats.adminpanel.common.Constants.url + "/saveComplexityOptionList", list, List.class);
			System.out.println("Complexity Insertion " + info.toString());

		} catch (Exception e) {
			System.err.println("Exc in Proj Insert " + e.getMessage());
			e.printStackTrace();

		}

		return "redirect:/showAddComplexOption";
	}

	@RequestMapping(value = "/showAddFormType", method = RequestMethod.GET)
	public ModelAndView showAddFormType(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("masters/addFormType");
		try {

			PhaseType[] phaseArray = restTemplate.getForObject(Constants.url + "masters/getAllPhaseTypeList",
					PhaseType[].class);

			phaseTypeList = new ArrayList<PhaseType>(Arrays.asList(phaseArray));

			model.addObject("phaseTypeList", phaseTypeList);

			GetTech[] techArray = restTemplate.getForObject(Constants.url + "/getAllTechPhaseList", GetTech[].class);

			techList = new ArrayList<GetTech>(Arrays.asList(techArray));

			model.addObject("techList", techList);

			GetFormType[] formTypeArray = restTemplate.getForObject(Constants.url + "/getAllFormTypeList",
					GetFormType[].class);

			formTypeList = new ArrayList<GetFormType>(Arrays.asList(formTypeArray));

			model.addObject("formTypeList", formTypeList);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;

	}

	@RequestMapping(value = "/insertFormType", method = RequestMethod.POST)
	public String insertFormType(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("masters/addFormType");

		try {

			int formTypeId = 0;

			String techId = request.getParameter("techId");

			String formTypeName = request.getParameter("formTypeName");

			String mPhaseId = request.getParameter("mPhaseId");

			FormType form = new FormType();

			try {
				formTypeId = Integer.parseInt(request.getParameter("formTypeId"));

			} catch (Exception e) {
				// TODO: handle exception
				formTypeId = 0;
			}

			form.setFormTypeId(formTypeId);
			form.setFormTypeName(formTypeName);
			form.setIsUsed(1);
			form.setTechId(Integer.parseInt(techId));
			form.setmPhaseId(Integer.parseInt(mPhaseId));

			FormType info = restTemplate.postForObject(com.ats.adminpanel.common.Constants.url + "masters/saveFormType",
					form, FormType.class);
			System.out.println("FormType Insertion " + info.toString());

		} catch (Exception e) {
			System.err.println("Exc in Form Insert " + e.getMessage());
			e.printStackTrace();

		}

		return "redirect:/showAddFormType";
	}

	@RequestMapping(value = "/editFormType/{formTypeId}", method = RequestMethod.GET)
	public ModelAndView editFormType(@PathVariable int formTypeId, HttpServletRequest request,
			HttpServletResponse response) {

		ModelAndView model = new ModelAndView("masters/addFormType");
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
			GetFormType[] formTypeArray = restTemplate.getForObject(Constants.url + "/getAllFormTypeList",
					GetFormType[].class);

			formTypeList = new ArrayList<GetFormType>(Arrays.asList(formTypeArray));

			model.addObject("formTypeList", formTypeList);
			map = new LinkedMultiValueMap<String, Object>();

			map.add("formTypeId", formTypeId);
			FormType editFormType = restTemplate.postForObject(Constants.url + "masters/formTypeByFormTypeId", map,
					FormType.class);
			model.addObject("editFormType", editFormType);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

	@RequestMapping(value = "/deleteFormType/{formTypeId}", method = RequestMethod.GET)
	public String deleteFormType(@PathVariable int formTypeId, HttpServletRequest request,
			HttpServletResponse response) {

		try {
			map = new LinkedMultiValueMap<String, Object>();

			map.add("formTypeId", formTypeId);
			Info info = restTemplate.postForObject(Constants.url + "masters/deleteFormType", map, Info.class);

			System.out.println("info " + info);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/showAddFormType";
	}

	@RequestMapping(value = "/getComplexityOptionData", method = RequestMethod.GET)
	public @ResponseBody List<GetCmplxHrs> getComplexityOptionData(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			System.out.println("in method");

			String[] phaseIdList = request.getParameterValues("mPhaseId");
			String[] techIdList = request.getParameterValues("techId");
			String[] cmplxOptIdList = request.getParameterValues("cmplxOptId");

			StringBuilder sb = new StringBuilder();

			System.out.println("phaseIdList" + phaseIdList);
			System.out.println("techIdList" + techIdList);

			for (int i = 0; i < phaseIdList.length; i++) {
				sb = sb.append(phaseIdList[i] + ",");

			}
			String items = sb.toString();
			items = items.substring(0, items.length() - 1);

			for (int i = 0; i < techIdList.length; i++) {
				sb = sb.append(techIdList[i] + ",");

			}
			String items1 = sb.toString();
			items1 = items1.substring(0, items1.length() - 1);

			for (int i = 0; i < cmplxOptIdList.length; i++) {
				sb = sb.append(cmplxOptIdList[i] + ",");

			}
			String items2 = sb.toString();
			items2 = items2.substring(0, items2.length() - 1);
			map = new LinkedMultiValueMap<String, Object>();

			map.add("phaseId", items);

			map.add("techId", items1);
			map.add("cmplxOptId", items2);

			GetCmplxHrs[] getCmplxHrsListArray = restTemplate.postForObject(Constants.url + "/getCompListByIdList", map,
					GetCmplxHrs[].class);

			getCmplxHrsList = new ArrayList<GetCmplxHrs>(Arrays.asList(getCmplxHrsListArray));

			System.out.println("getCmplxHrsList" + getCmplxHrsList.toString());

		} catch (Exception e) {
			e.printStackTrace();
		}

		return getCmplxHrsList;
	}

	@RequestMapping(value = "/showEditComplexOption", method = RequestMethod.GET)
	public ModelAndView showEditComplexOption(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("masters/editCmplxOption");
		try {

			PhaseType[] phaseArray = restTemplate.getForObject(Constants.url + "masters/getAllPhaseTypeList",
					PhaseType[].class);

			phaseTypeList = new ArrayList<PhaseType>(Arrays.asList(phaseArray));

			model.addObject("phaseTypeList", phaseTypeList);

			GetTech[] techArray = restTemplate.getForObject(Constants.url + "/getAllTechPhaseList", GetTech[].class);

			techList = new ArrayList<GetTech>(Arrays.asList(techArray));

			model.addObject("techList", techList);

			GetComplexityOption[] compArray = restTemplate.getForObject(Constants.url + "/getAllTechPhaseList",
					GetComplexityOption[].class);

			compOptionList = new ArrayList<GetComplexityOption>(Arrays.asList(compArray));

			model.addObject("compOptionList", compOptionList);

			CmplxOption[] optionArray = restTemplate.getForObject(Constants.url + "/getAllCompOptionList",
					CmplxOption[].class);

			optList = new ArrayList<CmplxOption>(Arrays.asList(optionArray));

			model.addObject("optList", optList);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;

	}

	@RequestMapping(value = "/insertEditComplexOption", method = RequestMethod.POST)
	public String insertEditComplexOption(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("masters/editComplexOption");

		try {
			Date now = new Date();
			int cmplxOptId = 0;
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

			CmplxOption comp = new CmplxOption();
			List<CmplxOption> list = new ArrayList<>();

			try {
				cmplxOptId = Integer.parseInt(request.getParameter("cmplxOptId"));

			} catch (Exception e) { // TODO: handle exception cmplxOptId = 0;
			}

			System.out.println("getCmplxHrsList" + getCmplxHrsList.toString());

			for (int j = 0; j < getCmplxHrsList.size(); j++) {
				System.err.println("id name" + getCmplxHrsList.get(j).getCmplxOptName());

				comp = new CmplxOption();
				comp.setCmplxOptId(cmplxOptId);

				comp.setIsUsed(1);
				comp.setCmplxOptDate(sdf.format(now));
				comp.setCmplxOptName(getCmplxHrsList.get(j).getCmplxOptName());

				float allocatedHrs = Float
						.parseFloat(request.getParameter("allocatedHrs" + getCmplxHrsList.get(j).getCmplxId()));

				if (allocatedHrs > 0) {

					comp.setCmplxId(getCmplxHrsList.get(j).getCmplxId());
					comp.setAllocatedHrs(allocatedHrs);
					list.add(comp);
				}

			}

			List<CmplxOption> info = restTemplate.postForObject(Constants.url + "/saveComplexityOptionList", list,
					List.class);
			System.out.println("Complexity Insertion " + info.toString());

		} catch (Exception e) {
			System.err.println("Exc in Proj Insert " + e.getMessage());
			e.printStackTrace();

		}

		return "redirect:/showEditComplexOption";
	}

}
