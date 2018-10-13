package com.ats.adminpanel.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLConnection;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.ats.adminpanel.common.Constants;
import com.ats.adminpanel.model.Employee;
import com.ats.adminpanel.model.GetPhaseTask;
import com.ats.adminpanel.model.proj.ProjList;
import com.ats.adminpanel.model.proj.ProjTaskDetail;
import com.ats.adminpanel.model.tx.Technology;
import com.ats.adminpanel.util.ItextPageEvent;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.Font.FontFamily;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPCellEvent;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import javafx.scene.layout.Border;


/* Itext Pdf Dependency 
  <dependency>
    <groupId>com.lowagie</groupId>
    <artifactId>itext</artifactId>
    <version>4.2.2</version>
</dependency>
 */
@Controller
public class ProjPlanController {
	RestTemplate restTemplate = new RestTemplate();
	MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

	List<ProjList> projList = new ArrayList<ProjList>();

	List<ProjTaskDetail> projTaskDetailList = new ArrayList<ProjTaskDetail>();

	@RequestMapping(value = "/getProjList", method = RequestMethod.GET)
	public ModelAndView getProjList(HttpServletRequest request, HttpServletResponse response) {

		Constants.mainAct = 1;
		Constants.subAct = 44;

		ModelAndView model = new ModelAndView("project/projList");

		List<Employee> empList;

		ProjList[] projArray = restTemplate.getForObject(Constants.url + "getProjList", ProjList[].class);

		projList = new ArrayList<ProjList>(Arrays.asList(projArray));

		model.addObject("projList", projList);

		return model;
	}

	// getProjTaskDetail

	@RequestMapping(value = "/getProjTaskDetail/{projId}/{projName}", method = RequestMethod.GET)
	public ModelAndView getProjTaskDetail(HttpServletRequest request, HttpServletResponse response,
			@PathVariable int projId, @PathVariable String projName) {

		Constants.mainAct = 1;
		Constants.subAct = 44;

		ModelAndView model = new ModelAndView("project/projDetail");
		map = new LinkedMultiValueMap<String, Object>();
		map.add("projId", projId);
		/*
		 * map.add("empIdList", -1); map.add("techIdList", -1); map.add("phaseIdList",
		 * -1);
		 */

		ProjTaskDetail[] taskArray = restTemplate.postForObject(Constants.url + "getProjTaskDetailOnLoad", map,
				ProjTaskDetail[].class);

		projTaskDetailList = new ArrayList<ProjTaskDetail>(Arrays.asList(taskArray));

		model.addObject("projTaskDetailList", projTaskDetailList);
		model.addObject("projName", projName);
		model.addObject("projId", projId);

		map = new LinkedMultiValueMap<String, Object>();
		map.add("projectId", projId);
		GetPhaseTask[] getPhaseTask = restTemplate.postForObject(Constants.url + "/masters/getPhaseTaskListByProjectId",
				map, GetPhaseTask[].class);
		List<GetPhaseTask> getPhaseTaskList = new ArrayList<GetPhaseTask>(Arrays.asList(getPhaseTask));
		model.addObject("getPhaseTaskList", getPhaseTaskList);

		Employee[] Employee = restTemplate.getForObject(Constants.url + "/masters/getAllEmpList", Employee[].class);
		List<Employee> empList = new ArrayList<Employee>(Arrays.asList(Employee));
		model.addObject("empList", empList);

		Technology[] techArray = restTemplate.getForObject(Constants.url + "/getAllTechList", Technology[].class);

		List<Technology> techList = new ArrayList<Technology>(Arrays.asList(techArray));

		model.addObject("techList", techList);

		return model;
	}

	@RequestMapping(value = "/getProjTaskDetailAjax", method = RequestMethod.GET)
	public @ResponseBody List<ProjTaskDetail> getProjTaskDetailAjax(HttpServletRequest request,
			HttpServletResponse response) {

		System.err.println("inside ajax getProjTaskDetailAjax");
		/*
		 * Constants.mainAct = 1; Constants.subAct = 44;
		 * 
		 * ModelAndView model = new ModelAndView("project/projDetail");
		 */
		try {
			String projId = request.getParameter("project_id");
			String empId = request.getParameter("emp_id");
			String techId = request.getParameter("tech_id");
			String phaseId = request.getParameter("phase_id");

			map = new LinkedMultiValueMap<String, Object>();

			map.add("projId", Integer.parseInt(projId));
			map.add("empIdList", Integer.parseInt(empId));
			map.add("techIdList", Integer.parseInt(techId));
			map.add("phaseIdList", 1);
			// map.add("phaseIdList", Integer.parseInt(phaseId));

			ProjTaskDetail[] taskArray = restTemplate.postForObject(Constants.url + "getProjTaskDetail", map,
					ProjTaskDetail[].class);

			projTaskDetailList = new ArrayList<ProjTaskDetail>(Arrays.asList(taskArray));

		} catch (Exception e) {

			System.err.println("Exce in Ajax getProjTaskDetailAjax   " + e.getMessage());
			e.printStackTrace();
		}

		return projTaskDetailList;
	}

	@RequestMapping(value = "/projectTaskPdf", method = RequestMethod.GET)
	public void projectTaskPdf(HttpServletRequest request, HttpServletResponse response) {

		BufferedOutputStream outStream = null;
		System.out.println("Inside Pdf prod From Order Or Plan");

		Document document = new Document(PageSize.A4, 20, 20, 70, 30);
		// ByteArrayOutputStream out = new ByteArrayOutputStream();

		DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
		Calendar cal = Calendar.getInstance();

		String timeStamp = dateFormat.format(cal.getTime());
		String FILE_PATH = Constants.REPORT_SAVE;
		File file = new File(FILE_PATH);

		PdfWriter writer = null;

		FileOutputStream out = null;
		try {
			out = new FileOutputStream(FILE_PATH);
		} catch (FileNotFoundException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		try {

			String header = "Project Name : " + projTaskDetailList.get(0).getProjName();

			String title = "                 ";

			DateFormat DF = new SimpleDateFormat("dd-MM-yyyy");
			String reportDate = DF.format(new Date());

			writer = PdfWriter.getInstance(document, out);

			ItextPageEvent event = new ItextPageEvent(header, title, reportDate);

			writer.setPageEvent(event);

		} catch (DocumentException e) {

			e.printStackTrace();
		}

		PdfPTable table = new PdfPTable(11);
		try {
			System.out.println("Inside PDF Table try");
			table.setWidthPercentage(100);
			//table.setTotalWidth(120);
			
			table.setWidths(new float[] { 0.4f, 1.0f, 0.7f, 1.1f, 1.1f, 1.2f, 1.1f, 0.7f, 0.7f, 0.7f, 0.9f });
			Font headFont = new Font(FontFamily.TIMES_ROMAN, 10, Font.NORMAL, BaseColor.BLACK);
			Font headFont1 = new Font(FontFamily.HELVETICA, 12, Font.BOLD, BaseColor.BLACK);
			Font f = new Font(FontFamily.TIMES_ROMAN, 12.0f, Font.UNDERLINE, BaseColor.BLUE);
			headFont1.setColor(BaseColor.WHITE);

			PdfPCell hcell = new PdfPCell();

			hcell.setBackgroundColor(BaseColor.PINK);
			// hcell.setPaddingTop(4);
			// hcell.setPaddingBottom(4);
			hcell = new PdfPCell(new Phrase("Sr", headFont1));
			hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			hcell.setBackgroundColor(BaseColor.PINK);
			table.addCell(hcell);

			hcell = new PdfPCell(new Phrase("Start Date", headFont1));
			hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			hcell.setBackgroundColor(BaseColor.PINK);
			table.addCell(hcell);

			hcell = new PdfPCell(new Phrase("Tech", headFont1));
			hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			hcell.setBackgroundColor(BaseColor.PINK);
			table.addCell(hcell);

			hcell = new PdfPCell(new Phrase("Module Name", headFont1));
			hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			hcell.setBackgroundColor(BaseColor.PINK);
			table.addCell(hcell);

			hcell = new PdfPCell(new Phrase("Form Name", headFont1));
			hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			hcell.setBackgroundColor(BaseColor.PINK);
			table.addCell(hcell);

			hcell = new PdfPCell(new Phrase("Task Name", headFont1));
			hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			hcell.setBackgroundColor(BaseColor.PINK);
			table.addCell(hcell);

			hcell = new PdfPCell(new Phrase("Employee", headFont1));
			hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			hcell.setBackgroundColor(BaseColor.PINK);
			table.addCell(hcell);

			hcell = new PdfPCell(new Phrase("Plan Hr", headFont1));
			hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			hcell.setBackgroundColor(BaseColor.PINK);
			table.addCell(hcell);

			hcell = new PdfPCell(new Phrase("Assi Hr", headFont1));
			hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			hcell.setBackgroundColor(BaseColor.PINK);
			table.addCell(hcell);

			hcell = new PdfPCell(new Phrase("Req Hr", headFont1));
			hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			hcell.setBackgroundColor(BaseColor.PINK);
			table.addCell(hcell);

			hcell = new PdfPCell(new Phrase("Cost", headFont1));
			hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			hcell.setBackgroundColor(BaseColor.PINK);
			table.addCell(hcell);

			table.setHeaderRows(1);

			float totCost = 0.0f;
			float planHrSum = 0.0f;
			float assHrSum = 0.0f;
			float regHrSum = 0.0f;

			int index = 0;
		
			for (ProjTaskDetail projTask : projTaskDetailList) {
				
				index++;
				
				PdfPCell cell;

				totCost = totCost + projTask.getEmpTaskCost();
				
				planHrSum = planHrSum + projTask.getPlanHr();
				assHrSum = assHrSum + projTask.getAssignHr();
				regHrSum = regHrSum + projTask.getActualHr();
				
				cell = new PdfPCell(new Phrase(String.valueOf(index), headFont));
				cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
				cell.setHorizontalAlignment(Element.ALIGN_CENTER);
				// cell.setPadding(4);
				table.addCell(cell);

				cell = new PdfPCell(new Phrase(projTask.getStartDate(), headFont));
				cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
				cell.setHorizontalAlignment(Element.ALIGN_CENTER);
				// cell.setPaddingRight(2);
				// cell.setPadding(4);
				table.addCell(cell);

				cell = new PdfPCell(new Phrase(projTask.getTechName(), headFont));
				cell.setVerticalAlignment(Element.ALIGN_BASELINE);
				cell.setHorizontalAlignment(Element.ALIGN_CENTER);
				// cell.setPaddingRight(2);
				// cell.setPadding(4);
				table.addCell(cell);

				cell = new PdfPCell(new Phrase(String.valueOf(projTask.getModuleName()), headFont));
				cell.setVerticalAlignment(Element.ALIGN_BASELINE);
				cell.setHorizontalAlignment(Element.ALIGN_LEFT);
				// cell.setPaddingRight(2);
				// cell.setPadding(4);
				table.addCell(cell);

				cell = new PdfPCell(new Phrase(String.valueOf(projTask.getFormName()), headFont));
				cell.setVerticalAlignment(Element.ALIGN_BASELINE);
				cell.setHorizontalAlignment(Element.ALIGN_LEFT);
				// cell.setPaddingRight(2);
				// cell.setPadding(4);
				table.addCell(cell);

				cell = new PdfPCell(new Phrase(String.valueOf(projTask.getTaskName()), headFont));
				cell.setVerticalAlignment(Element.ALIGN_BASELINE);
				cell.setHorizontalAlignment(Element.ALIGN_LEFT);
				// cell.setPaddingRight(2);
				// cell.setPadding(4);
				table.addCell(cell);

				cell = new PdfPCell(new Phrase(String.valueOf(projTask.getEmpName()), headFont));
				cell.setVerticalAlignment(Element.ALIGN_BASELINE);
				cell.setHorizontalAlignment(Element.ALIGN_LEFT);
				// cell.setPaddingRight(2);
				// cell.setPadding(4);
				table.addCell(cell);

				cell = new PdfPCell(new Phrase(String.valueOf(projTask.getPlanHr()), headFont));
				cell.setVerticalAlignment(Element.ALIGN_BASELINE);
				cell.setHorizontalAlignment(Element.ALIGN_CENTER);
				// cell.setPaddingRight(2);
				// cell.setPadding(4);
				table.addCell(cell);

				cell = new PdfPCell(new Phrase(String.valueOf(projTask.getAssignHr()), headFont));
				cell.setVerticalAlignment(Element.ALIGN_BASELINE);
				cell.setHorizontalAlignment(Element.ALIGN_CENTER);
				// cell.setPaddingRight(2);
				// cell.setPadding(4);
				table.addCell(cell);

				cell = new PdfPCell(new Phrase(String.valueOf(projTask.getActualHr()), headFont));
				cell.setVerticalAlignment(Element.ALIGN_BASELINE);
				cell.setHorizontalAlignment(Element.ALIGN_CENTER);
				// cell.setPaddingRight(2);
				// cell.setPadding(4);
				table.addCell(cell);

				cell = new PdfPCell(new Phrase(String.valueOf(projTask.getEmpTaskCost()), headFont));
				cell.setVerticalAlignment(Element.ALIGN_BASELINE);
				cell.setHorizontalAlignment(Element.ALIGN_CENTER);
				// cell.setPaddingRight(2);
				// cell.setPadding(4);
				table.addCell(cell);

				// FooterTable footerEvent = new FooterTable(table);
				// writer.setPageEvent(footerEvent);
			
			}
			PdfPCell cell;

			cell = new PdfPCell(new Phrase(""));
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			
			cell.setBorder(Rectangle.BOTTOM | Rectangle.LEFT);
		//    cell.setCellEvent(new CustomBorder(dotted, null, solid, null));
		//	cell.setCellEvent(new CustomB);

			// cell.setPadding(4);
			// cell.setRowspan(7);
			table.addCell(cell);

			cell = new PdfPCell(new Phrase(""));
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		

			cell.setBorder(Rectangle.BOTTOM);
			// cell.setPadding(4);
			// cell.setRowspan(7);
			table.addCell(cell);
			

			cell = new PdfPCell(new Phrase(""));
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			cell.setBorder(Rectangle.BOTTOM);

			// cell.setPadding(4);
			// cell.setRowspan(7);
			table.addCell(cell);
			cell = new PdfPCell(new Phrase(""));
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			cell.setBorder(Rectangle.BOTTOM);

			// cell.setPadding(4);
			// cell.setRowspan(7);
			table.addCell(cell);
			cell = new PdfPCell(new Phrase(""));
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			cell.setBorder(Rectangle.BOTTOM);

			// cell.setPadding(4);
			// cell.setRowspan(7);
			table.addCell(cell);
			cell = new PdfPCell(new Phrase(""));
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			cell.setBorder(Rectangle.BOTTOM);

			// cell.setPadding(4);
			// cell.setRowspan(7);
			table.addCell(cell);
			cell = new PdfPCell(new Phrase("Total"));
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			// cell.setPadding(4);
			// cell.setRowspan(7);
			
			table.addCell(cell);
			cell = new PdfPCell(new Phrase(""+planHrSum));
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			// cell.setPadding(4);
			// cell.setRowspan(7);
			table.addCell(cell);
			cell = new PdfPCell(new Phrase(""+assHrSum));
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			// cell.setPadding(4);
			// cell.setRowspan(7);
			table.addCell(cell);
			cell = new PdfPCell(new Phrase(""+regHrSum));
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			// cell.setPadding(4);
			// cell.setRowspan(7);
			table.addCell(cell);
			cell = new PdfPCell(new Phrase(""+totCost));
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			// cell.setPadding(4);
			// cell.setRowspan(7);
			table.addCell(cell);

			Paragraph para = new Paragraph();
			para.add("Project Cost " + totCost);
			para.setAlignment(Paragraph.ALIGN_RIGHT);
			document.open();
			document.add(table);
			//document.add(para);
			document.close();

			// System.out.println("Page no " + totalPages);

			// document.close();
			// Atul Sir code to open a Pdf File
			if (file != null) {

				String mimeType = URLConnection.guessContentTypeFromName(file.getName());

				if (mimeType == null) {

					mimeType = "application/pdf";

				}

				response.setContentType(mimeType);

				response.addHeader("content-disposition", String.format("inline; filename=\"%s\"", file.getName()));

				response.setContentLength((int) file.length());

				InputStream inputStream = null;
				try {
					inputStream = new BufferedInputStream(new FileInputStream(file));
				} catch (FileNotFoundException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}

				try {
					FileCopyUtils.copy(inputStream, response.getOutputStream());
				} catch (IOException e) {
					System.out.println("Excep in Opening a Pdf File");
					e.printStackTrace();
				}
			}

		} catch (DocumentException ex) {

			System.out.println("Pdf Generation Error: Proj Plan Cont" + ex.getMessage());

			ex.printStackTrace();

		}
	}

	
	
	
}
