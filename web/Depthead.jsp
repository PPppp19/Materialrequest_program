<%-- 
    Document   : material_request
    Created on : Oct 26, 2022, 4:02:44 PM
    Author     : Phongsathon
--%>

<%@page import="java.util.Locale"%>
<%@page import="java.time.Instant"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.chrono.ThaiBuddhistChronology"%>
<%@page import="java.util.TimeZone"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.css" />
<link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid-theme.min.css" />
<script type="text/javascript" src="/test/wp-content/themes/child/script/jquery.jcarousel.min.js"></script>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.js"></script>
<!DOCTYPE html>
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
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
    <link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.css" />
    <link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid-theme.min.css" />

    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.js"></script>

    <link rel="shortcut icon" href="images/icons/favicon.ico"/>
    <title>Material Request : <%out.print(session.getAttribute("comp"));%></title> 
</head>
<style>


    .hide
    {
        display:none;
    }



    label {
        color: #ffffff;
        font-weight: bold;

    }




    #myInput {
        box-sizing: border-box;
        background-image: url('searchicon.png');
        background-position: 14px 12px;
        background-repeat: no-repeat;
        font-size: 16px;
        padding: 14px 20px 12px 45px;
        border: none;
        border-bottom: 1px solid #ddd;
    }

    #myInput:focus {
        outline: 3px solid #ddd;
    }

    .dropdown {
        position: relative;
        display: inline-block;
    }

    .dropdown-content {

        position: absolute;
        background-color: #f6f6f6;
        min-width: 230px;
        overflow: auto;
        border: 1px solid #ddd;
        z-index: 1;
    }

    .dropdown-content a {
        color: black;
        padding: 12px 16px;
        text-decoration: none;
        display: block;
    }

    .dropdown a:hover {
        background-color: #ddd;
    }

    .show {
        display: block;
    }


    .collapsible {
        background-color: red;
        color: white;
        cursor: pointer;
        padding: 18px;
        width: 250px;
        height: 40px;
        border: none;
        text-align: center;
        outline: none;
        font-size: 15px;
        border: 2px solid white;
        display: inline-flex;
        align-items: center;

    }


    .active, .collapsible:hover {
        background-color: #555;
    }


    .content {
        padding: 0 18px;
        display: none;
        /*display: block;*/
        overflow: hidden;
        background-color: #f1f1f1;
    }


    .ui-autocomplete {
        max-height: 200px;
        overflow-y: auto;
        /* prevent horizontal scrollbar */
        overflow-x: hidden;
        /* add padding to account for vertical scrollbar */
        padding-right: 20px;
    }



    .centerDiv
    {
        width: 100%;
        height:100%;
        margin: 0 auto;

    }
    .divleft
    {
        width: 33%;
        height:300px;
        float:left;
        /*background-color: #2e3135;*/
    }
    .divcenter
    {
        width: 34%;
        height:300px;
        float:left;
        /*          background-color: #2e3135;*/
    }
    .divright
    {
        width: 33%;
        height:300px;
        float:left;
        /*background-color: #2e3135;*/
    }



    .img-wrap {
        position: relative;
        display: inline-block;
        border: 1px red solid;
        font-size: 0;
    }
    .img-wrap .close {
        position: absolute;
        top: 2px;
        right: 2px;
        z-index: 100;
        background-color: #FFF;
        padding: 5px 2px 2px;
        color: #000;
        font-weight: bold;
        cursor: pointer;
        opacity: .2;
        text-align: center;
        font-size: 22px;
        line-height: 10px;
        border-radius: 50%;
    }
    .img-wrap:hover .close {
        opacity: 1;
    }



    .header {
        padding: 60px;
        text-align: center;
        /*        background: #070c13;*/
        background: #19bfde;
        color: white;
        font-size: 30px;
        height: 180px;
        background-image: linear-gradient(#6f8aff, #19bfde);

        /*        background-image: linear-gradient(#2b838e, #99cdf3);*/
        /*        border-top-left-radius:10px;*/
        /*        border-top-right-radius:10px;*/
        border-bottom-left-radius: 20% 50%;




        /*        border-top-left-radius:10px;
                border-top-right-radius:10px;*/

    }


    .wrap-login100 {
        width: auto;
        height: auto;
        background: #ffffff;
        border-radius: 10px;
        overflow: hidden;
        padding: 30px 55px 33px 55px;
        box-shadow: 0 5px 10px 0px rgba(0, 0, 0, 0.1);
        -moz-box-shadow: 0 5px 10px 0px rgba(0, 0, 0, 0.1);
        -webkit-box-shadow: 0 5px 10px 0px rgba(0, 0, 0, 0.1);
        -o-box-shadow: 0 5px 10px 0px rgba(0, 0, 0, 0.1);
        -ms-box-shadow: 0 5px 10px 0px rgba(0, 0, 0, 0.1);
    }

    .container {
        /*width: 970px;*/
        text-align: -webkit-center;
    }
    /*.jsgrid-edit-row>.jsgrid-cell {
      background-color: transparent;
      color: white;
    }*/

    /*  
     .jsgrid-row>.jsgrid-cell {
      background-color: #2e3135;
      color: white;
    }*/

    /* alternate rows */
    /*.jsgrid-alt-row>.jsgrid-cell {
      background-color: #2A2C2F;
      color: white;
    }*/

    .jsgrid-header-row>.jsgrid-header-cell {
        /*background-color: #0080ff;*/
        /*        background-image: linear-gradient(#2b838e, #99cdf3);*/
        background-image: linear-gradient(#6f8aff, #19bfde);

        /*font-family: "Roboto Slab";*/
        font-size: 1.2em;
        color: white;
        font-weight: normal;
        align-content: center;
        text-align: center;
        align-self: center;
    }

    .jsgrid-grid-body{

        color: #161637;
        text-align: center;
    }



    .center {
        display: flex;
        justify-content: left;
        align-items: left;
        height: auto;
        width: auto;
        background: #ffffff;
        /*border: 1px solid #6f6fff;*/
    }
    .frame {
        display: flex;
        justify-content: center;
        align-items: center;
        height: auto;
        width: auto;

    }



    .img_wrp {
        display: inline-block;
        position: relative;

    }
    .close {
        position: absolute;
        top: 0;
        right: 0;
    }


    input::placeholder {
        font-weight: bold;

        opacity: 0.5;
        color: #ffffff;
    }


    .select{
        background-color:  #2e3135;
        color: #cdcece;
        border-radius: 4px;
        text-align: center;


    }



</style>

<div class="container">
    <!--    <div class="wrap-login100" >-->

    <form name="Mail" id="Mail" method="GET" action="./sendmail"  >
        <br>

        <header class="header"  >

            <!--                <h5 style="margin-top: 0; color: #161637; padding-top: 0;" align="right">Material Request </h5>-->
            <h2 align="center";  style=" color: #ffffff; font-weight: bold"><%out.print(session.getAttribute("comp"));%> </h2>
            <label id="ordernumtxt">No. </label>
            <label id="ordernum">00000000</label>
            <div align="left">
                <select class="select" id="vState" style="visibility: hidden; background-color: #555; color: white;">
                    <option value="State1">Requester</option>
                    <option value="State2">Department Head</option>
                    <option value="State3">Approver</option>
                </select> 
            </div>
            <input id="company" style=" color: black;" type="hidden" name="company" value="<%out.print(session.getAttribute("cono"));%>" />
            <br>

            <hgroup>  
                &nbsp; &nbsp;
                <input style=" color: black;" type="hidden" id="ordernumpp" name="ordernumpp"  />
                <input style=" color: black;" type="hidden" id="status" name="status" value="S1" />
            </hgroup>

        </header>




        <div class="details-form-field">
            <br>

            <label id="movextxt" style="  width: auto; height: 30%; font-size: 16px; float:left; color: #ffffff" >Requester : </label>
            <label id="movexno" name="movexno" style=" visibility: hidden; width: 1%; height: 30%; color: #ffffff;font-size: 16px; float:left;" />

            <label id="usename" style="  width: auto; height: 30%; font-size: 16px; float:left; color: #ffffff" ><%out.print(session.getAttribute("user"));%></label>



        </div>

        <div class="details-form-field">


            <button  id="searchbtn" onclick = "load();" style=" visibility: hidden; float:right; width: 12%; height: 30px; color: white; background-color: #2c2c96; border-color: white;" class="btn btn-primary" type="button"  aria-expanded="false" aria-controls="collapseExample">
                SEARCH
            </button>

            <!--            <input  
            
                            style="  border-radius: 25px;    width: 60%;
                            background-image: url('http://i47.tinypic.com/r02vbq.png');
                            background-repeat: no-repeat;
                            background-position: left center;
                            height: 25px;
                            background: transparent;
                            color: white;
                            margin: 0 auto;
                            text-align: center;
                            border: none; /* <-- This thing here */
                            border:solid 2px #404345;
            
                            float:right; width: 20%; height: 30px; margin-bottom: 100;"
                            placeholder="Search Here"
                            type="text" id="ssearch" name="ssearch"/> -->


            <input  

                style="  border-radius: 25px;    width: 60%;
                background-image: url('http://i47.tinypic.com/r02vbq.png');
                background-repeat: no-repeat;
                background-position: left center;
                height: 25px;
                background: transparent;
                color: white;
                margin: 0 auto;
                text-align: center;
                border: none; /* <-- This thing here */
                border:solid 2px #404345;
                float:right; width: 20%; height: 30px; margin-bottom: 100;"
                placeholder="Search Here" 
                autocomplete="off"
                type="text" id="ssearch" name="ssearch" value=""/> 



            <!--              <input class="form-control" list="orderidlist" autocomplete="off" placeholder="OrderID" id="MRNO" name="MRNO" value="">
                                    <datalist id="orderidlist"> </datalist>
            -->





        </div>
        <br>
        <br>
        <br>


        <div id="bodyzone" style="   outline: 20px solid #141a23;  background: #141a23; border-radius: 10px; "> 


            <div align="left" class="details-form-field" >

                <label style="width: 10%;">Requested By :</label>

                <label id="creatortxt"  style="color: #ABB2B9; font-weight: normal;"> ------- &nbsp; &nbsp; </label> 
                <input style=" color: black; " type="hidden" id="username" name="username" value="<%out.print(session.getAttribute("user"));%>" />
                <input style=" color: black; " type="hidden" id="cono" name="cono" value="<%out.print(session.getAttribute("cono"));%>" />
                <input style=" color: black; " type="hidden" id="divi" name="divi" value="<%out.print(session.getAttribute("divi"));%>" />


                <label style=" width: 10%;">Cost Center :</label>
                <select class="select" style=" width: 20%; background-color: #2e3135;" name="vPeriod"  id="vPeriod">
                    <option value="" selected="selected">Select Department </option>
                </select> &nbsp;&nbsp;
                <input style=" color: black;" type="hidden" id="vdpm" name="vdpm" value="<%  request.getParameter("vPeriod");  %>" />



                <label>Department Name :</label>
<!--                <%out.print(session.getAttribute("cono"));%> &nbsp;&nbsp;-->
                <label id="Dname" style=" width: 15%"/>

                <!--                <label>Date : </label>-->
                <input   style="  border: none; /* <-- This thing here */
                         /*                       margin: 0 auto;*/
                         border:solid 2px #404345;
                         background-repeat: no-repeat;
                         background-position: left center;
                         border-radius: 10px;
                         color-scheme: dark;

                         background: transparent; color: #FFFFFF;
                         float:right; margin-right: 60px; width: 10%" type="date" class="forfloat:leftm-control text-center "  id="vDate" name="vDate" >
                <%

//                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy", Locale.US);
                    sdf.setTimeZone(TimeZone.getTimeZone("GMT"));

                    String date = sdf.format(new Date());

                %>




<!--                <input style=" color: black;" type="text" id="xdate" name="xdate" value="<%=date%>" />-->


                <input  style=" color: black;" type="hidden" id="date" name="date" value="<%=date%>"  />

            </div>



            <!----- Log in Signature Modal -----> 


            <div class="modal fade"  id="exampleModal" tabindex="-1" data-backdrop= "false" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" >
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header" style="background-color: #636366;">
                            <h5 class="modal-title" id="exampleModalLabel" style=" border-radius: 5px; color: #f2f2f7">Signature Login</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">

                            <label for="lbcustomer_name">User Name:</label>
                            <input type="text" id="cname" name="cname" value="<%out.print(session.getAttribute("user"));%>" disabled="true"> 

                            <br>
                            <!--                            <label for="lbcustomer_name">Password:</label>
                                                        <input type="text" id="makingplace" name="makingplace">-->



                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="button"  id="btn_login" class="btn btn-primary" data-dismiss="modal" >Log in</button>
                        </div> 
                    </div>
                </div>
            </div>

            <!---------------------------------->
            <div style="float: left " >

                <div align="left">    
                    <p style=" color: #161637; font-weight: bold;">Type :</p>
                    <input type="radio" id="radiotypeexp" name="radiotype" value="71">
                    <input style=" color: black;" type="hidden" id="radiotype" name="radiotype" value="<% request.getParameter("radiotype"); %>" />

                    <label for="expense">For Expense (ค่าใช้จ่าย)</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  

                    <label  for="fwhs">From Warehouse</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <label  for="twhs">To Warehouse</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <label  for="age2">Location</label>


                </div>
                <div align="left">
                    <input type="radio" id="radiotypetrn" name="radiotype" value="33">
                    <label for="age2">For Stock Transfer (คงคลัง)</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  

                    <select class="select"  name="period"  id="vFwarehouse"  style=" width: 155px" >
                        <option value="" selected="selected">Select Department </option>
                    </select>&nbsp;&nbsp;
                    <select  class="select" name="period"  id="vTwarehouse"  style=" width: 155px" >
                        <option value="" selected="selected">Select Department </option>
                    </select>&nbsp;&nbsp;
                    <input type="text" id="fname" style=" width: 20%; background-color: #2e3135; color: #cdcece; text-align: center; border-radius: 4px; border: none;
                           border:solid 1px #cdcece;" name="fname">

                </div>   

            </div>

            <!--            <button type="button" class="collapsible" id="searchbtn" style=" width:  250px; height: 40px">SEARCH</button><br>
                        <button type="button" class="collapsible"  >SAVE</button><br>-->

            <!--            <input style="width: 20%; height: 30px; margin-bottom: 100;" type="text" id="ssearch" name="ssearch"/> 
                        <button   onclick = "fun();"  style=" width: 20%; height: 40px; color: white; background-color: #555; border-color: white;" class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                            SAVE
                        </button>-->
            <br>



            <div align="left">
                <button id="Resend"   onclick = "resend();"  style=" visibility: hidden; width: 20%; height: 30px; color: white; background-color: red; border-color: white;" class="btn btn-danger" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                    Resend E-mail
                </button>

                <button   onclick = "fun();"  style=" width: 18%; height: 30px; color: white; background-color: #0080ff;" class="btn btn-primary" type="button" " data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                    SAVE
                </button>
                <button type="submit" id="SendRejectMail1" name="SendAppMail"   value="SendRejectMail" style=" width: 13%; " class="btn btn-danger mb-2" style="color:#FFFFFF; visibility:hidden;" >Cancel</button>




                <div style="clear:both;"></div>
                <br>
            </div>


            <!-- 
             <div class="center">
                  
              <div style="float: left " >
                      
                    <div  style="float: left ">
                        <div>
                        <label>Item Code</label><br>
                        <input type="text" id="pin" name="pin" size="12">&nbsp;&nbsp;
                        </div>
                        
                    </div>
                    
                    <div  style="float: left ">
                        <div>
                        <label>Description</label><br>
                        <input type="text" id="pin" name="pin" size="15">&nbsp;&nbsp;
                        </div>
                        
                    </div>
            
                    <div  style="float: left ">
                        <div>
                        <label>Unit</label><br>
                        <input type="text" id="pin" name="pin" size="5">&nbsp;&nbsp;
                        </div>
                        
                    </div>
                  
                    <div  style="float: left" >
                        <div>
                        <label>Qty Req</label><br>
                        <input type="text" id="pin" name="pin" size="5">&nbsp;&nbsp;
                        </div>
                        
                    </div>
                  
                  <div style="float: left ">
                        <div>
                            <label><br></label><br>
                         <button class="btn btn-primary mb-2" style="color:#FFFFFF; height: 25px;text-align: center; line-height: 12px;" form="detailsForm" name="report" value="Submit"type="submit">Add Item</button>
                         <button class="btn btn-primary mb-2" style="color:#FFFFFF; height: 25px;text-align: center; line-height: 12px;" form="detailsForm" name="report" value="Submit"type="submit">Search Item</button>       
            
                        </div>
                        
                    </div>
              </div>
                   <div style="clear:both;"></div>     
              </div>-->

            <div class="collapse" id="collapseExample" >
                <div class="card card-body">

                    <div class="center">
                        <div  id="Jsgrid"></div>
                    </div>



                    <br> 
                    <div>
                        <label style="text-align:left;
                               float:left;">Purpose</label>
                        <div style="clear:both;"></div> 

                        <div>
                            <textarea id="mypparea" rows="5" style=" background-color: #2e3135; border-radius: 4px; color: #9fa7ae; outline: 1px solid #55575a; ;
                                      box-sizing:border-box;
                                      height: 100%;
                                      width: 99%; " ></textarea>
                        </div>
                    </div>




                    <br>


                    <!-- set1 -->
                    <div class="centerDiv">




                        <div class="divleft" id="rqby"> <!-- Reqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq -->
                            <label style="text-align:left;
                                   float:left;">Requested By</label>               
                            <div style="clear:both;"></div>      


                            <div style="width: 100%;  background:  #2e3135; height: 300px;">                    
                                <br>   
                                <!-- Signature todo -->
                                <br>
                                <select   name="xxxx"  id="xxxx" style=" visibility: hidden" >
                                    <option value="" selected="selected">Select Department Head1</option>
                                </select>  

                                <div class="frame" id="frame" style=" width: auto;">
                                    <div id="image_div" class="img_wrp">
                                        <img class="close" width="25" height="25" id="imgclose" style=" visibility: visible"  src="https://cdn4.iconfinder.com/data/icons/ionicons/512/icon-close-1024.png" />
                                    </div>
                                </div>
                                <div>
                                    <label>Date/Time : </label>
                                    <label id="rqdate" >-</label>


                                </div>




                                <div>
                                    <button class="btn btn-primary mb-2" style=" background-color: #16b4f2; outline: 1px solid #ffffff; color:#FFFFFF;" form="detailsForm" name="report" value="Submit"type="button" data-toggle="modal" data-target="#exampleModal" id = "btn_openmodal">Log in</button>
                                </div>
                            </div>
                            <div style="clear:both;"></div>

                            <br>
                        </div>


                        <div class="divleft" id="dpmhd"> <!-- Reqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq -->
                            <label style="text-align:left;
                                   float:left;">Department Head</label>               
                            <div style="clear:both;"></div>      

                            <div id="sigf" style="width: 100%;background:  #2e3135;  padding:1% 0 1% 1%;  height: 300px;">                    
                                <br>
                                <br>
                                <select  class="select" name="vhead"  id="vhead" >
                                    <option value="00" selected="selected">Select Department Head </option>
                                </select>   
                                <!-- Signature todo -->
                                <br>
                                <div class="frame" id="frame2" style=" width: auto">
                                    <div id="image_div2" class="img_wrp">
                                        <img class="close" width="25" height="25" id="imgclose2" style=" visibility: hidden"  src="https://cdn4.iconfinder.com/data/icons/ionicons/512/icon-close-1024.png" />
                                    </div>
                                </div>
                                <div id="rqdate2txt" >
                                    <label>Date/Time : </label>
                                    <label id="rqdate2" >-</label>


                                </div>


                                <div>
                                    <button  class="btn btn-primary mb-2" style="color:#FFFFFF;" form="detailsForm" name="report" value="Submit"type="button" data-toggle="modal" data-target="#exampleModal" id = "btn_openmodal2">Log in</button>
                                </div>
                            </div>
                            <div style="clear:both;"></div>

                            <br>
                        </div>

                        <div id="isby" class="divleft"> <!-- Reqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq -->
                            <label style="text-align:left;
                                   float:left;">Issued By</label>               
                            <div style="clear:both;"></div>      


                            <div style="width: 100%; background:  #2e3135; padding:1% 0 1% 1%; border-top:1px solid black; border-bottom: 1px solid black; border-right: 1px solid black; height: 300px;">                    
                                <br>   
                                <!-- Signature todo -->
                                <br>
                                <select  name="vhead"  id="xxxx" style=" visibility: hidden" >
                                    <option value="" selected="selected">Select Department Head3 </option>
                                </select>   
                                <div class="frame" id="frame3" style=" width: auto">
                                    <div id="image_div3" class="img_wrp">
                                        <img class="close" width="25" height="25" id="imgclose3" style=" visibility: hidden"  src="https://cdn4.iconfinder.com/data/icons/ionicons/512/icon-close-1024.png" />
                                    </div>
                                </div>
                                <div>
                                    <label>Date/Time : </label>
                                    <label id="rqdate3" >-</label>


                                </div>


                                <div>
                                    <button class="btn btn-primary mb-2" style="color:#FFFFFF;" form="detailsForm" name="report" value="Submit"type="button" data-toggle="modal" data-target="#exampleModal" id = "btn_openmodal3">Log in</button>
                                </div>
                            </div>
                            <div style="clear:both;"></div>

                            <br>
                        </div>







                        <!--                        <div class="divcenter"> Reqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq 
                                                    <label style="text-align:left;
                                                           float:left;">Store Dept. Only</label> 
                                                    <div style="clear:both;"></div>         
                                                    <div style=" background: wheat; width: 100%; height: 300px;">
                                                        <br>
                                                        <br>
                                                        <br>
                                                        <button class="btn btn-primary mb-2" style="color:white; background: red;" form="detailsForm" name="report" value="Submit"type="button" data-toggle="modal" data-target="#exampleModal" id = "btn_openmodal">Issue Stock</button>
                                                        <br>
                                                    </div>           
                                                    <br>
                                                </div>-->

                        <!--                          <div class="divcenter"> Reqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq 
                                                    <label style="text-align:left;
                                                           float:left;">Store Dept. Only</label> 
                                                    <div style="clear:both;"></div>         
                                                    <div style=" background: wheat; width: 100%; height: 300px;">
                                                        <br>
                                                        <br>
                                                        <br>
                                                        <button class="btn btn-primary mb-2" style="color:white; background: red;" form="detailsForm" name="report" value="Submit"type="button" data-toggle="modal" data-target="#exampleModal" id = "btn_openmodal">Issue Stock</button>
                                                        <br>
                                                    </div>           
                                                    <br>
                                                </div>-->





                        <!--                        <div class="divright"> Reqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq                 
                                                    <label style="text-align:left;
                                                           float:left;">Movex Order No.</label>
                                                    <div style="clear:both;"></div> 
                        
                                                    <div  style=" background: whitesmoke; width: 100%; height: 300px;">
                                                        <label>Test Details </label>
                        
                                                    </div>
                                                    <br>         
                                                </div>  -->





                    </div>
                    <div style="clear:both;"></div>   





                    <br>
                    <br>
                    <br>
                    <br>
                    <!-- set2 --> 
                    <!--                    <div class="centerDiv">
                    
                    
                    
                    
                    
                    
                    
                                            <div class="divleft"> Reqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq                     
                                                var vType = document.querySelector('input[name="radiotype"]:checked').value
                                                <div>
                                                    <label style="text-align:left;
                                                           float:left;">Issued By</label>
                                                </div>
                                                <div style="clear:both;"></div>
                                                <br>
                                                <div  style=" background: whitesmoke;  width: 100%; height: 300px;">
                                                    <br>
                                                    <div>
                                                        <select  name="vhead"  id="vhead" >
                                                            <option value="" selected="selected">Select Department Head </option>
                    
                                                        </select> 
                                                    </div>
                    
                                                    <div>
                                                        <select name="Cars" onclick="remove();" size=10 id="mySelect" style=" width: 200px; overflow: hidden;">
                                                        </select>
                                                    </div>
                    
                    
                                                    <div>
                                                        <label>Date/Time : </label>
                    <%
                        SimpleDateFormat sdf1 = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                        String date1 = sdf1.format(new Date());
                    %>
                    <%=date1%>
                </div>
            </div>
            <br>
        </div>






        <div id="aaa" class="divcenter"> Reqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq 
            <label style="text-align:left;
                   float:left;"> Issued By</label>
            <div style="clear:both;"></div> 
            <br>
            <div  style=" background: whitesmoke;  width: 100%; height: 300px;" >
                <br>
                <div>
                    <textarea rows="11" style=" background: white; border: 1px solid black;
                              box-sizing:border-box;
                              " ></textarea>
                </div>
                <div>

                    <label>Date/Time : </label>
                    <%
                        SimpleDateFormat sdf3 = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                        String date3 = sdf3.format(new Date());
                    %>
                    <%=date3%>

                </div>
            </div>
            <br>   
        </div>





    </div>           -->
                    <div style="clear:both;"></div>   





                </div>
            </div>





            <!---- end of  table ----> 




            <!--<div class="demo">  
                <div class="ui-widget">    
                <label for="tags">Tags: </label>    
                <input id="tags">
                </div>
            </div>-->












            <button type="submit" id="SendReturnMail" name="SendAppMail"   value="SendReturnMail" style=" width: 15%; visibility: hidden; " class="btn btn-primary mb-2" style="color:#FFFFFF;" >Return</button>
            <button type="submit" id="SendRejectMail" name="SendAppMail"   value="SendRejectMail" style=" width: 15%; visibility: hidden; " class="btn btn-danger mb-2" style="color:#FFFFFF;" >Cancel</button>

            <!--            <button onclick="sendmail()" style=" width: 15%; "class="btn btn-danger" class="btn btn-primary mb-2" style="color:#FFFFFF;" form="detailsForm" name="report" value="Reject"type="button" id="Reject" >Reject</button>-->
            <br> 
            <br>
            <br>
            <br>
            <button type="submit" class="btn btn-primary mb-2" style=" background-color: #0080ff; width: 20%; height: 10%; outline: 1px solid #ffffff;" onclick="return sendmail();"   id="SendAppMail" name="SendAppMail"   value="SendAppMail"  >Submit</button>
            <br>
            <br>
            <br> 
            <br>

            <!--<button type="button" class="btn btn-primary mb-2" onclick="sendtom3()" id="sendtom3" name="sendtom3"   value="sendtom3"  >Post to M3</button>-->



            <!--            <button  type="submit" id="SendAppMail" name="SendAppMail"   value="SendtoM3" style=" width: 15%; height: 30%; color: white; background-color: red; border-color: white;" class="btn btn-primary">
                            Send to M3
                        </button>-->

            <!--            <button onclick="sendtom3result();" type="button" id="sendtom3" name="sendtom3"   value="sendtom3" style=" width: 15%; height: 30%; color: white; background-color: red; border-color: white;" class="btn btn-primary">
                            Send to M3
                        </button>-->
            <!--
                        <button   onclick = "sendtom3result();"  style=" width: 25%; height: 30px; color: white; background-color: #555; border-color: white;" class="btn btn-primary" type="button" " data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                        </button>-->



            <!--    <form align="center">
                    <hr class="my-4">
                    <div>
                        <button class="btn btn-primary mb-2" style="color:#FFFFFF;" form="detailsForm" name="report" value="MO_Report" type="submit">PDF</button>
                        <button onclick="sendmail()" style=" width: 15%; " class="btn btn-primary mb-2" style="color:#FFFFFF;" form="detailsForm" name="report" value="Return"type="button" id="Return" >Return</button>
                        <button onclick="sendmail()" style=" width: 15%; " class="btn btn-danger" style="color:#FFFFFF;" form="detailsForm" name="report" value="Reject"type="button" id="Reject" >Reject</button>
                        <br>
                        <br>
                        <button type="submit" class="btn btn-primary mb-2" id="SendAppMail" name="SendAppMail"   value="SendAppMail"  >Submit</button>
                                <button  style=" width: 30%; " class="btn btn-primary mb-2" style="color:#FFFFFF;" form="detailsForm" id="SendAppMail" name="SendAppMail"   value="SendAppMail" type="submit" >Submit</button>
            
                    </div>
                </form> -->




        </div>
</div>
<!--</div>-->

<!--<div id="jsGrid"></div>-->


<script>

    $(document).ready(function () {


        load();
//        Callloadgrid();




    });



    function Callloadgrid() {

        $("#Jsgrid").jsGrid({
            width: "100%",
            height: "auto",
            filtering: true,
            inserting: false,
            editing: true,
            sorting: true,
            paging: true,
            autoload: true,
            pageSize: 5,
//                pageButtonCount: 5,
            controller: {
                loadData: function (filter) {
                    var data = $.Deferred();
                    $.ajax({
                        type: 'GET',
                        dataType: 'json',
                        url: './Action',
                        data: {
                            path: "getItemcode",
                            whs: whs,
                            check: "true"

                        },
                        async: false
                    }).done(function (response) {

                        console.log(response);

//                        console.log("click to show value");
//                        console.log(response);
//                        console.log("click to show value");
//                        response = $.grep(response, function (item) {
//                            return (!filter.MMITNO || (item.MMITNO.indexOf(filter.MMITNO) > -1));
//                        });
//                        data.resolve(response);
                    });
                    return data.promise();
                },
                updateItem: function (item) {


                }
            },
            fields: [
                {name: "MMCONO", type: "text", width: 150, editing: false},
                {name: "ITEM", type: "text", width: 150, editing: false},
                {name: "MMITNO", type: "text", width: 150, editing: false},
                {name: "MMITDS", type: "text", width: 150, editing: false},
                {name: "MMUNMS", type: "text", width: 150, editing: false},
                {name: "QTY_REG", type: "text", width: 150},
                {type: "control", width: 30, deleteButton: false, css: "blue-cell"}

            ]
        });


    }

    function load() {

        const queryString = window.location.search;
        const urlParams = new URLSearchParams(queryString);
        var Keyordid = urlParams.get('ORDID');
        var Keyuser = urlParams.get('user');

//        var ordernum = document.getElementById('ordernum');
//        var rj = document.getElementById('SendRejectMail');
//        var cono = document.getElementById("cono").value;
//        var divi = document.getElementById("divi").value;

        alert(Keyordid);
        alert(Keyuser);


        var a = document.getElementById("ordernum").innerHTML;
        alert(a);


        $.ajax({
            url: './Action',
            type: 'GET',
            dataType: 'json',
            data: {
                path: "getload2",
                ID: "23020009",
                cono: "10",
                divi: "101"

            },
            success: function (result) {
                console.log(result);

                if (a === '00000000') {
                    return;
                }

                if (result) {


                    $("#Jsgrid").jsGrid("option", "data", result);
                } else {
                }
            }

        });

        $.ajax({
            url: './Action',
            type: 'GET',
            dataType: 'json',
            data: {
                path: "getload1",
                ID: "23020009",
                Key: "S4",
                cono: '10',
                divi: '101'


            },
            success: function (result) {
                
                console.log(result);

            }


        });
        
        
         $("#Jsgrid").jsGrid({
            width: "100%",
            height: "auto",
            filtering: true,
            inserting: false,
            editing: true,
            sorting: true,
            paging: true,
            autoload: true,
            pageSize: 5,
//                pageButtonCount: 5,
            controller: {
                loadData: function (filter) {
                    var data = $.Deferred();
                    $.ajax({
                        type: 'GET',
                        dataType: 'json',
                        url: './Action',
                        data: {
                            path: "getItemcode",
                            whs: whs,
                            check: "true"

                        },
                        async: false
                    }).done(function (response) {

                        console.log("click to show value");
                        console.log(response);
                        console.log("click to show value");
                        response = $.grep(response, function (item) {
                            return (!filter.MMITNO || (item.MMITNO.indexOf(filter.MMITNO) > -1));
                        });
                        data.resolve(response);
                    });
                    return data.promise();
                },
                updateItem: function (item) {


                }
            },
            fields: [
                {name: "MMCONO", type: "text", width: 150, editing: false},
                {name: "ITEM", type: "text", width: 150, editing: false},
                {name: "MMITNO", type: "text", width: 150, editing: false},
                {name: "MMITDS", type: "text", width: 150, editing: false},
                {name: "MMUNMS", type: "text", width: 150, editing: false},
                {name: "QTY_REG", type: "text", width: 150},
                {type: "control", width: 30, deleteButton: false, css: "blue-cell"}

            ]
        });





    }
</script>




