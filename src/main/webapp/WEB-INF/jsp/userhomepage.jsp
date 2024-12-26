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
		<div class="add-entry-button">
			<a href="./addentry"><button type="submit" class="add-button">Add Entry</button></a>
		</div>
		<div class="user-table">
			<table border="1">
				<tr>
					<th>Date</th>
					<th colspan="3">Actions</th>
				</tr>
				
				<c:if test="${entrieslist.size()==0}">
				
					<tr>	
						<td colspan="4" class="empty-list">User has not added any diary entries yet.</td>
					</tr>
				
				</c:if>
				
				
				<c:forEach items="${entrieslist}" var="e">
					<tr>
						<td>
							<fmt:formatDate value="${e.date}" pattern="dd-MM-yyyy" />
						</td>
						
						<td><a href="./viewentry?id=${e.id}" class="empty-list view-button">View</a></td>
						<td><a href="./updateentry?id=${e.id}" class="empty-list update-button">Update</a></td>
						<td><a href="./deleteentry?id=${e.id}" class="empty-list delete-button">Delete</a></td>
					</tr>
				</c:forEach>
				
						
			</table>
		</div>
	</body>
</html>