<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<html>
<head>
    <title>404 에러 발생</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
        }
        .container {
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
    	<h1>이런! ERROR 500</h1>
        <strong>요청한 페이지는 존재하지 않습니다:</strong>
        <br><br>
        주소를 올바르게 입력했는지 확인해보시기 바랍니다.<br>
         <h3><a href="/">메인페이지로 이동하기</a></h3>
    </div>
</body>
</html>
