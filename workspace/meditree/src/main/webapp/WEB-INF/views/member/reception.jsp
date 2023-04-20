<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reception</title>
<style>
    #main{
        display: grid;
        grid-template-columns: 1fr 8fr;
    }
    #board{
        display: flex;
        align-items: center;
        justify-content: center;

    }
    #board #reception-holder{
        width: 55%;
        height: 90%;
        display: flex;

    }
    .reception-form{
        display: grid;
        grid-template-rows: 1.2fr 1fr;
        width: 100%;
        height: 100%;
        border: 1px solid black;
        margin-right: 30px;
 
    }
    .reception-btn{
      box-sizing: border-box;
      width: 90%;
      margin: 10px;
      padding: 5px;
    }

      table {
        /* margin: auto; */
	    border-collapse: separate;
        width: 100%;
        height: 90%;
	  }
      th{
        border-bottom: 1px solid black;
      }
	  td {
          width: 100px;
	    /* border: 1px solid black; */
        text-align: center;

	  }
      select{
        width: 100%;
      }
      textarea{
        box-sizing: border-box;
        width: 100%;
      }

</style>
</head>
<body>
    <div id="wrap">
        <%@ include file="/WEB-INF/views/common/common.jsp" %>
        <div id="main">
            <%@ include file="/WEB-INF/views/common/commonSidebar.jsp" %>
            <div id="board">
                <div id="reception-holder">
                    <div class="reception-form">
                        <form id="form1" action="#" method="post">
                            <table>
                                <th colspan="6">환자접수</th>
                                <tr>
                                    <td>인적정보</td>
                                    <td></td>
                                    <td><button type="button" class="reception-btn">환자조회</button></td>
                                    <td><button type="button" class="reception-btn">환자등록</button></td>
                                </tr>
                                <tr>
                                    <td>이름</td>
                                    <td colspan="3"></td>
                                </tr>
                                <tr>
                                    <td>주민번호</td>
                                    <td colspan="3"></td>
                                </tr>
                                <tr>
                                    <td>최조내원일</td>
                                    <td></td>
                                    <td>최근내원일</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>최근진료과</td>
                                    <td colspan="3"></td>
                                </tr>
                                <tr>
                                    <td>메모</td>
                                    <td colspan="3"></td>
                                </tr>
                            </table>
                        </form>
                        <form id="form2" action="#" method="post">
                            <table>
                                <th colspan="6">접수정보</th>
                                <tr>
                                    <td>진료과</td>
                                    <td>
                                        <select>
                                            <option value="#" selected>선택</option>
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>
                                        </select>
                                    </td>
                                    <td>교수</td>
                                    <td>
                                        <select>
                                            <option value="#" selected>선택</option>
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>
                                        </select>                                    
                                    </td>
                                </tr>
                                <tr>
                                    <td>증상</td>
                                    <td colspan="3"><textarea name="" id="" cols="30" rows="10"></textarea></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td colspan="2"><button type="button" class="reception-btn">접수</button></td>
                                    <td></td>
                                </tr>
                            </table>
                        </form>
                    </div>
                    <div class="reception-form">
                        <form action="#" method="post">
                            <table>
                                <th colspan="6">진료관리</th>
                                <tr>
                                    <td colspan="2"><button type="button" class="reception-btn">진료대기</button></td>
                                    <td colspan="4">
                                        <select name="" id="">
                                            <option value="#" selected>전체</option>
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>전체 <input type="checkbox"></td>
                                    <td>순번</td>
                                    <td>이름</td>
                                    <td>성별</td>
                                    <td>나이(만)</td>
                                    <td>진료과</td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox"></td>
                                    <td>#</td>
                                    <td>#</td>
                                    <td>#</td>
                                    <td>#</td>
                                    <td>#</td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox"></td>
                                    <td>#</td>
                                    <td>#</td>
                                    <td>#</td>
                                    <td>#</td>
                                    <td>#</td>

                                </tr>
                                <tr>
                                    <td><input type="checkbox"></td>
                                    <td>#</td>
                                    <td>#</td>
                                    <td>#</td>
                                    <td>#</td>
                                    <td>#</td>
                                </tr>
                                <tr>
                                    <td colspan="6">
                                        <button type="button">상태변경</button>
                                    </td>
                                </tr>
                            </table>
                        </form>
                        <form action="#" method="post">
                            <table>
                                <th colspan="5">
                                    진료 중 환자
                                </th>
                                <tr>
                                    <td colspan="2"><button type="button" class="reception-btn">진료중</button></td>
                                    <td colspan="3">
                                        <select name="" id="">
                                            <option value="#" selected>전체</option>
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>순번</td>
                                    <td>이름</td>
                                    <td>성별</td>
                                    <td>나이</td>
                                    <td>진료과</td>
                                </tr>
                                <tr>
                                    <td>#</td>
                                    <td>#</td>
                                    <td>#</td>
                                    <td>#</td>
                                    <td>#</td>
                                </tr>
                                <tr>
                                    <td>#</td>
                                    <td>#</td>
                                    <td>#</td>
                                    <td>#</td>
                                    <td>#</td>
                                </tr>
                                <tr>
                                    <td>#</td>
                                    <td>#</td>
                                    <td>#</td>
                                    <td>#</td>
                                    <td>#</td>
                                </tr>
                                <tr>
                                    <td>#</td>
                                    <td>#</td>
                                    <td>#</td>
                                    <td>#</td>
                                    <td>#</td>
                                </tr>
                            </table>
                        </form>
                    </div>
                </div>
            </div>
        </div>


    </div>


</body>
</html>