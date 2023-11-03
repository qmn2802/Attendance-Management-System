<%-- 
    Document   : timetable
    Created on : Oct 18, 2023, 11:50:42 AM
    Author     : sonnt
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
        <style>
            .custom-table {
                position: relative;
                width: 100%;
                height: 100%;
                margin-top: 10px;
            }
            .custom-body {
                position: absolute;
                top: 60px; /* Điều chỉnh vị trí của thẻ con bằng các thuộc tính top, left, right, bottom */
                left: 0;
                width: 100%;
                height: 100%;
            }
            .session {
                padding: 10px;
                width: 160px;
            }
            .session-detail {
                background-color: #d1ffe6;
                border-radius: 5px;
            }
            .session-detail p {
                display: block;
                margin: 0px;
            }
            .slots {

            }
            .slots, .session-detail {
                height: 120px;
            }
            .dates-background {
                border-radius: 5px;
                height: 800px;
                background-color: #fff1f8;
            }
            .dates, .date-day {
                width: 160px;
                text-align: center;
                padding: 5px;
            }
            .date-day p{
                font-size: 25px;
                margin-bottom: 0px;
            }
            .input-date {
                display: flex;
                justify-content: center;
                padding: 20px;
                /*                width: 1000px;*/
            }
            .input-date button {
                margin: 0 20px 0 20px;
            }
        </style>
        <script>

            function autoSubmit() {
                document.getElementById("yearForm").submit();
            }

        </script>
    </head> 
    <body>
        <form id="yearForm" action="timetable" method="GET" class="input-date">
            <input type="hidden" value="${param.id}" name="id"/>
            <button name="btnWeek" type="submit" value="false" >
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-left" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
                </svg>
            </button>



            <label for="year">Year:</label>
            <select name="year" id="year" onchange="autoSubmit()">
                <option value="2023" <c:if test="${param.year == '2023'}">selected="selected"</c:if>>2023</option>
                <option value="2022" <c:if test="${param.year == '2022'}">selected="selected"</c:if>>2022</option>
                <option value="2021" <c:if test="${param.year == '2021'}">selected="selected"</c:if>>2021</option>
                </select>

                <label for="selectedWeek">Week</label> 
                <select name="selectedWeek" id="selectedWeek" onchange="autoSubmit()">
                    <option value="${requestScope.currentWeek}" >${requestScope.currentWeek}</option>
                <c:forEach items="${requestScope.weeks}" var="week">

                    <option value="${week}" >${week}</option>
                </c:forEach>
            </select>

            <button name="btnWeek" type="submit" value="true">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" 
                     class="bi bi-chevron-right" viewBox="0 0 16 16" name="nextWeek" >
                <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
                </svg>
            </button> <br>
        </form>


        <div class="container">
            <div class="row" style="width: 1300px;">
                <div class="col col-md-12">
                    <div class="custom-table">
                        <div class="custom-header">

                            <div class="row days">
                                <div class="col col-md-1"></div>
                                <div class="col col-md-1 date-day">
                                    <p>Monday</p>
                                </div>
                                <div class="col col-md-1 date-day">
                                    <p>Tuesday</p>
                                </div>
                                <div class="col col-md-1 date-day">
                                    <p >Wednesday</p>
                                </div>
                                <div class="col col-md-1 date-day">
                                    <p >Thursday</p>
                                </div>
                                <div class="col col-md-1 date-day">
                                    <p >Friday</p>
                                </div>
                                <div class="col col-md-1 date-day">
                                    <p >Saturday</p>
                                </div>
                                <div class="col col-md-1 date-day">
                                    <p >Sunday</p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col col-md-1"></div>
                                <c:forEach items="${requestScope.dates}" var="d">
                                    <div class="col col-md-1 dates " >
                                        <fmt:formatDate value="${d}" pattern="MM-dd" var="formattedDate" />
                                        <p>${formattedDate}</p>
                                        <div class="dates-background">

                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>

                        <div class="custom-body">
                            <c:forEach items="${requestScope.slots}" var="s">
                                <div class="row custom-row" style="margin-top: 50px;">
                                    <div class="col col-md-1 slots">
                                        <p>${s.description}</p>
                                    </div>

                                    <div class="col col-md-7" style="align-items: center">

                                        <div class="row " style="width: 1200px;">
                                            <c:forEach items="${requestScope.dates}" var="d">
                                                <div class="col col-md-1 session">
                                                    <c:forEach items="${requestScope.sessions}" var="ses">
                                                        <c:if test="${ses.time.id eq s.id and ses.date eq d}">
                                                            <div class="session-detail" >
                                                                <a href="att?id=${ses.id}" style="text-decoration: none">
                                                                    <p class="group">${ses.group.name}</p> 
                                                                    <p class="subject-name">- ${ses.subject.name}</p>
                                                                    <p class="room">at ${ses.room.rid}</p>
                                                                </a>
                                                                <c:if test="${ses.isAtt}">(attended)</c:if>
                                                                <c:if test="${!ses.isAtt}">(Not yet)</c:if>
                                                                </div>
                                                        </c:if>
                                                    </c:forEach>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
                integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous">
        </script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
                integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz" crossorigin="anonymous">
        </script>
    </body>
</html>
