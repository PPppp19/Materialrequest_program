<%-- 
    Document   : StorePage
    Created on : Dec 29, 2022, 4:33:21 PM
    Author     : Phongsathon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.css" />
<link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid-theme.min.css" />
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.js"></script>

<!DOCTYPE html>
<html>

    <style>



        #frm_sublot {
            position: relative;
        }

        .modal-dialog {
            position: fixed;
            width: 100%;
            margin: 0;
            padding: 10px;
        }




        .jsgrid-header-row>.jsgrid-header-cell {
            /*background-color: #0080ff;*/
            /*background-image: linear-gradient(#6f8aff, #19bfde);*/
            background-image: linear-gradient(#0a1321, #6f8aff);

            /*font-family: "Roboto Slab";*/
            font-size: 1.2em;
            color: white;
            font-weight: normal;
            align-content: center;
            text-align: center;
            align-self: center;
        }



        .header {
            padding: 60px;
            text-align: center;
            /*        background: #070c13;*/
            background: #19bfde;
            color: white;
            font-size: 30px;
            height: 180px;

            /*            background-image: linear-gradient(#6f8aff, #19bfde);*/
            background-image: linear-gradient(#0a1321, #6f8aff);
            /*            border-bottom-left-radius:10% 30%;*/
            /*        border-top-right-radius:10px;*/
            /*border-bottom-right-radius:   70% 20%;*/




            /*        border-top-left-radius:10px;
                    border-top-right-radius:10px;*/

        }


        .spinnermodal {
            background-color: #FFFFFF;
            height: 100%;
            left: 0;
            opacity: 0.5;
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 100000;
        }

        /* Center the loader */
        .loader {
            position: absolute;
            left: 50%;
            top: 50%;
            z-index: 1;
            width: 120px;
            height: 120px;
            margin: -76px 0 0 -76px;
            border: 16px solid #f3f3f3;
            border-radius: 50%;
            border-top: 16px solid #3498db;
            -webkit-animation: spin 2s linear infinite;
            animation: spin 2s linear infinite;
        }

        @-webkit-keyframes spin {
            0% {
                -webkit-transform: rotate(0deg);
            }
            100% {
                -webkit-transform: rotate(360deg);
            }
        }

        @keyframes spin {
            0% {
                transform: rotate(0deg);
            }
            100% {
                transform: rotate(360deg);
            }
        }

        /* Add animation to "page content" */
        .animate-bottom {
            position: relative;
            -webkit-animation-name: animatebottom;
            -webkit-animation-duration: 1s;
            animation-name: animatebottom;
            animation-duration: 1s
        }

        @-webkit-keyframes animatebottom {
            from {
                bottom:-100px;
                opacity:0
            }
            to {
                bottom:0px;
                opacity:1
            }
        }

        @keyframes animatebottom {
            from{
                bottom:-100px;
                opacity:0
            }
            to{
                bottom:0;
                opacity:1
            }
        }

        #myDiv {
            display: none;
            text-align: center;
        }

        .jsgrid-grid-body{

            color: #161637;
            text-align: center;
        }


    </style>


    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <header class="header"  >

            <h1 align="center";  style=" color: #ffffff; font-weight: bold"> Store Approval  </h1>

            <h3 align="center";  style=" color: #ffffff; font-weight: bold"><%out.print(session.getAttribute("comp"));%> </h3>

            <br>



        </header>



        <br>

        &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
        <label style="width: 10%; color: #FFFFFF ">Approval By :</label>
        <label id="creatortxt"  style="color: #FFFFFF; font-weight: normal;"><%out.print(session.getAttribute("user"));%></label> 
        <br>
        <br>

        <div  style="height: 50%; width: 50%;position: absolute;
              left: 50%;
              top: 50%;
              transform: translate(-50%, -0%);" id="jsGrid"></div>


        <div id="loader"  class="loader"  style="display:none;" ></div>
        <!--        <div  id="grid"></div>-->
        <div class="spinnermodal" id="progressbar" style="display: none; z-index: 10001">
            <div style="position: fixed; z-index: 10001; top: 50%; left: 50%; height:65px">
                <img src="./images/icons/duck.jpg" alt="" />
            </div>
        </div>

        <br>
        <br>
        <!--        <button class="btn-danger" >Reject</button>
                <button class="btn-success" >Send to m3</button>
            </body>-->

        <form name="Mail" id="Mail" method="GET" action="./sendmail" >



            <!--        <button onclick="sendtom3result();" type="button" id="sendtom3" name="sendtom3"   value="sendtom3" style=" width: 15%; height: 30%; color: white; background-color: red; border-color: white;" class="btn btn-primary">
                        Send to M3
                    </button>
            
                    <button type="submit" id="SendRejectMail" name="SendAppMail"   value="SendRejectMail" style=" width: 15%; " class="btn btn-danger mb-2" style="color:#FFFFFF;" >Reject</button>-->


        </form>


        <div id="frm_sublot" class="modal" style="position: fixed;
             left: 0;
             top: 0;
             width: 100%;
             height: 100%;
             overflow: auto;
             background-color: rgb(0,0,0);
             background-color: rgba(0,0,0,0.4); "  >
            <div class="modal-content">
                <div class="panel panel-default ">
                    <div class="panel-heading" style="background-color: #636366; border-radius: 2.5px;margin-left: -15px;">
                        <span class="close" style=" color: #f2f2f7">&times;</span>
                        <!--                          &nbsp;&nbsp;&nbsp;<input type="checkbox" id="isactive" name="isactive" value="isactive" style="display: inline-block; size: 15px;">               -->
                        <label class="panel-title" style="margin-left: 10px; font-size: 22px" > <font id="tabletitle" color="#FFFFFF">Requested Items</font></label>
                        <label class="panel-title" style="visibility: hidden; margin-left: 10px; font-size: 22px" > <font id="idtitle" color="#FFFFFF"></font></label>
                        <label class="panel-title" style="visibility: hidden; margin-left: 10px; font-size: 22px" > <font id="typetitle" color="#FFFFFF"></font></label>
                    </div>

                    <div class=" panel-body " >
                        <div class="row">
                            <!--  
                            <div id="jsGrid_item"></div>-->
                            <div id="grid"></div>





                            <div style="float: right; position: relative;   position: absolute; right:5%;top: 87%;">

                                <input  type="date" class="btn btn-primary mb-2" id="vDate" name="vDate">
                                &nbsp;
                                <button type="button" class="btn btn-primary mb-2" style="background-color: #2c2c96; outline: 1px solid #ffffff;" onclick="sendtom3result1()" id="sendtom3" name="sendtom3"   value="sendtom3"  >Post to M3</button>
                                &nbsp;
                                <button type="button" class="btn btn-primary mb-2" style="background-color: #ff0035; outline: 1px solid #ffffff;" onclick="rejectid1()" id="reject" name="sendtom3"   value="sendtom3"  >Cancel</button>
                            </div>
                        </div>


                    </div>

                </div>

            </div>

        </div>



        <script>


            var items = [];
            var username = "<%out.print(session.getAttribute("user"));%>";
            var cono = "<%out.print(session.getAttribute("cono"));%>";
            var divi = "<%out.print(session.getAttribute("divi"));%>";
            $.ajax({
                type: 'GET',
                dataType: 'json',
                url: './Action',
                async: false,
                data: {
                    path: "getHistorybystatefarm",
                    cono: cono,
                    divi: divi
                },
                success: function (data) {

                    console.log("getHistorybystatefarm");
                    console.log(data);
                    items = data;
                },
                error: function (e) {
                    alert('Error occured');
                    console.log(e);
                }
            });
            $("#jsGrid").jsGrid({
                width: "95%",
                height: "500px",
                filtering: false,
                editing: false,
                sorting: true,
                paging: true,
                data: items,
                rowClick: function (args) {
                    var modal = document.getElementById("frm_sublot");
                    modal.style.display = "block";
                    var titlesubgrid = document.getElementById("tabletitle");
                    titlesubgrid.innerHTML = "[ ID : " + args.item.ORD_ID + " ]  --------- : " + args.item.FRM_WAHO + " ---------> : " + args.item.TO_WAHO;
                    var idtitle = document.getElementById("idtitle");
                    idtitle.innerHTML = args.item.ORD_ID;
                    var typetitle = document.getElementById("typetitle");
                    typetitle.innerHTML = args.item.MAT_TYPE;
                    var cono = "<%out.print(session.getAttribute("cono"));%>";
                    var divi = "<%out.print(session.getAttribute("divi"));%>";
                    $.ajax({
                        type: 'GET',
                        dataType: 'json',
                        url: './Action',
                        async: false,
                        data: {
                            path: "gethistoryitem",
                            id: args.item.ORD_ID,
                            whs: args.item.FRM_WAHO,
                            cono: cono,
                            divi: divi
                        },
                        success: function (data) {

                            console.log("gethistoryitem");
                            console.log(data);
                            $("#grid").jsGrid("option", "data", data);

                            clientsitem = data;
                            // clients = data;
                        },
                        error: function (e) {
                            alert('Error occured');
                            console.log(e);
                        }
                    });
                },
                fields: [

                    {name: "ORD_ID", type: "text"},
                    {title: "TYPE", name: "MAT_TYPE", width: 50, type: "text",
                        itemTemplate: function (value, item) {
                            if (value === "71") {
                                return "A71";
                            } else if (value === "33") {
                                return "A33";
                            } else {
                                return "-";
                            }

                        }
                    },
                    {name: "COS_CENT", type: "text"},
                    {name: "CRE_DATE", type: "text"},
                    {name: "DEP_NAME", type: "text"},
                    {title: "FROM", name: "FRM_WAHO", width: 60, type: "text"},
                    {title: "TO", name: "TO_WAHO", width: 45, type: "text"},
                    {title: "LOCATION", name: "WAH_LOCA", width: 100, type: "text"},
                    {name: "ORD_REGB", type: "text"},
                    {name: "ORD_DPMH", type: "text"},
                    {name: "ORD_ISSB", type: "text"},
                    {

                        itemTemplate: function (_, item) {
                            if (item.ORD_STAT !== "99") {

                                return $("<button " + "class=" + '"' + "btn btn-primary mb-2" + '"' + " style=" + '"' + "background-color: #2c2c96; outline: 1px solid #ffffff;" + '"' + ">").text("PosttoM3")
                                        .on("click", function () {
                                            sendtom3result(item.MAT_TYPE, item.ORD_ID);
//                                            $("#jsGrid").jsGrid("loadData");
//                                            $("#jsGrid").jsGrid("refresh");

                                            $("#jsGrid").jsGrid("option", "data", clientsitem);

                                            $.ajax({
                                                type: 'GET',
                                                dataType: 'json',
                                                url: './Action',
                                                async: false,
                                                data: {
                                                    path: "getHistorybystatefarm",
                                                    cono: cono,
                                                    divi: divi
                                                },
                                                success: function (data) {

                                                    console.log("getHistorybystatefarm");
                                                    console.log(data);
                                                    $("#jsGrid").jsGrid("option", "data", data);

                                                },
                                                error: function (e) {
                                                    alert('Error occured');
                                                    console.log(e);
                                                }
                                            });
                                            return false;
                                        });
                            }
                            return false;
                        }
                    },
                    {
                        itemTemplate: function (_, item) {
                            if (item.ORD_STAT !== "99") {

                                return $("<button " + "class=" + '"' + "btn btn-primary mb-2" + '"' + " style=" + '"' + "background-color: #ff0035; outline: 1px solid #ffffff;" + '"' + ">").text("Cancel")
                                        .on("click", function () {
                                            alert("Reject: " + item.ORD_ID);
                                            //sendtom3result();
                                            rejectid(item.ORD_ID);
                                            $.ajax({
                                                type: 'GET',
                                                dataType: 'json',
                                                url: './Action',
                                                async: false,
                                                data: {
                                                    path: "getHistorybystatefarm",
                                                    cono: cono,
                                                    divi: divi
                                                },
                                                success: function (data) {

                                                    console.log("getHistorybystatefarm");
                                                    console.log(data);
                                                    $("#jsGrid").jsGrid("option", "data", data);

                                                },
                                                error: function (e) {
                                                    alert('Error occured');
                                                    console.log(e);
                                                }
                                            });
                                            return false;
                                        });
                            }
                            return false;
                        }
                    }
                ]
            });


            function MoneyField(config) {
                jsGrid.NumberField.call(this, config);
            }

            MoneyField.prototype = new jsGrid.NumberField({

//                itemTemplate: function (value) {
//                    return  parseFloat(value).toFixed(2) || parseFloat(0).toFixed(2);
//
//                },
//
//                filterValue: function () {
//                    return parseFloat(this.filterControl.val() || 9999);
//                },
//                insertValue: function () {
//                    return parseFloat(this.insertControl.val() || 9999);
//                },
////                editValue: function () {
////                    return parseDouble(this.editControl.val() || 0);
////                }
//                editValue: function () {
//                    return parseFloat(this.editControl.val() || 999);
//                }



                  filterValue: function () {
                        return this.filterControl.val()
                                ? parseFloat(this.filterControl.val() || 0, 10)
                                : undefined;
                    },

                    insertValue: function () {
                        return this.insertControl.val()
                                ? parseFloat(this.insertControl.val() || 0, 10)
                                : undefined;
                    },

                    editValue: function () {
                        return this.editControl.val()
                                ? parseFloat(this.editControl.val() || 0, 10)
                                : undefined;
                    },

            });
            jsGrid.fields.money = MoneyField;


            var clientsitem = [];
///////////////////Modal Grid//////////////////////


            $(function () {
                
                    function MoneyField(config) {
                jsGrid.NumberField.call(this, config);
            }

            MoneyField.prototype = new jsGrid.NumberField({

//                itemTemplate: function (value) {
//                    return  parseFloat(value).toFixed(2) || parseFloat(0).toFixed(2);
//
//                },
//
//                filterValue: function () {
//                    return parseFloat(this.filterControl.val() || 9999);
//                },
//                insertValue: function () {
//                    return parseFloat(this.insertControl.val() || 9999);
//                },
////                editValue: function () {
////                    return parseDouble(this.editControl.val() || 0);
////                }
//                editValue: function () {
//                    return parseFloat(this.editControl.val() || 999);
//                }



                  filterValue: function () {
                        return this.filterControl.val()
                                ? parseFloat(this.filterControl.val() || 0, 10)
                                : undefined;
                    },

                    insertValue: function () {
                        return this.insertControl.val()
                                ? parseFloat(this.insertControl.val() || 0, 10)
                                : undefined;
                    },

                    editValue: function () {
                        return this.editControl.val()
                                ? parseFloat(this.editControl.val() || 0, 10)
                                : undefined;
                    }

            });
            jsGrid.fields.money = MoneyField;


                

                $("#grid").jsGrid({
                    width: "100%",
                    height: 350,
                    filtering: false,
                    editing: true,
                    sorting: true,
                    paging: true,
                    pagesize: 10,
                    data: clientsitem,
                    onItemDeleting: function (args) {

                        console.log("-----------Deleted---------------");
                        console.log("onItemDelet ");
                        console.log(args.item);
                        var id = document.getElementById("idtitle").innerHTML;
                        $.ajax({
                            type: 'GET',
                            url: './Action',
                            data: {
                                path: "deleteitemdata",
                                code: args.item.ITM_ID,
                                itid: args.item.ID,
                                id: id


                            },
                            success: function (data) {

                                console.log("Deleted");
                            },
                            error: function (e) {
                                alert('Error occured');
                                console.log(e);
                            }
                        });
                    },
                    onItemUpdating: function (args) {

                        var onhand = "NO";
                        alert(args.item.QTY_ISSU);
                        console.log(args.item);
                        console.log(args.item.QTY_ISSU < parseInt(args.item.ONHAND));
                        console.log(args.item.QTY_ISSU > 0);

                        console.log(args.item.QTY_ISSU);
                        console.log(parseInt(args.item.ONHAND));
                        console.log(parseInt(args.item.QTY_ISSU));
                        if (args.item.QTY_ISSU <= parseInt(args.item.ONHAND) && args.item.QTY_ISSU > 0) {
                            onhand = "YES";
                            console.log("YES");
                        }
                        console.log("onItemUpdate ");
                        console.log(args.item);
                        var id = document.getElementById("idtitle").innerHTML;
                        console.log(id);
                        console.log(args.item.ID);
                        console.log(onhand);
                        console.log("onItemUpdate ");
                        $.ajax({
                            type: 'GET',
                            url: './Action',
                            async: false,
                            data: {
                                path: "updateissitemdatastore",
                                code: args.item.ITM_ID,
                                issu: args.item.QTY_ISSU,
                                itid: args.item.ID,
                                id: id,
                                onhand: onhand

                            },
                            success: function (data) {

                                console.log("Updated");
                                console.log(data);
                            },
                            error: function (e) {
                                alert('Error occured');
                                console.log(e);
                            }
                        });
                    },
                    fields: [

                        {name: "ITM_ID", type: "text", width: 3, editing: false},
                        {name: "ITM_DESC", type: "text", width: 3, editing: false},
                        {name: "ITM_UNIT", type: "text", width: 3, editing: false},
                        {name: "QTY_REQT", type: "number", width: 3, editing: false},
                        {name: "QTY_ISSU", type: "money", width: 3, editing: true},
                        {name: "ONHAND", type: "text", width: 3, editing: false},
                        {name: "STATUS", type: "text", width: 3, editing: false,
                            itemTemplate: function (_, item) {

                                if (parseFloat(item.ONHAND) >= parseFloat(item.QTY_ISSU) && parseFloat(item.QTY_ISSU) > 0) {
                                    return "YES";
                                } else {
                                    return "NO";
                                }

                            }

                        },
//                        {name: "POS_STAT", type: "text", width: 3, editing: false},
//                        {name: "MVX_ORDE", type: "text", width: 3, editing: false},
                        {type: "control", width: 3}


                    ]
                });
            }
            );
///////////////////Modal Grid//////////////////////

            (function (jsGrid, $, undefined) {

                var TextField = jsGrid.TextField;

                function NumberField(config) {
                    TextField.call(this, config);
                }

                NumberField.prototype = new TextField({

                    sorter: "number2",
                    align: "right",
                    readOnly: false,

                    filterValue: function () {
                        return this.filterControl.val()
                                ? parseFloat(this.filterControl.val() || 0, 10)
                                : undefined;
                    },

                    insertValue: function () {
                        return this.insertControl.val()
                                ? parseFloat(this.insertControl.val() || 0, 10)
                                : undefined;
                    },

                    editValue: function () {
                        return this.editControl.val()
                                ? parseFloat(this.editControl.val() || 0, 10)
                                : undefined;
                    },

                    _createTextBox: function () {
                        return $("<input>").attr("type", "number")
                                .prop("readonly", !!this.readOnly);
                    }
                });

                jsGrid.fields.number2 = jsGrid.NumberField = NumberField;

            }(jsGrid, jQuery));

            var modal = document.getElementById("frm_sublot");
            var span_1 = document.getElementsByClassName("close")[0];
            span_1.onclick = function () {
                modal.style.display = "none";
            };

            function sendtom3result1() {
                var id = document.getElementById("idtitle").innerHTML;
                var type = document.getElementById("typetitle").innerHTML;
                var cono = "<%out.print(session.getAttribute("cono"));%>";
                var divi = "<%out.print(session.getAttribute("divi"));%>";
                sendtom3result(type, id);
                $.ajax({
                    type: 'GET',
                    dataType: 'json',
                    url: './Action',
                    async: false,
                    data: {
                        path: "getHistorybystatefarm",
                        cono: cono,
                        divi: divi
                    },
                    success: function (data) {

                        console.log("getHistorybystatefarm");
                        console.log(data);
                        $("#jsGrid").jsGrid("option", "data", data);

                    },
                    error: function (e) {
                        alert('Error occured');
                        console.log(e);
                    }
                });
                modal.style.display = "none";
            }
            function rejectid1() {
                var id = document.getElementById("idtitle").innerHTML;
                var date1 = new Date().toLocaleString();
                var cono = "<%out.print(session.getAttribute("cono"));%>";
                var divi = "<%out.print(session.getAttribute("divi"));%>";
                rejectid(id);
                $.ajax({
                    type: 'GET',
                    dataType: 'json',
                    url: './Action',
                    async: false,
                    data: {
                        path: "getHistorybystatefarm",
                        cono: cono,
                        divi: divi

                    },
                    success: function (data) {

                        console.log("getHistorybystatefarm");
                        console.log(data);
                        $("#jsGrid").jsGrid("option", "data", data);

                    },
                    error: function (e) {
                        alert('Error occured');
                        console.log(e);
                    }
                });
                $.ajax({
                    type: 'GET',
                    url: './Action',
                    async: false,
                    data:
                            {
                                path: "updateusername",
                                username: username,
                                id: id,
                                datetime: date1
                            }
                });
                modal.style.display = "none";
            }


            function sendtom3result(type, ordernum) {
//                $("#loader").show();
                var date = document.getElementById('vDate').value.toString();
                var cono = "<%out.print(session.getAttribute("cono"));%>";
                var divi = "<%out.print(session.getAttribute("divi"));%>";




                var date1 = new Date().toLocaleString();
                console.log("sssssssss               " + type);
                console.log("sssssssss               " + ordernum);
                $.ajax({
                    url: './Action',
                    type: 'GET',
                    dataType: 'text',
                    data: {
                        path: "Sendtom3",
                        mat_type: type,
                        ordernum: ordernum,
                        vDate: date,
                        cono: cono,
                        divi: divi


                    },
                    async: false,
                    beforeSend: function () {
                        $("#loader").show();

                        showLoader();
                    },
                    success: function (data) {

                        $("#loader").hide();
                        $.ajax({
                            type: 'GET',
                            url: './Action',
                            async: false,
                            data:
                                    {
                                        path: "updateusername",
                                        username: username,
                                        id: ordernum,
                                        datetime: date1

                                    }
                        });
                        hideLoader();
                        alert(data);
                        document.getElementById('movexno').innerHTML = data;
                    },
                    error: function (e) {
                        alert("ล้มเหลว");

                    }
                });

            }



            function rejectid(ordernum) {
                var date1 = new Date().toLocaleString();
                $.ajax({
                    url: './Action',
                    type: 'GET',
                    data: {
                        path: "rejectid",
                        ordernum: ordernum

                    },
                    async: false,
                    beforeSend: function () {

                        // showLoader();
                    },
                    success: function (data) {

//                        $("#loader").hide();
                        //  hideLoader();
                        // alert(data);
                        //
                        //                document.getElementById('movexno').innerHTML = data;
                    },
                    error: function (e) {
                        alert("ล้มเหลว");
//                        $("#loader").hide();
                        // hideLoader();
                    }
                });
                $.ajax({
                    type: 'GET',
                    url: './Action',
                    async: false,
                    data:
                            {
                                path: "updateusername",
                                username: username,
                                id: ordernum,
                                datetime: date1
                            }
                });
            }


            function showLoader() {
                $("#progressbar").css("display", "");
            }

            function hideLoader() {
                setTimeout(function () {
                    $("#progressbar").css("display", "none");
                }, 1000);
            }



            $(document).ready(function () {

                var date = document.getElementById('vDate');
                var today = new Date();
                date.max = new Date(new Date().setDate(today.getDate() + 15)).toISOString().split("T")[0];
                date.min = new Date(new Date().setDate(today.getDate() - 45)).toISOString().split("T")[0];
                date.valueAsDate = today;

                //date.min = today.getDate(); 

            });
        </script>
</html>
