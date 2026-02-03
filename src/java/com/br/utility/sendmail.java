/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.br.utility;

import java.io.IOException;
//import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
//import java.text.SimpleDateFormat;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.br.connection.ConnectDB2;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONObject;

/**
 *
 * @author Phongsathon
 */
@WebServlet(name = "sendmail", urlPatterns = {"/sendmail"})
public class sendmail extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        PrintWriter out = response.getWriter();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        Locale.setDefault(Locale.US);
//        java.util.Date d = new java.util.Date();
//        SimpleDateFormat A = new SimpleDateFormat("yyyy-MM-dd");
        HttpSession session = request.getSession(true);
        String editType = request.getParameter("SendMail");

        System.out.println("OMG");

        if (editType != null && !editType.isEmpty()) {

            System.out.println("NULLLLLLLLLLLL");

        } else {

            System.out.println("ELSEEEEeee");
            System.out.println(request.getParameter("SendAppMail"));
            System.out.println("ELSEEEEeee");

            if (request.getParameter("SendAppMail").equals("SendAppMail")) {

                try {

                    System.out.println(" Check Send App Mail --------------------pp");

//                    Send_mail sm = new Send_mail();
                    String DPM_TO = request.getParameter("vhead");
                    String pgmtype = request.getParameter("pgmtype");
                    


                    if (pgmtype == null || pgmtype.trim().isEmpty()) {
                        pgmtype = "MTR";
                    }

                    if ("RTN".equals(pgmtype) || "DPS".equals(pgmtype)) {
                        DPM_TO = "WALAIL_KLE";
                    }

                    System.out.println("WWWWWWWWWWWWWWWWWWWWWWWWWWWWW");
                    System.out.println(pgmtype);
                    System.out.println("WWWWWWWWWWWWWWWWWWWWWWWWWWWWW");

                    String CONO = request.getParameter("cono");
                    String status = request.getParameter("status");
//                    String orderid = request.getParameter("ordernum");
                    ResultSet rsl = Getuseremail(DPM_TO);
//                    ResultSet rsl2 = Getuseremail(DPM_TO);
                    ArrayList<String> arruserName = new ArrayList<>();
                    switch (status) {
                        case "S1":
                            DPM_TO = request.getParameter("vhead");
                            CONO = request.getParameter("cono");
                            if ("RTN".equals(pgmtype) || "DPS".equals(pgmtype)) {
                                DPM_TO = "WALAIL_KLE";
                            }

                            rsl = Getuseremail(DPM_TO);
                            while (rsl.next()) {

                                arruserName.add(rsl.getString("ST_EMAIL").trim());
                                System.out.println("WWWWWWWWWWWWWWWWWWWWWWWWWWWWW");
                                System.out.println(arruserName);
                                System.out.println(rsl.getString("ST_EMAIL").trim());
                                System.out.println("WWWWWWWWWWWWWWWWWWWWWWWWWWWWW");
                                CONO = rsl.getString("ST_CONO").trim();

                            }

                            break;
                        case "S2":
                            
                            if ("RTN".equals(pgmtype) || "DPS".equals(pgmtype)) {

                                ResultSet rs2 = GetApprovemailRTNDPS(CONO,request.getParameter("ordernumpp"),status);
                                while (rs2.next()) {
                                    String username = rs2.getString("VAL").trim();
                                    rsl = Getuseremail(username);
                                    while (rsl.next()) {

                                        arruserName.add(rsl.getString("ST_EMAIL").trim());
                                        System.out.println("WWWWWWWWWWWWWWWWWWWWWWWWWWWWW");
                                        System.out.println(arruserName);
                                        System.out.println(rsl.getString("ST_EMAIL").trim());
                                        System.out.println("WWWWWWWWWWWWWWWWWWWWWWWWWWWWW");

                                    }
                                }

                            } 
                                case "S4":
                            
                            if ("RTN".equals(pgmtype) || "DPS".equals(pgmtype)) {

                                ResultSet rs2 = GetApprovemailRTNDPS(CONO,request.getParameter("ordernumpp"),status);
                                while (rs2.next()) {
                                    String username = rs2.getString("VAL").trim();
                                    rsl = Getuseremail(username);
                                    while (rsl.next()) {

                                        arruserName.add(rsl.getString("ST_EMAIL").trim());
                                        System.out.println("WWWWWWWWWWWWWWWWWWWWWWWWWWWWW");
                                        System.out.println(arruserName);
                                        System.out.println(rsl.getString("ST_EMAIL").trim());
                                        System.out.println("WWWWWWWWWWWWWWWWWWWWWWWWWWWWW");

                                    }
                                }

                            }
                            
                            else {
                                ResultSet rs2 = GetApprovemail();
                                while (rs2.next()) {
                                    String username = rs2.getString("UID").trim();
                                    rsl = Getuseremail(username);
                                    while (rsl.next()) {

                                        arruserName.add(rsl.getString("ST_EMAIL").trim());
                                        System.out.println("WWWWWWWWWWWWWWWWWWWWWWWWWWWWW");
                                        System.out.println(arruserName);
                                        System.out.println(rsl.getString("ST_EMAIL").trim());
                                        System.out.println("WWWWWWWWWWWWWWWWWWWWWWWWWWWWW");

                                    }
                                }
                            }

                            break;
                            
                            
                            case "S5":
                          //  DPM_TO = request.getParameter("vhead");
                            rsl = Getuseremail("WALAIL_KLE");
                            while (rsl.next()) {

                                arruserName.add(rsl.getString("ST_EMAIL").trim());
                                System.out.println("WWWWWWWWWWW333333WWWWWWWWWWWWWWWWWW");
                                System.out.println(arruserName);
                                System.out.println(rsl.getString("ST_EMAIL").trim());
                                System.out.println("WWWWWWWWWWW333333WWWWWWWWWWWWWWWWWW");

                            }

                            break;


                        case "S3":
                            DPM_TO = request.getParameter("vhead");
                            rsl = Getuseremail(DPM_TO);
                            while (rsl.next()) {

                                arruserName.add(rsl.getString("ST_EMAIL").trim());
                                System.out.println("WWWWWWWWWWW333333WWWWWWWWWWWWWWWWWW");
                                System.out.println(arruserName);
                                System.out.println(rsl.getString("ST_EMAIL").trim());
                                System.out.println("WWWWWWWWWWW333333WWWWWWWWWWWWWWWWWW");

                            }

                            break;
                        default:
                            DPM_TO = request.getParameter("vhead");
                            CONO = request.getParameter("cono");

                            rsl = Getuseremail(DPM_TO);
                            while (rsl.next()) {

                                arruserName.add(rsl.getString("ST_EMAIL").trim());
                                System.out.println("WWWWWWWWWWWWWWWWWWWWWWWWWWWWW");
                                System.out.println(arruserName);
                                System.out.println(rsl.getString("ST_EMAIL").trim());
                                System.out.println("WWWWWWWWWWWWWWWWWWWWWWWWWWWWW");

                            }

                            break;
                    }
                    
                    

                    System.out.println("Email is : ");
                    System.out.println(DPM_TO);
                    System.out.println(rsl);
                    System.out.println(" Check Send App Mail --------------------pp2");
                    int count = 0;
                    
                    
                    //while (arruserName.size() > count) {
                    
                    while (count < arruserName.size()) {

                        System.out.println(" Check Send App Mail --------------------pp3");

                        System.out.println(arruserName.get(count));

                        String Appemail = arruserName.get(count);

                        String SubjectEmail = "Material Request";

                        String LinkCreate = "";

                        if ("RTN".equals(pgmtype) || "DPS".equals(pgmtype)) {

                            System.out.println(" Check Send App Mail --------------------ppqqqq");
                            System.out.println(status);
                            System.out.println(" Check Send App Mail --------------------pqqqqq");
                            LinkCreate = com.br.utility.Utilities.getmaildetailRTNDPS(request.getParameter("username"), request.getParameter("ordernumpp"), request.getParameter("status"), arruserName.get(count), CONO, pgmtype
                            );
                        } else {
// mtr 
                            System.out.println(" Check Send App Mail --------------------mtr");
                            System.out.println(pgmtype);
                            System.out.println(" Check Send App Mail --------------------mtr");
                            LinkCreate = com.br.utility.Utilities.getmaildetail(request.getParameter("username"), request.getParameter("ordernumpp"), request.getParameter("status"), DPM_TO, CONO, pgmtype
                            );
                        }

                        Send_mail.Sendmail_ICT(Appemail, LinkCreate, SubjectEmail);
                        session.setAttribute("MSGError", "An email has been sent. Please check your  Email");

                        count++;

                       

                         

                    }
                       response.sendRedirect("./?report=material_request");

                } catch (Exception ex) {

                    Logger.getLogger(sendmail.class.getName()).log(Level.SEVERE, null, ex);

                    session.setAttribute("MSGError", "Your Username is Incorrect.");
                    response.sendRedirect("./?page=./" + ex);
                }

                System.out.println("UserSentMail");

            } else if (request.getParameter("SendAppMail").equals("SendtoM3")) {

                System.out.println("qpqpqpqpqpqpqpqpq");

//                ConnectM3 conm3 = new ConnectM3();
                try {
                    System.out.println("xxxxxxxxxxxxxxxxx");
                    // conm3.SendtoM3("A33","22120633");

//                try {
//                    // boolean connm3 = ConnectM3.ConnectM3("10","101");
//
//                     String  a =  ConnectM3.SendtoM3("A31"); 
//                     System.out.println(a);
//                     
//                } catch (JSONException ex) {
//                    Logger.getLogger(sendmail.class.getName()).log(Level.SEVERE, null, ex);
//                }
                } catch (Exception ex) {
                    Logger.getLogger(sendmail.class.getName()).log(Level.SEVERE, null, ex);
                }

            } else if (request.getParameter("SendAppMail").equals("SendReturnMail")) {

                try {
                    String pgmtype = request.getParameter("pgmtype");

                    if (pgmtype == null || pgmtype.trim().isEmpty()) {
                        pgmtype = "MTR";
                    }

                    System.out.println(" Check Send SendReturnMail Mail --------------------pp");

//                    response.sendRedirect("./?page=./ResetPW");
                    response.sendRedirect("./?report=material_request");
                    //http://localhost:8080/MaterialRequest/?report=material_request
//                    Send_mail sm = new Send_mail();
                    String DPM_TO = request.getParameter("vhead");
                    String CONO = request.getParameter("cono");

//                    String ORD_ID = request.getParameter("ordernum");
                    String user = request.getParameter("username");
                    ResultSet rsl = Getuseremail(user);
                    System.out.println("Email is : ");
                    System.out.println(DPM_TO);
                    System.out.println(rsl);
                    System.out.println(" Check Send SendReturnMail Mail --------------------pp2");
                    while (rsl.next()) {
                        System.out.println(" Check Send App Mail --------------------pp3");
                        String Appemail = rsl.getString("ST_EMAIL").trim();
                        CONO = rsl.getString("ST_CONO").trim();

                        String SubjectEmail = "Material Request: your request has been return";
                        System.out.println("-------------------------");
                        System.out.println(request.getParameter("ordernumpp"));
                        System.out.println(request.getParameter("username"));
                        System.out.println(request.getParameter("status"));

                        System.out.println("-------------------------");

                        String LinkCreate = com.br.utility.Utilities.getmaildetail(request.getParameter("username"), request.getParameter("ordernumpp"), request.getParameter("status"), DPM_TO, CONO, pgmtype);


                        System.out.println(Appemail);
                        Send_mail.Sendmail_ICT(Appemail, LinkCreate, SubjectEmail);

                        System.out.println("xxxxxxxxxxxxxxxxxxxxxxxxxxxx");
                        session.setAttribute("MSGError", "your request has been return. Please check your  Email");
                    }

                } catch (Exception ex) {
                    Logger.getLogger(sendmail.class.getName()).log(Level.SEVERE, null, ex);

                    session.setAttribute("MSGError", "Your Username is Incorrect.");
                    response.sendRedirect("./?page=./ResetPWvvvvvvvvvvvvvvvv");
                }

                System.out.println("UserSentMail");
                //response.sendRedirect("./?page=./RequestUser");

            } else if (request.getParameter("SendAppMail").equals("SendRejectMail")) {

                try {

                    System.out.println(" Check Send SendRejectMail Mail --------------------pp");

//                    response.sendRedirect("./?page=./ResetPW");
                    response.sendRedirect("./?report=material_request");
                    //http://localhost:8080/MaterialRequest/?report=material_request
//                    Send_mail sm = new Send_mail();
                    String DPM_TO = request.getParameter("vhead");
//                    String ORD_ID = request.getParameter("ordernum");
                    String user;
                    user = request.getParameter("username");
                    ResultSet rsl;
                    rsl = Getuseremail(user);
                    System.out.println("Email is : ");
                    System.out.println(DPM_TO);
                    System.out.println(rsl);
                    System.out.println(" Check Send SendReturnMail Mail --------------------pp2");
                    while (rsl.next()) {
                        System.out.println(" Check Send App Mail --------------------pp3");
                        String Appemail = rsl.getString("ST_EMAIL").trim();

//                        int ST_CONO = rsl.getInt("ST_CONO");
//
                        String SubjectEmail = "Material Request: your request has been reject";
                        System.out.println("-------------------------");
                        System.out.println(request.getParameter("ordernumpp"));
                        System.out.println(request.getParameter("username"));
                        System.out.println(request.getParameter("status"));

                        System.out.println("-------------------------");

                        String LinkCreate = com.br.utility.Utilities.getmaildetailreject(request.getParameter("username"), request.getParameter("ordernumpp"), request.getParameter("status"));

//                        sm.Sendmail_ICT(Appemail, LinkCreate, SubjectEmail);
//                        //Utility.addMailLog(Appemail, SubjectEmail, LinkCreate, 10,mimeusername); 
//                        System.out.println(Appemail + "\n" + SubjectEmail);
                        System.out.println(Appemail);
                        Send_mail.Sendmail_ICT(Appemail, LinkCreate, SubjectEmail);

                        System.out.println("xxxxxxxxxxxxxxxxxxxxxxxxxxxx");
                        session.setAttribute("MSGError", "your request has been return. Please check your  Email");
                    }

                } catch (Exception ex) {
                    Logger.getLogger(sendmail.class.getName()).log(Level.SEVERE, null, ex);

                    session.setAttribute("MSGError", "Your Username is Incorrect.");
                    response.sendRedirect("./?page=./AAAAAAAAAAA");
                }

                System.out.println("UserSentMail");
                //response.sendRedirect("./?page=./RequestUser");

            }

        }

    }

    public static ResultSet Getuseremail(String username) throws Exception {

        try {
            Connection conn = ConnectDB2.ConnectionDB();
            Statement sta = conn.createStatement();
            String query = "SELECT  * FROM BRLDTA0100.STAFFLIST WHERE  ST_STS = '20' AND  ST_N6L3 = '" + username.trim() + "'";

            ResultSet rs1 = sta.executeQuery(query);
            System.out.println("xxxxxxxxxxxxxxx");
            System.out.println(rs1);
            System.out.println(query);

            System.out.println("xxxxxxxxxxxxxxx");
            return rs1;
        } catch (SQLException ex) {

        }
        return null;
    }

    public static ResultSet GetApprovemailRTNDPS(String cono,  String ordid, String status) throws Exception {

        String columnName = "";
        switch (status) {
            case "S2":
                columnName = "ORD_MG1";
                break;
            case "S4":
                columnName = "ORD_MG2";
                break;
            default:
            // code block
        }

        try {
            Connection conn = ConnectDB2.ConnectionDB();
            Statement sta = conn.createStatement();

            // query เพื่อเอาค่าจริงจาก DB (String ที่มี comma)
            String query = " SELECT " + columnName + " AS VAL "
                    + " FROM BRLDTA0100.FAR_MTRREQ04 "
                    + " WHERE ORD_ID = '" + ordid.trim() + "' "
                    + "   AND REG_CONO  = '" + cono + "' "; 
 

            ResultSet rs1 = sta.executeQuery(query);

            // ถ้าไม่มีข้อมูล ก็ return null
            if (!rs1.next()) {
                return null;
            }

            // ได้ค่าต้นทาง เช่น "MAHAKI_CHU,PHONGS_PHO,PHONGS_PH2"
            String raw = rs1.getString("VAL");

            if (raw == null || raw.isEmpty()) {
                return null;
            }

            // split string
            String[] arr = raw.split(",");

            // สร้าง query ใหม่ให้เป็นหลายแถว
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < arr.length; i++) {
                if (i > 0) {
                    sb.append(" UNION ALL ");
                }
                sb.append("SELECT '").append(arr[i].trim()).append("' AS VAL FROM SYSIBM.SYSDUMMY1");
            }

            String finalQuery = sb.toString();
            
            System.out.println(finalQuery);

            // executeQuery ใหม่ → ได้ ResultSet ที่เป็นหลายแถวจริง ๆ
            return sta.executeQuery(finalQuery);

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return null;

    }

    public static ResultSet GetApprovemail() throws Exception {

        try {
            Connection conn = ConnectDB2.ConnectionDB();
            Statement sta = conn.createStatement();
            String query = "SELECT UID   FROM BRLDTA0100.FAR_APPRV01 a                    \n"
                    + "                        WHERE  CONO  = '10'\n"
                    + "                        AND STS  = '20'\n"
                    + "                        AND APP = 'apv'";

            ResultSet rs1 = sta.executeQuery(query);
            System.out.println("xxxxxxxxxxxxxxx");
            System.out.println(rs1);
            System.out.println(query);

            System.out.println("xxxxxxxxxxxxxxx");
            return rs1;
        } catch (SQLException ex) {

        }
        return null;
    }

    public static String Getown(String id) throws Exception {

        try {
            Connection conn = ConnectDB2.ConnectionDB();
            Statement stmt = conn.createStatement();
            JSONArray mJSonArr = new JSONArray();

//            Statement sta = conn.createStatement();
            String query = "            SELECT ORD_REGB   FROM  " + GBVAR.DBPRD + ".FAR_MTRREQ04                  \n"
                    + "                        WHERE  ORD_ID  = '" + id + "'\n"
                    + "               ";
            ResultSet mRes = stmt.executeQuery(query);

            String name = "";

            while (mRes.next()) {
                Map<String, Object> mMap = new HashMap<>();

                mMap.put("ORD_REGB", mRes.getString(1).trim());

                mJSonArr.put(mMap);

                System.out.println("Result Value : ");
                System.out.println(mJSonArr);

                JSONObject jsonObject = mJSonArr.getJSONObject(0);
                name = jsonObject.getString("ORD_REGB");

                System.out.println("Result Value : ");
                System.out.println(name);

            }

            return name;
        } catch (SQLException ex) {

        }
        return null;
    }
}
