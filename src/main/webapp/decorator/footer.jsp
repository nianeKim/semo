<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="deco" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">	
	@import url("../css/fonts.css");
	@import url("../css/reset.css");
	
	/* body{
		position: relative;
	}  */
	
	.outer	{
		display: flex;
  		align-items: center;
 		justify-content: center;
		width: 100%;
		height: 265px;
		position: absolute;
		bottom: 0;
		
	}
	
	.inner {
		height: 134px;
		margin: auto;
		font-size: 14px;
		font-weight: 300;
		font-stretch: normal;
		font-style: normal;
		line-height: normal;
		letter-spacing: normal;
		text-align: center;
		color: #000000;
		margin-top: auto;
	}
	
	 .footer_logo {
		width: 153px;
		height: 91px;
		margin-bottom: 16px;
	}
</style>
</head>
<body>
	<div class="contents_imsi" style="width:100%; height:1500px">
	</div>
	
	<footer class="outer">
		<div class="inner">
			<img class="footer_logo" alt="" src="../images/logo.svg" width="153px" height="91px" >
			<p>© 2021, semojeon. All Rights Reserved.</p>
		</div>
	</footer>
</body>
</html>