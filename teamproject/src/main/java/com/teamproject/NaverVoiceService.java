package com.teamproject;

//네이버 음성합성 Open API 예제
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Date;

import org.springframework.stereotype.Service;

import com.teamproject.NaverService;

@Service("chatbotvoiceService")
public class NaverVoiceService implements NaverService {
	public String test(String image) {//voiceinput 에서 speaker 정보 미선택시 호출
		return test(image,"mijin"); 
	}
	public String test(String responsetext , String speaker) {
	 // 텍스트 --> *.mp3,200,400,500, 
	 String returnfile = null;
     String clientId = "u1u8soc8ja";//애플리케이션 클라이언트 아이디값";
     String clientSecret = "QVmLZMfbh2l8yE7pieSVUPmWHctO9kkve8Bo8I7a";//애플리케이션 클라이언트 시크릿값";
     
     try {
         String text = URLEncoder.encode(responsetext, "UTF-8"); // 13자
         
         
         
         //clova voice 선택 진짜 주소 
         String apiURL = "https://naveropenapi.apigw.ntruss.com/tts-premium/v1/tts"; 
         //clova premium voice  짭 230에러코드 발생 
         //String apiURL = "https://naveropenapi.apigw.ntruss.com/voice/v1/tts";
         URL url = new URL(apiURL);
         HttpURLConnection con = (HttpURLConnection)url.openConnection();
         con.setRequestMethod("POST");
         con.setRequestProperty("X-NCP-APIGW-API-KEY-ID", clientId);
         con.setRequestProperty("X-NCP-APIGW-API-KEY", clientSecret);
         // post request
         String postParams = 
         "speaker="+speaker+"&volume=0&speed=0&pitch=0&format=mp3&text=" + text;
         con.setDoOutput(true);
         DataOutputStream wr = new DataOutputStream(con.getOutputStream());
         wr.writeBytes(postParams);
         wr.flush();
         wr.close();
         int responseCode = con.getResponseCode();
         BufferedReader br;
         System.out.println(responseCode);
         if(responseCode==200) { // 정상 호출
             InputStream is = con.getInputStream();
             int read = 0;
             byte[] bytes = new byte[1024];
             // 랜덤한 이름으로 mp3 파일 생성
             String tempname = Long.valueOf(new Date().getTime()).toString();
             
             File f = new File("C:/Users/Maple/Desktop/images/"+ tempname + ".mp3");
             returnfile = tempname + ".mp3";
             f.createNewFile();
             OutputStream outputStream = new FileOutputStream(f);
             while ((read =is.read(bytes)) != -1) {
                 outputStream.write(bytes, 0, read);
             }
             is.close();
         } else {  // 오류 발생
             br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
             String inputLine;
             StringBuffer response = new StringBuffer();
             while ((inputLine = br.readLine()) != null) {
                 response.append(inputLine);
             }
             br.close();
             System.out.println(response.toString());
         }
     } catch (Exception e) {
         System.out.println(e);
     }
     return returnfile;
 }
}
