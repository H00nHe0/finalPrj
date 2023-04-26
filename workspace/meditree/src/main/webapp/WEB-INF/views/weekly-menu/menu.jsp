<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식단표</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<style>
    #main{
        display: grid;
        grid-template-columns: 1fr 8fr;
    }
    #content{
    	width: 80%;
    	margin: 30px auto auto auto;
    	
    }
    #content table {
    	text-align: center;
    	margin-top: 20px; 
    }
</style>
</head>
<body>
    <div id="wrap">
        <%@ include file="/WEB-INF/views/common/common.jsp" %>

        <div id="main">
            <%@ include file="/WEB-INF/views/common/commonSidebar.jsp" %>
                <div id="content">
                <select class="form-select">
                	<option>환자식</option>
                	<option>직원식</option>
                </select>
					<table class="table">
						<thead>
							<tr class="table-success">
								<th></th>
								<th>월</th>
								<th>화</th>
								<th>수</th>
								<th>목</th>
								<th>금</th>
								<th>토</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th class="table-success">조식</th>
								<td>
									쌀밥<br>
									미역국<br>
									시금치무침<br>
									배추김치<br>
									계란찜<br>
									가지조림
								</td>
								<td>
									쌀밥<br>
									미역국<br>
									시금치무침<br>
									배추김치<br>
									계란찜<br>
									가지조림
								</td>
								<td>
									쌀밥<br>
									미역국<br>
									시금치무침<br>
									배추김치<br>
									계란찜<br>
									가지조림
								</td>
								<td>
									쌀밥<br>
									미역국<br>
									시금치무침<br>
									배추김치<br>
									계란찜<br>
									가지조림
								</td>
								<td>
									쌀밥<br>
									미역국<br>
									시금치무침<br>
									배추김치<br>
									계란찜<br>
									가지조림
								</td>
								<td>
									쌀밥<br>
									미역국<br>
									시금치무침<br>
									배추김치<br>
									계란찜<br>
									가지조림
								</td>
							</tr>
							<tr>
								<th class="table-success">중식</th>
								<td>
									쌀밥<br>
									미역국<br>
									시금치무침<br>
									배추김치<br>
									계란찜<br>
									가지조림
								</td>
								<td>
									쌀밥<br>
									미역국<br>
									시금치무침<br>
									배추김치<br>
									계란찜<br>
									가지조림
								</td>
								<td>
									쌀밥<br>
									미역국<br>
									시금치무침<br>
									배추김치<br>
									계란찜<br>
									가지조림
								</td>
								<td>
									쌀밥<br>
									미역국<br>
									시금치무침<br>
									배추김치<br>
									계란찜<br>
									가지조림
								</td>
								<td>
									쌀밥<br>
									미역국<br>
									시금치무침<br>
									배추김치<br>
									계란찜<br>
									가지조림
								</td>
								<td>
									쌀밥<br>
									미역국<br>
									시금치무침<br>
									배추김치<br>
									계란찜<br>
									가지조림
								</td>
							</tr>
							<tr>
								<th class="table-success">석식</th>
								<td>
									쌀밥<br>
									미역국<br>
									시금치무침<br>
									배추김치<br>
									계란찜<br>
									가지조림
								</td>
								<td>
									쌀밥<br>
									미역국<br>
									시금치무침<br>
									배추김치<br>
									계란찜<br>
									가지조림
								</td>
								<td>
									쌀밥<br>
									미역국<br>
									시금치무침<br>
									배추김치<br>
									계란찜<br>
									가지조림
								</td>
								<td>
									쌀밥<br>
									미역국<br>
									시금치무침<br>
									배추김치<br>
									계란찜<br>
									가지조림
								</td>
								<td>
									쌀밥<br>
									미역국<br>
									시금치무침<br>
									배추김치<br>
									계란찜<br>
									가지조림
								</td>
								<td>
									쌀밥<br>
									미역국<br>
									시금치무침<br>
									배추김치<br>
									계란찜<br>
									가지조림
								</td>
							</tr>
						</tbody>
					</table>

            </div>
        </div>
    </div>

</body>
</html>