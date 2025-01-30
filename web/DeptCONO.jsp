<%-- 
    Document   : DeptCONO.jsp
    Created on : Apr 20, 2023, 8:35:58 AM
    Author     : Phongsathon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

//
    <%
            if (request.getParameter("ORDID") != null) { 
                session.setAttribute("user", request.getParameter("user"));
                session.setAttribute("cono", request.getParameter("CONO"));
                session.setAttribute("comp", request.getParameter("CONO"));

                if (request.getParameter("CONO").equalsIgnoreCase("10")) {
                    session.setAttribute("divi", "101");
                }
                else if (request.getParameter("CONO").equalsIgnoreCase("100")){
                    session.setAttribute("divi", "110");
                }
                 else if (request.getParameter("CONO").equalsIgnoreCase("200")) {
                    session.setAttribute("divi", "200");
                }
                 else if (request.getParameter("CONO").equalsIgnoreCase("300")){
                    session.setAttribute("divi", "300");
                }
                 else if (request.getParameter("CONO").equalsIgnoreCase("400")) {
                    session.setAttribute("divi", "400");
                }
                 else if(request.getParameter("CONO").equalsIgnoreCase("500")) {
                    session.setAttribute("divi", "500");
                }
                 else if (request.getParameter("CONO").equalsIgnoreCase("600")){
                    session.setAttribute("divi", "600");
                }
            

            
            response.sendRedirect("/MaterialRequest?report=material_request&status=S2&ORDID=" + request.getParameter("ORDID") + "");

        }
//
//            session.setAttribute("cono", "10");
////            response.sendRedirect("/MaterialRequest?report=material_request");
//            response.sendRedirect("/MaterialRequest?report=material_request&status=S2&ORDID=00000000");
//
////            session.setAttribute("cono", "10");
////            response.sendRedirect("?report=material_request&status=S2&ORDID=00000000");
//        } else {
//
//            response.sendRedirect("/MaterialRequest?report=material_request&status=S2&ORDID=00000000");
//
//        }
    %>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>

    </head>
    <body>
        <h1>Bypass</h1>
        <form class="login100-form validate-form" action="ddeptcono" method="POST">

            <input type="text" id="ID" name ="ID" />
            <input type="text" id="username" name ="username" />

            <input type="submit" /> 

        </form>
    </body>
</html>

<script>

//
//    $(document).ready(function () {
//
//
//    });

    $(document).ready(function () {

        const queryString = window.location.search;
        const urlParams = new URLSearchParams(queryString);
        const Keyusername = urlParams.get('username');
        const KeyID = urlParams.get('ORDID');
        document.getElementById("ID").value = KeyID;
        document.getElementById("username").value = Keyusername;

        alert(KeyID);
        console.log(queryString);

    });


</script>
