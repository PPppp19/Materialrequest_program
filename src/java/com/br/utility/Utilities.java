/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.br.utility;

import com.br.connection.ConnectDB2;
//import static com.br.utility.ConnectM3.order_no;
//import java.nio.charset.StandardCharsets;
//import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
//import java.util.Base64;
//import javax.crypto.Cipher;

/**
 *
 * @author Phongsathon
 */
public class Utilities {

    public static String getmaildetailRTNDPS(String username, String ordernum, String status, String touser, String cono, String pgmtype) throws Exception {

        try {
            Connection conn = ConnectDB2.ConnectionDB();
            Statement sta = conn.createStatement();
            String state = "";

            System.out.println("zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz");
            String nextStatus = "";
            switch (status) {
                case "S1":
                    nextStatus = "S2";
                    state = "01";

                    break;
                case "S2":
                    nextStatus = "S4";
                    state = "14";
                    break;

                case "S4":
                    nextStatus = "S5";
                    state = "15";
                    break;

                case "S5":
                    nextStatus = "S3";
                    state = "11";
                    break;
                case "S3":
                    nextStatus = "SS";
                    state = "11";
                    break;

            }

            String  name = ""; 
            String Sql = "UPDATE " + GBVAR.DBPRD + ".FAR_MTRREQ04\n"
                    + "SET   ORD_STAT = '" + state + "'  \n"
                    + "WHERE ORD_ID  = '" + ordernum + "'";

            System.out.println(Sql);
            sta.executeUpdate(Sql);

            String Sql2 = " SELECT ST_N6L3 FROM BRLDTA0100.STAFFLIST s \n"
                    + "       WHERE ST_EMAIL  = '" + touser + "' AND ST_CONO = '" + cono + "'";

            System.out.println(Sql2);
            ResultSet rs2 = sta.executeQuery(Sql2);

            if (rs2.next()) {
                 name = rs2.getString("ST_N6L3");
                System.out.println("ST_N6L3 = " + name);
            } else {
                System.out.println("No data found");
            }

            //String LinkCreate = "Please click this link to verify your email address : http://192.200.9.106:8080/UserRequest/?page=ResetNewPW&pp=" + encyptedCodeStr;
//            String LinkCreate = " Testpp: http://192.200.9.106:8080/UserRequest/?page=ResetNewPW&Destination=ResetPW&pp=" + urlEncry;
//            String LinkCreate = "<p>Please click this link to verify your email address : <a href=\"http://192.200.9.106:8080/UserRequest/?page=ResetNewPW&Destination=ResetPW&pp="+encyptedCodeStr+"\"><u>Click Here</U></a>.</p>";
            String LinkCreate = "";
            if (nextStatus == "SS") {

                LinkCreate = "<p> Material request Send to Store <a href=\"http://192.200.9.189:8080/MaterialRequest/?page=history\"><u>Check it</U></a>.</p>";

            } else {

//PRD
                LinkCreate = "<p> Material request " + pgmtype + " ID : " + ordernum + " from : " + username + " : <a href=\"http://210.1.14.22:8080/MaterialRequest/DeptCONO.jsp?user=" + name + "&ORDID=" + ordernum + "&CONO=" + cono + "&PGMTYPE=" + pgmtype + "&STATUS=" + nextStatus + "\"><u>Click Here to puclic network</U></a>.</p> <p> Material request ID : " + ordernum + " from : " + username + " : <a href=\"http://192.200.9.189:8080/MaterialRequest/DeptCONO.jsp?user=" + touser + "&ORDID=" + ordernum + "&CONO=" + cono + "&PGMTYPE=" + pgmtype + "&STATUS=" + nextStatus +  " \"><u>Click Here to internal network</U></a>.</p>";

//TST
                //     LinkCreate = "<p> Material request ID : " + ordernum + " from : " + username + " : <a href=\"http://192.200.9.94:8080/MaterialRequest/DeptCONO.jsp?user="+touser+"&ORDID=" + ordernum + "&CONO="+cono+"\"><u>Click Here to puclic network</U></a>.</p> <p> Material request ID : " + ordernum + " from : " + username + " : <a href=\"http://192.200.9.94:8080/MaterialRequest/DeptCONO.jsp?user="+touser+"&ORDID=" + ordernum + "&CONO="+cono+"\"><u>Click Here to internal network</U></a>.</p>";
            }

            //String LinkCreate = "Please click this link to verify your email address : http://localhost:8080/UserRequest/?page=ResetNewPW&pp=" + encyptedCodeStr;
            //http://localhost:8080/UserRequest/?page=ResetNewPW&Destination=ResetPW&pp=LGZdzeQUNBzT4R9/oIUPoHBnPFmns740qCrqCGfPQZBhhSviWAj5hV33UaT0JiQwWXdvfJz5amWhWdzFqoRl+g==
            //http://192.200.9.189:8080/
            //InsertDB2.InsertPrikey(encyptedCodeStr,privateKeyStr); 
            java.util.Date date = new java.util.Date();
//            long t = date.getTime();
//            java.sql.Date sqlDate = new java.sql.Date(t);
//            java.sql.Time sqlTime = new java.sql.Time(t);

//TODO BACKUP MAIL
            return LinkCreate;

        } catch (Exception e) {
            System.err.println(e.getMessage());
        }

        String a = "none";

        return a;
    }

    public static String getmaildetail(String username, String ordernum, String status, String touser, String cono, String pgmtype) throws Exception {

        try {
            Connection conn = ConnectDB2.ConnectionDB();
            Statement sta = conn.createStatement();
            String state = "";

            System.out.println("zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz");
            String nextStatus = "";
            switch (status) {
                case "S1":
                    nextStatus = "S2";
                    state = "01";

                    break;
                case "S2":
                    nextStatus = "SS";
                    state = "11";
                    break;
                case "S3":
                    nextStatus = "SS";
                    state = "11";
                    break;

            }

            String Sql = "UPDATE " + GBVAR.DBPRD + ".FAR_MTRREQ04\n"
                    + "SET   ORD_STAT = '" + state + "'  \n"
                    + "WHERE ORD_ID  = '" + ordernum + "'";

            System.out.println(Sql);
            sta.executeUpdate(Sql);

            //String LinkCreate = "Please click this link to verify your email address : http://192.200.9.106:8080/UserRequest/?page=ResetNewPW&pp=" + encyptedCodeStr;
//            String LinkCreate = " Testpp: http://192.200.9.106:8080/UserRequest/?page=ResetNewPW&Destination=ResetPW&pp=" + urlEncry;
//            String LinkCreate = "<p>Please click this link to verify your email address : <a href=\"http://192.200.9.106:8080/UserRequest/?page=ResetNewPW&Destination=ResetPW&pp="+encyptedCodeStr+"\"><u>Click Here</U></a>.</p>";
            String LinkCreate = "";
            if (nextStatus == "SS") {

                LinkCreate = "<p> Material request Send to Store <a href=\"http://192.200.9.189:8080/MaterialRequest/?page=history\"><u>Check it</U></a>.</p>";

            } else {

//http://localhost:8080/MaterialRequest/DeptCONO.jsp?ORDID=23031926&username=PHONGS_PHO               
                // LinkCreate = "<p> Material request ID : "+ ordernum +" from : "+ username +" : <a href=\"http://192.200.9.189:8080/MaterialRequest/?report=material_request&status=" + nextStatus + "&ORDID=" + ordernum  +"\"><u>Click Here</U></a>.</p>";
                //  LinkCreate = "<p> Material request ID : " + ordernum + " from : " + username + " : <a href=\"http://192.200.9.189:8080/MaterialRequest/DeptCONO.jsp?ORDID=" + ordernum + "&user=PP><u>Click Here</U></a>.</p>";
//                          LinkCreate = "<p> Material request ID : " + ordernum + " from : " + username + " : <a href=\"http://localhost:8080/MaterialRequest/DeptCONO.jsp?user="+touser+"&ORDID=" + ordernum + "\"><u>Click Here</U></a>.</p>";
//                          LinkCreate = "<p> Material request ID : " + ordernum + " from : " + username + " : <a href=\"http://192.200.9.189:8080/MaterialRequest/DeptCONO.jsp?user="+touser+"&ORDID=" + ordernum + "&CONO="+cono+"\"><u>Click Here to approve</U></a>.</p> ";
//PRD
                LinkCreate = "<p> Material request ID : " + ordernum + " from : " + username + " : <a href=\"http://210.1.14.22:8080/MaterialRequest/DeptCONO.jsp?user=" + touser + "&ORDID=" + ordernum + "&CONO=" + cono + "\"><u>Click Here to puclic network</U></a>.</p> <p> Material request ID : " + ordernum + " from : " + username + " : <a href=\"http://192.200.9.189:8080/MaterialRequest/DeptCONO.jsp?user=" + touser + "&ORDID=" + ordernum + "&CONO=" + cono + "\"><u>Click Here to internal network</U></a>.</p>";

//TST
                //     LinkCreate = "<p> Material request ID : " + ordernum + " from : " + username + " : <a href=\"http://192.200.9.94:8080/MaterialRequest/DeptCONO.jsp?user="+touser+"&ORDID=" + ordernum + "&CONO="+cono+"\"><u>Click Here to puclic network</U></a>.</p> <p> Material request ID : " + ordernum + " from : " + username + " : <a href=\"http://192.200.9.94:8080/MaterialRequest/DeptCONO.jsp?user="+touser+"&ORDID=" + ordernum + "&CONO="+cono+"\"><u>Click Here to internal network</U></a>.</p>";
            }

            //String LinkCreate = "Please click this link to verify your email address : http://localhost:8080/UserRequest/?page=ResetNewPW&pp=" + encyptedCodeStr;
            //http://localhost:8080/UserRequest/?page=ResetNewPW&Destination=ResetPW&pp=LGZdzeQUNBzT4R9/oIUPoHBnPFmns740qCrqCGfPQZBhhSviWAj5hV33UaT0JiQwWXdvfJz5amWhWdzFqoRl+g==
            //http://192.200.9.189:8080/
            //InsertDB2.InsertPrikey(encyptedCodeStr,privateKeyStr); 
            java.util.Date date = new java.util.Date();
//            long t = date.getTime();
//            java.sql.Date sqlDate = new java.sql.Date(t);
//            java.sql.Time sqlTime = new java.sql.Time(t);

//TODO BACKUP MAIL
            return LinkCreate;

        } catch (Exception e) {
            System.err.println(e.getMessage());
        }

        String a = "none";

        return a;
    }

    public static String getmaildetailreturn(String username, String ordernum, String status) throws Exception {

        try {

            Connection conn = ConnectDB2.ConnectionDB();
            Statement sta = conn.createStatement();
            String state = "";

            System.out.println("zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz");
            String nextStatus = "";
            switch (status) {
                case "S2":
                    nextStatus = "S1";
                    state = "R00";
                    break;
                case "S3":
                    nextStatus = "S1";
                    state = "R00";
                    break;
            }

            String Sql = "UPDATE " + GBVAR.DBPRD + ".FAR_MTRREQ04\n"
                    + "SET   ORD_STAT = '" + state + "'  \n"
                    + "WHERE ORD_ID  = '" + ordernum + "'";

            System.out.println(Sql);
            sta.executeUpdate(Sql);

            //String LinkCreate = "Please click this link to verify your email address : http://192.200.9.106:8080/UserRequest/?page=ResetNewPW&pp=" + encyptedCodeStr;
//            String LinkCreate = " Testpp: http://192.200.9.106:8080/UserRequest/?page=ResetNewPW&Destination=ResetPW&pp=" + urlEncry;
//            String LinkCreate = "<p>Please click this link to verify your email address : <a href=\"http://192.200.9.106:8080/UserRequest/?page=ResetNewPW&Destination=ResetPW&pp="+encyptedCodeStr+"\"><u>Click Here</U></a>.</p>";
            String LinkCreate = "<p> your request has been return Please Here : <a href=\"http://192.200.9.189:8080/MaterialRequest/?report=material_request&status=" + nextStatus + "&ORDID=" + ordernum + "\"><u>Click Here</U></a>.</p>";

            //String LinkCreate = "Please click this link to verify your email address : http://localhost:8080/UserRequest/?page=ResetNewPW&pp=" + encyptedCodeStr;
            //http://localhost:8080/UserRequest/?page=ResetNewPW&Destination=ResetPW&pp=LGZdzeQUNBzT4R9/oIUPoHBnPFmns740qCrqCGfPQZBhhSviWAj5hV33UaT0JiQwWXdvfJz5amWhWdzFqoRl+g==
            //http://192.200.9.189:8080/
            //InsertDB2.InsertPrikey(encyptedCodeStr,privateKeyStr); 
//            java.util.Date date = new java.util.Date();
//            long t = date.getTime();
//            java.sql.Date sqlDate = new java.sql.Date(t);
//            java.sql.Time sqlTime = new java.sql.Time(t);
//            InsertDB2.InsertMailLog(eddocument, edrefno, esentto, esentcc, esentfrom, edsubject, LinkCreate, createby, cono, sqlDate, sqlTime);
            return LinkCreate;

        } catch (Exception e) {
            System.err.println(e.getMessage());
        }

        String a = "none";

        return a;
    }

    public static String getmaildetailreject(String username, String ordernum, String status) throws Exception {

        try {

            Connection conn = ConnectDB2.ConnectionDB();
            Statement sta = conn.createStatement();
            String state = "99";

            System.out.println("zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz");
//            String nextStatus = "";

//            state = "99";
            String Sql = "UPDATE " + GBVAR.DBPRD + ".FAR_MTRREQ04\n"
                    + "SET   ORD_STAT = '" + state + "', MVX_ORDE = '11111111'  \n"
                    + "WHERE ORD_ID  = '" + ordernum + "'";

            System.out.println(Sql);
            sta.executeUpdate(Sql);

            //String LinkCreate = "Please click this link to verify your email address : http://192.200.9.106:8080/UserRequest/?page=ResetNewPW&pp=" + encyptedCodeStr;
//            String LinkCreate = " Testpp: http://192.200.9.106:8080/UserRequest/?page=ResetNewPW&Destination=ResetPW&pp=" + urlEncry;
//            String LinkCreate = "<p>Please click this link to verify your email address : <a href=\"http://192.200.9.106:8080/UserRequest/?page=ResetNewPW&Destination=ResetPW&pp="+encyptedCodeStr+"\"><u>Click Here</U></a>.</p>";
            String LinkCreate = "<p> your request (" + ordernum + ")  has been rejected </p>";

            //String LinkCreate = "Please click this link to verify your email address : http://localhost:8080/UserRequest/?page=ResetNewPW&pp=" + encyptedCodeStr;
            //http://localhost:8080/UserRequest/?page=ResetNewPW&Destination=ResetPW&pp=LGZdzeQUNBzT4R9/oIUPoHBnPFmns740qCrqCGfPQZBhhSviWAj5hV33UaT0JiQwWXdvfJz5amWhWdzFqoRl+g==
            //http://192.200.9.189:8080/
            //InsertDB2.InsertPrikey(encyptedCodeStr,privateKeyStr); 
//            java.util.Date date = new java.util.Date();
//            long t = date.getTime();
//            java.sql.Date sqlDate = new java.sql.Date(t);
//            java.sql.Time sqlTime = new java.sql.Time(t);
//            InsertDB2.InsertMailLog(eddocument, edrefno, esentto, esentcc, esentfrom, edsubject, LinkCreate, createby, cono, sqlDate, sqlTime);
            return LinkCreate;

        } catch (Exception e) {
            System.err.println(e.getMessage());
        }

        String a = "none";

        return a;
    }

}
