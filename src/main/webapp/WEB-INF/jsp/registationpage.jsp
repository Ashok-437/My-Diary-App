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
		<div class="container">
			<div class="login-image">
				<img src="<c:url value='/images/diary.jpg'/>" height="500" width="500"/>
			</div>
			<div class="login-box">
				<div class="login-header">
					<h1>Register Here</h1>
				</div>
				<div class="login-form">
					<form action="./saveuser" method="POST">
						<label for="username">User Name :</label>
						<input type="text" id="username" name="username" class="username" requried>
						<br/>
						<label for="password">Password  :</label>
						<input type="password" id="password" name="password" class="username" requried>
						<br/>
						<button type="submit" class="button">Register</button>
					</form>
				</div>
				<div class="login-footer">
					<p>Existing user? <a href="/home">Login</a> here.</p>
				</div>
			</div>
		</div>
	</body>
</html>