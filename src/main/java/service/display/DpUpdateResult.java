package service.display;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.DisplayDao;
import model.Display;
import service.CommandProcess;

public class DpUpdateResult implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int dno = Integer.parseInt(request.getParameter("dno"));

		Display dp = new Display();

		// file upload
		String real = request.getSession().getServletContext().getRealPath("/upload");
		int maxSize = 1024 * 1024 * 20; // 20MB 이미지 사이즈를 설정해줘야 함!

		try {
			MultipartRequest mr = new MultipartRequest(request, real, maxSize, "utf-8", new DefaultFileRenamePolicy());
			// 이미지 name param
			String detail_img = mr.getFilesystemName("detail_img");
			String poster = mr.getFilesystemName("poster");

			String dname = mr.getParameter("dname");
			Date start_date = Date.valueOf(mr.getParameter("start_date"));
			Date end_date = Date.valueOf(mr.getParameter("end_date"));
			String hours = mr.getParameter("hours");
			String spot = mr.getParameter("spot");
			String loc = mr.getParameter("loc");
			String address = mr.getParameter("address");
			int fee = Integer.parseInt(mr.getParameter("fee"));
			int discount = Integer.parseInt(mr.getParameter("discount"));
			int fee_adult = Integer.parseInt(mr.getParameter("fee_adult"));
			int fee_teen = Integer.parseInt(mr.getParameter("fee_teen"));
			int fee_child = Integer.parseInt(mr.getParameter("fee_child"));
			String intro = mr.getParameter("intro");
			String tag = mr.getParameter("tag");
			String artist = mr.getParameter("artist");
			String tel = mr.getParameter("tel");
			String home_pg = mr.getParameter("home_pg");
			String detail_txt = mr.getParameter("detail_txt");

			// 이미지 세팅
			dp.setDetail_img(detail_img);
			dp.setPoster(poster);

			// 입력받은 데이터 세팅
			dp.setDname(dname);
			dp.setStart_date(start_date);
			dp.setEnd_date(end_date);
			dp.setHours(hours);
			dp.setSpot(spot);
			dp.setLoc(loc);
			dp.setAddress(address);
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
			dp.setDetail_txt(detail_txt);

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		dp.setDno(dno);

		DisplayDao dd = DisplayDao.getInstance();
		int result = dd.update(dp);
		
		request.setAttribute("result", result);
		request.setAttribute("dno", dno);

		return "dpUpdateResult";
	}

}
