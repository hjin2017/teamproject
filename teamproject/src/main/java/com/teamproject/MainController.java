package com.teamproject;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import jakarta.xml.bind.DatatypeConverter;
@Controller
public class MainController {

	@RequestMapping("/teamprc")
	public String imagetest() {
		return "/main";
		
	}
	
	//김세미
	
	  @Autowired StudentDAO stddao;
	  @Autowired AttendDAO attdao;
	  
	  //student test
	  @RequestMapping("/studentlist") 
	  @ResponseBody public List<StudentVO> student_list() { 
		  List<StudentVO> test = (List<StudentVO>)stddao.getAllStudent();
		  for(int i = 0; i<test.size();i++) {
			  System.out.println(test.get(i) +"\n");
		  }
		  return test; 
	  }
		 
	 
	  //attend test
	  @RequestMapping("/test2")
	  @ResponseBody public List<AttendVO> selectTodayAttend(String name) {//변수줘야함
		  List<AttendVO> test2 = (List<AttendVO>)attdao.confirmTodayAttend(name);
		  System.out.println(test2); 
		  System.out.println(test2.getClass().getName());
		  return test2; 
	  }
		 
	
		//attend test2
	  @RequestMapping(value="/test3", method=RequestMethod.GET) 
	  public ModelAndView test3(String name) { 
		  ModelAndView mv = new ModelAndView(); 
		  AttendVO todayAttend = attdao.confirmTodayAttend(name); //[AttendVO [id=null, attdate=null, status=0]]
		  mv.addObject("todayAttend",todayAttend);
		  System.out.println(todayAttend.getClass().getName());
		  mv.setViewName("/ksm/test"); 
		  return mv; 
	  }
		 
	//img src넣어지는지 확인 
	@RequestMapping(value="/chkUpdate")
	@ResponseBody
	public void test(StudentVO student) {
		  File file = new File("../image"); 
		  String[] files = file.list();
		  
		  System.out.println("Listing contents of " + file.getPath()); 
		  for(int i=0 ; i< files.length ; i++) 
		  { System.out.println(files[i]); }

		//System.out.println(student);
		String data = student.getImg().split(",")[1];
		//System.out.println(data);
		byte[] imageBytes = DatatypeConverter.parseBase64Binary(data);
		
		try {
			BufferedImage bufImg = ImageIO.read(new ByteArrayInputStream(imageBytes));
			ImageIO.write(bufImg, "png", new File("../image/"+student.getName()+".png"));
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			System.out.println("실패");
		}
		
		System.out.println("성공");
		
		//stddao.updateImg(student);
		
	}
	
	
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
		 * File file = new File("../"); String[] files = file.list();
		 * 
		 * System.out.println("Listing contents of " + file.getPath()); for(int i=0 ; i<
		 * files.length ; i++) { System.out.println(files[i]); }
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
	@Autowired
	MemberDAO serviceMemberDao;
	
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
		/*
		 * for(int i = 0; i<test.size();i++) System.out.println(test.get(i));
		 */
		return test;
	}
	
	@RequestMapping("/sing_up")
	public String sing_up() {
		return "/hjh/sing_up";
	}
	
	@RequestMapping("/hjh_join")
	@ResponseBody
	public String hjh_join(String id, String addr,String name,int phon,String pass) {
		MemberVO vo = new MemberVO(0,phon, 0, id,name,addr,pass,"");
		System.out.println(vo);
		 return "{\"process\":\"정상적으로 저장되었습니다.\"}"; 
	}
	
	//허진호 end
	
}
