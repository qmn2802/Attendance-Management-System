<%-- 
    Document   : timetable
    Created on : Oct 18, 2023, 11:50:42 AM
    Author     : sonnt
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

    <head>
        <title>Time Table</title>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS v5.2.1 -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
        <link rel="stylesheet" href="../css/timetableStyle.css"/>
        <style>
            .col.pt-2 p {
                margin: 0;
                padding: 0;
            }
        </style>
    </head>

    <body class="body">
        <header>
            <nav class="navbar navbar-expand-lg fixed-top" style="background-color: white; ">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#">
                        <img src="../img/logoFPT.webp" style="width: 120px;">
                    </a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="navbar-center" style="font-size: 30px; margin-left: 120px;">
                        <span>FPT University Academic Portal</span>
                    </div>

                    <form class="d-flex" role="search">
                        <table>
                            <tbody>
                                <tr>
                                    <td colspan="2"><strong>FAP mobile app (myFAP) is ready
                                            at</strong></td>
                                </tr>
                                <tr>
                                    <td><a href="https://apps.apple.com/app/id1527723314">
                                            <img src="https://fap.fpt.edu.vn/images/app-store.png"
                                                 style="width: 120px; height: 40px" alt="apple store"></a></td>
                                    <td><a href="https://play.google.com/store/apps/details?id=com.fuct">
                                            <img src="https://fap.fpt.edu.vn/images/play-store.png"
                                                 style="width: 120px; height: 40px" alt="google store"></a></td>
                                </tr>
                            </tbody>
                        </table>
                    </form>

                </div>
            </nav>
        </header>
        <!--end header-->
        <main>
            <div class="row" style="height: 60px; width: 100%; margin: 0;"></div>
            <div class="row" style="width: 100%;">

                <div class="col-1 bg-dark sidebar d-flex flex-column" style="height: 100vh; width: 120px !important; position: fixed; ">

                    <div class="sidebar-detail justify-content-center text-center mt-3">

                        <div id="" class="row">
                            <a href="">
                                <svg xmlns="http://www.w3.org/2000/svg" height="3em" fill="currentColor"
                                     class="bi bi-person-circle" viewBox="0 0 16 16">
                                <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
                                <path fill-rule="evenodd"
                                      d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
                                </svg>
                                <p>Profile</p>
                            </a>
                        </div>

                        <div class="row">
                            <a href="">
                                <svg xmlns="http://www.w3.org/2000/svg" height="3em" fill="currentColor"
                                     class="bi bi-newspaper" viewBox="0 0 16 16">
                                <path
                                    d="M0 2.5A1.5 1.5 0 0 1 1.5 1h11A1.5 1.5 0 0 1 14 2.5v10.528c0 .3-.05.654-.238.972h.738a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 1 1 0v9a1.5 1.5 0 0 1-1.5 1.5H1.497A1.497 1.497 0 0 1 0 13.5v-11zM12 14c.37 0 .654-.211.853-.441.092-.106.147-.279.147-.531V2.5a.5.5 0 0 0-.5-.5h-11a.5.5 0 0 0-.5.5v11c0 .278.223.5.497.5H12z" />
                                <path
                                    d="M2 3h10v2H2V3zm0 3h4v3H2V6zm0 4h4v1H2v-1zm0 2h4v1H2v-1zm5-6h2v1H7V6zm3 0h2v1h-2V6zM7 8h2v1H7V8zm3 0h2v1h-2V8zm-3 2h2v1H7v-1zm3 0h2v1h-2v-1zm-3 2h2v1H7v-1zm3 0h2v1h-2v-1z" />
                                </svg>
                                <p>News</p>
                            </a>
                        </div>

                        <div id="timetable" class="row">
                            <a href="">
                                <svg xmlns="http://www.w3.org/2000/svg" height="3em" viewBox="0 0 448 512">

                                <path
                                    d="M128 0c17.7 0 32 14.3 32 32V64H288V32c0-17.7 14.3-32 32-32s32 14.3 32 32V64h48c26.5 0 48 21.5 48 48v48H0V112C0 85.5 21.5 64 48 64H96V32c0-17.7 14.3-32 32-32zM0 192H448V464c0 26.5-21.5 48-48 48H48c-26.5 0-48-21.5-48-48V192zm64 80v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V272c0-8.8-7.2-16-16-16H80c-8.8 0-16 7.2-16 16zm128 0v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V272c0-8.8-7.2-16-16-16H208c-8.8 0-16 7.2-16 16zm144-16c-8.8 0-16 7.2-16 16v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V272c0-8.8-7.2-16-16-16H336zM64 400v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V400c0-8.8-7.2-16-16-16H80c-8.8 0-16 7.2-16 16zm144-16c-8.8 0-16 7.2-16 16v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V400c0-8.8-7.2-16-16-16H208zm112 16v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V400c0-8.8-7.2-16-16-16H336c-8.8 0-16 7.2-16 16z" />
                                </svg>
                                <p>Weekly timetables</p>
                            </a>
                        </div>

                        <div class="row">
                            <a href="">
                                <svg xmlns="http://www.w3.org/2000/svg" height="3em" fill="currentColor" class="bi bi-table"
                                     viewBox="0 0 16 16">
                                <path
                                    d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm15 2h-4v3h4V4zm0 4h-4v3h4V8zm0 4h-4v3h3a1 1 0 0 0 1-1v-2zm-5 3v-3H6v3h4zm-5 0v-3H1v2a1 1 0 0 0 1 1h3zm-4-4h4V8H1v3zm0-4h4V4H1v3zm5-3v3h4V4H6zm4 4H6v3h4V8z" />
                                </svg>
                                <p>Student Grading</p>
                            </a>
                        </div>

                        <div class="row">
                            <a href="">
                                <svg xmlns="http://www.w3.org/2000/svg" height="3em"
                                     viewBox="0 0 640 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                                <path
                                    d="M208 352c114.9 0 208-78.8 208-176S322.9 0 208 0S0 78.8 0 176c0 38.6 14.7 74.3 39.6 103.4c-3.5 9.4-8.7 17.7-14.2 24.7c-4.8 6.2-9.7 11-13.3 14.3c-1.8 1.6-3.3 2.9-4.3 3.7c-.5 .4-.9 .7-1.1 .8l-.2 .2 0 0 0 0C1 327.2-1.4 334.4 .8 340.9S9.1 352 16 352c21.8 0 43.8-5.6 62.1-12.5c9.2-3.5 17.8-7.4 25.3-11.4C134.1 343.3 169.8 352 208 352zM448 176c0 112.3-99.1 196.9-216.5 207C255.8 457.4 336.4 512 432 512c38.2 0 73.9-8.7 104.7-23.9c7.5 4 16 7.9 25.2 11.4c18.3 6.9 40.3 12.5 62.1 12.5c6.9 0 13.1-4.5 15.2-11.1c2.1-6.6-.2-13.8-5.8-17.9l0 0 0 0-.2-.2c-.2-.2-.6-.4-1.1-.8c-1-.8-2.5-2-4.3-3.7c-3.6-3.3-8.5-8.1-13.3-14.3c-5.5-7-10.7-15.4-14.2-24.7c24.9-29 39.6-64.7 39.6-103.4c0-92.8-84.9-168.9-192.6-175.5c.4 5.1 .6 10.3 .6 15.5z" />
                                </svg>
                                <p>Report</p>
                            </a>
                        </div>

                        <div class="row logout ">
                            <a href="">
                                <svg xmlns="http://www.w3.org/2000/svg" height="3em"
                                     viewBox="0 0 512 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                                <path
                                    d="M377.9 105.9L500.7 228.7c7.2 7.2 11.3 17.1 11.3 27.3s-4.1 20.1-11.3 27.3L377.9 406.1c-6.4 6.4-15 9.9-24 9.9c-18.7 0-33.9-15.2-33.9-33.9l0-62.1-128 0c-17.7 0-32-14.3-32-32l0-64c0-17.7 14.3-32 32-32l128 0 0-62.1c0-18.7 15.2-33.9 33.9-33.9c9 0 17.6 3.6 24 9.9zM160 96L96 96c-17.7 0-32 14.3-32 32l0 256c0 17.7 14.3 32 32 32l64 0c17.7 0 32 14.3 32 32s-14.3 32-32 32l-64 0c-53 0-96-43-96-96L0 128C0 75 43 32 96 32l64 0c17.7 0 32 14.3 32 32s-14.3 32-32 32z" />
                                </svg>
                                <p>Logout</p>
                            </a>
                        </div>
                    </div>
                </div>
                <!-- end sidebar -->
                <div class="col-1"></div>
                <div class="col-11">
                    <div class="slot-info text-center">
                        <div class="row ">
                            <div class="col-6 ">
                                <p>Group: ${requestScope.ses.group.name}</p>
                            </div>
                            <div class="col-6 ">
                                <p>Subject: ${requestScope.ses.subject.name}</p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <p>Room: ${requestScope.ses.room.rid}</p> 
                            </div>
                            <div class="col-6">
                                <p>Time Slot: ${requestScope.ses.time.description}</p>
                            </div>
                        </div>
                    </div>

                    <form action="att" method="POST">
                        <div class="table container text-center">
                            <!-- Header Row -->
                            <div class="row row-header d-flex align-items-center" style=" background-color: #ccc; height: 30px; border-bottom: 1px solid #ccc;">
                                <div class="col font-weight-bold">Student</div>
                                <div class="col font-weight-bold">Status</div>
                                <div class="col font-weight-bold">Description</div>
                                <div class="col font-weight-bold">Time</div>
                            </div>
                            <!-- Data Rows -->
                            <c:forEach items="${requestScope.atts}" var="a">
                                <div class="row d-flex align-items-center" style=" background-color: #ffffff; border-bottom: 1px solid #ccc; height: 60px;">
                                    <div class="col pt-2">
                                        <div>
                                            <p>${a.student.name} </p> 
                                            <p>${a.student.id}</p> 
                                        </div>
                                        <input type="hidden" name="stuid" value="${a.student.id}"/>
                                    </div>
                                    <div class="col">
                                        <input type="radio"
                                               <c:if test="${!a.status}">checked="checked"</c:if>
                                               name="status${a.student.id}" value="absent"> Absent
                                        <input type="radio"
                                               <c:if test="${a.status}">checked="checked"</c:if>
                                               name="status${a.student.id}" value="present"> Present
                                    </div>
                                    <div class="col ">
                                        <input type="text" class="form-control" value="${a.description}"
                                               name="description${a.student.id}" 
                                               style=" border: none; outline: none;">
                                    </div>
                                    <div class="col">
                                        ${a.datetime}
                                    </div>
                                </div>
                            </c:forEach>
                            <div class="row d-flex justify-content-end mt-3" > 
                                <input type="hidden" value="${requestScope.ses.id}" name="sesid"/>
                                <input type="submit" class="btn btn-primary" value="Save"/>
                            </div>
                        </div>

                    </form>
                </div>
            </div>
        </main>
        <footer>
            <!-- place footer here -->

        </footer>
        <!-- Bootstrap JavaScript Libraries -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
                integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous">
        </script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
                integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz" crossorigin="anonymous">
        </script>
    </body>

</html>
