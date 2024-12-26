<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>MyDiary App Homepage</title>
	    <link rel="stylesheet" href="<c:url value='/css/style.css'/>">
	</head>
	<body>
		<div class="header">
			<div class="first">
				<img src="<c:url value='/images/diary.jpg'/>" height="60" width="60"/>
			</div>
			<div class="second">
				<h1>MY DIARY</h1>
			</div>
		</div>
		<div class="header2">
			<h1 class="user-name">Welcome ${user.username}</h1>
			<a href="./signout" class="sign-out">Sign out</a>
		</div>
		<div class="display-container">
			<h1 class="display-entry-heading">View Entry</h1>
			


			<c:choose>
				<c:when test="${not empty entry}">
					<div class="display-entry-discription-card">
						<fmt:formatDate value="${entry.date}" pattern="dd-MM-yyyy" />
						<p class="display-entry-discription">${entry.discription}</p>
					</div>
				</c:when>
				<c:otherwise>
					<p class="display-entry-discription">No entry found.</p>
				</c:otherwise>
			</c:choose>
			
			
			
			<a href="./userhome"><button type="submit" class="add-button">Back</button></a>
		</div>
	</body>
</html>