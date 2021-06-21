package service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BdSaveDao;
import service.CommandProcess;

public class BdSaveDelete implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String[] str = request.getParameterValues("bs_no");
		int[] bs_no = new int[str.length];
		
		for(int i = 0; i<str.length; i++){
			bs_no[i] = Integer.parseInt(str[i]);
		}

		BdSaveDao bsd = BdSaveDao.getInstance();
		int result = bsd.deleteList(bs_no);
		
		request.setAttribute("result", result);
		
		return "bdSaveDelete";
	}
}
