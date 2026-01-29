/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.br.data;

import com.br.connection.ConnectDB2;
import com.br.utility.GBVAR;

import com.br.connection.ConnectSQLServer;
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
public class Update {

    public static void ROLLBACK(String cono, String divi, String ordid) throws Exception {

        Connection conn = ConnectDB2.ConnectionDB();
        String state = "";

        try {
            if (conn != null) {

                Statement stmt = conn.createStatement();
                String query = " UPDATE " + GBVAR.DBPRD + ".FAR_MTRREQ04 fm  \n"
                        + " SET ORD_STAT  = '11', ORD_ISSB  = '-', ISB_DATE  = '-'\n"
                        + " WHERE ORD_ID  = '" + ordid.trim() + "'";

                System.out.println("rejectid : \n" + query);
                stmt.execute(query);

            } else {
                System.out.println("Server can't connect.");
            }

        } catch (SQLException sqle) {
            throw sqle;
        } catch (Exception e) {
            e.printStackTrace();
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

    public static void SETITEM(String cono, String divi, String ordid) throws Exception {

        Connection conn = ConnectDB2.ConnectionDB();
        String state = "";

        try {
            if (conn != null) {

                Statement stmt = conn.createStatement();
                String query = " UPDATE " + GBVAR.DBPRD + ".FAR_ITMTLB04 fm  \n"
                        + " SET ONH_STAT  = 'YES'\n"
                        + " WHERE ORD_ID  = '" + ordid.trim() + "'";

                System.out.println("rejectid : \n" + query);
                stmt.execute(query);

            } else {
                System.out.println("Server can't connect.");
            }

        } catch (SQLException sqle) {
            throw sqle;
        } catch (Exception e) {
            e.printStackTrace();
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

    public static void updateusername(String username, String id, String datetime) throws Exception {

        Connection conn = ConnectDB2.ConnectionDB();
        String state = "";

        try {
            if (conn != null) {

                Statement stmt = conn.createStatement();
                String query = "UPDATE " + GBVAR.DBPRD + ".FAR_MTRREQ04\n"
                        + "SET   ORD_ISSB = '" + username.trim() + "', ISB_DATE = '" + datetime.trim() + "' \n"
                        + "WHERE ORD_ID  = '" + id + "'";

                System.out.println("rejectid : \n" + query);
                stmt.execute(query);

            } else {
                System.out.println("Server can't connect.");
            }

        } catch (SQLException sqle) {
            throw sqle;
        } catch (Exception e) {
            e.printStackTrace();
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

    public static void rejectid(String ordernum) throws Exception {

        Connection conn = ConnectDB2.ConnectionDB();
        String state = "";
        state = "99";

        try {
            if (conn != null) {

                Statement stmt = conn.createStatement();
                String query = "UPDATE " + GBVAR.DBPRD + ".FAR_MTRREQ04\n"
                        + "SET   ORD_STAT = '" + state + "'  \n"
                        + "WHERE ORD_ID  = '" + ordernum + "'";

                System.out.println("rejectid : \n" + query);
                stmt.execute(query);

            } else {
                System.out.println("Server can't connect.");
            }

        } catch (SQLException sqle) {
            throw sqle;
        } catch (Exception e) {
            e.printStackTrace();
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

    public static void returnid(String id) throws Exception {

        Connection conn = ConnectDB2.ConnectionDB();

        try {
            if (conn != null) {

                Statement stmt = conn.createStatement();
                String query = "UPDATE " + GBVAR.DBPRD + ".FAR_MTRREQ04\n"
                        + "                      SET ORD_STAT = '00' \n"
                        + "                      WHERE ORD_ID  = '" + id + "'";
                System.out.println("returnid\n" + query);
                stmt.execute(query);

            } else {
                System.out.println("Server can't connect.");
            }

        } catch (SQLException sqle) {
            throw sqle;
        } catch (Exception e) {
            e.printStackTrace();
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

    public static void insertsubmitRTNDPS(String cono, String divi, String orderid, String dpmh_to, String purpose, String status) throws Exception {

        Connection conn = ConnectDB2.ConnectionDB();

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
            if (conn != null) {

                Statement stmt = conn.createStatement();
                String query = "UPDATE " + GBVAR.DBPRD + ".FAR_MTRREQ04\n"
                        + "                      SET "+columnName+" = '" + dpmh_to + "', ORD_PURP = '" + purpose + "' \n"
                        + "                      WHERE ORD_ID  = '" + orderid + "'";
                System.out.println("insertsubmit\n" + query);
                stmt.execute(query);

            } else {
                System.out.println("Server can't connect.");
            }

        } catch (SQLException sqle) {
            throw sqle;
        } catch (Exception e) {
            e.printStackTrace();
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

    public static void insertsubmit(String cono, String divi, String orderid, String dpmh_to, String purpose) throws Exception {

        Connection conn = ConnectDB2.ConnectionDB();

        try {
            if (conn != null) {

                Statement stmt = conn.createStatement();
                String query = "UPDATE " + GBVAR.DBPRD + ".FAR_MTRREQ04\n"
                        + "                      SET DPM_HEAD = '" + dpmh_to + "', ORD_PURP = '" + purpose + "' \n"
                        + "                      WHERE ORD_ID  = '" + orderid + "'";
                System.out.println("insertsubmit\n" + query);
                stmt.execute(query);

            } else {
                System.out.println("Server can't connect.");
            }

        } catch (SQLException sqle) {
            throw sqle;
        } catch (Exception e) {
            e.printStackTrace();
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

    public static void insertsignature(String cono, String divi, String orderid, String rolename, String name, String datetime, String roledate) throws Exception {

        Connection conn = ConnectDB2.ConnectionDB();

        try {
            if (conn != null) {

                Statement stmt = conn.createStatement();
                String query = "UPDATE " + GBVAR.DBPRD + ".FAR_MTRREQ04\n"
                        + "                      SET  " + rolename + " = '" + name + "', " + roledate + " = '" + datetime + "'\n"
                        + "                      WHERE ORD_ID  = '" + orderid + "' \n"
                        + " AND ORD_STAT != '99' AND ORD_STAT != '22' ";
                System.out.println("insertsignature\n" + query);
                stmt.execute(query);

            } else {
                System.out.println("Server can't connect.");
            }

        } catch (SQLException sqle) {
            throw sqle;
        } catch (Exception e) {
            e.printStackTrace();
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

    public static void updatesignature(String cono, String divi, String orderid, String rolename, String roledate) throws Exception {

        Connection conn = ConnectDB2.ConnectionDB();

        try {
            if (conn != null) {

                Statement stmt = conn.createStatement();
                String query = "UPDATE " + GBVAR.DBPRD + ".FAR_MTRREQ04\n"
                        + "                      SET  " + rolename + " = '' , " + roledate + " = ''\n"
                        + "                      WHERE ORD_ID  = '" + orderid + "'\n"
                        + " AND ORD_STAT != '99' AND ORD_STAT != '22'";
                System.out.println("updatesignature\n" + query);
                stmt.execute(query);

            } else {
                System.out.println("Server can't connect.");
            }

        } catch (SQLException sqle) {
            throw sqle;
        } catch (Exception e) {
            e.printStackTrace();
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

    public static void updateitemdata(String id, String itid, String code, String desc, String unit, String reqt, String issu, String onhand, String QTY_ETC, String QTY_ETCTH) throws Exception {

        Connection conn = ConnectDB2.ConnectionDB();
        desc = convertApostrophe(desc);

        try {
            if (conn != null) {

                Statement stmt = conn.createStatement();
                String query = "UPDATE " + GBVAR.DBPRD + ".FAR_ITMTLB04\n"
                        + "SET ITM_ID = '" + code + "',ITM_DESC = '" + desc + "', ONH_STAT = '" + onhand + "',ITM_UNIT = '" + unit + "',QTY_REQT = '" + reqt + "', QTY_ISSU = '" + issu + "'\n"
                        + "WHERE ID  = '" + itid + "'"
                        + "AND ORD_ID = '" + id + "'  AND QTY_ETC = '" + QTY_ETC + "' AND QTY_ETCTH = '" + QTY_ETCTH + "'";
                System.out.println("updateitemdata\n" + query);
                stmt.execute(query);

            } else {
                System.out.println("Server can't connect.");
            }

        } catch (SQLException sqle) {
            throw sqle;
        } catch (Exception e) {
            e.printStackTrace();
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

    public static void updateissitemdata(String id, String itid, String code, String issu) throws Exception {

        Connection conn = ConnectDB2.ConnectionDB();

        try {
            if (conn != null) {

                Statement stmt = conn.createStatement();
                String query = "UPDATE " + GBVAR.DBPRD + ".FAR_ITMTLB04\n"
                        + "SET ITM_ID = '" + code + "', QTY_ISSU = '" + issu + "'\n"
                        + "WHERE ID  = '" + itid + "'"
                        + "AND ORD_ID = '" + id + "'";
                System.out.println("updateissitemdata\n" + query);
                stmt.execute(query);

            } else {
                System.out.println("Server can't connect.");
            }

        } catch (SQLException sqle) {
            throw sqle;
        } catch (Exception e) {
            e.printStackTrace();
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

    public static void updateissitemdatastore(String id, String itid, String code, String issu, String onhand) throws Exception {

        Connection conn = ConnectDB2.ConnectionDB();

        try {
            if (conn != null) {

                Statement stmt = conn.createStatement();
                String query = "UPDATE " + GBVAR.DBPRD + ".FAR_ITMTLB04\n"
                        + "SET ITM_ID = '" + code + "', QTY_ISSU = '" + issu + "', ONH_STAT = '" + onhand + "'\n"
                        + "WHERE ID  = '" + itid + "'"
                        + "AND ORD_ID = '" + id + "'";
                System.out.println("updateissitemdata\n" + query);
                stmt.execute(query);

            } else {
                System.out.println("Server can't connect.");
            }

        } catch (SQLException sqle) {
            throw sqle;
        } catch (Exception e) {
            e.printStackTrace();
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

    public static void updateheaddata(String id, String vdepartmentname, String vcostcenter, String vdate, String vtype, String vfwhs, String vtwhs, String location, String orderPurpose) throws Exception {

        Connection conn = ConnectDB2.ConnectionDB();

        try {
            if (conn != null) {

                Statement stmt = conn.createStatement();
                String query = "UPDATE " + GBVAR.DBPRD + ".FAR_MTRREQ04\n"
                        + "SET  DEP_NAME = '" + vdepartmentname + "',COS_CENT = '" + vcostcenter + "',CRE_DATE = '" + vdate + "',MAT_TYPE = '" + vtype + "',FRM_WAHO = '" + vfwhs + "',TO_WAHO ='" + vtwhs + "', WAH_LOCA = '" + location + "', ORD_PURP = '" + orderPurpose + "' \n"
                        + "WHERE ORD_ID  = '" + id + "' \n"
                        + "AND ORD_STAT != '99' AND ORD_STAT != '22'";
                System.out.println("UpdateFacility\n" + query);
                stmt.execute(query);

            } else {
                System.out.println("Server can't connect.");
            }

        } catch (SQLException sqle) {
            throw sqle;
        } catch (Exception e) {
            e.printStackTrace();
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
}
