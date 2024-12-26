<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

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
		<div class="add-entry">
			
			<div class="add-entry-card">
				<h1 class="update-entry-heading">Update Entry</h1>
				<form action="./processupdateentry" method="POST">
					
					<input type="date" id="date" name="date" class="username" value="${entry.date}">
					<br/>
					
					<textarea id="discription" rows="10" cols="30" name="discription" class="discription" placeholder="Write your diary entry here..." required>${entry.discription}</textarea>

					<input type="hidden" name="userid" value="${user.id}">
					<input type="hidden" name="id" value="${entry.id}">
					<br/>
					<button type="submit" class="add-button update-button">Update Entry</button>
				</form>
			</div>
		</div>
	</body>
</html>