<%-- 
    Document   : index
    Created on : Jun 13, 2019, 4:29:51 PM
    Author     : Wattana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<style>

    input {
        outline: none;
        border: none;
    }

    button {
        outline: none !important;
        border: none;
        background: transparent;
    }

</style>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="assets/Bootstrap-3.3.7/css/bootstrap.min.css"/>
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
        <script src="assets/animsition/js/animsition.min.js"></script>
        <script src="assets/Bootstrap-3.3.7/js/popper.js"></script>
        <script src="assets/Bootstrap-3.3.7/js/bootstrap.min.js"></script>
        <script src="assets/select2/select2.min.js"></script>
        <script src="assets/countdowntime/countdowntime.js"></script>
        <script src="assets/main.js"></script>
        <link rel="shortcut icon" href="images/icons/favicon.ico"/>
        <title>Material Request Login</title>
    </head>

    <body>

        <div class="limiter">
            <div class="container-login100">
                <div class="wrap-login100">
                    <form class="login100-form validate-form" action="Login" method="POST">
                        <img src="images/duck.jpg" class="center-block" width="180" height="180" alt="duck"/>
                        <br/>
                        <h4>Login Material Request</h4>
                        <br/>
                        <div class="wrap-input100 validate-input">
                            <input class="input100" type="text" name="username" id="vUsername" placeholder="Username">
                        </div>

                        <div class="wrap-input100 validate-input">
                            <input class="input100" type="password" name="password" id="vPassword" placeholder="Password">
                        </div>

                        <% String user = (String) session.getAttribute("user"); %>


<!--                        <div class="form-group">
                            <select class="form-control form-control-user" name="pgmtype" id="vPgmtype">
                                <option value="">-- กรุณาเลือก --</option>
                                <option value="MTR">Material Request (โอน/ตัดค่าใช้จ่ายสินค้า)</option>
                                <option value="RTN" >Requisition (ใบเบิกสินค้า)</option>
                                <option value="DPS" >Deposit (ใบฝากสินค้า)</option>

                            </select>
                        </div>-->

<div class="form-group">
    <select class="form-control form-control-user" name="pgmtype" id="vPgmtype">
        <option value="">-- กรุณาเลือก --</option>
        <option value="MTR" selected>Material Request (โอน/ตัดค่าใช้จ่ายสินค้า)</option>
        <option value="RTN">Requisition (ใบเบิกสินค้า)</option>
        <option value="DPS">Deposit (ใบฝากสินค้า)</option>
    </select>
</div>

                     

                        <div class="form-group">
                            <select class="form-control form-control-user" name="company" id="vCompany"  onchange="Location(this.value)">
                                <option value="" selected="selected">Select Company</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <select class="form-control form-control-user" name="vFac" id="vFac">
                            </select>
                        </div>




                        <div class="row container col-md-12" style="font-size: 13px; width: 280px;">
                            <div style="width: 140px;">
                                <a href="http://192.200.9.189:8080/UserRequest/?Destination=PResetPW"><li style="color: blue;"><u>Reset Password</u></li></a>  
                            </div>  
                        </div>

                        <div class="form-group">
                            <div style="width: 140px;">
                                <a href="#" onclick="window.open('http://192.200.9.189:8080/MaterialRequest/คู่มือการใช้งานโปรแกรม_Material_Request.pdf', '_blank', 'fullscreen=yes'); return true;" ><li style="color: blue;"><u>คู่มือการใช้งานโปรแกรม_Material_Request</u></li></a>        
                            </div>  
                        </div>
                        <p style="color: red">${msg}</p>
                        <div class="container-login100-form-btn">
                            <div class="wrap-login100-form-btn">
                                <div class="login100-form-bgbtn"></div>
                                <button class="login100-form-btn">Login</button>
                            </div>
                        </div>

                    </form>
                </div>
            </div>
        </div>

    </body>
</html>

<script>



    $(document).ready(function () {

//                  location.replace("http://192.200.9.94:8080/MaterialRequest/login.jsp");

//      location.replace("http://192.200.9.251:8080/MaterialRequest/login.jsp");



    <% System.out.println("Path : " + request.getContextPath());%>

        $.ajax({
            type: 'GET',
            dataType: 'json',
            url: './Action',
            data: {
                path: "getCompany"
            },
            success: function (getdata) {
                console.log(getdata);
                console.log(getdata.data);
                $.each(getdata, function (i, obj) {
                    var div_data = "<option value=" + obj.COMPANY + ">" + obj.CCCONO + " : " + obj.CCDIVI + " : " + obj.CCCONM + "</option>";
                    console.log(div_data);
                    $(div_data).appendTo('#vCompany');

                });
            }
        });

    });




    function Location(val) {
        //alert(val);
        console.log("xxx");




        let text = val;
        const myArray = text.split(":");
        let cono = myArray[0];
        let divi = myArray[1];
        $("#location").empty();
        $.ajax({
            type: 'GET',
            dataType: 'json',
            url: './Action',
            data: {
                path: "GetFAC",
                CONO: cono,
                DIVI: divi
            },
            success: function (getdata) {

                // เคลียร์ข้อมูลเก่าทั้งหมดใน #vFac
                $('#vFac').empty();

                if (getdata.length === 0) {
                    // ถ้า getdata ไม่มีข้อมูล ให้เพิ่ม option "-" ลงไป
                    $('#vFac').append("<option value='-'>-</option>");
                } else {
                    // ถ้ามีข้อมูลใน getdata
                    $.each(getdata, function (i, obj) {


                        var div_data = "<option value='" + obj.CFFACI + "'>" + obj.CFFACN + "</option>";
                        $('#vFac').append(div_data);  // เพิ่มข้อมูลใหม่
                    });
                }
            }



        });

//
//var div_data = "<option value='xxxx'>xxx</option>";
//                    $(div_data).appendTo('#vFac');
//    }

        console.log("xxx");


    }
</script>
