package service.display;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import dao.DisplayDao;
import dao.MemberDao;
import model.Display;
import service.CommandProcess;

public class DpRegistResult implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		MemberDao md = MemberDao.getInstance();
		int mno = md.selectMno(id); // login된 id로 mno select
		
		Display dp = new Display();
		
		String dname = request.getParameter("dname");
		Date start_date = Date.valueOf(request.getParameter("start_date"));
		Date end_date = Date.valueOf(request.getParameter("end_date"));
		String hours = request.getParameter("hours");
		String loc = request.getParameter("loc");
		int fee = Integer.parseInt(request.getParameter("fee"));
		int discount = Integer.parseInt(request.getParameter("discount"));
		int fee_adult = Integer.parseInt(request.getParameter("fee_adult"));
		int fee_teen = Integer.parseInt(request.getParameter("fee_teen"));
		int fee_child = Integer.parseInt(request.getParameter("fee_child"));
		String intro = request.getParameter("intro");
		String tag = request.getParameter("tag");
		String artist = request.getParameter("artist");
		String tel = request.getParameter("tel");
		String home_pg = request.getParameter("home_pg");
		String deatil_txt = request.getParameter("detail_txt");
		// file upload
		String real = request.getSession().getServletContext().getRealPath("/upload");
		
		try {
			MultipartRequest mr = new MultipartRequest(request, real, "utf-8");
			String detail_img = mr.getFilesystemName("detail_img");
			String poster = mr.getFilesystemName("poster");
			
			dp.setDetail_img(detail_img);
			dp.setPoster(poster);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		// 입력받은 데이터 세팅
		dp.setDname(dname);
		dp.setStart_date(start_date);
		dp.setEnd_date(end_date);
		dp.setHours(hours);
		dp.setLoc(loc);
		dp.setFee(fee);
		dp.setDiscount(discount);
		dp.setFee_adult(fee_adult);
		dp.setFee_teen(fee_teen);
		dp.setFee_child(fee_child);
		dp.setIntro(intro);
		dp.setTag(tag);
		dp.setArtist(artist);
		dp.setTel(tel);
		dp.setHome_pg(home_pg);
		dp.setDetail_txt(deatil_txt);
		dp.setMno(mno);
		
		DisplayDao dd = DisplayDao.getInstance();
		int result = dd.insert(dp);
		
		request.setAttribute("result", result);
		
		return "dpRegistResult";
	}

}
