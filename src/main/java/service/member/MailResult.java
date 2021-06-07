package service.member;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.SimpleEmail;

import service.CommandProcess;

public class MailResult implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String to =request.getParameter("id");  
		String subject = "세모전 회원가입 인증 메일";
		
		
		//인증 난수 발생 코드
		Random random = new Random();
		String key=""; //인증번호
		
		for(int i=0; i<3; i++) {
			int index = random.nextInt(25)+65; //A~Z까지 랜덤 알파벳 생성
			key+=(char)index;
		}
		int numIndex = random.nextInt(9999)+1000; //4자리 랜덤 정수 생성
		key+=numIndex;		
		String msg = (String)key;  //메시지 내용 함수입력
		
		SimpleEmail se = new SimpleEmail();
		se.setHostName("smtp.naver.com");
		se.setSmtpPort(465);  
		se.setAuthenticator(new DefaultAuthenticator("kny09280", "qlqjs2skdus2"));
		try {
			se.setSSLOnConnect(true);
			se.addTo(to);
			se.setFrom("kny09280@naver.com");
			se.setSubject(subject);
			se.setMsg("인증번호 : " + msg);
			se.send(); //메일 전송
			request.setAttribute("msg", "인증메일이 전송되었습니다");
		} catch (Exception e) {
			System.out.println("에러"+e.getMessage());
			request.setAttribute("msg", "인증메일 전송이 실패했습니다. 다시 시도해주세요");
		}
		return "mailResult";
	}


}
