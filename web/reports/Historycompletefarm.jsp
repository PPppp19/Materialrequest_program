<%-- 
    Document   : history
    Created on : Nov 7, 2022, 3:32:21 PM
    Author     : Phongsathon
--%>
<link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.css" />
<link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid-theme.min.css" />

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.js"></script>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <style>




        .center {
            position: absolute;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
        }


        .header {
            padding: 60px;
            text-align: center;
            /*        background: #070c13;*/
            background: #19bfde;
            color: white;
            font-size: 30px;
            height: 180px;
            background-image: linear-gradient(#FFD700, #cd9900);
            /*background-image: linear-gradient(#1eb9e5, #608af0);*/
            /*        border-top-left-radius:10px;*/
            /*        border-top-right-radius:10px;*/
            /*            border-bottom-left-radius: 20% 50%;
                        border-bottom-right-radius: 50% 20%;*/



            /*        border-top-left-radius:10px;
                    border-top-right-radius:10px;*/

        }

        .jsgrid-header-row>.jsgrid-header-cell {
            /*background-color: #0080ff;*/
            /*            background-image: linear-gradient(#6f8aff, #19bfde);*/
            /*font-family: "Roboto Slab";*/
            background-image: linear-gradient(#FFD700, #cd9900);

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


        .modal {
            /*            background: green;
                                    position: absolute;
                        float: left;
                        left: 50%;
                        top: 50%;
                        transform: translate(-50%, -50%);
                        position:fixed;*/

            /* position: fixed;  Stay in place 
              transform: translate(-50%, -50%);
              left: 0;
              top: 0;
              width: 100%;  Full width 
              height: 100%;  Full height 
              overflow: auto;  Enable scroll if needed 
              background-color: rgb(0,0,0);  Fallback color 
              background-color: rgba(0,0,0,0.4);  Black w/ opacity */
        }


    </style>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <header class="header"  >

        <h2 align="center";  style=" color: #ffffff; font-weight: bold"> Specialty History for Store  </h2>

        <h3 align="center";  style=" color: #ffffff; font-weight: bold"><%out.print(session.getAttribute("comp"));%> </h3>

        <br>



    </header>

    <br>
    <br>
    <!--        <div>
                <div id="jsGrid"></div>
                <div id="jsGrid_item" style=" float: right"></div>
            </div>-->


    <div  id="jsGrid"></div>

    <!--        <div   id="jsGrid_item"  style=" height: 50px"></div>   -->


    <div id="frm_sublot" class="modal" style="position: fixed;
         left: 0;
         top: 0;
         width: 100%;
         height: 100%;
         overflow: auto;
         background-color: rgb(0,0,0);
         background-color: rgba(0,0,0,0.4);  "  >
        <div class="modal-content">
            <div class="panel panel-default ">
                <div class="panel-heading" style="background-color: #636366; border-radius: 2.5px;margin-left: -15px;">
                    <span class="close" style=" color: #f2f2f7">&times;</span>
                    <!--                          &nbsp;&nbsp;&nbsp;<input type="checkbox" id="isactive" name="isactive" value="isactive" style="display: inline-block; size: 15px;">               -->
                    <label class="panel-title" style="margin-left: 10px; font-size: 22px" > <font id="tabletitle" color="#FFFFFF">Edit Lot Table</font></label>

                </div>

                <div class=" panel-body " >
                    <div class="row">
                        <!--                            <div id="jsGrid_item"></div>-->
                        <div id="grid"></div>
                        <!--                        <div id="sgrid"></div>-->

                    </div>
                </div>

            </div>
        </div>
    </div>


</body>


</html>


<script>

    var DateField = function (config) {
        jsGrid.Field.call(this, config);
    };

    var clientsitem = [
        {"ITM_ID": "Otto Clay"}
    ];
    console.clear();
    var Primenumber = [{Primenumber: " 2"}, {Primenumber: " 3"}, {Primenumber: " 5"}, {Primenumber: " 7"}];
    //var clientsitem = [];
    var clients = [
        {"Name": "Otto Clay", "Age": 25, "Country": 1, "Address": "Ap #897-1459 Quam Avenue", "Married": false},
        {"Name": "Connor Johnston", "Age": 45, "Country": 2, "Address": "Ap #370-4647 Dis Av.", "Married": true},
        {"Name": "Lacey Hess", "Age": 29, "Country": 3, "Address": "Ap #365-8835 Integer St.", "Married": false},
        {"Name": "Timothy Henson", "Age": 56, "Country": 1, "Address": "911-5143 Luctus Ave", "Married": true},
        {"Name": "Ramona Benton", "Age": 32, "Country": 3, "Address": "Ap #614-689 Vehicula Street", "Married": false},
        {"Name": "Ramona Benton", "Age": 32, "Country": 3, "Address": "Ap #614-689 Vehicula Street", "Married": false},
        {"Name": "Ramona Benton", "Age": 32, "Country": 3, "Address": "Ap #614-689 Vehicula Street", "Married": false},
        {"Name": "Ramona Benton", "Age": 32, "Country": 3, "Address": "Ap #614-689 Vehicula Street", "Married": false},
        {"Name": "Ramona Benton", "Age": 32, "Country": 3, "Address": "Ap #614-689 Vehicula Street", "Married": false},
        {"Name": "Ramona Benton", "Age": 32, "Country": 3, "Address": "Ap #614-689 Vehicula Street", "Married": false},
        {"Name": "Ramona Benton", "Age": 32, "Country": 3, "Address": "Ap #614-689 Vehicula Street", "Married": false},
        {"Name": "Ramona Benton", "Age": 32, "Country": 3, "Address": "Ap #614-689 Vehicula Street", "Married": false},
        {"Name": "Ramona Benton", "Age": 32, "Country": 3, "Address": "Ap #614-689 Vehicula Street", "Married": false},
        {"Name": "Ramona Benton", "Age": 32, "Country": 3, "Address": "Ap #614-689 Vehicula Street", "Married": false},
        {"Name": "Ramona Benton", "Age": 32, "Country": 3, "Address": "Ap #614-689 Vehicula Street", "Married": false},
        {"Name": "Ramona Benton", "Age": 32, "Country": 3, "Address": "Ap #614-689 Vehicula Street", "Married": false}

    ];
//////////////

    $(function () {

        $("#grid").jsGrid({
            width: "100%",
            height: "400px",
            filtering: false,
            editing: false,
            sorting: true,
            paging: true,
            data: clientsitem,
            fields: [

                {name: "ITM_ID", type: "text", width: 3},
                {name: "ITM_DESC", type: "text", width: 3},
                {name: "ITM_UNIT", type: "text", width: 3},
                {name: "QTY_REQT", type: "text", width: 3},
                {name: "QTY_ISSU", type: "text", width: 3}
//                {title: "STATUS", name: "POS_STAT", type: "text", width: 3, editing: false},
//                {title: "Movex NO.", name: "MVX_ORDE", type: "text", width: 3, editing: false}
                
            ]
        });
        $("#sgrid").jsGrid({
            width: "100%",
            height: "400px",
            filtering: false,
            editing: false,
            sorting: true,
            paging: true,
            data: clientsitem,
            fields: [

                {name: "ITM_ID", type: "text", width: 3},
                {name: "ITM_DESC", type: "text", width: 3},
                {name: "ITM_UNIT", type: "text", width: 3},
                {name: "QTY_REQT", type: "text", width: 3},
                {name: "QTY_ISSU", type: "text", width: 3}

            ]
        });
    }
    );
///////////////


    var clients = clients;
    function runGrid() {
        var cono = "<%out.print(session.getAttribute("cono"));%>";
        var divi = "<%out.print(session.getAttribute("divi"));%>";

        $.ajax({
            type: 'GET',
            dataType: 'json',
            url: './Action',
            async: false,
            data: {
                path: "gethistoryspfarm",
                cono: cono,
                divi: divi
            },
            success: function (data) {

                console.log("gethistoryspfarm");
                console.log(data);
                clients = data;
            },
            error: function (e) {
                alert('Error occured');
                console.log(e);
            }
        });
        $("#jsGrid").jsGrid(
                {
                    width: "100%",
                    height: "605",
                    filtering: true,
                    inserting: false,
                    editing: false,
                    sorting: true,
                    paging: true,
                    data: clients,
                    rowClick: function (args) {
                        console.log(args.item.ORD_ID);
                        var modal = document.getElementById("frm_sublot");
                        modal.style.display = "block";
                        $.ajax({
                            type: 'GET',
                            dataType: 'json',
                            url: './Action',
                            async: false,
                            data: {
                                path: "gethistoryspfarm",
                                id: args.item.ORD_ID,
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
                    controller: {

                        loadData: function (filter) {
                            var data = $.Deferred();
                            if ((filter.mlitno === "")) {


                                isFilter = false;
                                console.log("no filter");
                            } else {

                                isFilter = true;
                                console.log("filter");
                            }



                            console.log("No data");
                            /////////////////////



                            $.ajax({
                                type: 'GET',
                                dataType: 'json',
                                url: './Action',
                                async: false,
                                data: {
                                    path: "gethistoryspfarm",
                                    cono: cono,
                                    divi: divi
                                },
                                success: function (data) {

                                    console.log("gethistoryspfarm");
                                    console.log(data);
                                    clients = data;
                                },
                                error: function (e) {
                                    alert('Error occured');
                                    console.log(e);
                                }
                            }).done(function (response) {
                                response = $.grep(response, function (item) {

                                    const today = new Date(item.CRE_DATE);
                                    const yyyy = today.getFullYear();
                                    let mm = today.getMonth() + 1; // Months start at 0!
                                    let dd = today.getDate();

                                    if (dd < 10)
                                        dd = '0' + dd;
                                    if (mm < 10)
                                        mm = '0' + mm;

                                    const formattedToday = dd + '/' + mm + '/' + yyyy;



                                    return (!filter.ORD_ID || (item.ORD_ID.indexOf(filter.ORD_ID) > -1))
                                            && (!filter.COS_CENT || (item.COS_CENT.indexOf(filter.COS_CENT) > -1))
                                            && (!filter.DEP_NAME || (item.DEP_NAME.indexOf(filter.DEP_NAME) > -1))
                                            && (filter.CRE_DATE.from === "01/01/1970" || formattedToday === filter.CRE_DATE.from)
                                            && (!filter.MAT_TYPE || (item.MAT_TYPE.indexOf(filter.MAT_TYPE) > -1))
                                            && (!filter.FRM_WAHO || (item.FRM_WAHO.indexOf(filter.FRM_WAHO) > -1))
                                            && (!filter.TO_WAHO || (item.TO_WAHO.indexOf(filter.TO_WAHO) > -1))
                                            && (!filter.WAH_LOCA || (item.WAH_LOCA.indexOf(filter.WAH_LOCA) > -1))
                                            && (!filter.ORD_REGB || (item.ORD_REGB.indexOf(filter.ORD_REGB) > -1))
                                            && (!filter.ORD_DPMH || (item.ORD_DPMH.indexOf(filter.ORD_DPMH) > -1))
                                            && (!filter.ORD_ISSB || (item.ORD_ISSB.indexOf(filter.ORD_ISSB) > -1))
                                            && (!filter.ORD_STAT || (item.ORD_STAT.indexOf(filter.ORD_STAT) > -1)
                                                    );
                                });
                                data.resolve(response);
                                console.log("response");
                                console.log(response);
                                console.log("response");
                            });


                            return data.promise();
                            /////////////////////








                        }

                    }
                    ,
                    fields: [
                        {title: "ID", name: "ORD_ID", type: "text", width: 3},
                        {title: "Movex No.", name: "MVX_ORDE", type: "text", width: 3,
                            itemTemplate: function (value, item) {
                                if (value === "00000000") {
                                    return "-";
                                } else {
                                    return value;
                                }


                            }
                        },
                        {title: "CRE_DATE", name: "CRE_DATE", type: "date", width: 3  },

                        {title: "POSTED DATE", name: "ORD_REMAR", type: "date", width: 3},

                        {title: "Status", name: "ORD_STAT", type: "text", items: countries, valueField: "Id", textField: "Name", width: 3, filtering: false,
                            itemTemplate: function (value, item) {
                                if (value === "99") {
                                    return "Reject";
                                } else if (value === "00") {
                                    return "Requester";
                                } else if (value === "01") {
                                    return "Department Head";
                                } else if (value === "10") {
                                    return "Approver";
                                } else if (value === "11") {
                                    return "Storing";
                                } else if (value === "R00") {
                                    return "Returned";
                                } else if (value === "22") {
                                    return "Completed";
                                } else if (value === "21") {
                                    return "Posted";
                                } else {
                                    return "-";
                                }

                            }

                        },
                        {title: "COS_CENT", name: "COS_CENT", type: "text", width: 3},
                        {title: "Dept", name: "DEP_NAME", type: "text", width: 3},
                        {title: "TYPE", name: "MAT_TYPE", type: "text", width: 1,
                            itemTemplate: function (value, item) {
                                if (value === "33") {
                                    return "A33";
                                } else if (value === "71") {
                                    return "A71";
                                } else {
                                    return "-";
                                }

                            }

                        },
                        {title: "FROM", name: "FRM_WAHO", type: "text", width: 1},
                        {title: "TO", name: "TO_WAHO", type: "text", width: 1}

                    ]
                }
        );
    }
    $(runGrid);
    var modal = document.getElementById("frm_sublot");
    var span_1 = document.getElementsByClassName("close")[0];
    span_1.onclick = function () {
        modal.style.display = "none";
    };







    DateField.prototype = new jsGrid.Field({
        sorter: function (date1, date2) {
            return new Date(date1) - new Date(date2);
        },

        itemTemplate: function (value) {
            const today = new Date(value);
            const yyyy = today.getFullYear();
            let mm = today.getMonth() + 1; // Months start at 0!
            let dd = today.getDate();

            if (dd < 10)
                dd = '0' + dd;
            if (mm < 10)
                mm = '0' + mm;

            const formattedToday = dd + '/' + mm + '/' + yyyy;

            return formattedToday;
        },

        filterTemplate: function () {
            var grid = this._grid;

            var now = new Date();
            this._fromPicker = $("<input placeholder=" + '"' + "MM/DD/YYYY" + '"' + ">").datepicker({defaultDate: now.setFullYear(now.getFullYear() - 1)});

            this._fromPicker.on("change", function (e) {
//                if (e.which === 13) {
                grid.search();
                e.preventDefault();
                //}
            });

            this._fromPicker.on("Close", function (e) {
//                if (e.which === 13) {
                grid.search();
                e.preventDefault();
                //}
            });


            return $("<div>").append(this._fromPicker);


        },

        insertTemplate: function (value) {
            return this._insertPicker = $("<input>").datepicker({defaultDate: new Date()});
        },

        editTemplate: function (value) {
            return this._editPicker = $("<input>").datepicker().datepicker("setDate", new Date(value));

        },

        insertValue: function () {
            return this._insertPicker.datepicker("getDate").toISOString();
        },

        editValue: function () {
            return this._editPicker.datepicker("getDate").toISOString();
        },

        filterValue: function () {

            const today = new Date(this._fromPicker.datepicker("getDate"));
            const yyyy = today.getFullYear();
            let mm = today.getMonth() + 1; // Months start at 0!
            let dd = today.getDate();

            if (dd < 10)
                dd = '0' + dd;
            if (mm < 10)
                mm = '0' + mm;

            const formattedToday = dd + '/' + mm + '/' + yyyy;


            return {
                from: formattedToday
//                from:this._fromPicker.datepicker("getDate")

            };
        }
    });

    jsGrid.fields.date = DateField;


    var countries = [
        {Name: "ALL", Id: ""},
        {Name: "Requester", Id: "00"},
        {Name: "Department Head", Id: "01"},
        {Name: "Storing", Id: "11"},
        {Name: "Returned", Id: "R00"},
        {Name: "Reject", Id: "99"},
        {Name: "Posted", Id: "21"},
        {Name: "Completed", Id: "22"}

    ];


</script>