/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.br.api;

import com.br.data.Delete;
import com.br.data.Insert;
import com.br.data.Select;
import com.br.data.Update;
import com.br.utility.ConnectM3;
import com.br.utility.Send_mail;
import com.br.utility.sendmail;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.Integer.parseInt;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.codehaus.jettison.json.JSONException;

/**
 *
 * @author Wattana
 */
public class Action extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String path = request.getParameter("path");
        // String path = request.getServletPath();
        System.out.println("path: " + path);

        switch (path) {
            // M3 
            case "Sendtom3":

                ConnectM3 cm3 = new ConnectM3();

                out.print(cm3.SendtoM3(request.getParameter("mat_type"), request.getParameter("ordernum"), request.getParameter("vDate"), request.getParameter("cono"), request.getParameter("divi")));
                String name1 = Select.getcreator(request.getParameter("ordernum"));

                System.out.println("maaaaaaaariiiiiooooooooooo");
                System.out.println(name1);

                ResultSet r1 = sendmail.Getuseremail(name1);
                String Appemail = "";
                while (r1.next()) {

                    Appemail = (r1.getString("ST_EMAIL").trim());
                }

                String SubjectEmail = "Material Request";
                String LinkCreate = "Your request No. " + request.getParameter("ordernum") + " has been Complete ";
             //   Send_mail.Sendmail_ICT(Appemail, LinkCreate, SubjectEmail);
                out.flush();

                break;

            case "rejectid":
            try {
                Update.rejectid(request.getParameter("ordernum"));
            } catch (JSONException ex) {
                Logger.getLogger(Action.class.getName()).log(Level.SEVERE, null, ex);
            }
            break;

             case "SETITEM":
            try {
                Update.SETITEM(request.getParameter("cono"), request.getParameter("divi"), request.getParameter("ordid"));
            } catch (JSONException ex) {
                Logger.getLogger(Action.class.getName()).log(Level.SEVERE, null, ex);
            }
            break;
                    
            case "ROLLBACK":
            try {
                Update.ROLLBACK(request.getParameter("cono"), request.getParameter("divi"), request.getParameter("ordid"));
            } catch (JSONException ex) {
                Logger.getLogger(Action.class.getName()).log(Level.SEVERE, null, ex);
            }
            break;

            case "updateusername":
            try {
                Update.updateusername(request.getParameter("username"), request.getParameter("id"), request.getParameter("datetime"));
            } catch (JSONException ex) {
                Logger.getLogger(Action.class.getName()).log(Level.SEVERE, null, ex);
            }
            break;

            case "getCompany":
                System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
                out.print(Select.Company());
                out.flush();
                break;
                
                
                  case "GetFAC":
                System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaazzzzz");
                out.print(Select.Location(request.getParameter("CONO"),request.getParameter("DIVI")));
                out.flush();
                break;
                
                

            case "checkuserprioAPV":
                System.out.println("checkuserprioAPV");
                out.print(Select.checkuserprioAPV(request.getParameter("username")));
                out.flush();
                break;
            case "checkuserprio":
                System.out.println("checkuserprio");
                out.print(Select.checkuserprio(request.getParameter("username")));
                out.flush();
                break;
                
                   case "checkuserpriofm":
                System.out.println("checkuserpriofm");
                out.print(Select.checkuserpriofm(request.getParameter("username")));
                out.flush();
                break;
            case "getonhand1":
                System.out.println("getonhand1");
                out.print(Select.getonhand1(request.getParameter("itmid"), request.getParameter("fwhs"), request.getParameter("loca")));
                out.flush();
                break;

            // Select
            case "getmyid":
                System.out.println("getmyid");
                out.print(Select.getmyid(request.getParameter("username"), request.getParameter("cono"), request.getParameter("divi")));
                out.flush();
                break;
            case "getmovex":
                System.out.println("getmovex");
                out.print(Select.getmovex(request.getParameter("ordernum")));
                out.flush();
                break;

            case "getonhand":
                String fwhs = request.getParameter("frm_whs");
                String itemid = request.getParameter("code");
                String cono = request.getParameter("cono");
                float inputval = Float.parseFloat(request.getParameter("qty_reg"));
                System.out.println("oooooooooooooooooooooooooooooooooooooo");

                System.out.println("fwhs");
                System.out.println(fwhs);
                System.out.println("code");
                System.out.println(itemid);
                System.out.println("inputval");
                System.out.println(inputval);

                System.out.println("getonhand");
                out.print(Select.getonhand(itemid, fwhs, inputval, cono));
                out.flush();
                break;

            case "getuserapprovalname":
                System.out.println("getuserapprovalname");
                out.print(Select.getuserapprovalname(request.getParameter("cono")));
                out.flush();
                break;

            case "getuserapproval":
                System.out.println("getuserapproval");
                out.print(Select.getuserapproval(request.getParameter("cono")));
                out.flush();
                break;

            case "getstoredsignature":
                System.out.println("getstoredsignature");
                out.print(Select.getstoredsignature(request.getParameter("orderid"), request.getParameter("rolename")));
                out.flush();
                break;

            case "getemailbyname":
                System.out.println("getemailbyname");
                out.print(Select.getemailbyname(request.getParameter("cono"), request.getParameter("name")));
                out.flush();
                break;

            case "getitemtype":
                System.out.println("getitemtype");
                out.print(Select.getitemtype(request.getParameter("itemid"), request.getParameter("cono")));
                out.flush();
                break;

            case "getsignaturename":
                System.out.println("getsignaturename");
                out.print(Select.getsignaturename(request.getParameter("cono"), request.getParameter("divi"), request.getParameter("orderid")));
                out.flush();
                break;

            case "getload":
                System.out.println("getload");
                out.print(Select.getload(request.getParameter("ID"), request.getParameter("cono"), request.getParameter("divi")));
                out.flush();
                break;

            case "getload1":
                System.out.println("getload1");
                out.print(Select.getload1(request.getParameter("ID"), request.getParameter("Key"), request.getParameter("cono"), request.getParameter("divi")));
                out.flush();
                break;

            case "getload2":
                System.out.println("getload2");
                out.print(Select.getload2(request.getParameter("ID"), request.getParameter("cono"), request.getParameter("divi")));
                out.flush();
                break;

            case "GetSelectID":
                System.out.println("GetSelectID");
                out.print(Select.getSelectID(request.getParameter("username"), request.getParameter("key"), request.getParameter("cono"), request.getParameter("divi")));
                out.flush();
                break;

            case "getHistorybystate":
                System.out.println("getHistorybystate");
                out.print(Select.getHistorybystate(request.getParameter("cono"), request.getParameter("divi"), request.getParameter("pgmtype")));
                out.flush();
                break;
                
                  case "getHistorybystatefarm":
                System.out.println("getHistorybystatefarm");
                out.print(Select.getHistorybystatefarm(request.getParameter("cono"), request.getParameter("divi") ,request.getParameter("pgmtype")));
                out.flush();
                break;

            case "gethistory":
                System.out.println("gethistory");
                out.print(Select.getHistory(request.getParameter("cono"), request.getParameter("divi") , request.getParameter("pgmtype")  ));
                out.flush();
                break;

            case "gethistorysp":
                System.out.println("gethistorysp");
                out.print(Select.getHistorysp(request.getParameter("cono"), request.getParameter("divi")));
                out.flush();
                break;
                
                case "gethistoryspfarm":
                System.out.println("gethistoryspfarm");
                out.print(Select.getHistoryspfarm(request.getParameter("cono"), request.getParameter("divi")));
                out.flush();
                break;

            case "gethistoryitem":
                System.out.println("gethistoryitem");
                out.print(Select.getHistoryitem(request.getParameter("id"), request.getParameter("whs"), request.getParameter("cono"), request.getParameter("divi") ,request.getParameter("pgmtype")) );
                out.flush();

                break;

            case "getOrderID":
                System.out.println("getOrderID");
                out.print(Select.getOrderID());
                out.flush();
                break;

            case "getDepthead":
                System.out.print("getDepthead");
                out.print(Select.getDepthead());
                out.flush();
                break;

            case "getSignaturenormal":
                System.out.print("getSignaturenormal");

                out.print(Select.getSignature(request.getParameter("cono"), request.getParameter("divi"), request.getParameter("prno")));
                out.flush();
                break;

            case "getSignature":
                System.out.print("getSignature");
                String feild1;
                String feild2;
                String feild3;

                String status = request.getParameter("status");
                System.out.println(status);

                if ("S1".equals(status)) {

//                    String name = Select.getstoredsignature(request.getParameter("orderid"), request.getParameter("rolename"));
//                    out.print(Select.getSignature(request.getParameter("cono"), request.getParameter("divi"), name));
                } else if ("S2".equals(status)) {

                    
                    
                    feild1 = "ORD_REGB";

                    String name = Select.getstoredsignature(request.getParameter("orderid"), feild1);
                    out.print(Select.getSignature(request.getParameter("cono"), request.getParameter("divi"), name));

                } else if ("S3".equals(status)) {

                    feild2 = "ORD_DPMH";
                    String name = Select.getstoredsignature(request.getParameter("orderid"), feild2);
                    out.print(Select.getSignature(request.getParameter("cono"), request.getParameter("divi"), name));

                } else if ("S4".equals(status)) {

                    feild3 = "ORD_MG1";
                    String name = Select.getstoredsignature(request.getParameter("orderid"), feild3);
                    out.print(Select.getSignature(request.getParameter("cono"), request.getParameter("divi"), name));

                }
                out.flush();
                break;

            case "getItemcodedown":
                System.out.println("getItemcodedown");
                out.print(Select.getItemcodedown(request.getParameter("order_id")));
                out.flush();
                break;
            case "getItemcode":
                System.out.println("getItemcode");
                out.print(Select.getItemcode(request.getParameter("whs"), request.getParameter("check"), request.getParameter("cono") ,request.getParameter("itemstype")));
                out.flush();
                break;

            case "getItemcode2way":
                System.out.println("getItemcode2way");
                out.print(Select.getItemcode2way(request.getParameter("fwhs"), request.getParameter("twhs")));
                out.flush();
                break;

            case "getCostcenter":
                System.out.println("getCostcenter");
                out.print(Select.getCostcenter(request.getParameter("dep"), request.getParameter("cono"), request.getParameter("divi")));
                out.flush();
                break;
                
                
                     case "GETMGLIST":
    System.out.println("GETMGLIST");
              out.print(Select.GETMGLIST(request.getParameter("GMCONO"), request.getParameter("GMDIVI"), request.getParameter("GMGROUP"), request.getParameter("WHA")));
            out.flush();
                break;


            case "getWarehouse":
                out.print(Select.getWarehouse(request.getParameter("cono"), request.getParameter("divi"), request.getParameter("fac")));
                out.flush();
                break;
                
                 case "gettoWarehouse":
                out.print(Select.gettoWarehouse(request.getParameter("cono"), request.getParameter("divi"), request.getParameter("fac")));
                out.flush();
                break;

            // Insert
            case "insertitemdata":
            try {
                String lastid = Select.getitemID();
                int inum1;
                inum1 = parseInt(lastid) + 1;
                String a = Integer.toString(inum1);
                System.out.print(a);

                Insert.Additemdata(a, request.getParameter("id"), request.getParameter("code"), request.getParameter("desc"), request.getParameter("unit"), request.getParameter("reqt"), request.getParameter("issu"), request.getParameter("onhandsts"), request.getParameter("cono"), request.getParameter("divi"), request.getParameter("QTY_ETC"),request.getParameter("QTY_ETCTH"),request.getParameter("QTY_NO") ,request.getParameter("QTY_THTXT") ,request.getParameter("QTY_KGS") );

            } catch (JSONException ex) {
                Logger.getLogger(Action.class.getName()).log(Level.SEVERE, null, ex);
            }
            break;

            case "insertorderid":
                System.out.print("insertorderid");
                String currentID = Select.getOrderID();

                System.out.println("zzzzzzzzzzzzzzzzzzzzzzzzzzzzzz");
                System.out.println(currentID);

                String id1 = Select.getID();
                String nextid;
                String nextid1;
                int inum;

                System.out.println(id1);
                inum = parseInt(id1) + 1;
                nextid1 = String.valueOf(inum);

                Date date = new Date();
                String numtxt;
                numtxt = currentID.substring(2, 8);
                System.out.println("xx" + numtxt);
                //SimpleDateFormat sdf = new SimpleDateFormat("yyMM");
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
                sdf.setTimeZone(TimeZone.getTimeZone("UTC"));

                System.out.println();

                int num = parseInt(numtxt);
                num += 1;

                String txt = String.format("%04d", num);
                String stringDate = sdf.format(date);
                int numy = parseInt(stringDate.substring(0, 4));
                if (numy > 2500) {
                    numy -= 543;
                }
                String yy = Integer.toString(numy).substring(2, 4);

                String id = yy  + txt;

                nextid = id;
                nextid1 = String.valueOf(inum);

                System.out.println(id);
                System.out.println(inum);
                 System.out.println(nextid1);
                
                System.out.println("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
                System.out.println(request.getParameter("vcompany"));
                System.out.println("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");

                System.out.println(id);
                
                out.print(Insert.AddOrderID(nextid, nextid1, inum, request.getParameter("vcompany"), request.getParameter("vrequester"), request.getParameter("vdepartmentname"), request.getParameter("vcostcenter"), request.getParameter("orderpurpose"), request.getParameter("vdate"), request.getParameter("vtype"), request.getParameter("vfwhs"), request.getParameter("vtwhs"), request.getParameter("location"),
                        request.getParameter("rqtdate"), request.getParameter("dpmhead"), request.getParameter("orddpmh"), request.getParameter("drhdate"), request.getParameter("ordissb"), request.getParameter("isbdate"), request.getParameter("ordstat"), request.getParameter("vcono"), request.getParameter("vdivi"),request.getParameter("fac"), request.getParameter("itemtype") , request.getParameter("pgmtype")  ));

                out.flush();
                break;

                
                      case "insertorderidRTNDPT":
                System.out.print("insertorderidRTNDPT");
                String currentID2 = Select.getOrderID();

                System.out.println("zzzzzzzzzzzzzzzzzzzzzzzzzzzzzz");
                System.out.println(currentID2);

                String id12 = Select.getID();
                String nextid2;
                String nextid12;
                int inum2;

                System.out.println(id12);
                inum2 = parseInt(id12) + 1;
                nextid12 = String.valueOf(inum2);

                Date date2 = new Date();
                String numtxt2;
                numtxt2 = currentID2.substring(2, 8);
                System.out.println("xx2" + numtxt2);
                //SimpleDateFormat sdf = new SimpleDateFormat("yyMM");
                SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy");
                sdf2.setTimeZone(TimeZone.getTimeZone("UTC"));

                System.out.println();

                int num2 = parseInt(numtxt2);
                num2 += 1;

                String txt2 = String.format("%04d", num2);
                String stringDate2 = sdf2.format(date2);
                int numy2 = parseInt(stringDate2.substring(0, 4));
                if (numy2 > 2500) {
                    numy2 -= 543;
                }
                String yy2 = Integer.toString(numy2).substring(2, 4);

                String id2 = yy2  + txt2;

                nextid2 = id2;
                nextid12 = String.valueOf(inum2);

                System.out.println(id2);
                System.out.println(inum2);
                 System.out.println(nextid12);
                
                System.out.println("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
                System.out.println(request.getParameter("vcompany"));
                System.out.println("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");

                System.out.println(id2);
                
                out.print(Insert.AddOrderIDRTNDPT(nextid2, nextid12, inum2, request.getParameter("vcompany"), request.getParameter("vrequester"), request.getParameter("vdepartmentname"), request.getParameter("vcostcenter"), request.getParameter("orderpurpose"), request.getParameter("vdate"), request.getParameter("vtype"), request.getParameter("vfwhs"), request.getParameter("vtwhs"), request.getParameter("location"),
                        request.getParameter("rqtdate"), request.getParameter("dpmhead"), request.getParameter("orddpmh"), request.getParameter("drhdate"), request.getParameter("ordissb"), request.getParameter("isbdate"), request.getParameter("ordstat"), request.getParameter("vcono"), request.getParameter("vdivi"),request.getParameter("fac"), request.getParameter("itemtype") , request.getParameter("pgmtype"),request.getParameter("ORD_MG1"),request.getParameter("ORD_MG2")  ));

                out.flush();
                break;

                
                
                
            // Update
            case "insertsubmit":
            try {
                Update.insertsubmit(request.getParameter("cono"), request.getParameter("divi"), request.getParameter("orderid"), request.getParameter("dpmh_to"), request.getParameter("purpose"));
            } catch (JSONException ex) {
                Logger.getLogger(Action.class.getName()).log(Level.SEVERE, null, ex);
            }
            break;
            
            
             case "insertsubmitRTNDPS":
            try {
                Update.insertsubmitRTNDPS(request.getParameter("cono"), request.getParameter("divi"), request.getParameter("orderid"), request.getParameter("dpmh_to"), request.getParameter("purpose"), request.getParameter("status"));
            } catch (JSONException ex) {
                Logger.getLogger(Action.class.getName()).log(Level.SEVERE, null, ex);
            }
            break;
            
            
            
            
            
            
           
            
            
            case "returnid":
            try {
                Update.returnid(request.getParameter("id"));
            } catch (JSONException ex) {
                Logger.getLogger(Action.class.getName()).log(Level.SEVERE, null, ex);
            }
            break;

            case "insertsignature":
            try {
                Update.insertsignature(request.getParameter("cono"), request.getParameter("divi"), request.getParameter("orderid"), request.getParameter("rolename"), request.getParameter("name"), request.getParameter("datetime"), request.getParameter("roledate"));
            } catch (JSONException ex) {
                Logger.getLogger(Action.class.getName()).log(Level.SEVERE, null, ex);
            }
            break;

            case "updatesignature":
            try {
                Update.updatesignature(request.getParameter("cono"), request.getParameter("divi"), request.getParameter("orderid"), request.getParameter("rolename"), request.getParameter("roledate"));
            } catch (JSONException ex) {
                Logger.getLogger(Action.class.getName()).log(Level.SEVERE, null, ex);
            }
            break;

            case "updateitemdata":
                
                try {
                Update.updateitemdata(request.getParameter("id"), request.getParameter("itid"),
                        request.getParameter("code"), request.getParameter("desc"),
                        request.getParameter("unit"), request.getParameter("reqt"),
                        request.getParameter("issu"), request.getParameter("onhand") ,request.getParameter("QTY_ETC") ,request.getParameter("QTY_ETCTH") ,request.getParameter("QTY_NO") ,request.getParameter("QTY_THTXT") ,request.getParameter("QTY_KGS")
                );
            } catch (JSONException ex) {
                Logger.getLogger(Action.class.getName()).log(Level.SEVERE, null, ex);
            }

            break;

            case "updateissitemdata":

            try {

                Update.updateissitemdata(request.getParameter("id"), request.getParameter("itid"),
                        request.getParameter("code"),
                        request.getParameter("issu")
                );

            } catch (JSONException ex) {
                Logger.getLogger(Action.class.getName()).log(Level.SEVERE, null, ex);
            }

            break;

            case "updateissitemdatastore":
            try {
                Update.updateissitemdatastore(request.getParameter("id"), request.getParameter("itid"),
                        request.getParameter("code"),
                        request.getParameter("issu"), request.getParameter("onhand")
                );
            } catch (JSONException ex) {
                Logger.getLogger(Action.class.getName()).log(Level.SEVERE, null, ex);
            }
            break;

            case "updateheaddata":
                
                 try {

                Update.updateheaddata(request.getParameter("id"), request.getParameter("vdepartmentname"), request.getParameter("vcostcenter"), request.getParameter("vdate"), request.getParameter("vtype"), request.getParameter("vfwhs"), request.getParameter("vtwhs"), request.getParameter("location"), request.getParameter("orderPurpose"));

            } catch (JSONException ex) {
                Logger.getLogger(Action.class.getName()).log(Level.SEVERE, null, ex);
            }

            break;

            // Delete
            case "deleteitemdata":
                
                 try {

                Delete.deleteitemdata(request.getParameter("code"), request.getParameter("itid"), request.getParameter("id"));

            } catch (JSONException ex) {
                Logger.getLogger(Action.class.getName()).log(Level.SEVERE, null, ex);
            }

            break;
            case "deleteitemdatapp":
                
                 try {

                Delete.deleteitemdatapp(request.getParameter("code"), request.getParameter("id"), request.getParameter("qty"));

            } catch (JSONException ex) {
                Logger.getLogger(Action.class.getName()).log(Level.SEVERE, null, ex);
            }

            break;

            default:
                break;
        }

    }

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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(Action.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(Action.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
