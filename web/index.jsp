<%-- 
    Document   : index
    Created on : Jun 14, 2019, 9:32:52 AM
    Author     : Wattana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <%
        if (session.getAttribute("cono") == null) {
            response.sendRedirect("login.jsp");
        }
    %>



    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="assets/jQuery-3.3.1/jquery-ui.min.css">
        <link rel="stylesheet" type="text/css" href="assets/Bootstrap-3.3.7/css/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="assets/jsgrid-1.5.3/dist/jsgrid.min.css" />
        <link rel="stylesheet" type="text/css" href="assets/jsgrid-1.5.3/dist/jsgrid-theme.min.css">
        <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
        <link rel="stylesheet" type="text/css" href="assets/animate/animate.css">
        <link rel="stylesheet" type="text/css" href="assets/css-hamburgers/hamburgers.min.css">
        <link rel="stylesheet" type="text/css" href="assets/animsition/css/animsition.min.css">
        <link rel="stylesheet" type="text/css" href="assets/select2/select2.min.css">
        <link rel="stylesheet" type="text/css" href="assets/util.css">
        <link rel="stylesheet" type="text/css" href="assets/main.css">
        <script type="text/javascript" src="assets/jQuery-3.3.1/jquery-3.3.1.min.js"></script>
        <script type="text/javascript" src="assets/Bootstrap-3.3.7/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="assets/jQuery-3.3.1/jquery-ui.min.js"></script>
        <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js"></script>
        <script type="text/javascript" src="assets/jsgrid-1.5.3/dist/jsgrid.min.js"></script>
        <script src="assets/jsgrid-1.5.3/src/jsgrid.core.js"></script>
        <script src="assets/jsgrid-1.5.3/src/jsgrid.validation.js"></script>
        <script src="assets/jsgrid-1.5.3/src/jsgrid.load-indicator.js"></script>
        <script src="assets/jsgrid-1.5.3/src/jsgrid.load-strategies.js"></script>
        <script src="assets/jsgrid-1.5.3/src/jsgrid.sort-strategies.js"></script>
        <script src="assets/jsgrid-1.5.3/src/jsgrid.field.js"></script>
        <script src="assets/jsgrid-1.5.3/src/fields/jsgrid.field.text.js"></script>
        <script src="assets/jsgrid-1.5.3/src/fields/jsgrid.field.number.js"></script>
        <script src="assets/jsgrid-1.5.3/src/fields/jsgrid.field.select.js"></script>
        <script src="assets/jsgrid-1.5.3/src/fields/jsgrid.field.checkbox.js"></script>
        <script src="assets/jsgrid-1.5.3/src/fields/jsgrid.field.control.js"></script>
        <link rel="shortcut icon" href="images/icons/favicon.ico"/>
        <title>Material Request : <%out.print(session.getAttribute("comp"));%></title> 
    </head>

    <style>

        .btnsignout {
            display: inline-block;
            padding: 0px 12px;
            margin-bottom: 0;
            font-size: 14px;
            font-weight: 400;
            line-height: 1.42857143;
            text-align: center;
            white-space: nowrap;
            vertical-align: middle;
            -ms-touch-action: manipulation;
            /*            touch-action: manipulation;*/
            cursor: pointer;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            /*            user-select: none;*/
            background-image: none;
            border: 1px solid transparent;
            border-radius: 4px;
        }
        .li {
            display: none;
        }



        #nav ul {
            display: inline-block;
            list-style-type: none;
        }

        .nav{
            /*            border:1px solid #ccc;
                        border-width:auto;*/
            list-style:none;
            margin:0;
            padding:0;
            text-align:center;
            vertical-align: middle;

        }
        .nav li{
            display:inline;

        }

        .nav ul :hover {
            color: white;
            font-weight: bold;
        }
        .nav ul{
            display:none;
            color: #ffffff;
        }
        .nav a{
            display:inline-block;
            padding:10px;
            color: #ffffff;
            text-decoration:none;
        }
        .nav navbar-header{
            display:inline-block;
            padding:10px;
            color: #161637;
            text-decoration:none;
        }

    </style>

    <body style="background-color: #070c13;">

        <div style="  border-bottom:2px solid #24292F;">
            <nav id="vNavbar"   style="background-color: #070c13; height: 50px;">
                <div class="container">
                    <div  style="margin:auto;" class="navbar-header"><a style=" color: #ffffff" class="navbar-brand" href="?report=material_request">Material Request                <label id="requestname" 
                                                                                                                                                                                            style="width:auto; font-size:16px; color:#ff0000; float:right;">
                                <%
                                    String pgm = (String) session.getAttribute("pgmty");
                                    out.print(
                                            "RTN".equals(pgm) ? " : ใบเบิก"
                                            : "DPS".equals(pgm) ? " : ใบฝาก" : ""
                                    );
                                %>
                            </label></label>
                        </a><button data-toggle="collapse" class="navbar-toggle collapsed" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button></div>

                    <div class="collapse navbar-collapse" id="navcol-1">
                        <ul class="nav navbar-nav navbar-right" >
                            <li  class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true" href="./">Material Request Form&nbsp;<span class="caret"></span></a>
                                <ul class="dropdown-menu" role="menu" style=" color: #ffffff; background-color: #070c13;">
                                    <li  role="presentation"><a style=" color: #ffffff; background-color: #070c13;" class='dropdown-item' name="rental" href="?report=material_request">Requester</a></li>
                                    <li  id="DEPTHEAD" role="presentation" style=" visibility: hidden"><a style=" color: #ffffff; background-color: #070c13;" class='dropdown-item' name="rental" href="?report=material_request&status=S2&ORDID=00000000">Department Head</a></li>
                                    <!--                                    <li  role="presentation"><a style=" color: #ffffff; background-color: #070c13;" class='dropdown-item' name="rental" href="?report=material_request&status=S3&ORDID=00000000">Approval</a></li>-->

                                    <!--                                    <li  role="presentation"><a style=" color: #ffffff; background-color: #070c13;" class='dropdown-item' name="rental" href="?report=Screenmain">Screenmain</a></li>-->

                                </ul>
                            </li>



                            <li  role="presentation"><a class='dropdown-item' name="history" href="?page=history">History</a></li>
                            <!--                            <li  role="presentation"><a class='dropdown-item' name="rental" href="?report=approval_setting">Approval Setting</a></li>-->
                            <li  class="dropdown" id="storepart" style=" visibility: hidden" ><a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true" href="./">Store Approval<span class="caret"></span></a>
                                <ul class="dropdown-menu" role="menu" style=" color: #ffffff; background-color: #070c13;">
                                    <li  role="presentation"><a style=" color: #ffffff; background-color: #070c13;"class='dropdown-item' name="rental" href="?report=StorePage">Store Approval List</a></li>
                                    <li  role="presentation"><a style=" color: #ffffff; background-color: #070c13;"class='dropdown-item' name="rental" href="?report=MTRRQT_Report">Report</a></li>
                                    <li  role="presentation"><a style=" color: #ffffff; background-color: #070c13;"class='dropdown-item' name="rental" href="?report=Historycomplete">Specialty History for Store</a></li>
                                    <li  role="presentation"><a style=" color: #ffffff; background-color: #070c13;"class='dropdown-item' name="rental" href="?page=ROLLBACK">ROLLBACK</a></li>

                                    <!--                                    <li  role="presentation"><a style=" color: #ffffff; background-color: #070c13;" class='dropdown-item' name="rental" href="?report=material_request&status=S3&ORDID=00000000">Approval</a></li>-->

                                </ul>
                            </li>


                            <li  class="dropdown" id="farmpart" style=" visibility: visible" ><a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true" href="./">Admin Approval<span class="caret"></span></a>
                                <ul class="dropdown-menu" role="menu" style=" color: #ffffff; background-color: #070c13;">
                                    <li  role="presentation"><a style=" color: #ffffff; background-color: #070c13;"class='dropdown-item' name="rental" href="?report=FarmPage">Admin Approval List</a></li>
                                    <li  role="presentation"><a style=" color: #ffffff; background-color: #070c13;"class='dropdown-item' name="rental" href="?report=MTRRQT_Report_1">Report</a></li>
                                    <li  role="presentation"><a style=" color: #ffffff; background-color: #070c13;"class='dropdown-item' name="rental" href="?report=Historycompletefarm">Specialty History for Admin</a></li>
                                    <li  role="presentation"><a style=" color: #ffffff; background-color: #070c13;"class='dropdown-item' name="rental" href="?page=ROLLBACK">ROLLBACK</a></li>

                                    <!--                                    <li  role="presentation"><a style=" color: #ffffff; background-color: #070c13;" class='dropdown-item' name="rental" href="?report=material_request&status=S3&ORDID=00000000">Approval</a></li>-->

                                </ul>
                            </li>



                            <li  class="dropdown" id="PPUKREPORT" ><a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true" href="./">REPORT<span class="caret"></span></a>
                                <ul class="dropdown-menu" role="menu" style=" color: #ffffff; background-color: #070c13;">
                                    <li  role="presentation"><a style=" color: #ffffff; background-color: #070c13;"class='dropdown-item' name="rental" href="?report=REPORTPage">Report</a></li>
                                    <li  role="presentation"><a style=" color: #ffffff; background-color: #070c13;" class='dropdown-item' name="rental" href="?report=MTRRQT_Report_RTN">Report ใบเบิก</a></li>
                                    <li  id="DPSpage" role="presentation" style=" visibility: visible"><a style=" color: #ffffff; background-color: #070c13;" class='dropdown-item' name="rental" href="?report=MTRRQT_Report_DPS">Report ใบฝาก</a></li>


                                </ul>
                            </li>


                            <!--<li  role="presentation"><a style=" color: #ffffff; background-color: #070c13;"class='dropdown-item' name="rental" href="?report=TestSpeech">Test</a></li>-->


                            <li class="dropdown">
                                <a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                    <form action="Logout" method="POST">
                                        <input class="btnsignout btn-danger mb-2" type="submit" value="Sign Out">
                                    </form>
                                </a>
                            </li>

                        </ul>


                    </div><link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css" rel='stylesheet' type='text/css'>





                </div>
            </nav>
        </div>


        <section id="pages">
            <div class='centerDiv' id="vSection"></div>
        </section>


    </body>
</html>

<script type="text/javascript">


    var url = window.location.hostname;
    const queryString = window.location.search;
    const urlParams = new URLSearchParams(queryString);
    const Key = urlParams.get('status');
    const KeyID = urlParams.get('ORDID');
    const KeyUSER = urlParams.get('user');
    console.log("KKKKKKKKKKK");
//    console.log(queryString);
//    console.log(KeyID);
    console.log(KeyUSER);
    if (KeyUSER != "") {

        //alert("PP");



        //  if (session.getAttribute("cono") == null) {
        //     response.sendRedirect("login.jsp");
        // }

        //<%@ page import = " java.util.* " %>
        //<%
            // session.setAttribute("cono", "10");
            //  if (session.getAttribute("cono") == null) {
            // String url = request.getRequestURL().toString();
            //String baseURL = url.substring(0, url.length() - request.getRequestURI().length());
            // session.setAttribute("cono", "10");
            // System.out.println(url);
            //   System.out.println(baseURL);
            //     System.out.println("ccccccccccccccccccccccccc");
            // }
            //%>

    } else {

        alert("NG");
    <%        //  if (session.getAttribute("cono") == null) {
        //     response.sendRedirect("login.jsp");
        // }
    %>
    }

    <% if (request.getParameter("page") != null) {%>
    $("#vSection").load("./pages/<%=request.getParameter("page").toString()%>.jsp");
    <% }%>

    <% if (request.getParameter("report") != null) {%>
    $("#vSection").load("./reports/<%=request.getParameter("report").toString()%>.jsp");
    <% }%>



    $('.dropdown-item').on('click', function () {
//        console.log(this.name);
        $("#vSection").load("./pages/" + this.name + ".jsp");
    });
//    $.ajax({
//
//        url: './Menuitem',
//        type: 'GET',
//        dataType: 'json',
//        async: false,
//        cache: false,
//        timeout: 30000,
//        data: {page: 'EP01E'},
//        success: function (response, textStatus, xhr) {
//            for (var i = 0; i < response.length; i++) {
//                $('#menuitem').append(" <a class='dropdown-item' id='link-aa' name='" + response[i].REPORT + "' href='?page=" + response[i].REPORT + "'>" + response[i].REPORT + "</a><div class='dropdown-divider''></div>");
//            }
//            $('.dropdown-item').on('click', function () {
//                console.log(this.name);
//                $("#show1").load("./pages/" + this.name + ".jsp");
//            });
//        },
//        error: function (xhr, textStatus, errorThrown) {
//            console.log('Error in Operation');
//        }
//    });


//
    $(document).ready(function () {






        var f = "<%out.print(session.getAttribute("fac"));%>";


        //  alert(f);
        var username = "<%out.print(session.getAttribute("user"));%>";
        var st = document.getElementById("storepart");
        var fm = document.getElementById("farmpart");
        var DH = document.getElementById("DEPTHEAD");
        console.log(username);
        if (username == "PHONGS_PHO")
        {
            st.style.visibility = "Visible";
            DH.style.visibility = "Visible";
            fm.style.visibility = "Visible";

        } else {
            Checkpriority(username);
            CheckpriorityAPV(username);
            Checkpriorityfm(username);

        }
    });
    function Checkpriority(username) {
        var txt = "NG";
        $.ajax({
            url: './Action',
            type: 'GET',
            dataType: 'text',
            data: {
                path: "checkuserprio",
                username: username

            },
            async: false,
            success: function (data) {
                var st = document.getElementById("storepart");

                if (data == "OK") {

                    st.style.visibility = "Visible";
                } else {

                    st.style.visibility = "Hidden";
                }


            },
            error: function (e) {

            }
        });
        return txt;
    }


    function Checkpriorityfm(username) {
        var txt = "NG";
        $.ajax({
            url: './Action',
            type: 'GET',
            dataType: 'text',
            data: {
                path: "checkuserpriofm",
                username: username

            },
            async: false,
            success: function (data) {
                var fm = document.getElementById("farmpart");

                if (data == "OK") {

                    fm.style.visibility = "Visible";
                } else {

                    fm.style.visibility = "Hidden";
                }


            },
            error: function (e) {

            }
        });
        return txt;
    }


    function CheckpriorityAPV(username) {
        var txt = "NG";
        $.ajax({
            url: './Action',
            type: 'GET',
            dataType: 'text',
            data: {
                path: "checkuserprioAPV",
                username: username

            },
            async: false,
            success: function (data) {
                var DH = document.getElementById("DEPTHEAD");
                if (data == "OK") {

                    DH.style.visibility = "Visible";
                } else {

                    DH.style.visibility = "Hidden";
                }


            },
            error: function (e) {

            }
        });
        return txt;
    }


</script>