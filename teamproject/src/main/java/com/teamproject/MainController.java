package com.teamproject;

import java.io.File;
import java.io.IOException;

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
		File f = new File("C:/Users/Maple/Desktop/images"); 
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
		String savePath = "C:/Users/Maple/Desktop/images/";
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
		for(int i =  0; i<10;i++)
		System.out.println(serviceDao.getAllRestautant().get(i));
		if(message == "") {
			event ="open";
		}else {
			event ="send";
		}
		return service.test(message,event);
	}
	
	//허진호 end
	
}
