<%-- 
    Document   : Settings
    Created on : Nov 28, 2022, 3:32:21 PM
    Author     : Phongsathon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.css" />
<link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid-theme.min.css" />

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.js"></script>

<!DOCTYPE html>
<style>



    .ui-autocomplete {
        max-height: 200px;
        overflow-y: auto;
        /* prevent horizontal scrollbar */
        overflow-x: hidden;
        /* add padding to account for vertical scrollbar */
        padding-right: 20px;
    }


    .header {
        padding: 60px;
        text-align: center;
        /*        background: #070c13;*/
        background: #19bfde;
        color: white;
        font-size: 30px;
        height: 180px;

        /*        background-image: linear-gradient(#2b7176, #0c4e6a);*/
        background-image: linear-gradient(#0a1321, #195d7a);

        /*        border-top-left-radius:10px;*/
        /*        border-top-right-radius:10px;*/
        /*            border-bottom-left-radius: 20% 50%;
                    border-bottom-right-radius: 50% 20%;*/



        /*        border-top-left-radius:10px;
                border-top-right-radius:10px;*/

    }


    .jsgrid-header-row>.jsgrid-header-cell {
        /*background-color: #0080ff;*/
        /*        background-image: linear-gradient(#6f8aff, #19bfde);*/
        background-image: linear-gradient(#0a1321, #195d7a);        /*font-family: "Roboto Slab";*/
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
</style>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Setting</title>
    </head>

    <header class="header"  >

        <h2 align="center";  style=" color: #ffffff; font-weight: bold"> Approval Settings </h2>

        <h3 align="center";  style=" color: #ffffff; font-weight: bold"><%out.print(session.getAttribute("comp"));%> </h3>





    </header>


    <br>
    <br>
    <body>

        <!--        <div id="myDropdown" class="dropdown-content">
                    <input type="text" placeholder="Search.." id="myInput" onkeyup="filterFunction()">
                    <a href="#about">About</a>
                    <a href="#base">Base</a>
                    <a href="#blog">Blog</a>
                    <a href="#contact">Contact</a>
                    <a href="#custom">Custom</a>
                    <a href="#support">Support</a>
                    <a href="#tools">Tools</a>
        
                </div>-->



    </body>

    <div class="center">
        <div  id="Jsgrid"></div>
    </div>

</html>

<script>

    var approval = [];
    $(document).ready(function () {

        console.log("Ready...");
        var cono = "10";
        var divi = "101";
        $.ajax({
            url: './Action',
            type: 'GET',
            dataType: 'json',
            data: {
                path: "getuserapproval",
                cono: cono

            },
            success: function (result) {

                console.log("result");
                console.log(result);
                $("#Jsgrid").jsGrid("option", "data", result);
//                approval = result;

            }
        });
        $(function () {




            $("#Jsgrid").jsGrid({
                width: "100%",
                height: "400px",
                filtering: true,
                editing: false,
                sorting: true,
                inserting: true,
                paging: true,
                data: approval,
                onItemInserting: function (args) {

                    console.log(args.item.UID);
                    $.ajax({
                        url: './Action',
                        type: 'GET',
                        dataType: 'json',
                        data: {
                            path: "insertapproval",
                            cono: "10",
                            id: args.item.UID

                        }

                    });
                },
                onItemDeleting: function (args) {

                    console.log(args.item.UID);
                    $.ajax({
                        url: './Action',
                        type: 'GET',
                        dataType: 'json',
                        data: {
                            path: "deletdapproval",
                            cono: "10",
                            id: args.item.UID

                        }

                    });
                },
                fields: [
                    {title: "Approver", name: "UID", type: "myTagField", width: 150},
                    {type: "control", modeSwitchButton: false, clearFilterButton: false, editButton: false}

                ]
            }
            );
        });
    });
////////////////////////////////////////////




    $(function (e) {


        $.ajax({
            url: './Action',
            type: 'GET',
            dataType: 'json',
            data: {
                path: "getuserapprovalname",
                cono: "10"

            },
            success: function (data) {

                $.each(data, function (i) {



                    approval.push(data[i].CTL_UID);
                });
            }
        });
        var myTagField = function (config) {
            jsGrid.Field.call(this, config);
        };
        myTagField.prototype = new jsGrid.Field({
            sorter: function (tag1, tag2) {
                return tag1.localeCompare(tag2);
            },
            itemTemplate: function (value) {

                return value;
            },
            insertTemplate: function (value) {



                var reitem = this._insertAuto = $("<input>").autocomplete({source: approval,
                    select: function (event, ui) {



                    }
                });
                return reitem;
            },
            insertValue: function () {
                console.log(this._insertAuto.val());
                var revalue = this._insertAuto.val();
                const myArray = revalue.split(":");
                return myArray[0];
            },
        });
        jsGrid.fields.myTagField = myTagField;
    });


</script>