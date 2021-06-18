package service.member;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.MemberDao;
import model.Member;
import service.CommandProcess;

public class UpdateResult implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		//member 생성
		Member member = new Member();
				
		//프로필 파일 업로드
		String real = request.getSession().getServletContext().getRealPath("/upload");
		int maxSize = 1024 * 1024 * 2;
		
		String id = null;
		
		try {
			MultipartRequest mr = new MultipartRequest(request, real, maxSize, "utf-8", new DefaultFileRenamePolicy());
			id = mr.getParameter("id");
			String password=mr.getParameter("password");
			String name=mr.getParameter("name");
			String nick_nm=mr.getParameter("nick_nm");
			String phone=mr.getParameter("phone");
			String gender = mr.getParameter("gender");
			String loc = mr.getParameter("loc");
			int age = Integer.parseInt(mr.getParameter("age"));
			String profile = mr.getFilesystemName("profile");
			
			//member에 수정내용 세팅
			
			member.setId(id);
			member.setPassword(password);
			member.setName(name);
			member.setNick_nm(nick_nm);
			member.setPhone(phone);
			member.setGender(gender);
			member.setLoc(loc);
			member.setAge(age);
			member.setProfile(profile);
			
		} catch (IOException e) {
			System.out.println("에러:" + e.getMessage());
		}
		
		
		//세션에서 id 가져옴
		HttpSession session = request.getSession();
		id = (String)session.getAttribute("id");
		
		//memberDao 생성 및 update
		MemberDao md = MemberDao.getInstance();
		int result = md.update(member);
		request.setAttribute("id", id);
		request.setAttribute("result", result);
		
		return "updateResult";
	}

}
