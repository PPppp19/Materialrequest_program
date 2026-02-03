/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.br.data;

import com.br.connection.ConnectDB2;
import com.br.connection.ConnectSQLServer;
import com.br.utility.GBVAR;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;
import org.codehaus.jettison.json.JSONArray;

/**
 *
 * @author Wattana
 */
public class Insert {

    public static String convertApostrophe(String text) {
        text = text.replace("'", "''");
        text = text.replace("‘", "''");
        text = text.replace("’", "''");
        text = text.replace("\"", "\"");
        text = text.replace("“", "\"");
        text = text.replace("”", "\"");
        text = text.replace(";", ",");

        return text;
    }

    public static void Additemdata(String itid, String id, String code, String desc, String unit, String reqt, String issu, String onhandsts, String cono, String divi , String QTY_ETC, String QTY_ETCTH,String QTY_NO, String QTY_THTXT,String QTY_KGS ) throws Exception {

        System.out.println("add reqt");
        System.out.println(reqt);
        System.out.println("add issu");
        System.out.println(issu);

        desc = convertApostrophe(desc);
        JSONArray mJSonArr = new JSONArray();
        Connection conn = ConnectSQLServer.ConnectionDB();

        try {
            if (conn != null) {

                Statement stmt = conn.createStatement();
                String query = "INSERT INTO  "+GBVAR.DBPRD+".FAR_ITMTLB04\n"
                        + "(ID,ORD_ID,ITM_ID,ITM_DESC,ITM_UNIT,QTY_REQT,QTY_ISSU,ONH_STAT,POS_STAT, REG_CONO,REG_DIVI , QTY_ETC,QTY_ETCTH, QTY_NO,QTY_THTXT,QTY_KGS)\n"
                        + "VALUES \n"
                        + "('" + itid + "','" + id + "','" + code + "','" + desc + "','" + unit + "','" + reqt + "','" + issu + "','" + onhandsts + "','-','" + cono + "','" + divi + "' , '"+QTY_ETC+"', '"+QTY_ETCTH+"' , '"+QTY_NO+"','"+QTY_THTXT+"' , '"+QTY_KGS+"') \n ";
                System.out.println("Additemdata\n" + query);
                stmt.execute(query);

                //insertRentalDetail03(cono, divi, whs, round, fromdate, todate);
                Map<String, Object> mMap = new HashMap<>();
                mMap.put("result", "ok");
                mMap.put("message", "insert complete");
                mJSonArr.put(mMap);

            } else {
                System.out.println("Server can't connect.");
            }

        } catch (SQLException sqle) {
            throw sqle;
        } catch (Exception e) {
            Map<String, Object> mMap = new HashMap<>();
            mMap.put("result", "nok");
            mMap.put("message", e);
            mJSonArr.put(mMap);
            if (conn != null) {
                conn.close();
            }
            throw e;
        } finally {
            if (conn != null) {
                conn.close();
            }
        }

    }
    
    
            
            
            public static String AddOrderIDRTNDPT(String nextid, String id, int ruid, String vcompany, String vrequester, String vdepartmentname, String vcostcenter, String orderpurpose, String vdate, String vtype, String vfwhs, String vtwhs, String location, String rqtdate, String dpmhead, String orddpmh, String dphdate, String ordissb, String isbdate, String ordstat, String vcono, String vdivi , String fac ,String itemtype,String pgmtype, String ORD_MG1, String ORD_MG2  ) throws Exception {

        JSONArray mJSonArr = new JSONArray();
        //Connection conn = ConnectSQLServer.ConnectionDB();
        Connection conn = ConnectDB2.ConnectionDB();

        try {
            if (conn != null) {

                int a = Integer.parseInt(nextid);

                Statement stmt2 = conn.createStatement();
                String query2 = "INSERT INTO "+GBVAR.DBPRD+".FAR_MTRREQ04 (ID,ORD_ID,RUID,COM_ID ,ORD_REGB,DEP_NAME,COS_CENT, ORD_PURP, CRE_DATE, MAT_TYPE, FRM_WAHO, TO_WAHO, WAH_LOCA, RQT_DATE, DPM_HEAD, ORD_DPMH, DPH_DATE, ORD_ISSB, ISB_DATE, ORD_STAT, MVX_ORDE, REG_CONO, REG_DIVI,REG_FAC , ITM_TYPE, PGM_TYPE,ORD_MG1,ORD_MG2, MG1_DATE) values (" + id + "," + a + ", " + ruid + " , '" + vcompany + "', '" + vrequester + "', '" + vdepartmentname + "', '" + vcostcenter + "', '" + orderpurpose + "' , '" + vdate + "', '" + vtype + "', '" + vfwhs + "', '" + vtwhs + "', '" + location + "', '" + rqtdate + "', '" + dpmhead + "', '" + orddpmh + "', '" + dphdate + "', '" + ordissb + "', '" + isbdate + "', '" + ordstat + "','00000000','" + vcono + "','" + vdivi + "'  , '"+fac+"' , '"+itemtype+"', '"+pgmtype+"' ,'"+ORD_MG1+"','"+ORD_MG2+"' , '-')";
                System.out.println("AddOrderID\n" + query2);
                stmt2.execute(query2);

                Map<String, Object> mMap = new HashMap<>();
                mMap.put("result", "ok");
                mMap.put("message", "insert complete");
                mJSonArr.put(mMap);

            } else {
                System.out.println("Server can't connect.");
            }

        } catch (SQLException sqle) {
            throw sqle;
        } catch (NumberFormatException e) {
            Map<String, Object> mMap = new HashMap<>();
            mMap.put("result", "nok");
            mMap.put("message", e);
            mJSonArr.put(mMap);
            if (conn != null) {
                conn.close();
            }
            throw e;
        } finally {
            if (conn != null) {
                conn.close();
            }
        }

        return nextid;

    }

    public static String AddOrderID(String nextid, String id, int ruid, String vcompany, String vrequester, String vdepartmentname, String vcostcenter, String orderpurpose, String vdate, String vtype, String vfwhs, String vtwhs, String location, String rqtdate, String dpmhead, String orddpmh, String dphdate, String ordissb, String isbdate, String ordstat, String vcono, String vdivi , String fac ,String itemtype,String pgmtype ) throws Exception {

        JSONArray mJSonArr = new JSONArray();
        //Connection conn = ConnectSQLServer.ConnectionDB();
        Connection conn = ConnectDB2.ConnectionDB();

        try {
            if (conn != null) {

                int a = Integer.parseInt(nextid);

                Statement stmt2 = conn.createStatement();
                String query2 = "INSERT INTO "+GBVAR.DBPRD+".FAR_MTRREQ04 (ID,ORD_ID,RUID,COM_ID ,ORD_REGB,DEP_NAME,COS_CENT, ORD_PURP, CRE_DATE, MAT_TYPE, FRM_WAHO, TO_WAHO, WAH_LOCA, RQT_DATE, DPM_HEAD, ORD_DPMH, DPH_DATE, ORD_ISSB, ISB_DATE, ORD_STAT, MVX_ORDE, REG_CONO, REG_DIVI,REG_FAC , ITM_TYPE, PGM_TYPE) values (" + id + "," + a + ", " + ruid + " , '" + vcompany + "', '" + vrequester + "', '" + vdepartmentname + "', '" + vcostcenter + "', '" + orderpurpose + "' , '" + vdate + "', '" + vtype + "', '" + vfwhs + "', '" + vtwhs + "', '" + location + "', '" + rqtdate + "', '" + dpmhead + "', '" + orddpmh + "', '" + dphdate + "', '" + ordissb + "', '" + isbdate + "', '" + ordstat + "','00000000','" + vcono + "','" + vdivi + "'  , '"+fac+"' , '"+itemtype+"', '"+pgmtype+"' )";
                System.out.println("AddOrderID\n" + query2);
                stmt2.execute(query2);

                Map<String, Object> mMap = new HashMap<>();
                mMap.put("result", "ok");
                mMap.put("message", "insert complete");
                mJSonArr.put(mMap);

            } else {
                System.out.println("Server can't connect.");
            }

        } catch (SQLException sqle) {
            throw sqle;
        } catch (NumberFormatException e) {
            Map<String, Object> mMap = new HashMap<>();
            mMap.put("result", "nok");
            mMap.put("message", e);
            mJSonArr.put(mMap);
            if (conn != null) {
                conn.close();
            }
            throw e;
        } finally {
            if (conn != null) {
                conn.close();
            }
        }

        return nextid;

    }
}
