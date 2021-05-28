package com.teamproject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	//작업 공간
	
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
