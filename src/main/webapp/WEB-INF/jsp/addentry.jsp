<%@ taglib prefix="c" uri="jakarta.tags.core" %>
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
				<form action="./saveentry" method="POST">
					
					<input type="date" name="date" id="date" class="username" required>
					<br/>
					
					<textarea id="discription" rows="10" cols="30" name="discription" class="discription" placeholder="Write your diary entry here..." required></textarea>
					<input type="hidden" name="userid" value="${user.id}">
					<br/>
					<button type="submit" class="add-button">Add Entry</button>
				</form>
			</div>
		</div>
	</body>
</html>