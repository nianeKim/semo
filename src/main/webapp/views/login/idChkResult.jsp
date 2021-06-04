<!-- 이메일 인증하기 버튼 처리 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- 여기도 확인 필요 -->
<%@ page import="dao.MemberDao" %>
<%@ page import="model.Member" %>
<%@ page import="service.login.*" %>
<%@ page import="java.io.PrintWriter" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:if test="${id not empty}" > 
	String id = ${id };
</c:if>

<c:if test="${empty id}"> 
	alert("이메일을 입력하세요");
	history.back();
</c:if>

<!-- 여기부터 수정 -->
<%-- <%

if (userID == null || userPassword == null || userEmail == null) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('입력이 안 된 사항이 있습니다.');");
	script.println("history.back();");
	script.println("</script>");
	script.close();

} else {
	MemberDao md = new MemberDao();
	int result = md.join(new md(id, password, userEmail, SHA256.getSHA256(userEmail), false));
	if (result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 존재하는 아이디입니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
	} else {
		session.setAttribute("id", id);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'emailSendAction.jsp';");
		script.println("</script>");
		script.close();
	}
}

%> --%>

</body>
</html>