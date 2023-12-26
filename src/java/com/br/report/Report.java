/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.br.report;

import com.br.connection.ConnectDB2;
import java.io.File;
import java.io.IOException;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.export.ooxml.JRXlsxExporter;
import net.sf.jasperreports.engine.xml.JRXmlLoader;

/**
 *
 * @author Wattana
 */
public class Report extends HttpServlet {

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
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/pdf");

        String report = request.getParameter("report");
        System.out.println("report: " + report);

        Connection conn = null;
        switch (report) {
//            case "Rental_Excel":
//                String path = getServletContext().getRealPath("/jaspers/");
//                System.out.println(path);
//                Map parameters = new HashMap();
//                parameters.put("cono", "10");
//                parameters.put("divi", "101");
//                parameters.put("whs", request.getParameter("warehouse"));
//                parameters.put("period", request.getParameter("period"));
//
//                JasperDesign JPD;
//                try {
//
//                    JPD = JRXmlLoader.load(path + "Rental_Excel_V3.jrxml");
//                    JasperReport jasperReport = JasperCompileManager.compileReport(JPD);
//
//                    try {
//                        // conn = ConnectSQLServer.ConnectionDB();
//                    } catch (Exception ex) {
//                        Logger.getLogger(Report.class.getName()).log(Level.SEVERE, null, ex);
//                    }
//
//                    JasperPrint jasp = JasperFillManager.fillReport(jasperReport, parameters, conn);
//                    response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
//                    response.setHeader("Content-Disposition", "attachment; filename=\"" + "Rental_Report_" + request.getParameter("warehouse") + "_" + request.getParameter("period") + ".xlsx" + "\"");
//                    JRXlsxExporter exporterXls = new JRXlsxExporter();
//            try (ServletOutputStream ouputStream = response.getOutputStream()) {
//                exporterXls.setParameter(JRExporterParameter.JASPER_PRINT, jasp);
//                exporterXls.setParameter(JRExporterParameter.OUTPUT_STREAM, ouputStream);
//                exporterXls.exportReport();
//                ouputStream.flush();
//            }
//
//                } catch (IOException | JRException ex) {
//                    Logger.getLogger(Report.class.getName()).log(Level.SEVERE, null, ex);
//                }
//                break;
//

            case "NEWMATERAIL_REQ":

                String CONO1 = request.getParameter("cono");
                String REQBY1 = "PPpppp";
                String Costc1 = "Cos";
                String Department1 = "Dept";
                String ORD_ID1 = request.getParameter("MRNO");

                System.out.println("xxxxxxxxxxxxxxxxxxxxxxxxxx");
                System.out.println(ORD_ID1);
                System.out.println(CONO1);
                System.out.println(REQBY1);
                System.out.println(Costc1);
                System.out.println(Department1);
                System.out.println("xxxxxxxxxxxxxxxxxxxxxxxxxx");
                
                JasperDesign JPD;
                try {
                    String path1 = getServletContext().getRealPath("/jaspers/");

                    JPD = JRXmlLoader.load(path1 + "RP_MaterialReq_PP.jrxml");
                    JasperReport jasperReport = JasperCompileManager.compileReport(JPD);

                    Locale.setDefault(Locale.US);
                    Date d = new Date();
                    SimpleDateFormat A = new SimpleDateFormat("dd/MM/yyyy");
                    String DateNow = A.format(d);

                    ResultSet Data111 = Datafrom222(ORD_ID1, CONO1);
//                    
                    System.out.println("---------------------------");

                    if (Data111.next()) {

                        Costc1 = Data111.getString("COS_CENT").trim();
                        Department1 = Data111.getString("DEP_NAME").trim();
                        CONO1 = Data111.getString("REG_CONO").trim();
                        REQBY1 = Data111.getString("ORD_REGB").trim();

                    }
                    Map parameters2 = new HashMap();
                    parameters2.put("MRNO", ORD_ID1);
                    parameters2.put("CONO", CONO1);
                    parameters2.put("REQBY", REQBY1);
                    parameters2.put("Costc", Costc1);
                    parameters2.put("DATE", DateNow);
                    parameters2.put("Department", Department1);

                    System.out.println("----------------");

                    try {
                        conn = ConnectDB2.ConnectionDB();
                    } catch (Exception ex) {
                        Logger.getLogger(Report.class.getName()).log(Level.SEVERE, null, ex);
                    }
                  
                    byte[] bytes = JasperRunManager.runReportToPdf(jasperReport, parameters2, conn);
                    response.setContentType("application/pdf");

                    response.setContentLength(bytes.length);
                    try ( ServletOutputStream ouputStream = response.getOutputStream()) {
                        ouputStream.write(bytes, 0, bytes.length);
                        ouputStream.flush();
                    }
                    conn.close();
                } catch (JRException ex) {
                    Logger.getLogger(Report.class.getName()).log(Level.SEVERE, null, ex);
                } catch (Exception ex) {
                    Logger.getLogger(Report.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (IOException | ServletException ex) {
            Logger.getLogger(Report.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (IOException | ServletException ex) {
            Logger.getLogger(Report.class.getName()).log(Level.SEVERE, null, ex);
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

    public static ResultSet Datafrom111(String MRNO) throws Exception {
        Connection conn = ConnectDB2.servers111();
        try {
            if (conn != null) {
                Statement stmt = conn.createStatement();
                String query = "select a.XMDoc_InNo,a.XMDoc_DT,a.TxtFromWHS,a.TxtToWHS,a.TransType1,\n"
                        + "a.TxtToLoc,a.TxtOrderType,a.TxtCostCenter,convert(varchar,a.TxtMRDate,112) pdate ,a.TxtReqestedBy,a.TxtDepartment,b.CODE,b.DESCRIPTION,b.QTYREQ\n"
                        + "from Form_MaterialRequisition a , Form_MaterialRequisition_Table_MRItem b\n"
                        + "where a.XMDoc_InNo = b.XMDoc_InNo\n"
                        + "and a.cbb_choose_company = 'BR'\n"
                        + " and AutoNumber1 = '" + MRNO.trim() + "'";
                System.out.println("SelectCompany\n" + query);
                ResultSet rs1 = stmt.executeQuery(query);
                return rs1;

            } else {
                System.out.println("Server can't connect.");
            }

        } catch (SQLException sqle) {
            throw sqle;
        } catch (Exception e) {
            if (conn != null) {
                conn.close();
            }
            throw e;
        }

        return null;

    }

    public static ResultSet Datafrom222(String MRNO, String cono) throws Exception {
        Connection conn = ConnectDB2.ConnectionDB();

        try {
            if (conn != null) {
                Statement stmt = conn.createStatement();

                String query = "SELECT b.REG_CONO ,b.DEP_NAME, b.ORD_REGB, FRM_WAHO AS MTWHLO ,b.COS_CENT, a.ORD_ID  AS MR_NO , b.CRE_DATE AS  REQ_DATE, a.ITM_ID AS CODE , a.ITM_DESC AS  DESCRIPTION , a.ITM_UNIT AS  UNIT , a.QTY_ISSU as QTY_ISSUE , a.QTY_REQT as QTY , b.CRE_DATE as REC_DATE, b.MVX_ORDE AS ORDER_NO \n"
                        + " FROM (\n"
                        + " \n"
                        + " SELECT  * FROM BRLDTA0100.FAR_ITMTLB04 \n"
                        + " WHERE  ORD_ID  = '" + MRNO + "'\n"
                        + " AND REG_CONO = '" + cono + "' \n"
                        + " ) AS a \n"
                        + " \n"
                        + " LEFT  JOIN  \n"
                        + " (\n"
                        + " \n"
                        + "  SELECT  * FROM BRLDTA0100.FAR_MTRREQ04 fm  \n"
                        + " WHERE  ORD_ID  ='" + MRNO + "'\n"
                        + " ) AS b \n"
                        + " \n"
                        + " ON a.ord_id = b.ord_id AND a.REG_CONO = b.REG_CONO";
                System.out.println("SelectCompany\n" + query);
                ResultSet rs1 = stmt.executeQuery(query);
                return rs1;

            } else {
                System.out.println("Server can't connect.");
            }

        } catch (SQLException sqle) {
            throw sqle;
        } catch (Exception e) {
            if (conn != null) {
                conn.close();
            }
            throw e;
        }

        conn.close();
        return null;

    }

}
