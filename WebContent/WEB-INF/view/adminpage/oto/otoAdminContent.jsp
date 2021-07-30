<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.text.SimpleDateFormat"%>


<main>
	<html>
<head>
<title>1:1문의</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body>
	<center>
		<b>문의내용 보기</b> <br>
		<table width="500" border="1" cellspacing="0" cellpadding="0"
			align="center">
			<tr height="30">
				<td align="center" width="125">문의번호</td>
				<td align="center" width="125" align="center">${article.num}<input
					type="hidden" name="otonum" value="${article.num}" /></td>
				<td align="center" width="125">문의상태</td>
				<td align="center" width="125" align="center">
					<c:if test="${article.readcount > 0 && article.re_level > 0}">
						<b>문의답변</b>
					</c:if> 
					<c:if test="${article.readcount > 0 && article.re_level == 0}">
						<b>문의확인</b>
					</c:if> 
					<c:if test="${article.readcount == 0 && article.re_level == 0}">
						<b>문의대기</b></td>
					</c:if>
				</td>
			</tr>
			<tr height="30">
				<td align="center" width="125">작성자</td>
				<td align="center" width="125" align="center">${article.writer}</td>
				<td align="center" width="125">작성일</td>
				<td align="center" width="125" align="center">${article.reg_date}</td>
			</tr>

			<tr height="30">
				<td align="center" width="125">문의제목</td>
				<td align="center" width="125" align="center">${article.subject}</td>
				<td align="center" width="125">휴대폰번호</td>
				<td align="center" width="125" align="center">${article.ph}</td>
			</tr>
			<tr>
				<td align="center" width="125">문의내용</td>
				<td align="left" width="375" colspan="3"><pre>${article.content}</pre></td>
			</tr>
			<tr height="30">
				<td colspan="4" align="right">
					<input type="button" value="문의삭제"
					onclick="document.location.href='/jejuguseok/adminpage/deleteForm.do?num=${num}&otonum=${article.otonum}&pageNum=${pageNum}&re_level=${article.re_level}'">
					<input type="button" value="답변쓰기"
					onclick="document.location.href='/jejuguseok/adminpage/write.do?num=${num}&ref=${ref}&re_step=${re_step}&re_level=${re_level}'">
					<input type="button" value="문의목록"
					onclick="document.location.href='/jejuguseok/adminpage/list.do?pageNum=${pageNum}'">
				</td>
			</tr>
		</table>
</body>
	</html>
</main>
</div>
