<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <c:set var="root" value="${pageContext.request.contextPath}" scope="page"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <style>    
    body{
    -ms-overflow-style: none;
    }
    
    ::-webkit-scrollbar {
    display: none;
    }
    .wrap{
        height: 100vh;
    }
    header{
        height: 20%;
        text-align: center;
        box-sizing: border-box;
        margin-top: 100px;
    }
    img{
        width: 180px; height: 100%;
    }
    form{
        width: 70%;
        margin: auto;
        /* height: fit-content; */
        box-shadow: 10px 180px 75px rgba(0, 0, 0, 0.01), 40px 80px 60px rgba(0, 0, 0, 0.05), 5px 47px 47px rgba(0, 0, 0, 0.09), 5px 12px 26px rgba(0, 0, 0, 0.1), 0px 0px 0px rgba(0, 0, 0, 0.1);
        border-radius: 26px;
        padding-top: 70px;
        padding-left: 250px;
        padding-right: 250px;
        padding-bottom: 90px;
    }
    label {
    color: lightgray;
    }
    input{
        height: 50px;
        width: 100%;
    }
    #login{
        text-align: center;
    }
    #login h2{
        font-weight: 900;
        color: #82CBC4;
    }
    footer{
        height: 100px;
    }

    </style>
</head>

<body>
    <div class="wrap">
        <header>
            <img src="${root}/resources/img/mediLogo.jpg" alt="로고이미지">
        </header>
        <main>
            <form action="${root}/member/login" method="post">
                <div id="login">
                    <h2>LOGIN</h2>            <br>
                </div>
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" name="no"  placeholder="99999999">
                    <label for="floatingInput">사번을 입력해주세요</label>
                  </div>
                  <div class="form-floating">
                    <input type="password" class="form-control" name="pwd" placeholder="Password">
                    <label for="floatingPassword">비밀번호를 입력해주세요</label>
                    <br>
                </div>
                <div>
                    <input class="btn btn-primary" type="submit" value="로그인" style="background-color: #82CBC4;">
                </div>
            </form>
        </main>
        <footer>

        </footer>
    </div>

    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>