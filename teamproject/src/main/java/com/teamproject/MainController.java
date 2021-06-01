package com.teamproject;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class MainController {

	@RequestMapping("/teamprc")
	public String imagetest() {
		return "/main";
		
	}
	
	//김세미
	
	//작업 공간
	
	//김세미 end
	//이현용
	@Autowired
	NaverOCRService ocrservice;
	@Autowired
	NaverVoiceService voiceservice;
	//ocr
	
	@RequestMapping("/ocrinput")
	public ModelAndView ocrinput() {
		File f = new File("../img"); 
		/*
		 * 
		 * File file = new File("../"); String[] files = file.list();
		 * 
		 * System.out.println("Listing contents of " + file.getPath()); for(int i=0 ; i
		 * < files.length ; i++) { System.out.println(files[i]); }
		 */
		String[] filelist = f.list();
		ModelAndView mv = new ModelAndView();
		mv.addObject("filelist",filelist);
		mv.setViewName("/lhy/ocrinput");
		return mv;
	}
	@RequestMapping(value="/ocr",method=RequestMethod.POST)
	public ModelAndView ocr(String image) { 
		String result = ocrservice.test(image);
		ModelAndView mv = new ModelAndView();
		mv.addObject("ocrResult",result);
		mv.setViewName("/lhy/ocr");
		return mv;
	}
	//upload
	@RequestMapping(value="/imgupload" , method = RequestMethod.POST)
	@ResponseBody
	public String uploadresult(MultipartFile file) throws IOException{
		String filename = file.getOriginalFilename();
		String savePath = "../img/";
		File savefile = new File(savePath + filename);	
		file.transferTo(savefile);
		return "잘받았습니다"; 
	}
	/*
	 * //tts
	 * 
	 * @RequestMapping("/tts")
	 * 
	 * @ResponseBody public String voice(String text , String speaker ) { String
	 * result = voiceservice.test(text,speaker); return result;// 리턴 *.mp3 파일명 }
	 */
	
	//이현용 end
	//허진호
	//ajax 컨트롤러 예제//////////////////////////////////////////////////////////////////////////////////////////
	@RequestMapping(value = "/menu",method = RequestMethod.POST,produces ={"applcation/json;charset=utf-8" })
	@ResponseBody
	public String tmain(int s) {
		System.out.println(s);
	   return "{\"process\":\"정상적으로 저장되었습니다.\"}"; 
	}
	///////////////////////////////////////////////////////////////////////////////////////////////////////////
	//작업 공간
	@Autowired
	ChabotService service;
	
	@Autowired
	RestaurantDAO serviceDao;
	
	@RequestMapping("/chabot")
	@ResponseBody
	public String chatbot(String message) {
		String event =null;
		if(message == "") {
			event ="open";
		}else {
			event ="send";
		}
		return service.test(message,event);
	}
	
	@RequestMapping("/chabot_list")
	@ResponseBody
	public List<RestaurantVO> chabot_list(String userId) {
		int [] num = {0,10};
		ArrayList<RestaurantVO> test = (ArrayList<RestaurantVO>)serviceDao.getdistance(num);
		for(int i =  0; i<test.size();i++)
			System.out.println(test.get(i));
		return test;
	}
	
	//허진호 end
	
}
