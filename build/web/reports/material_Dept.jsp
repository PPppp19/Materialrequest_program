<%-- 
    Document   : material_request
    Created on : Oct 26, 2022, 4:02:44 PM
    Author     : Phongsathon
--%>
<!--
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

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.js"></script>
<!DOCTYPE html>

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
        background: fff;
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
        <div class="wrap-login100" >

    <form name="Mail" id="Mail" method="GET" action="./sendmail" >
        <br>

        <header class="header"  >

                            <h5 style="margin-top: 0; color: #161637; padding-top: 0;" align="right">Material Request </h5>
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
                            type="text" id="ssearch" name="ssearch"/> 


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



                          <input class="form-control" list="orderidlist" autocomplete="off" placeholder="OrderID" id="MRNO" name="MRNO" value="">
                                    <datalist id="orderidlist"> </datalist>
            





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
                <%out.print(session.getAttribute("cono"));%> &nbsp;&nbsp;
                <label id="Dname" style=" width: 15%"/>

                                <label>Date : </label>
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




                <input style=" color: black;" type="text" id="xdate" name="xdate" value="<%=date%>" />


                <input  style=" color: black;" type="hidden" id="date" name="date" value="<%=date%>"  />

            </div>



            --- Log in Signature Modal --- 


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
                                                        <label for="lbcustomer_name">Password:</label>
                                                        <input type="text" id="makingplace" name="makingplace">



                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="button"  id="btn_login" class="btn btn-primary" data-dismiss="modal" >Log in</button>
                        </div> 
                    </div>
                </div>
            </div>

            ------------------------------
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

                        <button type="button" class="collapsible" id="searchbtn" style=" width:  250px; height: 40px">SEARCH</button><br>
                        <button type="button" class="collapsible"  >SAVE</button><br>

                        <input style="width: 20%; height: 30px; margin-bottom: 100;" type="text" id="ssearch" name="ssearch"/> 
                        <button   onclick = "fun();"  style=" width: 20%; height: 40px; color: white; background-color: #555; border-color: white;" class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                            SAVE
                        </button>
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
              </div>

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


                     set1 
                    <div class="centerDiv">




                        <div class="divleft" id="rqby">  Reqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq 
                            <label style="text-align:left;
                                   float:left;">Requested By</label>               
                            <div style="clear:both;"></div>      


                            <div style="width: 100%;  background:  #2e3135; height: 300px;">                    
                                <br>   
                                 Signature todo 
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


                        <div class="divleft" id="dpmhd">  Reqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq 
                            <label style="text-align:left;
                                   float:left;">Department Head</label>               
                            <div style="clear:both;"></div>      

                            <div id="sigf" style="width: 100%;background:  #2e3135;  padding:1% 0 1% 1%;  height: 300px;">                    
                                <br>
                                <br>
                                <select  class="select" name="vhead"  id="vhead" >
                                    <option value="00" selected="selected">Select Department Head </option>
                                </select>   
                                 Signature todo 
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

                        <div id="isby" class="divleft">  Reqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq 
                            <label style="text-align:left;
                                   float:left;">Issued By</label>               
                            <div style="clear:both;"></div>      


                            <div style="width: 100%; background:  #2e3135; padding:1% 0 1% 1%; border-top:1px solid black; border-bottom: 1px solid black; border-right: 1px solid black; height: 300px;">                    
                                <br>   
                                 Signature todo 
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







                                                <div class="divcenter"> Reqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq 
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
                                                </div>

                                                  <div class="divcenter"> Reqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq 
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
                                                </div>





                                                <div class="divright"> Reqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq                 
                                                    <label style="text-align:left;
                                                           float:left;">Movex Order No.</label>
                                                    <div style="clear:both;"></div> 
                        
                                                    <div  style=" background: whitesmoke; width: 100%; height: 300px;">
                                                        <label>Test Details </label>
                        
                                                    </div>
                                                    <br>         
                                                </div>  





                    </div>
                    <div style="clear:both;"></div>   





                    <br>
                    <br>
                    <br>
                    <br>
                     set2  
                                        <div class="centerDiv">
                    
                    
                    
                    
                    
                    
                    
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





    </div>           
                    <div style="clear:both;"></div>   





                </div>
            </div>





            -- end of  table -- 




            <div class="demo">  
                <div class="ui-widget">    
                <label for="tags">Tags: </label>    
                <input id="tags">
                </div>
            </div>












            <button type="submit" id="SendReturnMail" name="SendAppMail"   value="SendReturnMail" style=" width: 15%; visibility: hidden; " class="btn btn-primary mb-2" style="color:#FFFFFF;" >Return</button>
            <button type="submit" id="SendRejectMail" name="SendAppMail"   value="SendRejectMail" style=" width: 15%; visibility: hidden; " class="btn btn-danger mb-2" style="color:#FFFFFF;" >Cancel</button>

                        <button onclick="sendmail()" style=" width: 15%; "class="btn btn-danger" class="btn btn-primary mb-2" style="color:#FFFFFF;" form="detailsForm" name="report" value="Reject"type="button" id="Reject" >Reject</button>
            <br> 
            <br>
            <br>
            <br>
            <button type="submit" class="btn btn-primary mb-2" style=" background-color: #0080ff; width: 20%; height: 10%; outline: 1px solid #ffffff;" onclick="return sendmail();"   id="SendAppMail" name="SendAppMail"   value="SendAppMail"  >Submit</button>
            <br>
            <br>
            <br> 
            <br>

            <button type="button" class="btn btn-primary mb-2" onclick="sendtom3()" id="sendtom3" name="sendtom3"   value="sendtom3"  >Post to M3</button>



                        <button  type="submit" id="SendAppMail" name="SendAppMail"   value="SendtoM3" style=" width: 15%; height: 30%; color: white; background-color: red; border-color: white;" class="btn btn-primary">
                            Send to M3
                        </button>

                        <button onclick="sendtom3result();" type="button" id="sendtom3" name="sendtom3"   value="sendtom3" style=" width: 15%; height: 30%; color: white; background-color: red; border-color: white;" class="btn btn-primary">
                            Send to M3
                        </button>
            
                        <button   onclick = "sendtom3result();"  style=" width: 25%; height: 30px; color: white; background-color: #555; border-color: white;" class="btn btn-primary" type="button" " data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                        </button>



                <form align="center">
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
                </form> 




        </div>
</div>-->
<!--</div>-->

<!--<div id="jsGrid"></div>-->


<script>


//
//
//    $('#vhead').change(function (e) {
//
//        checkgrid();
//
//    });
//
//    function TextSelectField(config) {
//        jsGrid.SelectField.call(this, config);
//    }
//    var prevalue = "";
//    var idlist = [];
//    var loaditems = [];
//    $('#myfile').change(function (e) {
//        var reader = new FileReader();
//        reader.readAsArrayBuffer(e.target.files[0]);
//        reader.onload = function (e) {
//            var data = new Uint8Array(reader.result);
//            var workbook = XLSX.read(data, {type: 'array'});
//            var sheet = workbook.Sheets[workbook.SheetNames[0]];
//            var cell_ref = XLSX.utils.encode_cell({c: 1, r: 2});
//            var cell = sheet[cell_ref];
//            console.log(cell.v);
//        };
//    });
//    function myFunction() {
//        document.getElementById("myDropdown").classList.toggle("show");
//    }
//
//    function filterFunction() {
//        var input, filter, ul, li, a, i;
//        input = document.getElementById("myInput");
//        filter = input.value.toUpperCase();
//        div = document.getElementById("myDropdown");
//        a = div.getElementsByTagName("a");
//        for (i = 0; i < a.length; i++) {
//            txtValue = a[i].textContent || a[i].innerText;
//            if (txtValue.toUpperCase().indexOf(filter) > -1) {
//                a[i].style.display = "";
//            } else {
//                a[i].style.display = "none";
//            }
//        }
//    }
//
//
//    var chkStatus = "S1";
//    var sig_req = "";
//    var sig_dep = "";
//    var sig_iss = "";
//    ///////// all input form ////////////////////
//
//    var vCompany = document.getElementById("company").innerHTML;
//    var vNo = document.getElementById("ordernum").innerHTML;
//    var vRequester = document.getElementById("username").innerHTML;
//    var vCostcenter = document.getElementById("vdpm").innerHTML;
//    var vDepartmentname = document.getElementById("Dname").innerHTML;
//    var vDate = document.getElementById("vDate").innerHTML;
//    var vType = document.getElementById("radiotype").innerHTML;
//    var vFwhs = document.getElementById("vFwarehouse").innerHTML;
//    var vTwhs = document.getElementById("vTwarehouse").innerHTML;
//    var Location = document.getElementById("fname").innerHTML;
//
//    console.log("Location is :");
//    console.log(Location);
//
//    ////////////////////////////////////////////
//
//    // insert 
//    $.ajax({
//        url: './Action',
//        type: 'GET',
//        dataType: 'json',
//        data: {
//            path: "Addheadata"
//        },
//        success: function (result) {
//
//        }
//
//    });
//    /////// additem /////// 
//
//    $.ajax({
//        url: './Action',
//        type: 'GET',
//        dataType: 'json',
//        data: {
//            path: "additem"
//        },
//        success: function (result) {
//
//            alert("added item conpleate.");
//        }
//
//    });
//    var buttonid = "";
//    var selectedid = "";
//    $(function () {
//
//
//        $('#collapseExample').on('shown.bs.collapse', function (e) {
//            $('html,body').animate({
//                scrollTop: $('#collapseExample').offset().top - 10
//            }, 500);
//        });
//        document.getElementById("rqby").style.visibility = 'visible';
//        document.getElementById("dpmhd").style.visibility = 'visible';
//        document.getElementById("isby").style.visibility = 'hidden';
//        document.getElementById("btn_openmodal2").style.visibility = 'hidden';
//        document.getElementById("btn_openmodal").style.visibility = 'visible';
//        document.getElementById("rqdate2txt").style.visibility = 'hidden';
//        document.getElementById("vhead").style.visibility = 'visible';
//        document.getElementById("sigf").style.visibility = 'hidden';
//        document.getElementById("imgclose").style.visibility = 'hidden';
//        document.getElementById("imgclose2").style.visibility = 'hidden';
//        document.getElementById("imgclose3").style.visibility = 'hidden';
//    });
//    function sendmail() {
//
//
//        var vhead = document.getElementById("vhead").value;
//        var vNo = document.getElementById("ordernum").innerHTML;
//        var purpose = document.getElementById("mypparea").value;
//        console.log("vhead");
//        console.log(vhead);
//        console.log(purpose);
//        insertsubmit(purpose, vhead, vNo);
//        getEmailByName(vhead);
//    }
//
//    function loaddata() {
//        var cono = document.getElementById("cono").value;
//        var divi = document.getElementById("divi").value;
//        $.ajax({
//            url: './Action',
//            type: 'GET',
//            dataType: 'json',
//            data: {
//                path: "getload",
//                ID: a,
//                cono: cono,
//                divi: divi
//
//            },
//            success: function (result) {
//                var itemid = [];
//                var itemdesc = [];
//                var qtyreqt = [];
//                var qtyissu = [];
//                console.log("*********************  LOAD  *********************");
//                console.log(result);
//                console.log("loaded Data");
//                console.log("*********************  LOAD  *********************");
//                $.each(result, function () {
//
//                    var code = "";
//                    var desc = "";
//                    var unit = "";
//                    var qi = "";
//                    var qr = "";
//                    $("#Jsgrid").jsGrid("option", "data", []);
//                    $.each(this, function (k, v) {
//
//
//
//
//                        if (k === "Code") {
//                            if (v !== "22110000") {
//                                console.log("COde :");
//                                console.log(v);
//                                code = v;
//                            }
//
//
//                        } else if (k === "MAT_TYPE") {
//                            if (v === 33) {
//
//
//
//                            } else {
//
//
//                            }
//                        } else if (k === "CRE_DATE") {
//
//
//                            if (v !== null) {
//                                document.getElementById("xdate").value = "PPPPPPPPPPP";
//                            }
//
//                        } else if (k === "ORD_PURP") {
//
//
//                            if (v !== null) {
//
//                                document.getElementById("mypparea").value = v;
//                            }
//
//                        } else if (k === "COS_CENT") {
//
//                            if (v !== null) {
//                                document.getElementById("vPeriod").value = v;
//                            }
//
//                        } else if (k === "FRM_WAHO") {
//
//                            if (v !== null) {
//                                document.getElementById("vFwarehouse").value = v;
//                            }
//
//                        } else if (k === "TO_WAHO") {
//
//                            if (v !== null) {
//                                document.getElementById("vTwarehouse").value = v;
//                            }
//
//                        } else if (k === "WAH_LOCA") {
//
//                            if (v !== null) {
//                                document.getElementById("fname").value = v;
//                            }
//
//                        } else if (k === "DEP_NAME") {
//
//                            if (v !== null) {
//                                document.getElementById("Dname").innerHTML = v;
//                            }
//
//                        } else if (k === "ORD_PURP") {
//
//                            if (v !== null) {
//                                document.getElementById("mypparea").innerHTML = v;
//                            }
//
//                        } else if (k === "Description") {
//
//                            if (v !== null) {
//                                if (v !== "DEFAULT") {
//                                    console.log("Description :");
//                                    console.log(v);
//                                    desc = v;
//                                }
//
//                            }
//                        } else if (k === "Unit") {
//                            console.log("Unit :");
//                            console.log(v);
//                            unit = v;
//                        } else if (k === "Qty_Iss") {
//                            console.log("Qty Iss :");
//                            console.log(v);
//                            qi = v;
//                        } else if (k === "Qty_Reg") {
//                            console.log("Qty Reg :");
//                            console.log(v);
//                            qr = v;
//                        } else if (k === "ITM_ID") {
//                            console.log("ITM_ID");
//                            console.log(v);
//                            itemid.push(v);
//                        } else if (k === "ITM_DESC") {
//                            console.log("ITM_DESC");
//                            console.log(v);
//                            itemdesc.push(v);
//                        } else if (k === "QTY_REQT") {
//                            console.log("QTY_REQT");
//                            console.log(v);
//                            qtyreqt.push(v);
//                        } else if (k === "QTY_ISSU") {
//                            console.log("QTY_ISSU");
//                            console.log(v);
//                            qtyissu.push(v);
//                        } else if (k === "RQT_DATE") {
//
//                            document.getElementById("rqdate").innerHTML = v;
//                        }
//
//
//                    });
//                });
//            }
//
//        });
//    }
//
//// Get the input field
//    var input = document.getElementById("ssearch");
//// Execute a function when the user presses a key on the keyboard
//    input.addEventListener("keypress", function (event) {
//        // If the user presses the "Enter" key on the keyboard
//        if (event.key === "Enter") {
//            // Cancel the default action, if needed
//            event.preventDefault();
//            // Trigger the button element with a click
//            document.getElementById("searchbtn").click();
//        }
//    });
//    input.addEventListener("focus", function (event) {
//
//        $(this).autocomplete("search", "2");
//    });
//    function load() {
//
//        console.log("ready1111111111111!");
//        const queryString = window.location.search;
//        console.log(queryString);
//        const urlParams = new URLSearchParams(queryString);
//        console.log(urlParams);
//        var Key = urlParams.get('status');
//        var ordernum = document.getElementById('ordernum');
//        var rj = document.getElementById('SendRejectMail');
//        var cono = document.getElementById("cono").value;
//        var divi = document.getElementById("divi").value;
//        console.log(Key);
//        if (Key == null) {
//            Key = "S1";
//        }
//
//
//
//        console.log(Key);
//        console.log("Loaded55");
//        var a = document.getElementById("ssearch").value;
//        var movex = "00000000";
//        console.log(a);
//        //todo movex
////        $.ajax({
////            url: './Action',
////            type: 'GET',
////            dataType: 'text',
////            data: {
////                path: "getmovex",
////                ordernum: a
////
////            }, async: false,
////            success: function (result) {
////
////                console.log(result);
////                // alert(result);
////                movex = result;
////            }
////
////        });
////        alert(movex); 
//
//        console.log("Loaded11");
//        if (movex === "00000000" || movex === "" || !movex) {
//            if (a !== null && a.length !== 0) {
//
//                $('#collapseExample').collapse('show');
//                //////////////////
//
//                $.ajax({
//                    url: './Action',
//                    type: 'GET',
//                    dataType: 'json',
//                    data: {
//                        path: "getload2",
//                        ID: a,
//                        cono: cono,
//                        divi: divi
//
//                    },
//                    success: function (result) {
//
//                        if (a == '00000000') {
//                            return;
//                        }
//                        console.log("resultzxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
//                        console.log(result);
//                        if (result) {
//
//
//                            $("#Jsgrid").jsGrid("option", "data", result);
//                        } else {
//                            //alert("Nullllllllllllll");
//                        }
//                    }
//
//                });
//                //////////////
//                $.ajax({
//                    url: './Action',
//                    type: 'GET',
//                    dataType: 'json',
//                    data: {
//                        path: "getload1",
//                        ID: a,
//                        Key: Key,
//                        cono: cono,
//                        divi: divi
//
//
//                    },
//                    success: function (result) {
//                        console.log(Key);
//                        if (a == '00000000') {
//                            return;
//                        }
//
//                        if (result == "") {
//
//
//                            alert("this ORD_ID is not this state");
//                            window.location.href = "http://192.200.9.189:8080/MaterialRequest/?report=material_request";
//                        }
//
//
//
//                        var itemid = [];
//                        var itemdesc = [];
//                        var qtyreqt = [];
//                        var qtyissu = [];
//                        //                    $("#Jsgrid").jsGrid("loadData");
//                        console.log("*********************  LOAD  *********************");
//                        console.log(result);
//                        console.log("loaded Data");
//                        console.log("*********************  LOAD  *********************");
//                        $.each(result, function () {
//
//                            var code = "";
//                            var desc = "";
//                            var unit = "";
//                            var qi = "";
//                            var qr = "";
////            $("#Jsgrid").jsGrid("option", "data", result);
//                            $.each(this, function (k, v) {
//
//
//
//
//                                if (k === "Code") {
//                                    if (v !== "22110000") {
//                                        console.log("COde :");
//                                        console.log(v);
//                                        code = v;
//                                    }
//
//
//
//                                } else if (k === "ITM_UNIT") {
//
//                                    if (v !== null) {
//
//                                        //                                        itemid.push(v)  ; 
//                                        //                                        console.log(itemid);
//                                        //                                        console.log("Arr itemid");
//
//
//                                    }
//
//                                } else if (k === "ORD_STAT") {
//
//                                    if (v !== null) {
//
//
//
//
//                                    }
//
//                                } else if (k === "ORD_ID") {
//
//                                    if (v !== null) {
//
//                                        // todoid 
//                                        document.getElementById("ordernum").innerHTML = v;
//                                        document.getElementById("ordernumpp").value = v;
//                                    }
//
//                                } else if (k === "COM_ID") {
//
//                                    if (v !== null) {
//                                        document.getElementById("company").value = v;
//                                    }
//
//                                } else if (k === "DEP_NAME") {
//
//                                    if (v !== null) {
//                                        document.getElementById("Dname").innerHTML = v;
//                                    }
//
//                                } else if (k === "COS_CENT") {
//
//                                    if (v !== null) {
//
//                                        var vcc = document.getElementById("vPeriod");
//                                        vcc.options[vcc.selectedIndex].text = v;
//                                    }
//
//                                } else if (k === "ORD_REGB") {
//
//                                    if (v !== null) {
//
//                                        // todosig 
//                                        getsignature(v, "S2", a);
//                                        document.getElementById("creatortxt").innerHTML = v;
//                                        var usename = document.getElementById("usename").innerHTML;
//
//                                        if (v.trim() === usename.trim() && Key == "S2") {
//
//                                            alert("ไม่สามารถ Approve รายการของตัวเองได้");
//                                            window.location.href = "./?report=material_request&status=S2&ORDID=00000000";
//
//                                        }
//
//
//                                    }
//
//                                } else if (k === "ORD_DPMH") {
//
//                                    if (v !== null) {
//
//                                        // todosig 
//
//                                        getsignature(v, "S3", a);
//                                    }
//
//                                } else if (k === "ORD_ISSB") {
//
//                                    if (v !== null) {
//
//                                        // todosig 
//                                        console.log("xxxx s3 ");
//                                        getsignature(v, "S4", a);
//                                    }
//
//                                } else if (k === "MAT_TYPE") {
//
//
//                                    if (v === 33) {
//
//                                        const yesBtn = document.getElementById('radiotypeexp');
//                                        yesBtn.checked = true;
//                                    } else {
//
//                                        const noBtn = document.getElementById('radiotypetrn');
//                                        noBtn.checked = true;
//                                    }
//                                } else if (k === "CRE_DATE") {
//
//
//                                    if (v !== null) {
////                                        document.getElementById("date").value = v;
////                                        document.getElementById("datelb").innerHTML = v;
//                                        document.getElementById("vDate").value = v;
//                                        document.getElementById("vDate").innerHTML = v;
//                                    }
//
//                                } else if (k === "FRM_WAHO") {
//
//                                    if (v !== null) {
//                                        document.getElementById("vFwarehouse").value = v;
//                                        getItemscode(v);
//                                    }
//
//                                } else if (k === "ORD_REGB") {
//
//                                    if (v !== null) {
//                                        document.getElementById("creatortxt").innerHTML = v;
//
//                                    }
//
//                                } else if (k === "TO_WAHO") {
//
//                                    if (v !== null) {
//                                        document.getElementById("vTwarehouse").value = v;
//                                    }
//
//                                } else if (k === "WAH_LOCA") {
//
//                                    if (v !== null) {
//                                        document.getElementById("fname").value = v;
//                                    }
//
//                                } else if (k === "DEP_NAME") {
//
//                                    if (v !== null) {
//                                        document.getElementById("Dname").innerHTML = v;
//                                    }
//
//                                } else if (k === "ORD_PURP") {
//
//                                    if (v !== null) {
//                                        document.getElementById("mypparea").innerHTML = v;
//                                    }
//
//                                } else if (k === "Description") {
//
//                                    if (v !== null) {
//                                        if (v !== "DEFAULT") {
//                                            console.log("Description :");
//                                            console.log(v);
//                                            desc = v;
//                                        }
//
//                                    }
//                                } else if (k === "Unit") {
//                                    console.log("Unit :");
//                                    console.log(v);
//                                    unit = v;
//                                } else if (k === "Qty_Iss") {
//                                    console.log("Qty Iss :");
//                                    console.log(v);
//                                    qi = v;
//                                } else if (k === "Qty_Reg") {
//                                    console.log("Qty Reg :");
//                                    console.log(v);
//                                    qr = v;
//                                } else if (k === "ITM_ID") {
//                                    console.log("ITM_ID");
//                                    console.log(v);
//                                    itemid.push(v);
//                                } else if (k === "ITM_DESC") {
//                                    console.log("ITM_DESC");
//                                    console.log(v);
//                                    itemdesc.push(v);
//                                } else if (k === "QTY_REQT") {
//                                    console.log("QTY_REQT");
//                                    console.log(v);
//                                    qtyreqt.push(v);
//                                } else if (k === "QTY_ISSU") {
//                                    console.log("QTY_ISSU");
//                                    console.log(v);
//                                    qtyissu.push(v);
//                                } else if (k === "MVX_ORDE") {
//
//                                    console.log("MVX_ORDE");
//                                    console.log(v);
////                                    document.getElementById('movexno').innerHTML = v;
//                                } else if (k === "RQT_DATE") {
//
//                                    document.getElementById("rqdate").innerHTML = v;
//                                } else if (k === "DPH_DATE") {
//
//                                    document.getElementById("rqdate2").innerHTML = v;
//                                } else if (k === "ISB_DATE") {
//
//                                    document.getElementById("rqdate3").innerHTML = v;
//                                }
//
//
//
//
//
//
//                            });
//                        });
//                    }
//
//                });
//            } else {
//
//
////            if (confirm('This ORDID Status is Rejected or Completed')) {
////                
////                window.location.href = 'http://localhost:8080/MaterialRequest/?report=material_request'; //one level up
////
////            } else {
////                
////                window.location.href = 'http://localhost:8080/MaterialRequest/?report=material_request'; //one level up
////
////            }
//            }
//
//        } else {
//            alert("this ORD_IS has been completed.");
////              location.replace("http://192.200.9.189:8080/UserRequest/login.jsp");
//            window.location.href = "http://192.200.9.189:8080/MaterialRequest/?report=material_request";
//        }
//
//
//    }
//
//
//    function resend() {
//
//        alert("Mail send.");
//    }
//
//    function fun() {
//
//
//
//        var vcc = document.getElementById("vPeriod");
//        var vCostcenter = vcc.options[vcc.selectedIndex].text;
//        var vRequester = document.getElementById("username").value;
//        var vCono = document.getElementById("cono").value;
//        var vDivi = document.getElementById("divi").value;
////        alert(vCono);
////        alert(vDivi);
//
//
//        var vDepartmentname = document.getElementById("Dname").innerHTML;
//        var vDate = document.getElementById("vDate").value;
//        var vFwhs = document.getElementById("vFwarehouse").value;
//        var vTwhs = document.getElementById("vTwarehouse").value;
//        if (
//                isEmpty(vCostcenter) &&
//                isEmpty(vRequester) &&
//                isEmpty(vDepartmentname) &&
//                isEmpty(vDate) &&
//                sendSuccess() &&
//                isEmpty(vFwhs) &&
//                isEmptyto(vTwhs)) {
//
//
//
//
//
//
//            var status = document.getElementById("status").value;
//            $('#collapseExample').collapse('show');
//            console.log("Save button Clicked.");
//            var ordernum = document.getElementById("ordernum").innerHTML;
//            var vCompany = document.getElementById("company").value;
//            var vcc = document.getElementById("vPeriod");
//            var vCostcenter = vcc.options[vcc.selectedIndex].text;
//            var vRequester = document.getElementById("username").value;
//            var vDepartmentname = document.getElementById("Dname").innerHTML;
//            var vDate = document.getElementById("vDate").value;
//            var vType = document.querySelector('input[name="radiotype"]:checked').value;
//            var vFwhs = document.getElementById("vFwarehouse").value;
//            var vTwhs = document.getElementById("vTwarehouse").value;
//            var Location = document.getElementById("fname").value;
//            var vcono = document.getElementById("cono").value;
//            var vdivi = document.getElementById("divi").value;
//            var orderPurpose = "-";
//            var rqtdate = "-";
//            var dpmhead = "-";
//            var orddpmh = "-";
//            var drhdate = "-";
//            var ordissb = "-";
//            var isbdate = "-";
//            var ordstat = "00";
//            if (ordernum === "00000000") {
//
//
//
//                $.ajax({
//                    url: './Action',
//                    type: 'GET',
//                    dataType: 'json',
//                    data: {
//                        path: "insertorderid",
//                        vcompany: vCompany,
//                        vrequester: vRequester,
//                        vdepartmentname: vDepartmentname,
//                        vcostcenter: vCostcenter,
//                        vdate: vDate,
//                        vtype: vType,
//                        vfwhs: vFwhs,
//                        vtwhs: vTwhs,
//                        location: Location,
//                        orderpurpose: orderPurpose,
//                        rqtdate: rqtdate,
//                        dpmhead: dpmhead,
//                        orddpmh: orddpmh,
//                        drhdate: drhdate,
//                        ordissb: ordissb,
//                        isbdate: isbdate,
//                        ordstat: ordstat,
//                        vcono: vcono,
//                        vdivi: vdivi
//
//
//
//
//
//
//                    },
//                    success: function (result) {
//
//                        console.log(result);
//                        console.log("SAVED Data");
//                        document.getElementById("ordernum").innerHTML = result;
//                        document.getElementById("ordernumpp").value = result;
//                    }
//
//                });
//            } else {
//
//                // todoupdate 
//                var orderPurpose = document.getElementById("mypparea").value;
//                var rqtdate = "regdate";
//                var drhdate = "drhdate";
//                var isbdate = "isbdate";
//                var ordstat = "01";
//                $.ajax({
//                    url: './Action',
//                    type: 'GET',
//                    dataType: 'json',
//                    data: {
//                        path: "updateheaddata",
//                        id: document.getElementById("ordernum").innerHTML,
//                        vcompany: vCompany,
//                        vrequester: vRequester,
//                        vdepartmentname: vDepartmentname,
//                        vcostcenter: vCostcenter,
//                        vdate: vDate,
//                        vtype: vType,
//                        vfwhs: vFwhs,
//                        vtwhs: vTwhs,
//                        location: Location,
//                        orderPurpose: orderPurpose
//
//                    },
//                    success: function (result) {
//
//                        console.log(result);
//                        console.log("Updated Data");
//                    }
//
//                });
//                ////////  table data  Storing  //////////
//
//
//
//                var data = $("#Jsgrid").jsGrid("option", "data");
//                console.log("All data : ");
//                console.log(data);
//                $.each(data, function () {
//                    $.each(this, function (k, v) {
//
//
//                        if (k === "Code") {
//                            if (v !== "22110000") {
//                                console.log("COde :");
//                                console.log(v);
//                            }
//
//                        } else if (k === "Description") {
//
//                            if (v !== null) {
//                                if (v !== "DEFAULT") {
//                                    console.log("Description :");
//                                    console.log(v);
//                                }
//
//                            }
//                        } else if (k === "Unit") {
//                            console.log("Unit :");
//                            console.log(v);
//                        } else if (k === "Qty Iss") {
//                            console.log("Qty Iss :");
//                            console.log(v);
//                        } else if (k === "Qty Reg") {
//                            console.log("Qty Reg :");
//                            console.log(v);
//                        }
//
//                    });
//                });
//            }
//
//        } else {
//
//
//            alert("กรุณากรอกข้อมูลให้ครบ");
//        }
//    }
//
//
//    var rowNum = 0;
//    $('#vPeriod').change(function () {
//
//        console.log(this.value);
//        console.log(this.value.length);
//        // todo
//        document.getElementById('Dname').innerHTML = this.value;
//    });
//    $('#vState').change(function (e) {
//
//        var state = $(this).val().toString();
//        console.log(state.toString());
//        //three do 
//        if (state === "State1") {
//
////            document.getElementById("sendtom3").style.visibility = 'hidden';
//            document.getElementById("rqby").style.visibility = 'visible';
//            document.getElementById("dpmhd").style.visibility = 'visible';
//            document.getElementById("isby").style.visibility = 'hidden';
//            document.getElementById("btn_openmodal2").style.visibility = 'hidden';
//            document.getElementById("btn_openmodal").style.visibility = 'visible';
//            document.getElementById("rqdate2txt").style.visibility = 'hidden';
//            document.getElementById("vhead").style.visibility = 'visible';
//            document.getElementById("sigf").style.visibility = 'hidden';
//            document.getElementById("imgclose2").style.visibility = 'hidden';
//            document.getElementById("imgclose3").style.visibility = 'hidden';
//            var srcimg = document.getElementById("image_id");
//            console.log(srcimg);
//            if (srcimg !== null) {
//
//                console.log(srcimg);
//                if (srcimg.src === null) {
//
//                    document.getElementById("imgclose").style.visibility = 'hidden';
//                } else {
//                    document.getElementById("imgclose").style.visibility = 'visible';
//                }
//            } else {
//                console.log("No");
//                document.getElementById("imgclose").style.visibility = 'hidden';
//            }
//
//        } else if (state === "State2") {
////            document.getElementById("sendtom3").style.visibility = 'hidden';
//            document.getElementById("rqby").style.visibility = 'visible';
//            document.getElementById("dpmhd").style.visibility = 'visible';
//            document.getElementById("isby").style.visibility = 'hidden';
//            document.getElementById("btn_openmodal2").style.visibility = 'visible';
//            document.getElementById("btn_openmodal").style.visibility = 'hidden';
//            document.getElementById("rqdate2txt").style.visibility = 'visible';
//            document.getElementById("vhead").style.visibility = 'collapse';
//            document.getElementById("sigf").style.visibility = 'visible';
//            document.getElementById("imgclose").style.visibility = 'hidden';
//            document.getElementById("imgclose3").style.visibility = 'hidden';
//            var srcimg = document.getElementById("image_id2");
//            if (srcimg !== null) {
//                if (srcimg.src === null) {
//
//                    document.getElementById("imgclose2").style.visibility = 'hidden';
//                } else {
//                    document.getElementById("imgclose2").style.visibility = 'visible';
//                }
//            } else {
//
//                document.getElementById("imgclose2").style.visibility = 'hidden';
//            }
//
//        } else if (state === "State3") {
//
//
////            document.getElementById("sendtom3").style.visibility = 'visible';
//            document.getElementById("rqby").style.visibility = 'visible';
//            document.getElementById("dpmhd").style.visibility = 'visible';
//            document.getElementById("isby").style.visibility = 'visible';
//            document.getElementById("btn_openmodal2").style.visibility = 'hidden';
//            document.getElementById("btn_openmodal").style.visibility = 'hidden';
//            document.getElementById("rqdate2txt").style.visibility = 'visible';
//            document.getElementById("vhead").style.visibility = 'collapse';
//            document.getElementById("imgclose").style.visibility = 'hidden';
//            document.getElementById("imgclose2").style.visibility = 'hidden';
//            var srcimg = document.getElementById("image_id3");
//            if (srcimg !== null) {
//
//
//
//                if (srcimg.src === null) {
//
//                    document.getElementById("imgclose3").style.visibility = 'hidden';
//                } else {
//                    document.getElementById("imgclose3").style.visibility = 'visible';
//                }
//            } else {
//
//                document.getElementById("imgclose3").style.visibility = 'hidden';
//            }
//
//
//
//        }
//
//
//
//    });
//    function changeddl1() {
//        alert("Show");
//    }
//
//    function changeddl(a) {
//        //        var state = $(this).val().toString();
//        //        console.log(state.toString());
//        //three do 
//        if (a === "S1") {
//
//            document.getElementById("rqby").style.visibility = 'visible';
//            document.getElementById("dpmhd").style.visibility = 'visible';
//            document.getElementById("isby").style.visibility = 'hidden';
//            document.getElementById("btn_openmodal2").style.visibility = 'hidden';
//            document.getElementById("btn_openmodal").style.visibility = 'visible';
//            document.getElementById("rqdate2txt").style.visibility = 'hidden';
//            document.getElementById("vhead").style.visibility = 'visible';
//            document.getElementById("sigf").style.visibility = 'hidden';
//            document.getElementById("imgclose2").style.visibility = 'hidden';
//            document.getElementById("imgclose3").style.visibility = 'hidden';
//            var srcimg = document.getElementById("image_id");
//            console.log(srcimg);
//            if (srcimg != null) {
//
//                console.log(srcimg);
//                if (srcimg.src == null) {
//
//                    document.getElementById("imgclose").style.visibility = 'hidden';
//                } else {
//                    document.getElementById("imgclose").style.visibility = 'visible';
//                }
//            } else {
//                console.log("No");
//                document.getElementById("imgclose").style.visibility = 'hidden';
//            }
//
//        } else if (a == "S2") {
//            document.getElementById("rqby").style.visibility = 'visible';
//            document.getElementById("dpmhd").style.visibility = 'visible';
//            document.getElementById("isby").style.visibility = 'hidden';
//            document.getElementById("btn_openmodal2").style.visibility = 'visible';
//            document.getElementById("btn_openmodal").style.visibility = 'hidden';
//            document.getElementById("rqdate2txt").style.visibility = 'visible';
//            document.getElementById("vhead").style.visibility = 'collapse';
//            document.getElementById("sigf").style.visibility = 'visible';
//            document.getElementById("imgclose").style.visibility = 'hidden';
//            document.getElementById("imgclose3").style.visibility = 'hidden';
//            var srcimg = document.getElementById("image_id2");
//            if (srcimg != null) {
//                if (srcimg.src == null) {
//
//                    document.getElementById("imgclose2").style.visibility = 'hidden';
//                } else {
//                    document.getElementById("imgclose2").style.visibility = 'visible';
//                }
//            } else {
//
//                document.getElementById("imgclose2").style.visibility = 'hidden';
//            }
//
//        } else if (a === "S3") {
//
//            document.getElementById("rqby").style.visibility = 'visible';
//            document.getElementById("dpmhd").style.visibility = 'visible';
//            document.getElementById("isby").style.visibility = 'visible';
//            document.getElementById("btn_openmodal2").style.visibility = 'hidden';
//            document.getElementById("btn_openmodal").style.visibility = 'hidden';
//            document.getElementById("rqdate2txt").style.visibility = 'visible';
//            document.getElementById("vhead").style.visibility = 'collapse';
//            document.getElementById("imgclose").style.visibility = 'hidden';
//            document.getElementById("imgclose2").style.visibility = 'hidden';
//            var srcimg = document.getElementById("image_id3")
//
//            if (srcimg != null) {
//
//
//
//                if (srcimg.src == null) {
//
//                    document.getElementById("imgclose3").style.visibility = 'hidden';
//                } else {
//                    document.getElementById("imgclose3").style.visibility = 'visible';
//                }
//            } else {
//
//                document.getElementById("imgclose3").style.visibility = 'hidden';
//            }
//
//
//
//        } else {
//
//
//        }
//
//
//    }
//    function remove() {
//        var x = document.getElementById("mySelect");
//        x.remove(x.selectedIndex);
//    }
//
//
//
//    $("#SendAppMail").click(function (e) {
//
//
//
//        // todosubmit 
//        console.log("wow");
//        alert("An email has been sent.");
//        var vhead = document.getElementById("vhead").value;
//        var vNo = document.getElementById("ordernum").innerHTML;
//        var purpose = document.getElementById("mypparea").value;
//        console.log("vhead");
//        console.log(vhead);
//        console.log(purpose);
//        insertsubmit(purpose, vhead, vNo);
//        getEmailByName(vhead);
//    });
//    $("#btn_openmodal").click(function (e) {
//
//        buttonid = "button1";
//        console.log(buttonid);
//    });
//    $("#btn_openmodal2").click(function (e) {
//
//        buttonid = "button2";
//        console.log(buttonid);
//    });
//    $("#btn_openmodal3").click(function (e) {
//
//        buttonid = "button3";
//        console.log(buttonid);
//    });
//    // todo pp 
//
//
//    $("#imgclose").click(function (e) {
//        var vhead = document.getElementById("vhead");
//        var sm = document.getElementById("SendAppMail");
//        var vNo = document.getElementById("ordernum").innerHTML;
//        console.log("Click");
//        $("#image_id").remove();
//        var img = document.getElementById('image_id');
//        var imgclose = document.getElementById('imgclose');
//        imgclose.style.visibility = "hidden";
//        document.getElementById("rqdate").innerHTML = "-";
//        DeleteSignature("ORD_REGB", vNo, "RQT_DATE");
//        console.log("close click");
//        sm.disabled = true;
//        vhead.disabled = true;
//
//    });
//    $("#imgclose2").click(function (e) {
//        var vNo = document.getElementById("ordernum").innerHTML;
//        console.log("Click");
//        $("#image_id2").remove();
//        var img = document.getElementById('image_id2');
//        var imgclose = document.getElementById('imgclose2');
//        imgclose.style.visibility = "hidden";
//        document.getElementById("rqdate2").innerHTML = "-";
//        DeleteSignature("ORD_DPMH", vNo, "DPH_DATE");
//    });
//    $("#imgclose3").click(function (e) {
//        var vNo = document.getElementById("ordernum").innerHTML;
//        console.log("Click");
//        $("#image_id3").remove();
//        var img = document.getElementById('image_id3');
//        var imgclose = document.getElementById('imgclose3');
//        imgclose.style.visibility = "hidden";
//        document.getElementById("rqdate3").innerHTML = "-";
//        DeleteSignature("ORD_ISSB", vNo, "ISB_DATE");
//    });
//    $("#btn_login").click(function (e) {
//
//
//        var vhead = document.getElementById('vhead');
//        var username = document.getElementById("username").value;
//        var modal = document.getElementById("exampleModal");
//        modal.style.display = "none"; // Close the modal
//
//        var prnum = document.getElementById("cname").value;
//        var cono = document.getElementById("cono").value;
//        var divi = document.getElementById("divi").value;
//        var prno = prnum;
//        $.ajax({
//            url: './Action',
//            type: 'GET',
//            dataType: 'json',
//            data: {
//                path: "getSignaturenormal",
//                cono: cono,
//                divi: divi,
//                prno: prno
//            },
//            success: function (result) {
//
//                console.log("Result Clob : ");
//                console.log(result);
//                $.each(result, function (i, obj) {
//                    //var img = $('<img id="image_id">');
//                    var imgclose = document.getElementById('imgclose');
//                    var frame = document.getElementById('image_div');
//                    var frame2 = document.getElementById('image_div2');
//                    var frame3 = document.getElementById('image_div3');
//                    var vNo = document.getElementById("ordernum").innerHTML;
//                    //                    img.attr('src', 'data:image/png;base64,' + result[i].ST_SIGN);
//
//
//                    if (buttonid == "button1")
//                    {
//                        $("#image_id").remove();
//                        var img = $('<img id="image_id">');
//                        img.appendTo('#image_div');
//                        var date1 = new Date().toLocaleString();
//                        document.getElementById("rqdate").innerHTML = date1;
//                        imgclose.style.visibility = "visible";
//                        frame.style.border = "1px solid black";
//                        img.attr('src', 'data:image/png;base64,' + result[i].ST_SIGN);
//                        insertSignature("ORD_REGB", vNo, username, date1, "RQT_DATE");
//                    } else if (buttonid == "button2")
//                    {
//                        $("#image_id2").remove();
//                        var img = $('<img id="image_id2">');
//                        img.appendTo('#image_div2');
//                        var date2 = new Date().toLocaleString();
//                        document.getElementById("rqdate2").innerHTML = date2;
//                        imgclose2.style.visibility = "visible";
//                        frame2.style.border = "1px solid black";
//                        img.attr('src', 'data:image/png;base64,' + result[i].ST_SIGN);
//                        insertSignature("ORD_DPMH", vNo, username, date2, "DPH_DATE");
//                    } else if (buttonid == "button3")
//                    {
//                        $("#image_id3").remove();
//                        var img = $('<img id="image_id3">');
//                        img.appendTo('#image_div3');
//                        var date3 = new Date().toLocaleString();
//                        document.getElementById("rqdate3").innerHTML = date3;
//                        imgclose3.style.visibility = "visible";
//                        frame3.style.border = "1px solid black";
//                        img.attr('src', 'data:image/png;base64,' + result[i].ST_SIGN);
//                        insertSignature("ORD_ISSB", vNo, username, date3, "ISB_DATE");
//                    }
//                    console.log(result[i].ST_SIGN);
//                });
//                //document.getElementById("myDiv").style.border = "thick solid #0000FF";
//            },
//            error: function (result) {
//                alert('error');
//            }
//        });
//        vhead.disabled = false;
//    });
//    var cono = document.getElementById("cono").value;
//    var divi = document.getElementById("divi").value;
//    var facility = "1A1";
////    var cono = "10"
////    var divi = "101"
//
//    $("#vFromDate").datepicker({dateFormat: 'yy-mm-dd'}).datepicker("setDate", new Date($.now()));
//    $("#vToDate").datepicker({dateFormat: 'yy-mm-dd'}).datepicker("setDate", new Date($.now()));
//    $(function () {
//        $("#vFromDate").datepicker({
//            clearBtn: true,
//            dateFormat: 'yy-mm-dd'
//        });
//        $("#vToDate").datepicker({
//            clearBtn: true,
//            dateFormat: 'yy-mm-dd'
//        });
//    });
//    $.ajax({
//        url: './Action',
//        type: 'GET',
//        dataType: 'json',
//        data: {
//            path: "getWarehouse",
//            cono: cono,
//            divi: divi,
//            fac: facility
//        },
//        async: false
//    }).done(function (response) {
//        console.log(response);
//        warehouse = response;
//        $.each(response, function (i, obj) {
//            var div_data = "<option value=" + obj.MWWHLO + ">" + obj.WAREHOUSE + "</option>";
//            $(div_data).appendTo('#vWarehouse');
//        });
//    });
//    $.ajax({SSS
//        url: './Action',
//        type: 'GET',
//        dataType: 'json',
//        data: {
//            path: "getWarehouse",
//            cono: cono,
//            divi: divi,
//            fac: facility
//        },
//        async: false
//    }).done(function (response) {
//        console.log(response);
//        warehouse = response;
//        $.each(response, function (i, obj) {
//            var div_data = "<option value=" + obj.MWWHLO + ">" + obj.WAREHOUSE + "</option>";
//            $(div_data).appendTo('#vFwarehouse');
//        });
//    }); //todo 
//
//
//
//
//
//    $.ajax({
//        url: './Action',
//        type: 'GET',
//        dataType: 'json',
//        data: {
//            path: "getWarehouse",
//            cono: cono,
//            divi: divi,
//            fac: facility
//        },
//        async: false
//    }).done(function (response) {
//        console.log(response);
//        warehouse = response;
//        $.each(response, function (i, obj) {
//            var div_data = "<option value=" + obj.MWWHLO + ">" + obj.WAREHOUSE + "</option>";
//            $(div_data).appendTo('#vTwarehouse');
//        });
//    }); //todo 
//
//
//
//
//
//    $.ajax({
//        url: './Action',
//        type: 'GET',
//        dataType: 'json',
//        data: {
//            path: "getDepthead",
//        },
//        async: false
//    }).done(function (response) {
//        console.log(response);
//        warehouse = response;
//        $.each(response, function (i, obj) {
//            var div_data = "<option value=" + obj.US_LOGIN + ">" + obj.US_LOGIN + "</option>";
//            $(div_data).appendTo('#vhead');
//        });
//    }); //todo 
//
//
//
//
//
//
//    $('#vFwarehouse').on('change', function () {
//        getItemscode(this.value);
//    });
//
//    $('#vTwarehouse').on('change', function () {
//
//        var vFwhs = document.getElementById("vFwarehouse").value;
//        getItemscode2way(vFwhs, this.value);
//    });
//    $(function (e) {
//
//        var e = document.getElementById("vFwarehouse");
//        var value = e.value;
//        getCostcenter("SB0102")
//
//        var myTagField = function (config) {
//            jsGrid.Field.call(this, config);
//        };
//        myTagField.prototype = new jsGrid.Field({
//            sorter: function (tag1, tag2) {
//                return tag1.localeCompare(tag2);
//            },
//            itemTemplate: function (value) {
//
//                return value;
//            },
//            insertTemplate: function (value) {
//                //todoauto
//                var isexpense = true; 
//                var fullCost = 0;
//                var grid = this._grid;
//                var teamField = this._grid.fields[3];
//          
//                    var reitem = this._insertAuto = $("<input>").autocomplete({source: item,
//                        select: function (event, ui) {
//
//
//
//                            let text = ui.item.value;
//                            const myArray = text.split(":");
//                            let word = myArray[0];
//                            let disc = myArray[1];
//                            selectedid = word;
//                            ui.item.value = word;
//                            $.ajax({
//                                type: 'GET',
//                                dataType: 'json',
//                                url: './Action',
//                                data: {
//                                    path: "getitemtype",
//                                    itemid: selectedid
//
//                                },
//                                success: function (data) {
//
//
//                                    console.log("Clicked");
//                                    items = data;
//                                    console.log(items);
//                                    ittem = items;
//                                    console.log("dddddddddddddddddddddddatttttttttttttttttttta");
//                                    console.log(data);
//                                    console.log("##################");
//                                    console.log(ittem);
//                                    console.log("##################");
//                                    console.log("*********************");
//                                    console.log("*********************");
//                                    //                                teamField.items = ittem;
//                                    //                                teamField.textField = "MMUNMS";
//                                    //                                teamField.valueField = "MMUNMS";
//
//                                    teamField.items = ittem;
//                                    teamField.textField = "MMUNMS";
//                                    teamField.valueField = "MMUNMS";
//                                    $(".states-filter").empty().append(teamField.insertTemplate());
//                                },
//                                error: function (e) {
//                                    alert('Error occured');
//                                    console.log(e);
//                                }
//                            });
//                            grid.option("fields")[2].insertControl.val(disc);
//                        }
//                    });
//                
//                return reitem;
//            },
//            insertValue: function () {
//                console.log(this._insertAuto.val());
//                var revalue = this._insertAuto.val();
//                const myArray = revalue.split(":");
//                return myArray[0];
//            },
//            editTemplate: function (value) {
//
//
//                console.log(prevalue);
//                var state = document.getElementById("vState").value;
//                if (state == "State1" || state == "State2") {
//
//
//
//                    var fullCost = 0;
//                    var grid = this._grid;
//                    var teamField = this._grid.fields[3];
//                    var reitem = this._editAuto = $("<input>").autocomplete({source: item,
//                        select: function (event, ui) {
//
//
//
//                            let text = ui.item.value;
//                            const myArray = text.split(":");
//                            let word = myArray[0];
//                            let disc = myArray[1];
//                            selectedid = word;
//                            ui.item.value = word;
//                            $.ajax({
//                                type: 'GET',
//                                dataType: 'json',
//                                url: './Action',
//                                data: {
//                                    path: "getitemtype",
//                                    itemid: selectedid
//
//                                },
//                                success: function (data) {
//
//
//                                    console.log("Clicked");
//                                    items = data;
//                                    console.log(items);
//                                    ittem = items;
//                                    console.log("dddddddddddddddddddddddatttttttttttttttttttta");
//                                    console.log(data);
//                                    console.log("##################");
//                                    console.log(ittem);
//                                    console.log("##################");
//                                    console.log("*********************");
//                                    console.log("*********************");
//                                    //                                teamField.items = ittem;
//                                    //                                teamField.textField = "MMUNMS";
//                                    //                                teamField.valueField = "MMUNMS";
//
//                                    teamField.items = ittem;
//                                    teamField.textField = "MMUNMS";
//                                    teamField.valueField = "MMUNMS";
//                                    // $(".states-filter").empty().append(teamField.insertTemplate());
//                                    //todoupdate 
//                                    $(".estates-filter").empty().append(teamField.editTemplate());
//                                },
//                                error: function (e) {
//                                    alert('Error occured');
//                                    console.log(e);
//                                }
//                            });
//                            // grid.option("fields")[2].insertControl.val(disc);
//                            grid.fields[2].editControl[0].value = disc;
//                        }
//                    }).val(value);
//                    return reitem;
//                } else
//                {
//                    return  value;
//                }
//
//
//            },
//            editValue: function () {
//                return this._editAuto.val();
//            }
//
//        });
//        jsGrid.fields.myTagField = myTagField;
//        var myTagField1 = function (config) {
//            jsGrid.Field.call(this, config);
//        };
//        myTagField1.prototype = new jsGrid.Field({
//            sorter: function (tag1, tag2) {
//                return tag1.localeCompare(tag2);
//            },
//            itemTemplate: function (value) {
//
//                return value;
//            },
//            insertTemplate: function (value) {
//
//
//                return  value;
//            },
//            editTemplate: function (value) {
//                var state = document.getElementById("vState").value;
//                if (state == "State1") {
//
//                    return this._editAuto = $("<input>").autocomplete({source: item}).val(value);
//                } else
//                {
//                    return  value;
//                }
//            },
//            insertValue: function () {
//
//                var a = items.filter(
//                        function (items) {
//                            return items.mmitno == selectedid
//                        }
//                );
//                return a[0].MMFUDS;
//            },
//            editValue: function () {
//                return this._editAuto.val();
//            }
//        });
//        jsGrid.fields.myTagField1 = myTagField1;
//        var myTagField2 = function (config) {
//            jsGrid.Field.call(this, config);
//        };
//        myTagField2.prototype = new jsGrid.Field({
//            sorter: function (tag1, tag2) {
//                return tag1.localeCompare(tag2);
//            },
//            itemTemplate: function (value) {
//
//                return value;
//            },
//            insertTemplate: function (value) {
//
//
//                return $("<input id='unittype' value='Text' >");
//            },
//            editTemplate: function (value) {
//
//                var state = document.getElementById("vState").value;
//                if (state == "State1") {
//
//                    return this._editAuto = $("<input>").autocomplete({source: item}).val(value);
//                } else
//                {
//                    return  value;
//                }
//            },
//            insertValue: function () {
//
//
//                var a = items.filter(
//                        function (items) {
//                            return items.mmitno == selectedid;
//                        }
//                );
//                return a[0].MMPUUN;
//            },
//            editValue: function () {
//                return this._editAuto.val();
//            }
//        });
//        jsGrid.fields.myTagField2 = myTagField2;
//        //////////  full detail item ///////
//
//        var myTagFieldfull = function (config) {
//            jsGrid.Field.call(this, config);
//        };
//        myTagFieldfull.prototype = new jsGrid.Field({
//            sorter: function (tag1, tag2) {
//                return tag1.localeCompare(tag2);
//            },
//            itemTemplate: function (value) {
//
//                return value;
//            },
//            insertTemplate: function (value) {
//                return this._insertAuto = $("<input>").autocomplete({source: itemfull});
//            },
//            editTemplate: function (value) {
//                return this._editAuto = $("<input>").autocomplete({source: itemfull}).val(value);
//            },
//            insertValue: function () {
//                return this._insertAuto.val();
//            },
//            editValue: function () {
//                return this._editAuto.val();
//            }
//        });
//        jsGrid.fields.myTagFieldfull = myTagFieldfull;
//        //////////////////////////////////////////////////////////////////
//
//        $("#Jsgrid").jsGrid({
//            width: "100%",
//            height: "400px",
//            filtering: true,
//            editing: true,
//            sorting: true,
//            inserting: true,
//            paging: true,
//            controller: items,
//            data: loaditems,
//            deleteConfirm: "คุณต้องการลบข้อมูลรายการนี้ใช่หรือไม่ ?",
//            onRefreshed: function (args) {
//
//                checkgrid();
//            },
//            onItemUpdating: function (args) {
//                prevalue = args.previousValue;
//            },
//            onItemInserting: function (args) {
//
////                console.log(item);
//                console.log(itemno);
//                console.log(args.item.ITM_ID.toString());
//                console.log(args.item.ITM_ID);
//                var idtxt = args.item.ITM_ID.toString();
//                console.log(itemno.includes(idtxt));
//                if (args.item.ITM_ID != "" && args.item.ITM_DESC != "" && args.item.ITM_UNIT != "" && args.item.QTY_REQT != "" && args.item.QTY_ISSU != "")
//                {
//                    if (itemno.includes(idtxt.trim())) {
//
//
//                        var issitm = 0;
//                        if (args.item.QTY_ISSU != null) {
//                            issitm = args.item.QTY_ISSU;
//                        }
//
//                        var e = document.getElementById("vFwarehouse");
//                        var value = e.value;
//                        var result = checkitemexist(args.item.ITM_ID, value, args.item.QTY_REQT);
//                        console.log("--------------- result ----------------");
//                        console.log(result);
//                        if (result)
//                        {
//                            var onhandsts = "YES";
//                            var issu = args.item.QTY_REQT;
//                            if (args.item.QTY_REQT <= 0) {
//                                onhandsts = "NO";
//                                issu = 0;
//                            }
//                            console.log("Add Zone");
//                            console.log(args.item.Code);
//                            console.log(args.item.Code);
//                            console.log(args.item.Description);
//                            console.log(args.item.Qty_Iss);
//                            console.log(args.item.Qty_Reg);
//                            console.log(args.item);
//                            console.log(args);
//                            console.log(args.item.Unit);
//                            console.log("xxx");
//                            var id = document.getElementById("ordernum").innerHTML;
//                            console.log(id);
//                            var e = document.getElementById("vFwarehouse");
//                            var value = e.value;
//                            var cono = document.getElementById("cono").value;
//                            var divi = document.getElementById("divi").value;
//                            $.ajax({
//                                type: 'GET',
//                                dataType: 'json',
//                                url: './Action',
//                                data: {
//                                    path: "insertitemdata",
//                                    code: args.item.ITM_ID,
//                                    //                        code: "11",
//                                    desc: args.item.ITM_DESC,
//                                    unit: args.item.ITM_UNIT,
//                                    reqt: args.item.QTY_REQT,
//                                    issu: issu,
//                                    id: id,
//                                    onhandsts: onhandsts,
//                                    cono: cono,
//                                    divi: divi
//                                            // tototo
//                                },
//                                success: function (data) {
//
//                                    console.log("Added");
//                                },
//                                error: function (e) {
//                                    alert('Error occured');
//                                    console.log(e);
//                                }
//                            });
//                        } else {
//
//                            if (confirm("จำนวนไอเท็มมีไม่พอ. \n คุณยังยืนยันที่จะทำรายการต่อ?"))
//                            {
//                                var id = document.getElementById("ordernum").innerHTML;
//                                console.log(id);
//                                var e = document.getElementById("vFwarehouse");
//                                var value = e.value;
//                                var cono = document.getElementById("cono").value;
//                                var divi = document.getElementById("divi").value;
//                                $.ajax({
//                                    type: 'GET',
//                                    dataType: 'json',
//                                    url: './Action',
//                                    data: {
//                                        path: "insertitemdata",
//                                        code: args.item.ITM_ID,
//                                        //                        code: "11",
//                                        desc: args.item.ITM_DESC,
//                                        unit: args.item.ITM_UNIT,
//                                        reqt: args.item.QTY_REQT,
//                                        issu: 0,
//                                        id: id,
//                                        onhandsts: "NO",
//                                        cono: cono,
//                                        divi: divi
//                                                // tototo
//                                    },
//                                    success: function (data) {
//
//                                        console.log("Added");
//                                    },
//                                    error: function (e) {
//                                        alert('Error occured');
//                                        console.log(e);
//                                    }
//                                });
//                            } else {
//                                args.cancel = true;
//                            }
//                            //args.cancel = true;
//
//                        }
//                        //args.cancel = true;
//
//                        //Edititems(args.item.mlitno, args.item.mlbano, args.item.mlwhlo, "1", 0.00, fileName, args.item.mlwhsl, moddate, modby);
//
//                    } else {
//                        alert("ไอเทมไม่มี");
//                        args.cancel = true;
//                    }
//                } else {
//                    alert("Please input all fields");
//                    args.cancel = true;
//                }
//
//
//            },
//            onItemEditing: function (args) {
//
//                console.log("onItemEditing ");
//                var state = document.getElementById("vState").value;
//                console.log(state);
//                if (state != "State1") {
//
//
//                }
//
//
//            },
//            onItemDeleting: function (args) {
//                var state = document.getElementById("vState").value;
//                if (state != "State3") {
//
//                    console.log("-----------Deleted---------------");
//                    console.log("onItemDelet ");
//                    console.log(args.item);
//                    var id = document.getElementById("ordernum").innerHTML;
//                    $.ajax({
//                        type: 'GET',
//                        dataType: 'text',
//                        url: './Action',
//                        data: {
//                            path: "deleteitemdata",
//                            code: args.item.ITM_ID,
//                            itid: args.item.ID,
//                            id: id
//
//
//                        },
//                        success: function (data) {
//
//                            console.log("Updated");
//                        },
//                        error: function (e) {
//                            alert('Error occured');
//                            console.log(e);
//                        }
//                    });
//                } else {
//
//                }
//            },
//            onItemUpdating: function (args) {
//
//                var idtxt = args.item.ITM_ID.toString();
//                var e = document.getElementById("vFwarehouse");
//                var value = e.value;
//                var result = checkitemexist(args.item.ITM_ID, value, args.item.QTY_REQT);
//                console.log("--------------- result ----------------");
//                console.log(result);
//                if (result)
//                {
//
//                    console.log("Add Zone");
//                    console.log(args.item.Code);
//                    console.log(args.item.Code);
//                    console.log(args.item.Description);
//                    console.log(args.item.Qty_Iss);
//                    console.log(args.item.Qty_Reg);
//                    console.log(args.item);
//                    console.log(args);
//                    console.log(args.item.Unit);
//                    console.log("xxx");
//                    var id = document.getElementById("ordernum").innerHTML;
//                    console.log(id);
//                    var e = document.getElementById("vFwarehouse");
//                    var value = e.value;
//                    $.ajax({
//                        type: 'GET',
//                        dataType: 'text',
//                        url: './Action',
//                        data: {
//                            path: "updateitemdata",
//                            code: args.item.ITM_ID,
//                            desc: args.item.ITM_DESC,
//                            unit: args.item.ITM_UNIT,
//                            reqt: args.item.QTY_REQT,
//                            issu: args.item.QTY_ISSU,
//                            itid: args.item.ID,
//                            id: id,
//                            onhand: "NO"
//
//                        },
//                        success: function (data) {
//
//                            console.log("Updated");
//                        },
//                        error: function (e) {
//                            alert('Error occured');
//                            console.log(e);
//                        }
//                    });
//                } else {
//
//                    if (itemno.includes(idtxt.trim())) {
//
//                        if (confirm("QTY ITEM not enough. \nAre you sure to  request"))
//                        {
//                            var id = document.getElementById("ordernum").innerHTML;
//                            console.log(id);
//                            var e = document.getElementById("vFwarehouse");
//                            var value = e.value;
//                            $.ajax({
//                                type: 'GET',
//                                dataType: 'text',
//                                url: './Action',
//                                data: {
//                                    path: "updateitemdata",
//                                    code: args.item.ITM_ID,
//                                    desc: args.item.ITM_DESC,
//                                    unit: args.item.ITM_UNIT,
//                                    reqt: args.item.QTY_REQT,
//                                    issu: args.item.QTY_ISSU,
//                                    itid: args.item.ID,
//                                    id: id,
//                                    onhand: "NO"
//
//                                },
//                                success: function (data) {
//
//                                    console.log("Updated");
//                                },
//                                error: function (e) {
//                                    alert('Error occured');
//                                    console.log(e);
//                                }
//                            });
//                        } else {
//                            args.cancel = true;
//                        }
//                        //args.cancel = true;
//                    } else {
//                        alert("ไอเทมไม่มี");
//                        args.cancel = true;
//                    }
//
//                }
//
//                console.log("onItemUpdate ");
//                console.log(args.item);
//                var id = document.getElementById("ordernum").innerHTML;
//                console.log(id);
//                console.log(args.item.ID);
//                console.log("onItemUpdate ");
//                $.ajax({
//                    type: 'GET',
//                    dataType: 'text',
//                    url: './Action',
//                    data: {
//                        path: "updateitemdata",
//                        code: args.item.ITM_ID,
//                        desc: args.item.ITM_DESC,
//                        unit: args.item.ITM_UNIT,
//                        reqt: args.item.QTY_REQT,
//                        issu: args.item.QTY_ISSU,
//                        itid: args.item.ID,
//                        id: id,
//                        onhand: "NO"
//
//                    },
//                    success: function (data) {
//
//                        console.log("Updated");
//                    },
//                    error: function (e) {
//                        alert('Error occured');
//                        console.log(e);
//                    }
//                });
//            },
//            fields: [
//                {name: "No.", type: "number", width: 30, align: "center", inserting: false, editing: false, filtering: false,
//                    itemTemplate: function (value, item) {
//                        return this._grid.data.indexOf(item) + 1;
//                    }
//                },
//                {
//                    title: "Code",
//                    name: "ITM_ID",
//                    type: "myTagField",
//                    filtering: false
//
//                },
//                {title: "Description", name: "ITM_DESC", type: "text", width: 70, filtering: false, editing: true,
////                    editTemplate: function (value, item) {
////                        var $result = jsGrid.fields.text.prototype.editTemplate.apply(this);
////                        var state = document.getElementById("vState").value;
////                        $result.prop("readonly", item.notEditable);
////                        console.log(state);
////                        if (state == "State1") {
////                            console.log("ssssssssssssssssssss");
////                        }
////                        return $result;
//////                        } else if (state == "State2") {
//////                            return $result;
//////                        } else {
//////                            return  value;
//////                        }
////                    }
//                },
//                {title: "Unit", name: "ITM_UNIT", type: "textSelect", items: ittem, filtering: false, width: 30, editing: true, insertcss: "states-filter", editcss: "estates-filter",
//                },
//                {title: "Qty_Reg", name: "QTY_REQT", type: "number", width: 30, inserting: true, filtering: false,
//                },
////                {title: "Qty_Iss", name: "QTY_ISSU", type: "number", width: 30, filtering: false, editing: true,
//
//
//
////                    editTemplate: function (value, item) {
////                        var $result = jsGrid.fields.text.prototype.editTemplate.apply(this);
////                        var state = document.getElementById("vState").value;
////                        $result.prop("readonly", "True");
////                        console.log(state);
////                        if (state == "State1") {
////                            return $result;
////                        } else if (state == "State2") {
////                            return $result;
////                        } else {
////                            return  value;
////                        }
////                    },
////                    insertTemplate: function (value, item) {
////                        var $result = jsGrid.fields.text.prototype.insertTemplate.call(this); // original input
////                        var state = document.getElementById("vState").value;
////                        $result.prop("readonly", "True");
////                        if (state == "State1") {
////
////                            return $result;
////                        } else if (state == "State2") {
////                            return value;
////                        } else {
////                            return  value;
////                        }
////
////                    }
////                },
//                {type: "control", modeSwitchButton: false, clearFilterButton: false,
//                    /* 
//                     itemTemplate: function (value, item) {
//                     var state = document.getElementById("vState").value;
//                     var $result = jsGrid.fields.text.prototype.editTemplate.apply(this);
//                     $result.prop("readonly", item.notEditable);
//                     
//                     if (state == "State3") {
//                     return $result;
//                     }
//                     
//                     }
//                     
//                     
//                     */
//
//
//                    itemTemplate: function (value, item) {
//                        var $result = $([]);
//                        var state = document.getElementById("vState").value;
//                        if (state == "State1") {
//                            $result = $result.add(this._createDeleteButton(item));
//                            $result = $result.add(this._createEditButton(item));
//                            //this.css = "hide";
////                            this._grid.editing = false; 
//                            // this._grid.editing = false; works 
//
//                        } else if (state == "State2") {
//                            $result = $result.add(this._createDeleteButton(item));
////                            $result = $result.add(this._createEditButton(item));
//                            //this.css = "hide";
//                            this._grid.editing = true;
//                            // this._grid.editing = false; works 
//
//                        } else if (state == "State3") {
//                            $result = $result.add(this._createDeleteButton(item));
////                            $result = $result.add(this._createEditButton(item));
//                            //this.css = "hide";
//                            this._grid.editing = false;
//                            // this._grid.editing = false; works 
//
//                        }
//
//                        return $result;
//                    },
//                }
//
//            ]
//        });
//    });
//    var items = [];
//    var costcen = [];
//    var item = [];
//    var item2way = [];
//    var itemno = [];
//    var itemmyid = [];
//    var itemname = [];
//    var itemtype = [];
//    var itemfull = [];
//    var ittem = [];
//    $('.college').click(function () {
//        $('.college').css('color', 'red');
//    });
//    $(function () {
//        var availableTags = [
//            "ActionScript",
//            "AppleScript",
//            "Asp",
//            "BASIC",
//            "C",
//            "C++",
//            "Clojure",
//            "COBOL",
//            "ColdFusion",
//            "Erlang",
//            "Fortran",
//            "Groovy",
//            "Haskell",
//            "Java",
//            "JavaScript",
//            "Lisp",
//            "Perl",
//            "PHP",
//            "Python",
//            "Ruby",
//            "Scala",
//            "Scheme"];
//        $("#itemcode").autocomplete({
//            source: availableTags,
//            minLength: 0,
//            scroll: true,
//            max: 10
//        }).focus(function () {
//            $(this).trigger('keydown.autocomplete');
//        });
//    });
//    //////////////////////////
//    function updateValue(e) {
//        log.textContent = e.target.value;
//    }
//
//    function checkarr() {
//        console.log("SSSSSSSSSSS");
//    }
//
//
//    ////////////////////////////////////
//
//
//
//
//    TextSelectField.prototype = new jsGrid.SelectField({
//
//        sorter: "string",
//        filterValue: function () {
//            return this.filterControl.val();
//        },
//        itemTemplate: function (value) {
//
//            return value;
//        },
//        insertValue: function () {
//            return this.insertControl.val();
//        },
//        editValue: function () {
//            return this.editControl.val();
//        },
//    });
//    jsGrid.fields.textSelect = TextSelectField;
//    /////////////////////////////////////
//
//
//    var getmyid = function (username) {
//        var cono = document.getElementById("cono").value;
//        var divi = document.getElementById("divi").value;
//        $.ajax({
//            type: 'GET',
//            dataType: 'json',
//            url: './Action',
//            data: {
//                path: "getmyid",
//                username: username,
//                cono: cono,
//                divi: divi
//
//            },
//            success: function (data) {
//
//                console.log("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxppp");
//                itemmyid = data;
//                console.log(itemmyid);
//                console.log(items);
//                $.each(data, function (i) {
//
//
//
//                });
//                console.log(itemtype);
////                console.log(ITEM);
//            },
//            error: function (e) {
//                alert('Error occured itemcode');
//                console.log(e);
//            }
//        });
//    };
//
//
//    var getItemscode2way = function (fwhs, twhs) {
//
//
//
////        var warehouse = whs;
//        $.ajax({
//            type: 'GET',
//            dataType: 'json',
//            url: './Action',
//            data: {
//                path: "getItemcode2way",
//                fwhs: fwhs,
//                twhs: twhs
//
//            },
//            success: function (data) {
//
//                items = data;
//                console.log(items);
//                $.each(data, function (i) {
//
//                    if (!(data[i].MMPUUN in itemtype)) {
//                        itemtype[data[i].MMPUUN] = 1;
//                        itemtype.push(data[i].MMPUUN);
//                    }
//                    console.log("VVVVVVVVVVVVVVVV4444444444");
//                    console.log(data[i].ITEM);
//                    console.log(data[i].MMITNO);
//                    item2way.push(data[i].ITEM);
//                    itemno.push(data[i].MMITNO);
//                });
//                console.log(itemtype);
////                console.log(ITEM);
//
//            },
//            error: function (e) {
//                alert('Error occured itemcode');
//                console.log(e);
//            }
//        });
//    };
//    var getItemscode = function (whs) {
//
//
//
//        var warehouse = whs;
//        $.ajax({
//            type: 'GET',
//            dataType: 'json',
//            url: './Action',
//            data: {
//                path: "getItemcode",
//                whs: whs
//
//            },
//            success: function (data) {
//
//                items = data;
//                console.log(items);
//                $.each(data, function (i) {
//
//                    if (!(data[i].MMPUUN in itemtype)) {
//                        itemtype[data[i].MMPUUN] = 1;
//                        itemtype.push(data[i].MMPUUN);
//                    }
//                    console.log("VVVVVVVVVVVVVVVV333333333333");
//                    console.log(data[i].ITEM);
//                    console.log(data[i].MMITNO);
//                    item.push(data[i].ITEM);
//                    itemno.push(data[i].MMITNO);
//                });
//                console.log(itemtype);
////                console.log(ITEM);
//            },
//            error: function (e) {
//                alert('Error occured itemcode');
//                console.log(e);
//            }
//        });
//    };
//    var getCostcenter = function (dep) {
//
//        var cono = document.getElementById("cono").value;
//        var divi = document.getElementById("divi").value;
//        var Department = dep;
//        $.ajax({
//            type: 'GET',
//            dataType: 'json',
//            url: './Action',
//            data: {
//                path: "getCostcenter",
//                dep: Department,
//                cono: cono,
//                divi: divi
//
//
//
//            },
//            success: function (data) {
//
//
//                $.each(data, function (i, obj) {
//                    dept = obj.COSTCENTER;
//                    const myArray = dept.split(':');
//                    console.log(obj.COSTCENTER)
//                    var div_data = "<option value='" + obj.S2TX15 + "'> " + obj.S2AITM + "</option>";
//                    console.log(div_data)
//                    $(div_data).appendTo('#vPeriod');
//                });
//                console.log(costcen);
//            },
//            error: function (e) {
//                alert('Error occured');
//                console.log(e);
//            }
//        });
//    };
//    $(document).ready(function () {
//        var mvxtxt = document.getElementById('movextxt');
//        var date = document.getElementById('vDate');
//        var vhead = document.getElementById('vhead');
//        var today = new Date();
//        date.max = new Date(new Date().setDate(today.getDate() + 15)).toISOString().split("T")[0];
//        date.min = new Date(new Date().setDate(today.getDate() - 15)).toISOString().split("T")[0];
//        //date.min = today.getDate(); 
//
//        var ordernum = document.getElementById('ordernum');
//        var selectID = document.getElementById('idsearch');
//        var searchid = document.getElementById('ssearch');
//        var username = document.getElementById("username").value;
//        var sm = document.getElementById('SendAppMail');
//        var rt = document.getElementById('SendReturnMail');
//        var rj = document.getElementById('SendRejectMail');
//        var rj1 = document.getElementById('SendRejectMail1');
////        var sm3 = document.getElementById('sendtom3');
////        var mvx = document.getElementById('movexno');
//        // document.getElementById('#SendAppMail').disabled = true;
//
//
//
////        var vDate = document.getElementById("date").innerHTML;
////        var input = vDate;
////        var formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy")
////                .withChronology(ThaiBuddhistChronology.INSTANCE)
////        var inputDate = ChronoLocalDate.from(LocalDate.parse(input, formatter))
////        document.getElementById("date").innerHTML = inputDate;
////         document.getElementById("date").value = inputDate;
//
////        var username = session.getAttribute("user"); 
////        getmyid(username);
//
//        console.log("ready!");
//        const queryString = window.location.search;
//        console.log(queryString);
//        const urlParams = new URLSearchParams(queryString);
//        console.log(urlParams);
//        const Key = urlParams.get('status');
//        const KeyID = urlParams.get('ORDID');
//        console.log(Key);
//        document.getElementById("ssearch").value = KeyID;
//        var box = document.getElementById("collapseExample");
//        var vRequester = document.getElementById("username").value;
//        var cretxt = document.getElementById("creatortxt");
//        var user = document.getElementById("usename");
//
//        load();
//        GetSelectID(username, Key);
//        if (Key == "S1") {
//
//
//
//            cretxt.innerHTML = vRequester + "&nbsp&nbsp";
//            mvxtxt.innerHTML = "Requester : ";
//            $('#Jsgrid').jsGrid('option', 'inserting', true);
//            $('#Jsgrid').jsGrid('option', 'editing', true);
//            //            document.getElementById("vState").value = "State1";
//            //            chkStatus = "S1";
//            rt.style.visibility = 'hidden';
//            rj.style.visibility = 'hidden';
//            rj1.style.visibility = 'visible';
////            sm3.style.visibility = 'hidden';
////            sm.style.visibility = 'hidden';
//            sm.disabled = true;
//            vhead.disabled = true;
//            document.getElementById("status").value = "S1";
//            getsignature("PHONGS_PHO", "S1", KeyID);
//            document.getElementById("imgclose").style.visibility = 'visible';
//            /////
//
//
//
//            /////
//
//
//
//
//        } else if (Key == "S2") {
//
//
//            mvxtxt.innerHTML = "Department Head : ";
//            $('#Jsgrid').jsGrid('option', 'inserting', true);
//            $('#Jsgrid').jsGrid('option', 'editing', true);
//            rt.style.visibility = 'visible';
//            rj.style.visibility = 'visible';
//            rj1.style.visibility = 'hidden';
////            sm3.style.visibility = 'hidden';
//            sm.style.visibility = 'visible';
//            document.getElementById("vState").value = "State2";
//            chkStatus = "S2";
//            box.className = "collapse in";
//            document.getElementById("ordernum").innerHTML = KeyID;
//            document.getElementById("ordernumpp").value = KeyID;
//            document.getElementById("status").value = "S2";
//            document.getElementById("rqby").style.visibility = 'visible';
//            document.getElementById("dpmhd").style.visibility = 'visible';
//            document.getElementById("isby").style.visibility = 'hidden';
//            document.getElementById("btn_openmodal2").style.visibility = 'visible';
//            document.getElementById("btn_openmodal").style.visibility = 'hidden';
//            document.getElementById("rqdate2txt").style.visibility = 'visible';
//            document.getElementById("vhead").style.visibility = 'collapse';
//            document.getElementById("sigf").style.visibility = 'visible';
//            document.getElementById("imgclose").style.visibility = 'hidden';
//            document.getElementById("imgclose3").style.visibility = 'hidden';
//            getsignature("PHONGS_PHO", Key, KeyID);
//            var frame = document.getElementById('image_div');
//            frame.style.border = "1px solid black";
//        } else if (Key == "S3") {
//
//            mvxtxt.innerHTML = "Approval : ";
//            $('#Jsgrid').jsGrid('option', 'inserting', false);
//            $('#Jsgrid').jsGrid('option', 'editing', false);
//            rt.style.visibility = 'visible';
//            rj.style.visibility = 'visible';
////            sm3.style.visibility = 'visible';
//            sm.style.visibility = 'visible';
//            chkStatus = "S3";
//            document.getElementById("vState").value = "State3";
//            console.log("wowowo");
//            console.log(KeyID);
//            getsinglesignature(KeyID);
//            getsinglesignature()
//            getallsignature();
//            box.className = "collapse in";
//            document.getElementById("ordernum").innerHTML = KeyID;
//            document.getElementById("ordernumpp").value = KeyID;
//            document.getElementById("status").value = "S3";
//            document.getElementById("rqby").style.visibility = 'visible';
//            document.getElementById("dpmhd").style.visibility = 'visible';
//            document.getElementById("isby").style.visibility = 'visible';
//            document.getElementById("btn_openmodal2").style.visibility = 'hidden';
//            document.getElementById("btn_openmodal").style.visibility = 'hidden';
//            document.getElementById("rqdate2txt").style.visibility = 'visible';
//            document.getElementById("vhead").style.visibility = 'collapse';
//            document.getElementById("sigf").style.visibility = 'visible';
//            document.getElementById("imgclose").style.visibility = 'hidden';
//            document.getElementById("imgclose3").style.visibility = 'hidden';
//            getsignature("PHONGS_PHO", "S2", KeyID);
//            getsignature("PHONGS_PHO", "S3", KeyID);
//            var frame = document.getElementById('image_div');
//            frame.style.border = "1px solid black";
//            var frame2 = document.getElementById('image_div2');
//            frame2.style.border = "1px solid black";
//        } else {
//
//            cretxt.innerHTML = vRequester + "&nbsp&nbsp";
//            mvxtxt.innerHTML = "Requester : ";
//            $('#Jsgrid').jsGrid('option', 'inserting', true);
//            $('#Jsgrid').jsGrid('option', 'editing', true);
//            var ss = document.getElementById("ssearch");
////            GetSelectID(username,Key);
//            console.log("Starttttttttttttttt");
////            document.getElementById("Reject").style.visibility = 'hidden';
////            document.getElementById("SendAppMail").style.visibility = 'hidden';
////            document.getElementById("Resend").style.visibility = 'hidden';
////            document.getElementById("sendtom3").style.visibility = 'collapse';
////            document.getElementById("Reject").style.visibility = 'hidden';
////            document.getElementById("SendAppMail").style.visibility = 'hidden';
////            document.getElementById("Resend").style.visibility = 'hidden';
////            document.getElementById("sendtom3").style.visibility = 'collapse';
//
////            var rt = document.getElementById('SendReturnMail');
////            var rj = document.getElementById('SendRejectMail');
////            var sm3 = document.getElementById('sendtom3');
//
//            rt.style.visibility = 'hidden';
//            rj.style.visibility = 'hidden';
//            rj1.style.visibility = 'visible';
////            sm3.style.visibility = 'hidden';
////    sm.style.visibility = 'hidden';
//            sm.disabled = true;
//            vhead.disabled = true;
////SendReturnMail
////SendRejectMail
//
//
//            changeddl(chkStatus);
//        }
//    });
//    var callalert = function (a) {
//        alert(a);
//    };
//    var getsignature = function (prno, Key, KeyID) {
//
//
//        $.ajax({
//            url: './Action',
//            type: 'GET',
//            dataType: 'json',
//            data: {
//                path: "getSignature",
//                cono: cono,
//                divi: divi,
//                prno: prno,
//                orderid: KeyID,
//                status: Key
//            },
//            success: function (result) {
//
//                console.log("Result Clob : ");
//                console.log(result);
//                $.each(result, function (i, obj) {
//                    //var img = $('<img id="image_id">');
//                    var imgclose = document.getElementById('imgclose');
//                    var frame = document.getElementById('image_div');
//                    var frame2 = document.getElementById('image_div2');
//                    var frame3 = document.getElementById('image_div3');
//                    //                    img.attr('src', 'data:image/png;base64,' + result[i].ST_SIGN);
//
//
//                    if (Key == "S2")
//                    {
//                        $("#image_id").remove();
//                        var img = $('<img id="image_id">');
//                        img.appendTo('#image_div');
////                        document.getElementById("rqdate").innerHTML = new Date().toLocaleString();
//                        frame.style.border = "1px solid black";
//                        img.attr('src', 'data:image/png;base64,' + result[i].ST_SIGN);
//                        console.log(result[i].ST_SIGN);
//                    } else if (Key == "S3")
//                    {
//
//                        $("#image_id2").remove();
//                        var img = $('<img id="image_id2">');
//                        img.appendTo('#image_div2');
////                        document.getElementById("rqdate2").innerHTML = new Date().toLocaleString();
//                        frame2.style.border = "1px solid black";
//                        img.attr('src', 'data:image/png;base64,' + result[i].ST_SIGN);
//                        console.log(result[i].ST_SIGN);
//                    } else if (Key == "S4")
//                    {
//
//                        $("#image_id3").remove();
//                        var img = $('<img id="image_id3">');
//                        img.appendTo('#image_div3');
////                        document.getElementById("rqdate3").innerHTML = new Date().toLocaleString();
//                        frame3.style.border = "1px solid black";
//                        img.attr('src', 'data:image/png;base64,' + result[i].ST_SIGN);
//                        console.log(result[i].ST_SIGN);
//                    }
//                    if (Key == "S1")
//                    {
//                        imgclose.style.visibility = 'visible';
//                        $("#image_id").remove();
//                        var img = $('<img id="image_id">');
//                        img.appendTo('#image_div');
////                        document.getElementById("rqdate").innerHTML = new Date().toLocaleString();
//                        frame.style.border = "1px solid black";
//                        img.attr('src', 'data:image/png;base64,' + result[i].ST_SIGN);
//                        console.log(result[i].ST_SIGN);
//                    }
//                    console.log(result[i].ST_SIGN);
//                });
//            }
//        });
//    }
//
//
//    var getsinglesignature = function (prno) {
//
//        $.ajax({
//            url: './Action',
//            type: 'GET',
//            dataType: 'json',
//            data: {
//                path: "getSignature",
//                cono: cono,
//                divi: divi,
//                prno: prno
//            },
//            success: function (result) {
//
//                console.log("Result Clob : ");
//                console.log(result);
//                $.each(result, function (i, obj) {
//                    //var img = $('<img id="image_id">');
//                    var imgclose = document.getElementById('imgclose');
//                    var frame = document.getElementById('image_div');
//                    var frame2 = document.getElementById('image_div2');
//                    var frame3 = document.getElementById('image_div3');
//                    //                    img.attr('src', 'data:image/png;base64,' + result[i].ST_SIGN);
//
//
//                });
//            }
//        });
//    }
//
//
//
//    var getallsignature = function (orderid) {
//
//        var cono = document.getElementById("cono").value;
//        var divi = document.getElementById("divi").value;
//        console.log("getsinglesignature");
//        $.ajax({
//            url: './Action',
//            type: 'GET',
//            dataType: 'json',
//            data: {
//                path: "getsignaturename",
//                cono: cono,
//                divi: divi,
//                orderid: orderid
//            },
//            success: function (result) {
//
//
//
//                console.log(result);
//                console.log("getsignaturename");
//                $.each(result, function (i, obj) {
//
//                    console.log("TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT");
//                    console.log(result[i].ORD_REGB);
//                    console.log(result[i].ORD_DPMH);
//                    sig_req = result[i].ORD_REGB;
//                    sig_dep = result[i].ORD_DPMH;
//                    console.log("TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT");
//                });
//            }
//        });
//    }
//
//
//    var get1signature = function (prno) {
//
//        $.ajax({
//            url: './Action',
//            type: 'GET',
//            dataType: 'json',
//            data: {
//                path: "getSignature",
//                cono: cono,
//                divi: divi,
//                prno: prno
//            },
//            success: function (result) {
//
//                $.each(result, function (i, obj) {
//
//                    var imgclose = document.getElementById('imgclose');
//                    var frame = document.getElementById('image_div');
//                    var frame2 = document.getElementById('image_div2');
//                    var frame3 = document.getElementById('image_div3');
//                    (result[i].ST_SIGN);
//                });
//            }
//        });
//    }
//
//
//    var adddropdownlist = function (prno) {
//
//
//
//
//    }
//
//
//
//    var aa = [
//        {Id1: "xxx"},
//        {Id1: "xxxx"},
//        {Id1: "xxxxx"},
//    ];
//    function setSelectedValue(selectObj, valueToSet) {
//        for (var i = 0; i < selectObj.options.length; i++) {
//            if (selectObj.options[i].text == valueToSet) {
//                selectObj.options[i].selected = true;
//                return;
//            }
//        }
//    }
//
//    function DeleteSignature(rolename, orderid, roledate) {
//
//        $.ajax({
//            url: './Action',
//            type: 'GET',
//            dataType: 'json',
//            data: {
//                path: "updatesignature",
//                cono: "10",
//                divi: "101",
//                orderid: orderid,
//                rolename: rolename,
//                roledate: roledate
//            },
//            success: function (result) {
//
//                console.log(result);
//            }
//        });
//    }
//
//    function insertSignature(rolename, orderid, name, datetime, roledate) {
//
//        $.ajax({
//            url: './Action',
//            type: 'GET',
//            dataType: 'json',
//            data: {
//                path: "insertsignature",
//                cono: "10",
//                divi: "101",
//                orderid: orderid,
//                rolename: rolename,
//                name: name,
//                datetime: datetime,
//                roledate: roledate
//
//            },
//            success: function (result) {
//
//                console.log(result);
//            }
//        });
//    }
//
//
//    function insertsubmit(purpose, dpmh_to, orderid) {
//
//        $.ajax({
//            url: './Action',
//            type: 'GET',
//            dataType: 'json',
//            data: {
//                path: "insertsubmit",
//                cono: "10",
//                divi: "101",
//                orderid: orderid,
//                dpmh_to: dpmh_to,
//                purpose: purpose
//
//            },
//            success: function (result) {
//
//                console.log(result);
//            }
//        });
//    }
//
//    function getEmailByName(name) {
//
//
//        console.log(name);
//        $.ajax({
//            url: './Action',
//            type: 'GET',
//            dataType: 'json',
//            data: {
//                path: "getemailbyname",
//                cono: "10",
//                name: name
//
//
//            },
//            success: function (result) {
//
//                console.log(result);
//            }
//        });
//    }
//
//    var xtext = "wario";
//    function getstoredsignature(orderid, rolename) {
//
//
//        var name = "mmm";
//        console.log(orderid);
//        console.log(rolename);
//        $.ajax({
//            url: './Action',
//            type: 'GET',
//            dataType: 'json',
//            data: {
//                path: "getstoredsignature",
//                orderid: orderid,
//                rolename: rolename
//            },
//            success: function (result) {
//
//                success(result);
//            }
//
//
//
//        });
//    }
//
//
//    function sendtom3result() {
//        type = document.querySelector('input[name="radiotype"]:checked').value;
//        ordernum = document.getElementById("ordernum").innerHTML;
//        console.log("sssssssss               " + type);
//        $.ajax({
//            url: './Action',
//            type: 'GET',
//            dataType: 'text',
//            data: {
//                path: "Sendtom3",
//                mat_type: type,
//                ordernum: ordernum
//
//            },
//            async: false,
//            success: function (data) {
//
//                alert(data);
//                //
////                document.getElementById('movexno').innerHTML = data;
//            },
//            error: function (e) {
//                alert("ล้มเหลว");
//            }
//        });
//    }
//
//
//
//
//    function checkitemexist(id, frm_whs, qty) {
//
//
//        var isExist = false;
//        $.ajax({
//            type: 'GET',
//            dataType: 'text',
//            url: './Action',
//            data: {
//                path: "getonhand",
//                code: id,
//                frm_whs: frm_whs,
//                qty_reg: qty
//
//
//
//
//            },
//            async: false,
//            success: function (data) {
//
//
//                if (data.toString() == "yes") {
//
//                    //alert("added. ");
//                    isExist = true;
//                } else
//                {
//
//                    isExist = false;
//                }
//
//            },
//            error: function (e) {
//                alert('Error occured');
//                console.log(e);
//            }
//        });
//        return isExist;
//    }
//
//
//    function validate(form) {
//
//        // validation code here ...
//
//
//
//        var vcc = document.getElementById("vPeriod");
//        var vCostcenter = vcc.options[vcc.selectedIndex].value;
//        var vRequester = document.getElementById("username").value;
//        var vDepartmentname = document.getElementById("Dname").innerHTML;
//        var vDate = document.getElementById("vDate").value;
//        var vFwhs = document.getElementById("vFwarehouse").value;
//        var vTwhs = document.getElementById("vTwarehouse").value;
//        if (
//                isEmpty(vCostcenter) &&
//                isEmpty(vRequester) &&
//                isEmpty(vDepartmentname) &&
//                isEmpty(vDate) &&
//                sendSuccess() &&
//                isEmpty(vFwhs) &&
//                isEmpty(vTwhs)) {
//
//
//
//
//            if (!valid) {
//                alert('Please correct the errors in the form!');
//                return false;
//            } else {
//                return confirm('Do you really want to submit the form?');
//            }
//
//
//        } else {
//
//            alert("Cant  Submit");
//            // return isValidForm();
//            form.preventDefault();
////               form.preventDefault(); 
//        }
//
//
//
//
//
//    }
//
//    function isEmpty(str) {
//        return !((!str || str.length === 0));
//    }
//
//    function isEmptyto(str) {
//        var vType = document.querySelector('input[name="radiotype"]:checked').value;
//        if (vType == "71")
//        {
//            return true;
//        }
//        return !((!str || str.length === 0));
//    }
//
//
//    function sendSuccess() {
//        if ($('[name=radiotype]:checked').length)
//            return true;
//        else
//            return false;
//    }
//
//    function checkgrid() {
//        const queryString = window.location.search;
//        const urlParams = new URLSearchParams(queryString);
//        isExist = false;
//        var data = $("#Jsgrid").jsGrid("option", "data");
//        var sm = document.getElementById('SendAppMail');
//        var fm = document.getElementById('vFwarehouse');
//        var vhead = document.getElementById('vhead');
//        const Key = urlParams.get('status');
//
////        var mvx = document.getElementById('movexno');
//        console.log(data);
//        console.log(data.length);
//
//        if (Key == "S2") {
//            if (data.length > 0 && !vhead.disabled) {
//                sm.disabled = false;
//                fm.disabled = true;
//            } else {
//                sm.disabled = true;
//                fm.disabled = false;
//            }
//        } else {
//            if (data.length > 0 && !vhead.disabled && vhead.value != "00") {
//                sm.disabled = false;
//                fm.disabled = true;
//            } else {
//                sm.disabled = true;
//                fm.disabled = false;
//            }
//        }
//
//        console.log("-------- checkgrid ----------");
//        console.log(data.length);
//        console.log("------------------");
//    }
//
//
//    function GetSelectID(username, key) {
//
////        var cono = document.getElementById("cono").value;
////        var divi = document.getElementById("divi").value;
//
//        $.ajax({
//            url: './Action',
//            type: 'GET',
//            dataType: 'json',
//            data: {
//                path: "GetSelectID",
//                username: username,
//                key: key,
//                cono: cono,
//                divi: divi
//
//            },
//            success: function (data) {
//
//                //selectedid.append(' ' + result.ORD_ID + ' ' + result.ORD_ID);
//                $.each(data, function (key, item) {
//                    console.log(item.ORD_ID);
//                    idlist.push(item.ORD_ID);
//                });
//                $("#ssearch").autocomplete({
//                    source: idlist,
////                    select: function (e, ui) {
////                        $('#tags_code').val(availableTagsCode[availableTags.indexOf(ui.item.value)]);
////                    }
//                });
////                var options = '';
////                $.each(data, function (key, value) {
////                    //For example
////                    console.log(value.ORD_ID)
////                    options += '<option value="' + value.ORD_ID + '" />';
////                })
////
////                document.getElementById('orderidlist').innerHTML = options;
//
//            }
//
//        });
//    }

</script>




