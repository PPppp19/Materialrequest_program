/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.br.data;

import com.br.connection.ConnectDB2;
import com.br.utility.GBVAR;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;
import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;

/**
 *
 * @author Wattana
 */
public class Select {

    public static String DBPRD = GBVAR.DBPRD;
    public static String M3DB = GBVAR.M3DB;

    public static JSONArray Location(String CONO, String DIVI) throws Exception {

        JSONArray mJSonArr = new JSONArray();
        Connection conn = ConnectDB2.ConnectionDB();

        try {
            if (conn != null) {

                Statement stmt = conn.createStatement();
                String query = "SELECT CFFACI,CFFACI || ' : '  || CFFACN  AS CFFACN \n"
                        + "FROM M3FDBPRD.CFACIL\n"
                        + "WHERE CFCONO = '" + CONO.trim() + "'\n"
                        + "AND CFDIVI = '" + DIVI.trim() + "'";
                System.out.println("SelectCompany\n" + query);
                ResultSet mRes = stmt.executeQuery(query);

                while (mRes.next()) {
                    Map<String, Object> mMap = new HashMap<>();

                    mMap.put("CFFACI", mRes.getString(1).trim());
                    mMap.put("CFFACN", mRes.getString(2).trim());
                    mJSonArr.put(mMap);

                }

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

        return mJSonArr;

    }

    public static String checkuserprioAPV(String username) throws Exception {

        Connection conn = ConnectDB2.ConnectionDB();
        String isComplete = "NG";
        int count = 0;

        try {
            if (conn != null) {

                Statement stmt = conn.createStatement();
                String query = "SELECT COUNT(CTL_UID)  \n"
                        + "FROM BRLDTA0100.APPCTL1 a \n"
                        + "WHERE CTL_REM = 'AP'\n"
                        + "AND CTL_UID = '" + username + "'";

                System.out.println("getComplete\n" + query);
                ResultSet mRes = stmt.executeQuery(query);

                while (mRes.next()) {
                    count = mRes.getInt(1);
                }

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
        } finally {
            if (conn != null) {
                conn.close();
            }
        }

        System.out.println("mamamamamamama");
        System.out.println(count);

        if (count != 0) {
            isComplete = "OK";
        }

        return isComplete;

    }

    public static String checkuserprio(String username) throws Exception {

        Connection conn = ConnectDB2.ConnectionDB();
        String isComplete = "NG";
        int count = 0;

        try {
            if (conn != null) {

                Statement stmt = conn.createStatement();
                String query = "SELECT COUNT(CTL_UID)  \n"
                        + "FROM BRLDTA0100.APPCTL1 a \n"
                        + "WHERE CTL_CODE = 'EPR'\n"
                        + "AND CTL_REM = 'ST'\n"
                        + "AND CTL_UID = '" + username + "'";

                System.out.println("getComplete\n" + query);
                ResultSet mRes = stmt.executeQuery(query);

                while (mRes.next()) {
                    count = mRes.getInt(1);
                }

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
        } finally {
            if (conn != null) {
                conn.close();
            }
        }

        System.out.println("mamamamamamama");
        System.out.println(count);

        if (count != 0) {
            isComplete = "OK";
        }

        return isComplete;

    }

    public static String checkuserpriofm(String username) throws Exception {

        Connection conn = ConnectDB2.ConnectionDB();
        String isComplete = "NG";
        int count = 0;

        try {
            if (conn != null) {

                Statement stmt = conn.createStatement();
                String query = "SELECT COUNT(CTL_UID)  \n"
                        + "FROM BRLDTA0100.APPCTL1 a \n"
                        + "WHERE CTL_CODE = 'MAT'\n"
                        + "AND CTL_REM = 'AD'\n"
                        + "AND CTL_UID = '" + username + "'";

                System.out.println("getCompleteFM\n" + query);
                ResultSet mRes = stmt.executeQuery(query);

                while (mRes.next()) {
                    count = mRes.getInt(1);
                }

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
        } finally {
            if (conn != null) {
                conn.close();
            }
        }

        System.out.println("mamamamamamama");
        System.out.println(count);

        if (count != 0) {
            isComplete = "OK";
        }

        return isComplete;

    }

    public static JSONArray getSelectID(String username, String key, String cono, String divi) throws Exception {

        Connection conn = ConnectDB2.ConnectionDB();
        JSONArray mJSonArr = new JSONArray();
        String sts = "00";
        String column = "ORD_REGB";

        switch (key) {
            case "S1":
                sts = "00";
                break;
            case "S2":
                sts = "01";
                column = "DPM_HEAD";
                break;
            case "S3":
                sts = "10";
                break;

            default:
                sts = "00";
                break;
        }

        try {
            if (conn != null) {

                Statement stmt = conn.createStatement();
                String query = "SELECT  ORD_ID  FROM " + GBVAR.DBPRD + ".FAR_MTRREQ04 WHERE " + column + "  = '" + username + "' AND  ORD_STAT  = '" + sts + "' AND REG_CONO = '" + cono + "' AND REG_DIVI = '" + divi + "' ORDER BY CAST(id AS int )  desc ";

                System.out.println("getSelectIDddddd\n" + query);
                ResultSet mRes = stmt.executeQuery(query);

                while (mRes.next()) {

                    Map<String, Object> mMap = new HashMap<>();
                    mMap.put("ORD_ID", mRes.getString(1).trim());
                    mJSonArr.put(mMap);

                }

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
        } finally {
            if (conn != null) {
                conn.close();
            }
        }

        return mJSonArr;

    }

    public static JSONArray getmyid(String username, String cono, String divi) throws Exception {

        Connection conn = ConnectDB2.ConnectionDB();
        JSONArray mJSonArr = new JSONArray();

        try {
            if (conn != null) {

                Statement stmt = conn.createStatement();
                String query = "SELECT  ORD_ID  FROM " + GBVAR.DBPRD + ".FAR_MTRREQ04 WHERE ORD_REGB  = '" + username + "' AND REG_CONO = '" + cono + "' AND REG_DIVI = '" + divi + "' ";

                System.out.println("getmyid\n" + query);
                ResultSet mRes = stmt.executeQuery(query);

                while (mRes.next()) {

                    Map<String, Object> mMap = new HashMap<>();
                    mMap.put("ORD_ID", mRes.getString(1).trim());
                    mJSonArr.put(mMap);

                }

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
        } finally {
            if (conn != null) {
                conn.close();
            }
        }

        return mJSonArr;

    }

    public static boolean getComplete(String orderid) throws Exception {

        Connection conn = ConnectDB2.ConnectionDB();
        boolean isComplete = false;
        int count = 0;

        try {
            if (conn != null) {

                Statement stmt = conn.createStatement();
                String query = "         SELECT COUNT(POS_STAT) as xxx\n"
                        + "FROM " + GBVAR.DBPRD + ".FAR_ITMTLB04 fi \n"
                        + "WHERE  ORD_ID  = '" + orderid + "' ";

                System.out.println("getComplete\n" + query);
                ResultSet mRes = stmt.executeQuery(query);

                while (mRes.next()) {
                    count = mRes.getInt(1);
                }

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
        } finally {
            if (conn != null) {
                conn.close();
            }
        }

        System.out.println("mamamamamamama");
        System.out.println(count);

        if (count == 0) {
            isComplete = true;
        }

        return isComplete;

    }

    public static String getmovex(String ordernum) throws Exception {

        Connection conn = ConnectDB2.ConnectionDB();
        String movex = "00000000";

        try {
            if (conn != null) {

                Statement stmt = conn.createStatement();
                String query = "SELECT  MVX_ORDE FROM  " + GBVAR.DBPRD + ".FAR_MTRREQ04\n"
                        + " WHERE ORD_ID = '" + ordernum + "'";

                System.out.println("getmovex\n" + query);
                ResultSet mRes = stmt.executeQuery(query);

                while (mRes.next()) {

                    movex = mRes.getString("MVX_ORDE");
                }

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

        return movex;

    }

    public static String getcreator(String ordernum) throws Exception {

        Connection conn = ConnectDB2.ConnectionDB();
        String creator = "PHONGS_PHO";

        try {
            if (conn != null) {

                Statement stmt = conn.createStatement();
                String query = "SELECT  ORD_REGB FROM  " + GBVAR.DBPRD + ".FAR_MTRREQ04\n"
                        + " WHERE ORD_ID = '" + ordernum + "'";

                System.out.println("getstoredsignature\n" + query);
                ResultSet mRes = stmt.executeQuery(query);

                while (mRes.next()) {
                    creator = mRes.getString("ORD_REGB");
                }

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
        } finally {
            if (conn != null) {
                conn.close();
            }
        }

        return creator;

    }

    public static String getonhand1(String itmid, String fwhs, String loca) throws Exception {

        Connection conn = ConnectDB2.ConnectionDB();
        JSONArray mJSonArr = new JSONArray();
        String onhand = "";
        try {
            if (conn != null) {

                Statement stmt = conn.createStatement();
                String query = "SELECT CAST(MLSTQT AS double)-CAST(MLALQT AS double) as ONHAND  \n"
                        + "FROM m3fdbprd.MITLOC WHERE MLITNO = '" + itmid.trim() + "'\n"
                        + "AND MLWHLO = '" + fwhs + "'\n"
                        + "AND MLWHSL like '" + loca.trim() + "%'\n"
                        + "AND MLSTAS = 2";

                System.out.println(query);
                ResultSet mRes1 = stmt.executeQuery(query);

                while (mRes1.next()) {
                    onhand = mRes1.getString("ONHAND");
                }

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

        return onhand;

    }

    public static String getonhand(String itm_id, String frm_whs, float inputval, String cono) throws Exception {

        Connection conn = ConnectDB2.ConnectionDB();
        int onhand = 0;
        String isExist = "";

        try {
            if (conn != null) {

                Statement stmt = conn.createStatement();
                String query = "SELECT  MLITNO ,  round(sum(MLSTQT-MLALQT),2) Onhand \n"
                        + "                  FROM M3FDBPRD.MITLOC WHERE MLCONO = '" + cono + "' and MLITNO = '" + itm_id + "' \n"
                        + "                  AND MLWHLO = '" + frm_whs + "'  \n"
                        + "                  AND MLSTAS = 2 group by MLITNO,MLWHLO";

                System.out.println("getOnhand\n" + query);
                ResultSet mRes = stmt.executeQuery(query);

                while (mRes.next()) {
                    onhand = mRes.getInt("Onhand");
                }

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
        } finally {
            if (conn != null) {
                conn.close();
            }
        }

        System.out.println(onhand + " > " + inputval + "?????");
        if (onhand >= inputval) {
            isExist = "yes";
        } else {
            isExist = "no";
        }

        return isExist;

    }

    public static JSONArray getuserapprovalname(String cono) throws Exception {

        Connection conn = ConnectDB2.ConnectionDB();
        JSONArray mJSonArr = new JSONArray();

        try {
            if (conn != null) {

                Statement stmt = conn.createStatement();
                String query = "SELECT DISTINCT  CTL_UID FROM BRLDTA0100.APPCTL1 a                    \n"
                        + "WHERE  CTL_CONO  = '" + cono + "'\n"
                        + "AND CTL_STS  = '20'";

                System.out.println("getstoredsignature\n" + query);
                ResultSet mRes = stmt.executeQuery(query);

                while (mRes.next()) {

                    Map<String, Object> mMap = new HashMap<>();
                    mMap.put("CTL_UID", mRes.getString(1).trim());
                    mJSonArr.put(mMap);

                }

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
        } finally {
            if (conn != null) {
                conn.close();
            }
        }

        return mJSonArr;

    }

    public static JSONArray getuserapproval(String cono) throws Exception {

        Connection conn = ConnectDB2.ConnectionDB();
        JSONArray mJSonArr = new JSONArray();

        try {
            if (conn != null) {

                Statement stmt = conn.createStatement();
//                String query = "               SELECT * FROM BRLDTA0100.APPCTL1 a                    \n"
//                        + "WHERE CTL_CODE = 'APV'\n"
//                        + "AND  CTL_CONO  = '" + cono + "'\n"
//                        + "AND CTL_STS  = '20'";

                String query = "SELECT *   FROM BRLDTA0100.FAR_APPRV01 a                    \n"
                        + "WHERE  CONO  = '" + cono + "'\n"
                        + "AND STS  = '20'\n"
                        + "AND APP = 'apv'";

                System.out.println("getstoredsignature\n" + query);
                ResultSet mRes = stmt.executeQuery(query);

                while (mRes.next()) {

                    Map<String, Object> mMap = new HashMap<>();
                    mMap.put("UID", mRes.getString(1).trim());
                    mJSonArr.put(mMap);

                }

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
        } finally {
            if (conn != null) {
                conn.close();
            }
        }

        return mJSonArr;

    }

    public static String getstoredsignature(String orderid, String rolename) throws Exception {

        String name = "mario";

        System.out.println(name);
        Connection conn = ConnectDB2.ConnectionDB();

        try {
            if (conn != null) {

                Statement stmt = conn.createStatement();
                String query = "SELECT " + rolename + "  AS nameresult FROM " + GBVAR.DBPRD + ".FAR_MTRREQ04 WHERE  ORD_ID = '" + orderid + "'";
                System.out.println("getstoredsignature\n" + query);
                ResultSet mRes = stmt.executeQuery(query);

                while (mRes.next()) {
                    name = mRes.getString("NAMERESULT");
                }

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
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
        System.out.println(name);
        return name;

    }

    public static String getemailbyname(String cono, String name) throws Exception {

        String email = "";
        Connection conn = ConnectDB2.ConnectionDB();

        try {
            if (conn != null) {

                Statement stmt = conn.createStatement();
                String query = "SELECT  ST_EMAIL FROM BRLDTA0100.STAFFLIST WHERE  ST_CONO = '" + cono + "' AND  ST_N6L3 = '" + name + "'";
                System.out.println("getemailbyname\n" + query);
                ResultSet mRes = stmt.executeQuery(query);

                while (mRes.next()) {
                    email = mRes.getString("ST_EMAIL");
                }

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
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
        System.out.println(email);
        return email;

    }

    /////// get ordertype FAC 
    public static String GetOrderType(String mattype, String facility, String cono) throws Exception {

        String ordertype = "";
        Connection conn = ConnectDB2.ConnectionDB();

        try {
            if (conn != null) {

                Statement stmt = conn.createStatement();
                String query = "SELECT ORD_REMAR1 FROM BRLDTA0100.FAR_MTRREQ_ORDERTYPE\n"
                        + "WHERE MAT_TYPE = '" + mattype.trim() + "'\n"
                        + "AND REG_FAC  = '" + facility.trim() + "'   AND  COM_ID = '"+cono.trim()+"'   ";
                System.out.println("GetOrderType\n" + query);
                ResultSet mRes = stmt.executeQuery(query);

                while (mRes.next()) {
                    ordertype = mRes.getString("ORD_REMAR1");
                }

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
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
        System.out.println(ordertype);
        return ordertype;

    }

    public static JSONArray getitemtype(String itemid, String cono) throws Exception {

        JSONArray mJSonArr = new JSONArray();
        Connection conn = ConnectDB2.ConnectionDB();

        try {
            if (conn != null) {

                Statement stmt = conn.createStatement();
                String query = "SELECT MMUNMS FROM M3FDBPRD.MITMAS WHERE MMCONO = '" + cono + "' \n"
                        + "                         AND MMITNO = '" + itemid + "' UNION ALL SELECT MUALUN AS MMUNMS \n"
                        + "                         FROM M3FDBPRD.MITAUN WHERE MUCONO = '" + cono + "' AND MUITNO =  '" + itemid + "'\n"
                        + "                         GROUP BY MUALUN";
                System.out.println("getitemtype\n" + query);
                ResultSet mRes = stmt.executeQuery(query);

                while (mRes.next()) {
                    Map<String, Object> mMap = new HashMap<>();
//                    mMap.put("MMUNMS", mRes.getString(1).trim());
                    mMap.put("MMUNMS", mRes.getString(1).trim());

//                    mMap.put("MMFUDS", mRes.getString(3).trim());
                    mJSonArr.put(mMap);

                }

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
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
        System.out.println(mJSonArr.toString());
        return mJSonArr;

    }

    public static JSONArray getload(String id, String cono, String divi) throws Exception {

        JSONArray mJSonArr = new JSONArray();
        Connection conn = ConnectDB2.ConnectionDB();

        try {
            if (conn != null) {

                Statement stmt = conn.createStatement();
                String query = "SELECT * FROM \n"
                        + "                       (SELECT  ID, ORD_ID, COM_ID, COS_CENT, DEP_NAME, CRE_DATE, MAT_TYPE, FRM_WAHO, TO_WAHO, WAH_LOCA, ORD_PURP, ORD_REMAR, ORD_REGB, RQT_DATE, DPM_HEAD, ORD_DPMH, DPH_DATE, ORD_ISSB, ISB_DATE, ORD_STAT, RUID, MVX_ORDE, REG_CONO, REG_DIVIห FROM  " + GBVAR.DBPRD + ".FAR_MTRREQ04\n"
                        + "                        WHERE ORD_ID = '" + id.trim() + "' \n"
                        + "                        AND  ORD_STAT != '22' AND  ORD_STAT != '99' \n"
                        + "AND REG_CONO= '" + cono + "' AND REG_DIVI ='" + divi + "' ) AS a \n"
                        + "            			LEFT  JOIN  \n"
                        + "                        (SELECT * FROM " + GBVAR.DBPRD + ".FAR_ITMTLB04\n"
                        + "                        WHERE ORD_ID = '" + id.trim() + "' \n"
                        + "AND REG_CONO= '" + cono + "' AND REG_DIVI ='" + divi + "'') AS b\n"
                        + "                      	ON a.ORD_ID = b.ORD_ID";
                System.out.println("Selectall history4\n" + query);
                ResultSet mRes = stmt.executeQuery(query);

                while (mRes.next()) {
                    Map<String, Object> mMap = new HashMap<>();
                    mMap.put("ID", mRes.getString(1).trim());
                    mMap.put("ORD_ID", mRes.getString(2).trim());
                    mMap.put("COM_ID", mRes.getString(3).trim());
                    mMap.put("COS_CENT", mRes.getString(4).trim());
                    mMap.put("DEP_NAME", mRes.getString(5).trim());
                    mMap.put("CRE_DATE", mRes.getString(6).trim());
                    mMap.put("MAT_TYPE", mRes.getString(7).trim());
                    mMap.put("FRM_WAHO", mRes.getString(8).trim());
                    mMap.put("TO_WAHO", mRes.getString(9).trim());
                    mMap.put("WAH_LOCA", mRes.getString(10).trim());
                    mMap.put("ORD_PURP", mRes.getString(11).trim());
                    mMap.put("ORD_REGB", mRes.getString(13).trim());
//                    mMap.put("RQT_DATE", mRes.getString(13).trim());
//                    mMap.put("DPM_HEAD", mRes.getString(14).trim());
                    mMap.put("ORD_DPMH", mRes.getString(16).trim());
//                    mMap.put("DPH_DATE", mRes.getString(16).trim());
                    mMap.put("ORD_ISSB", mRes.getString(18).trim());
//                    mMap.put("ISB_DATE", mRes.getString(18).trim());
//                    mMap.put("ORD_STAT", mRes.getString(19).trim());
//                    mMap.put("UID", mRes.getString(20).trim());
//
                    if (mRes.getString(25) != null) {

                        mMap.put("ITID", mRes.getString(25).trim());
                    }
//                    mMap.put("ORD_ID", mRes.getString(23).trim());

                    if (mRes.getString(27) != null) {
                        mMap.put("ITM_ID", mRes.getString(27).trim());
                    }

                    if (mRes.getString(28) != null) {
                        mMap.put("ITM_DESC", mRes.getString(28).trim());
                    }
                    if (mRes.getString(29) != null) {
                        mMap.put("ITM_UNIT", mRes.getString(29).trim());
                    }

                    if (mRes.getString(30) != null) {
                        mMap.put("QTY_REQT", mRes.getString(30).trim());
                    }
                    if (mRes.getString(31) != null) {
                        mMap.put("QTY_ISSU", mRes.getString(31).trim());
                    }
                    if (mRes.getString(32) != null) {
                        mMap.put("ONH_STAT", mRes.getString(32).trim());
                    }

                    mJSonArr.put(mMap);

                }

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
        } finally {
            if (conn != null) {
                conn.close();
            }
        }

        return mJSonArr;

    }

    public static JSONArray getloadm3(String id) throws Exception {

        JSONArray mJSonArr = new JSONArray();
        Connection conn = ConnectDB2.ConnectionDB();

        try {
            if (conn != null) {

                Statement stmt = conn.createStatement();
                String query = "SELECT * FROM \n"
                        + "                       (                       SELECT  ID, ORD_ID, COM_ID, COS_CENT, DEP_NAME, CRE_DATE, MAT_TYPE, FRM_WAHO, TO_WAHO, WAH_LOCA, ORD_PURP, ORD_REMAR, ORD_REGB, RQT_DATE, DPM_HEAD, ORD_DPMH, DPH_DATE, ORD_ISSB, ISB_DATE, ORD_STAT, RUID, MVX_ORDE, REG_CONO, REG_DIVI , REG_FAC FROM " + GBVAR.DBPRD + ".FAR_MTRREQ04\n"
                        + "                        WHERE ORD_ID = '" + id.trim() + "' \n"
                        + "                        AND  ORD_STAT != '22' AND  ORD_STAT != '99'  ) AS a \n"
                        + "            			LEFT  JOIN  \n"
                        + "                        (SELECT * FROM " + GBVAR.DBPRD + ".FAR_ITMTLB04\n"
                        + "                        WHERE ORD_ID = '" + id.trim() + "') AS b\n"
                        + "                      	ON a.ORD_ID = b.ORD_ID";
                System.out.println("Selectall history4\n" + query);
                ResultSet mRes = stmt.executeQuery(query);

                while (mRes.next()) {
                    Map<String, Object> mMap = new HashMap<>();

                    if (mRes.getString(1) != null) {
                        mMap.put("ID", mRes.getString(1).trim());
                    }

                    if (mRes.getString(2) != null) {
                        mMap.put("ORD_ID", mRes.getString(2).trim());
                    }

                    if (mRes.getString(3) != null) {
                        mMap.put("COM_ID", mRes.getString(3).trim());
                    }

                    if (mRes.getString(4) != null) {
                        mMap.put("COS_CENT", mRes.getString(4).trim());
                    }

                    if (mRes.getString(5) != null) {
                        mMap.put("DEP_NAME", mRes.getString(5).trim());
                    }

                    if (mRes.getString(6) != null) {
                        mMap.put("CRE_DATE", mRes.getString(6).trim());
                    }

                    if (mRes.getString(7) != null) {
                        mMap.put("MAT_TYPE", mRes.getString(7).trim());
                    }

                    if (mRes.getString(8) != null) {
                        mMap.put("FRM_WAHO", mRes.getString(8).trim());
                    }

                    if (mRes.getString(9) != null) {
                        mMap.put("TO_WAHO", mRes.getString(9).trim());
                    }

                    if (mRes.getString(10) != null) {
                        mMap.put("WAH_LOCA", mRes.getString(10).trim());
                    }

                    if (mRes.getString(11) != null) {
                        mMap.put("ORD_PURP", mRes.getString(11).trim());
                    }

                    if (mRes.getString(13) != null) {
                        mMap.put("ORD_REGB", mRes.getString(13).trim());
                    }

                    if (mRes.getString(16) != null) {
                        mMap.put("ORD_DPMH", mRes.getString(16).trim());
                    }

                    if (mRes.getString(18) != null) {
                        mMap.put("ORD_ISSB", mRes.getString(18).trim());
                    }

                    if (mRes.getString(25) != null) {

                        mMap.put("REG_FAC", mRes.getString(25).trim());
                    }

                    if (mRes.getString(26) != null) {

                        mMap.put("ITID", mRes.getString(26).trim());
                    }
                    if (mRes.getString(28) != null) {
                        mMap.put("ITM_ID", mRes.getString(28).trim());
                    }

                    if (mRes.getString(29) != null) {
                        mMap.put("ITM_DESC", mRes.getString(29).trim());
                    }
                    if (mRes.getString(30) != null) {
                        mMap.put("ITM_UNIT", mRes.getString(30).trim());
                    }

                    if (mRes.getString(31) != null) {
                        mMap.put("QTY_REQT", mRes.getString(31).trim());
                    }
                    if (mRes.getString(32) != null) {
                        mMap.put("QTY_ISSU", mRes.getString(32).trim());
                    }
                    if (mRes.getString(33) != null) {
                        mMap.put("ONH_STAT", mRes.getString(33).trim());
                    }

                    mJSonArr.put(mMap);

                }

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
        } finally {
            if (conn != null) {
                conn.close();
            }
        }

        return mJSonArr;

    }

    public static JSONArray getload1(String id, String Key, String cono, String divi) throws Exception {

        JSONArray mJSonArr = new JSONArray();
        Connection conn = ConnectDB2.ConnectionDB();
        String stste = "00";
        switch (Key) {
            case "S1":
                stste = "00";
                break;
            case "S2":
                stste = "01";
                break;
            case "S3":
                stste = "10";
                break;
            case "S4":
                stste = "11";
                break;

            default:
                stste = "XX";
        }

        try {
            if (conn != null) {

                Statement stmt = conn.createStatement();
                String query = "SELECT  ID, ORD_ID, COM_ID, COS_CENT, DEP_NAME, CRE_DATE, MAT_TYPE, FRM_WAHO, TO_WAHO, WAH_LOCA, ORD_PURP, ORD_REMAR, ORD_REGB, RQT_DATE, DPM_HEAD, ORD_DPMH, DPH_DATE, ORD_ISSB, ISB_DATE, ORD_STAT, RUID, MVX_ORDE, REG_CONO, REG_DIVI FROM  " + GBVAR.DBPRD + ".FAR_MTRREQ04\n"
                        + " WHERE ORD_ID = '" + id.trim() + "' \n"
                        + "AND REG_CONO != '00' AND REG_DIVI !='00' \n"
                        + " and  ORD_STAT = '" + stste + "' ";
                System.out.println("Selectall history\n" + query);
                ResultSet mRes = stmt.executeQuery(query);

                while (mRes.next()) {
                    Map<String, Object> mMap = new HashMap<>();

                    mMap.put("ID", mRes.getString(1).trim());

                    if (mRes.getString(2) != null) {
                        mMap.put("ORD_ID", mRes.getString(2).trim());
                    } else {
                        mMap.put("ORD_ID", "00000000");
                    }

                    mMap.put("COM_ID", mRes.getString(3).trim());
                    mMap.put("COS_CENT", mRes.getString(4).trim());
                    mMap.put("DEP_NAME", mRes.getString(5).trim());
                    mMap.put("CRE_DATE", mRes.getString(6).trim());
                    mMap.put("MAT_TYPE", mRes.getString(7).trim());
                    mMap.put("FRM_WAHO", mRes.getString(8).trim());
                    mMap.put("TO_WAHO", mRes.getString(9).trim());
                    mMap.put("WAH_LOCA", mRes.getString(10).trim());
                    mMap.put("ORD_PURP", mRes.getString(11).trim());
                    mMap.put("ORD_REGB", mRes.getString(13).trim());
                    mMap.put("RQT_DATE", mRes.getString(14).trim());
                    mMap.put("DPM_HEAD", mRes.getString(15).trim());
                    mMap.put("ORD_DPMH", mRes.getString(16).trim());
                    mMap.put("DPH_DATE", mRes.getString(17).trim());
                    mMap.put("ORD_ISSB", mRes.getString(18).trim());
                    mMap.put("ISB_DATE", mRes.getString(19).trim());
                    mMap.put("ORD_STAT", mRes.getString(20).trim());
                    mMap.put("RUID", mRes.getString(21).trim());

                    if (mRes.getString(22) != null) {
                        mMap.put("MVX_ORDE", mRes.getString(22).trim());
                    }

                    mJSonArr.put(mMap);

                }

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
        } finally {
            if (conn != null) {
                conn.close();
            }
        }

        return mJSonArr;

    }

    public static JSONArray getload2(String id, String cono, String divi) throws Exception {

        JSONArray mJSonArr = new JSONArray();
        Connection conn = ConnectDB2.ConnectionDB();

        try {
            if (conn != null) {

                Statement stmt = conn.createStatement();
                String query = " SELECT * FROM " + GBVAR.DBPRD + ".FAR_ITMTLB04\n"
                        + "    WHERE ORD_ID = '" + id.trim() + "' \n"
                        + "AND REG_CONO != '00' AND REG_DIVI !='00'";

                System.out.println("Selectall history5\n" + query);
                ResultSet mRes = stmt.executeQuery(query);

                while (mRes.next()) {
                    Map<String, Object> mMap = new HashMap<>();
                    if (mRes.getString(1) != null) {

                        mMap.put("ID", mRes.getString(1).trim());
                    }

                    if (mRes.getString(2) != null) {

                        mMap.put("ORD_ID", mRes.getString(2).trim());
                    }
//                    mMap.put("ORD_ID", mRes.getString(23).trim());

                    if (mRes.getString(3) != null) {
                        mMap.put("ITM_ID", mRes.getString(3).trim());
                    }

                    if (mRes.getString(4) != null) {
                        mMap.put("ITM_DESC", mRes.getString(4).trim());
                    }
                    if (mRes.getString(5) != null) {
                        mMap.put("ITM_UNIT", mRes.getString(5).trim());
                    }

                    if (mRes.getString(6) != null) {
                        mMap.put("QTY_REQT", mRes.getString(6).trim());
                    }
                    if (mRes.getString(7) != null) {
                        mMap.put("QTY_ISSU", mRes.getString(7).trim());
                    }

                    mJSonArr.put(mMap);

                }

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
        } finally {
            if (conn != null) {
                conn.close();
            }
        }

        return mJSonArr;

    }

    public static JSONArray getsignaturename(String cono, String divi, String orderid) throws Exception {

        JSONArray mJSonArr = new JSONArray();
        Connection conn = ConnectDB2.ConnectionDB();

        try {
            if (conn != null) {

                Statement stmt = conn.createStatement();
                String query = "SELECT ORD_REGB , ORD_DPMH  FROM  " + GBVAR.DBPRD + ".FAR_MTRREQ04\n"
                        + " WHERE ORD_ID  = '" + orderid + "'";
                System.out.println("getsignaturename\n" + query);
                ResultSet mRes = stmt.executeQuery(query);

                while (mRes.next()) {
                    Map<String, Object> mMap = new HashMap<>();
                    mMap.put("ORD_REGB", mRes.getString(1).trim());
                    mMap.put("ORD_DPMH", mRes.getString(2).trim());

//                    mMap.put("MMFUDS", mRes.getString(3).trim());
                    mJSonArr.put(mMap);

                }

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
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
        System.out.println(mJSonArr.toString());
        return mJSonArr;

    }

    public static JSONArray getHistoryitem(String id, String whs, String cono, String divi) throws Exception {

        JSONArray mJSonArr = new JSONArray();
        Connection conn = ConnectDB2.ConnectionDB();

        try {
            if (conn != null) {

                Statement stmt = conn.createStatement();
//                String query = "SELECT  * FROM  BRLDTA0100.FAR_ITMTLB03  where ORD_ID = '" + id + "'";
                String query = " \n"
                        + " SELECT  * \n"
                        + "FROM (SELECT  * FROM  " + GBVAR.DBPRD + ".FAR_ITMTLB04  where ORD_ID = '" + id + "' AND REG_CONO = '" + cono + "' AND REG_DIVI = '" + divi + "') AS A \n"
                        + "LEFT JOIN  \n"
                        + "(\n"
                        + "SELECT MLITNO, MLCONO ,SUM(CAST(MLSTQT AS double)-CAST(MLALQT AS double)) as ONHAND\n"
                        + "FROM M3FDBPRD.MITLOC \n"
                        + "WHERE  MLWHLO = '" + whs + "'\n"
                        + "AND MLSTAS = 2\n"
                        + "AND mlcono = '" + cono + "'\n"
                        + "GROUP  BY MLITNO,MLCONO\n"
                        + ") AS B \n"
                        + "ON a.ITM_ID = b.MLITNO";

                System.out.println("Selectall history1\n" + query);
                ResultSet mRes = stmt.executeQuery(query);

                while (mRes.next()) {
                    Map<String, Object> mMap = new HashMap<>();

                    if (mRes.getString(1) != null) {
                        mMap.put("ID", mRes.getString(1).trim());
                    }
                    if (mRes.getString(3) != null) {
                        mMap.put("ITM_ID", mRes.getString(3).trim());
                    }
                    if (mRes.getString(4) != null) {
                        mMap.put("ITM_DESC", mRes.getString(4).trim());
                    }
                    if (mRes.getString(5) != null) {
                        mMap.put("ITM_UNIT", mRes.getString(5).trim());
                    }
                    if (mRes.getString(6) != null) {
                        mMap.put("QTY_REQT", mRes.getString(6).trim());
                    }

                    if (mRes.getString(7) != null) {
                        mMap.put("QTY_ISSU", mRes.getString(7).trim());
                    }
                    if (mRes.getString(17) != null) {
                        mMap.put("ONHAND", mRes.getString(17).trim());
                    }
                    if (mRes.getString(8) != null) {
                        mMap.put("STATUS", mRes.getString(8).trim());
                    }
                    if (mRes.getString(9) != null) {
                        mMap.put("POS_STAT", mRes.getString(9).trim());
                    }
                    if (mRes.getString(10) != null) {
                        mMap.put("MVX_ORDE", mRes.getString(10).trim());
                    }

                    mJSonArr.put(mMap);

                }

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
        } finally {
            if (conn != null) {
                conn.close();
            }
        }

        return mJSonArr;

    }

    public static JSONArray getHistory(String cono, String divi) throws Exception {

        JSONArray mJSonArr = new JSONArray();
        Connection conn = ConnectDB2.ConnectionDB();

        try {
            if (conn != null) {

                Statement stmt = conn.createStatement();

//                String query = " 	SELECT  * FROM  BRLDTA0100.FAR_MTRREQ04 WHERE REG_CONO = '" + cono + "' AND REG_DIVI = '" + divi + "'  ORDER BY CAST(id AS int )  desc  ";
                String query = "SELECT  ord_id  , MVX_ORDE,\n"
                        + "CRE_DATE , ORD_REMAR, \n"
                        + "ORD_STAT , COS_CENT,\n"
                        + "DEP_NAME , MAT_TYPE,\n"
                        + "FRM_WAHO , TO_WAHO,\n"
                        + "ORD_REGB , ORD_DPMH,\n"
                        + "ORD_ISSB\n"
                        + "FROM  " + GBVAR.DBPRD + ".FAR_MTRREQ04 WHERE COM_ID = '" + cono + "' ORDER BY ord_id DESC  ";

                System.out.println("Selectall history2\n" + query);
                ResultSet mRes = stmt.executeQuery(query);

                while (mRes.next()) {
                    Map<String, Object> mMap = new HashMap<>();

                    if (mRes.getString(1) != null) {
                        mMap.put("ORD_ID", mRes.getString(1).trim());
                    }
                    if (mRes.getString(2) != null) {
                        mMap.put("MVX_ORDE", mRes.getString(2).trim());
                    }
                    if (mRes.getString(3) != null) {
                        mMap.put("CRE_DATE", mRes.getString(3).trim());
                    }
                    if (mRes.getString(4) != null) {
                        mMap.put("ORD_REMAR", mRes.getString(4).trim());
                    }
                    if (mRes.getString(5) != null) {
                        mMap.put("ORD_STAT", mRes.getString(5).trim());
                    }
                    if (mRes.getString(6) != null) {
                        mMap.put("COS_CENT", mRes.getString(6).trim());
                    }
                    if (mRes.getString(7) != null) {
                        mMap.put("DEP_NAME", mRes.getString(7).trim());
                    }
                    if (mRes.getString(8) != null) {
                        mMap.put("MAT_TYPE", mRes.getString(8).trim());
                    }
                    if (mRes.getString(9) != null) {
                        mMap.put("FRM_WAHO", mRes.getString(9).trim());
                    }
                    if (mRes.getString(10) != null) {
                        mMap.put("TO_WAHO", mRes.getString(10).trim());
                    }
                    if (mRes.getString(11) != null) {
                        mMap.put("ORD_REGB", mRes.getString(11).trim());
                    }
                    if (mRes.getString(12) != null) {
                        mMap.put("ORD_DPMH", mRes.getString(12).trim());
                    }
                    if (mRes.getString(13) != null) {
                        mMap.put("ORD_ISSB", mRes.getString(13).trim());
                    }

//                    if (mRes.getString(2) != null) {
//                        mMap.put("ORD_ID", mRes.getString(2).trim());
//                    }
//                    if (mRes.getString(3) != null) {
//                        mMap.put("COM_ID", mRes.getString(3).trim());
//                    }
//                    mMap.put("ID", mRes.getString(1).trim());
//
//                    if (mRes.getString(4) != null) {
//                        mMap.put("COS_CENT", mRes.getString(4).trim());
//                    }
//                    if (mRes.getString(5) != null) {
//                        mMap.put("DEP_NAME", mRes.getString(5).trim());
//                    }
//                    if (mRes.getString(6) != null) {
//                        mMap.put("CRE_DATE", mRes.getString(6).trim());
//                    }
//                    if (mRes.getString(7) != null) {
//                        mMap.put("MAT_TYPE", mRes.getString(7).trim());
//                    }
//                    if (mRes.getString(8) != null) {
//                        mMap.put("FRM_WAHO", mRes.getString(8).trim());
//                    }
//                    if (mRes.getString(9) != null) {
//                        mMap.put("TO_WAHO", mRes.getString(9).trim());
//                    }
//                    if (mRes.getString(10) != null) {
//                        mMap.put("WAH_LOCA", mRes.getString(10).trim());
//                    }
//                    if (mRes.getString(11) != null) {
//                        mMap.put("ORD_PURP", mRes.getString(11).trim());
//                    }
//                    if (mRes.getString(12) != null) {
//                        mMap.put("ORD_REMAR", mRes.getString(12).trim());
//                    }
//                    if (mRes.getString(13) != null) {
//                        mMap.put("ORD_REGB", mRes.getString(13).trim());
//                    }
//                    if (mRes.getString(14) != null) {
//                        mMap.put("RQT_DATE", mRes.getString(14).trim());
//                    }
//                    if (mRes.getString(15) != null) {
//                        mMap.put("DPM_HEAD", mRes.getString(15).trim());
//                    }
//                    if (mRes.getString(16) != null) {
//                        mMap.put("ORD_DPMH", mRes.getString(16).trim());
//                    }
//                    if (mRes.getString(17) != null) {
//                        mMap.put("DPH_DATE", mRes.getString(17).trim());
//                    }
//                    if (mRes.getString(18) != null) {
//                        mMap.put("ORD_ISSB", mRes.getString(18).trim());
//                    }
//                    if (mRes.getString(19) != null) {
//                        mMap.put("ISB_DATE", mRes.getString(19).trim());
//                    }
//                    if (mRes.getString(20) != null) {
//                        mMap.put("ORD_STAT", mRes.getString(20).trim());
//                    }
//                    if (mRes.getString(22) != null) {
//                        mMap.put("MVX_ORDE", mRes.getString(22).trim());
//                    }
                    mJSonArr.put(mMap);

                }

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
        } finally {
            if (conn != null) {
                conn.close();
            }
        }

        return mJSonArr;

    }

    public static JSONArray getHistoryspfarm(String cono, String divi) throws Exception {

        JSONArray mJSonArr = new JSONArray();
        Connection conn = ConnectDB2.ConnectionDB();

        try {
            if (conn != null) {

                Statement stmt = conn.createStatement();
//                String query = "   SELECT * FROM \n"
//                        + "                       (SELECT  * FROM  BRLDTA0100.FAR_MTRREQ03   ) AS a \n"
//                        + "            			LEFT  JOIN  \n"
//                        + "                        (SELECT * FROM BRLDTA0100.FAR_ITMTLB03 ) AS b\n"
//                        + "                      	ON a.ORD_ID = b.ORD_ID";

                String query = " 	SELECT  ID, ORD_ID, COM_ID, COS_CENT, DEP_NAME, CRE_DATE, MAT_TYPE, FRM_WAHO, TO_WAHO, WAH_LOCA, ORD_PURP, ORD_REMAR, ORD_REGB, RQT_DATE, DPM_HEAD, ORD_DPMH, DPH_DATE, ORD_ISSB, ISB_DATE, ORD_STAT, RUID, MVX_ORDE, REG_CONO, REG_DIVI FROM  " + GBVAR.DBPRD + ".FAR_MTRREQ04 WHERE REG_CONO = '" + cono + "' AND REG_FAC IN ('1D1','1B1')    AND ORD_STAT = '22' AND REG_DIVI = '" + divi + "'  ORDER BY CAST(id AS int )  desc  ";
                System.out.println("Selectall history23\n" + query);
                ResultSet mRes = stmt.executeQuery(query);

                while (mRes.next()) {
                    Map<String, Object> mMap = new HashMap<>();

                    if (mRes.getString(2) != null) {
                        mMap.put("ORD_ID", mRes.getString(2).trim());
                    }
                    if (mRes.getString(3) != null) {
                        mMap.put("COM_ID", mRes.getString(3).trim());
                    }
                    mMap.put("ID", mRes.getString(1).trim());

                    if (mRes.getString(4) != null) {
                        mMap.put("COS_CENT", mRes.getString(4).trim());
                    }
                    if (mRes.getString(5) != null) {
                        mMap.put("DEP_NAME", mRes.getString(5).trim());
                    }
                    if (mRes.getString(6) != null) {
                        mMap.put("CRE_DATE", mRes.getString(6).trim());
                    }
                    if (mRes.getString(7) != null) {
                        mMap.put("MAT_TYPE", mRes.getString(7).trim());
                    }
                    if (mRes.getString(8) != null) {
                        mMap.put("FRM_WAHO", mRes.getString(8).trim());
                    }
                    if (mRes.getString(9) != null) {
                        mMap.put("TO_WAHO", mRes.getString(9).trim());
                    }
                    if (mRes.getString(10) != null) {
                        mMap.put("WAH_LOCA", mRes.getString(10).trim());
                    }
                    if (mRes.getString(11) != null) {
                        mMap.put("ORD_PURP", mRes.getString(11).trim());
                    }
                    if (mRes.getString(12) != null) {
                        mMap.put("ORD_REMAR", mRes.getString(12).trim());
                    }
                    if (mRes.getString(13) != null) {
                        mMap.put("ORD_REGB", mRes.getString(13).trim());
                    }
                    if (mRes.getString(14) != null) {
                        mMap.put("RQT_DATE", mRes.getString(14).trim());
                    }
                    if (mRes.getString(15) != null) {
                        mMap.put("DPM_HEAD", mRes.getString(15).trim());
                    }
                    if (mRes.getString(16) != null) {
                        mMap.put("ORD_DPMH", mRes.getString(16).trim());
                    }
                    if (mRes.getString(17) != null) {
                        mMap.put("DPH_DATE", mRes.getString(17).trim());
                    }
                    if (mRes.getString(18) != null) {
                        mMap.put("ORD_ISSB", mRes.getString(18).trim());
                    }
                    if (mRes.getString(19) != null) {
                        mMap.put("ISB_DATE", mRes.getString(19).trim());
                    }
                    if (mRes.getString(20) != null) {
                        mMap.put("ORD_STAT", mRes.getString(20).trim());
                    }
                    if (mRes.getString(22) != null) {
                        mMap.put("MVX_ORDE", mRes.getString(22).trim());
                    }

                    mJSonArr.put(mMap);

                }

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
        } finally {
            if (conn != null) {
                conn.close();
            }
        }

        return mJSonArr;

    }

    public static JSONArray getHistorysp(String cono, String divi) throws Exception {

        JSONArray mJSonArr = new JSONArray();
        Connection conn = ConnectDB2.ConnectionDB();

        try {
            if (conn != null) {

                Statement stmt = conn.createStatement();
//                String query = "   SELECT * FROM \n"
//                        + "                       (SELECT  * FROM  BRLDTA0100.FAR_MTRREQ03   ) AS a \n"
//                        + "            			LEFT  JOIN  \n"
//                        + "                        (SELECT * FROM BRLDTA0100.FAR_ITMTLB03 ) AS b\n"
//                        + "                      	ON a.ORD_ID = b.ORD_ID";

                String query = " 	SELECT  ID, ORD_ID, COM_ID, COS_CENT, DEP_NAME, CRE_DATE, MAT_TYPE, FRM_WAHO, TO_WAHO, WAH_LOCA, ORD_PURP, ORD_REMAR, ORD_REGB, RQT_DATE, DPM_HEAD, ORD_DPMH, DPH_DATE, ORD_ISSB, ISB_DATE, ORD_STAT, RUID, MVX_ORDE, REG_CONO, REG_DIVI FROM  " + GBVAR.DBPRD + ".FAR_MTRREQ04 WHERE REG_CONO = '" + cono + "'  AND ( \n"
                        + "                (REG_FAC IN ('1B1', '1D1') AND MAT_TYPE <> '71') \n"
                        + "              OR (REG_FAC NOT IN ('1B1', '1D1') AND MAT_TYPE = '71') \n"
                        + "               )  AND ORD_STAT = '22' AND REG_DIVI = '" + divi + "'  ORDER BY CAST(id AS int )  desc  ";
                System.out.println("Selectall history23\n" + query);
                ResultSet mRes = stmt.executeQuery(query);

                while (mRes.next()) {
                    Map<String, Object> mMap = new HashMap<>();

                    if (mRes.getString(2) != null) {
                        mMap.put("ORD_ID", mRes.getString(2).trim());
                    }
                    if (mRes.getString(3) != null) {
                        mMap.put("COM_ID", mRes.getString(3).trim());
                    }
                    mMap.put("ID", mRes.getString(1).trim());

                    if (mRes.getString(4) != null) {
                        mMap.put("COS_CENT", mRes.getString(4).trim());
                    }
                    if (mRes.getString(5) != null) {
                        mMap.put("DEP_NAME", mRes.getString(5).trim());
                    }
                    if (mRes.getString(6) != null) {
                        mMap.put("CRE_DATE", mRes.getString(6).trim());
                    }
                    if (mRes.getString(7) != null) {
                        mMap.put("MAT_TYPE", mRes.getString(7).trim());
                    }
                    if (mRes.getString(8) != null) {
                        mMap.put("FRM_WAHO", mRes.getString(8).trim());
                    }
                    if (mRes.getString(9) != null) {
                        mMap.put("TO_WAHO", mRes.getString(9).trim());
                    }
                    if (mRes.getString(10) != null) {
                        mMap.put("WAH_LOCA", mRes.getString(10).trim());
                    }
                    if (mRes.getString(11) != null) {
                        mMap.put("ORD_PURP", mRes.getString(11).trim());
                    }
                    if (mRes.getString(12) != null) {
                        mMap.put("ORD_REMAR", mRes.getString(12).trim());
                    }
                    if (mRes.getString(13) != null) {
                        mMap.put("ORD_REGB", mRes.getString(13).trim());
                    }
                    if (mRes.getString(14) != null) {
                        mMap.put("RQT_DATE", mRes.getString(14).trim());
                    }
                    if (mRes.getString(15) != null) {
                        mMap.put("DPM_HEAD", mRes.getString(15).trim());
                    }
                    if (mRes.getString(16) != null) {
                        mMap.put("ORD_DPMH", mRes.getString(16).trim());
                    }
                    if (mRes.getString(17) != null) {
                        mMap.put("DPH_DATE", mRes.getString(17).trim());
                    }
                    if (mRes.getString(18) != null) {
                        mMap.put("ORD_ISSB", mRes.getString(18).trim());
                    }
                    if (mRes.getString(19) != null) {
                        mMap.put("ISB_DATE", mRes.getString(19).trim());
                    }
                    if (mRes.getString(20) != null) {
                        mMap.put("ORD_STAT", mRes.getString(20).trim());
                    }
                    if (mRes.getString(22) != null) {
                        mMap.put("MVX_ORDE", mRes.getString(22).trim());
                    }

                    mJSonArr.put(mMap);

                }

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
        } finally {
            if (conn != null) {
                conn.close();
            }
        }

        return mJSonArr;

    }

    public static JSONArray getHistorybystatefarm(String cono, String divi) throws Exception {

        JSONArray mJSonArr = new JSONArray();
        Connection conn = ConnectDB2.ConnectionDB();

        try {
            if (conn != null) {

                Statement stmt = conn.createStatement();

                String query = "SELECT ID, ORD_ID, COM_ID, COS_CENT, DEP_NAME, CRE_DATE, MAT_TYPE, FRM_WAHO, TO_WAHO, WAH_LOCA, ORD_PURP, ORD_REMAR, ORD_REGB, RQT_DATE, DPM_HEAD, ORD_DPMH, DPH_DATE, ORD_ISSB, ISB_DATE, ORD_STAT, RUID, MVX_ORDE, REG_CONO, REG_DIVI FROM  " + GBVAR.DBPRD + ".FAR_MTRREQ04 WHERE ORD_STAT IN  ('11','21')   AND REG_FAC IN ('1B1', '1D1')      AND REG_CONO = '" + cono + "' AND REG_DIVI = '" + divi + "' AND ISB_DATE = '-'   ORDER BY CAST(id AS int )  desc  ";
                System.out.println("Selectall history3\n" + query);
                ResultSet mRes = stmt.executeQuery(query);

                while (mRes.next()) {
                    Map<String, Object> mMap = new HashMap<>();

                    if (mRes.getString(2) != null) {
                        mMap.put("ORD_ID", mRes.getString(2).trim());
                    }
                    if (mRes.getString(3) != null) {
                        mMap.put("COM_ID", mRes.getString(3).trim());
                    }
                    mMap.put("ID", mRes.getString(1).trim());

                    if (mRes.getString(4) != null) {
                        mMap.put("COS_CENT", mRes.getString(4).trim());
                    }
                    if (mRes.getString(5) != null) {
                        mMap.put("DEP_NAME", mRes.getString(5).trim());
                    }
                    if (mRes.getString(6) != null) {
                        mMap.put("CRE_DATE", mRes.getString(6).trim());
                    }
                    if (mRes.getString(7) != null) {
                        mMap.put("MAT_TYPE", mRes.getString(7).trim());
                    }
                    if (mRes.getString(8) != null) {
                        mMap.put("FRM_WAHO", mRes.getString(8).trim());
                    }
                    if (mRes.getString(9) != null) {
                        mMap.put("TO_WAHO", mRes.getString(9).trim());
                    }
                    if (mRes.getString(10) != null) {
                        mMap.put("WAH_LOCA", mRes.getString(10).trim());
                    }
                    if (mRes.getString(11) != null) {
                        mMap.put("ORD_PURP", mRes.getString(11).trim());
                    }
                    if (mRes.getString(13) != null) {
                        mMap.put("ORD_REGB", mRes.getString(13).trim());
                    }
                    if (mRes.getString(14) != null) {
                        mMap.put("RQT_DATE", mRes.getString(14).trim());
                    }
                    if (mRes.getString(15) != null) {
                        mMap.put("DPM_HEAD", mRes.getString(15).trim());
                    }
                    if (mRes.getString(16) != null) {
                        mMap.put("ORD_DPMH", mRes.getString(16).trim());
                    }
                    if (mRes.getString(17) != null) {
                        mMap.put("DPH_DATE", mRes.getString(17).trim());
                    }
                    if (mRes.getString(18) != null) {
                        mMap.put("ORD_ISSB", mRes.getString(18).trim());
                    }
                    if (mRes.getString(19) != null) {
                        mMap.put("ISB_DATE", mRes.getString(19).trim());
                    }
                    if (mRes.getString(20) != null) {
                        mMap.put("ORD_STAT", mRes.getString(20).trim());
                    }
                    if (mRes.getString(22) != null) {
                        mMap.put("MVX_ORDE", mRes.getString(22).trim());
                    }

                    mJSonArr.put(mMap);

                }

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
        } finally {
            if (conn != null) {
                conn.close();
            }
        }

        return mJSonArr;

    }

    public static JSONArray getHistorybystate(String cono, String divi) throws Exception {

        JSONArray mJSonArr = new JSONArray();
        Connection conn = ConnectDB2.ConnectionDB();

        try {
            if (conn != null) {

                Statement stmt = conn.createStatement();

                String query = "SELECT  ID, ORD_ID, COM_ID, COS_CENT, DEP_NAME, CRE_DATE, MAT_TYPE, FRM_WAHO, TO_WAHO, WAH_LOCA, ORD_PURP, ORD_REMAR, ORD_REGB, RQT_DATE, DPM_HEAD, ORD_DPMH, DPH_DATE, ORD_ISSB, ISB_DATE, ORD_STAT, RUID, MVX_ORDE, REG_CONO, REG_DIVI FROM  " + GBVAR.DBPRD + ".FAR_MTRREQ04 WHERE ORD_STAT IN  ('11','21')   AND REG_CONO = '" + cono + "' AND REG_DIVI = '" + divi + "'      AND ( \n"
                        + "                (REG_FAC NOT IN ('1B1', '1D1') ) \n"
                        + "               AND (REG_FAC NOT IN ('1B1', '1D1') ) \n"
                        + "               )AND ISB_DATE = '-'   ORDER BY CAST(id AS int )  desc  ";
                System.out.println("Selectall history3\n" + query);
                ResultSet mRes = stmt.executeQuery(query);

                while (mRes.next()) {
                    Map<String, Object> mMap = new HashMap<>();

                    if (mRes.getString(2) != null) {
                        mMap.put("ORD_ID", mRes.getString(2).trim());
                    }
                    if (mRes.getString(3) != null) {
                        mMap.put("COM_ID", mRes.getString(3).trim());
                    }
                    mMap.put("ID", mRes.getString(1).trim());

                    if (mRes.getString(4) != null) {
                        mMap.put("COS_CENT", mRes.getString(4).trim());
                    }
                    if (mRes.getString(5) != null) {
                        mMap.put("DEP_NAME", mRes.getString(5).trim());
                    }
                    if (mRes.getString(6) != null) {
                        mMap.put("CRE_DATE", mRes.getString(6).trim());
                    }
                    if (mRes.getString(7) != null) {
                        mMap.put("MAT_TYPE", mRes.getString(7).trim());
                    }
                    if (mRes.getString(8) != null) {
                        mMap.put("FRM_WAHO", mRes.getString(8).trim());
                    }
                    if (mRes.getString(9) != null) {
                        mMap.put("TO_WAHO", mRes.getString(9).trim());
                    }
                    if (mRes.getString(10) != null) {
                        mMap.put("WAH_LOCA", mRes.getString(10).trim());
                    }
                    if (mRes.getString(11) != null) {
                        mMap.put("ORD_PURP", mRes.getString(11).trim());
                    }
                    if (mRes.getString(13) != null) {
                        mMap.put("ORD_REGB", mRes.getString(13).trim());
                    }
                    if (mRes.getString(14) != null) {
                        mMap.put("RQT_DATE", mRes.getString(14).trim());
                    }
                    if (mRes.getString(15) != null) {
                        mMap.put("DPM_HEAD", mRes.getString(15).trim());
                    }
                    if (mRes.getString(16) != null) {
                        mMap.put("ORD_DPMH", mRes.getString(16).trim());
                    }
                    if (mRes.getString(17) != null) {
                        mMap.put("DPH_DATE", mRes.getString(17).trim());
                    }
                    if (mRes.getString(18) != null) {
                        mMap.put("ORD_ISSB", mRes.getString(18).trim());
                    }
                    if (mRes.getString(19) != null) {
                        mMap.put("ISB_DATE", mRes.getString(19).trim());
                    }
                    if (mRes.getString(20) != null) {
                        mMap.put("ORD_STAT", mRes.getString(20).trim());
                    }
                    if (mRes.getString(22) != null) {
                        mMap.put("MVX_ORDE", mRes.getString(22).trim());
                    }

                    mJSonArr.put(mMap);

                }

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
        } finally {
            if (conn != null) {
                conn.close();
            }
        }

        return mJSonArr;

    }

    public static String getitemID() throws Exception {

        String orderID = "";
        JSONArray mJSonArr = new JSONArray();
        Connection conn = ConnectDB2.ConnectionDB();

        try {
            if (conn != null) {

                Statement stmt = conn.createStatement();
                String query = "SELECT ID FROM " + GBVAR.DBPRD + ".FAR_ITMTLB04 Order by ID  desc LIMIT 1 ";
                System.out.println("SelectitemID\n" + query);
                ResultSet mRes = stmt.executeQuery(query);

                System.out.println(mRes);
                while (mRes.next()) {
                    Map<String, Object> mMap = new HashMap<>();

                    mMap.put("ID", mRes.getString(1).trim());

                    mJSonArr.put(mMap);

                    System.out.println("Result Value : ");
                    System.out.println(mJSonArr);

                    JSONObject jsonObject = mJSonArr.getJSONObject(0);
                    orderID = jsonObject.getString("ID");

                    System.out.println("Result Value : ");
                    System.out.println(orderID);

                }

            } else {
                System.out.println("Server can't connect.");
            }

        } catch (SQLException sqle) {
            throw sqle;
        } catch (JSONException e) {
            if (conn != null) {
                conn.close();
            }
            throw e;
        } finally {
            if (conn != null) {
                conn.close();
            }
        }

        return orderID;

    }

    public static String getID() throws Exception {

        String orderID = "";
        JSONArray mJSonArr = new JSONArray();
        Connection conn = ConnectDB2.ConnectionDB();

        try {
            if (conn != null) {

                Statement stmt = conn.createStatement();
                String query = "SELECT ID FROM " + GBVAR.DBPRD + ".FAR_MTRREQ04 Order by RUID  desc LIMIT 1 ";
                System.out.println("SelectOrderID\n" + query);
                ResultSet mRes = stmt.executeQuery(query);

                System.out.println(mRes);
                while (mRes.next()) {
                    Map<String, Object> mMap = new HashMap<>();

                    mMap.put("ID", mRes.getString(1).trim());

                    mJSonArr.put(mMap);

                    System.out.println("Result Value : ");
                    System.out.println(mJSonArr);

                    JSONObject jsonObject = mJSonArr.getJSONObject(0);
                    orderID = jsonObject.getString("ID");

                    System.out.println("Result Value : ");
                    System.out.println(orderID);

                }

            } else {
                System.out.println("Server can't connect.");
            }

        } catch (SQLException sqle) {
            throw sqle;
        } catch (JSONException e) {
            if (conn != null) {
                conn.close();
            }
            throw e;
        } finally {
            if (conn != null) {
                conn.close();
            }
        }

        return orderID;

    }

    public static String getOrderID() throws Exception {

        String orderID = "";
        JSONArray mJSonArr = new JSONArray();
        Connection conn = ConnectDB2.ConnectionDB();

        try {
            if (conn != null) {

                Statement stmt = conn.createStatement();
                String query = "SELECT ORD_ID FROM " + GBVAR.DBPRD + ".FAR_MTRREQ04 Order by RUID Desc limit 1 ";
                System.out.println("SelectOrderID\n" + query);
                ResultSet mRes = stmt.executeQuery(query);

                System.out.println(mRes);
                while (mRes.next()) {
                    Map<String, Object> mMap = new HashMap<>();

                    mMap.put("ORD_ID", mRes.getString(1).trim());

                    mJSonArr.put(mMap);

                    System.out.println("Result Value : ");
                    System.out.println(mJSonArr);

                    JSONObject jsonObject = mJSonArr.getJSONObject(0);
                    orderID = jsonObject.getString("ORD_ID");

                    System.out.println("Result Value : ");
                    System.out.println(orderID);

                }

            } else {
                System.out.println("Server can't connect.");
            }

        } catch (SQLException sqle) {
            throw sqle;
        } catch (JSONException e) {
            if (conn != null) {
                conn.close();
            }
            throw e;
        } finally {
            if (conn != null) {
                conn.close();
            }
        }

        return orderID;

    }

    public static JSONArray getDepthead() throws Exception {

        JSONArray mJSonArr = new JSONArray();
        Connection conn = ConnectDB2.ConnectionDB();

        try {
            if (conn != null) {

                Statement stmt = conn.createStatement();
                String query = "SELECT ROW_NUMBER() OVER(ORDER BY CTL_UID) AS ID, UPPER(TRIM(CTL_UID)) AS US_LOGIN ,CTL_UID,TRIM(ST_EPNM)||' '||TRIM(ST_ENAME)||' '||TRIM(ST_ELNAME)AS fullname\n"
                        + "		 FROM BRLDTA0100.APPCTL1 a, BRLDTA0100.STAFFLIST b \n"
                        + "		 WHERE CTL_REM = 'AP'\n"
                        + "		 AND b.ST_N6L3 = a.CTL_UID\n"
                        + "		 AND b.ST_STS = '20' AND CTL_UID != '-' ";
                System.out.println("SelectDeptHead\n" + query);
                ResultSet mRes = stmt.executeQuery(query);

                while (mRes.next()) {
                    Map<String, Object> mMap = new HashMap<>();
                    mMap.put("ID", mRes.getString(1).trim());
                    mMap.put("US_LOGIN", mRes.getString(2).trim());
                    mMap.put("CTL_UID", mRes.getString(3).trim());
                    mMap.put("fullname", mRes.getString(4).trim());
                    mJSonArr.put(mMap);

                }

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
        } finally {
            if (conn != null) {
                conn.close();
            }
        }

        return mJSonArr;

    }

    public static JSONArray getSignature(String cono, String divi, String prno) throws Exception {

        JSONArray mJSonArr = new JSONArray();
        Connection conn = ConnectDB2.ConnectionDB();

        System.out.println("xoxoxoxoxxoo");
        System.out.println(prno);

        try {
            if (conn != null) {

                Statement stmt = conn.createStatement();
                String query = "SELECT ST_SIGN \n"
                        + "						FROM BRLDTA0100.STAFFLIST \n"
                        + "						WHERE ST_N6L3 =  '" + prno + "'\n"
                        + "						AND ST_CONO != '99'\n"
                        + "						AND ST_SIGN IS NOT NULL\n"
                        + "						AND ST_SIGN != ''";
                System.out.println("getItemcode\n" + query);
                ResultSet mRes = stmt.executeQuery(query);

                while (mRes.next()) {
                    Map<String, Object> mMap = new HashMap<>();
                    mMap.put("ST_SIGN", mRes.getString(1).trim());
//                    mMap.put("MMPUUN", mRes.getString(2).trim());
//                    mMap.put("MMFUDS", mRes.getString(3).trim());

                    mJSonArr.put(mMap);

                }

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
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
        System.out.println(mJSonArr.toString());
        return mJSonArr;

    }

    public static JSONArray getCostcenter(String department, String cono, String divi) throws Exception {

        JSONArray mJSonArr = new JSONArray();
        Connection conn = ConnectDB2.ConnectionDB();

        try {
            if (conn != null) {

                Statement stmt = conn.createStatement();
//                String query = "SELECT  S2STID ,ROW_NUMBER() OVER(ORDER BY S2AITM) AS ID, TRIM(S2AITM) AS S2AITM, S2TX15, TRIM(S2AITM) || ' : ' || TRIM(S2TX15) AS COSTCENTER\n"
//                        + "						FROM M3FDBPRD.FSTLIN\n"
//                        + "						WHERE S2CONO = '" + cono + "'\n"
//                        + "						AND S2DIVI = '" + divi + "'\n"
//                        + "						ORDER BY S2AITM";

                String query = "SELECT S2STID ,ROW_NUMBER() OVER(ORDER BY S2AITM) AS ID, TRIM(S2AITM) AS S2AITM, S2TX15,TRIM(S2STID) AS S2STID, SUBSTR(EATX40,38,3) AS EATX40, TRIM(S2AITM) || ' : ' || TRIM(S2TX15) || ' : ' || SUBSTR(EATX40,38,3) AS COSTCENTER\n"
                        + "FROM M3FDBPRD.FSTLIN a, M3FDBPRD.FCHACC b\n"
                        + "WHERE S2CONO = '" + cono + "'\n"
                        + "AND S2SLVL = '1'\n"
                        + "AND b.EACONO = a.S2CONO\n"
                        + "AND b.EADIVI = a.S2DIVI\n"
                        + "AND b.EAAITP = '2'\n"
                        + "AND b.EALCCD = '0' -- 1 = block, 0 = unblock\n"
                        + "AND b.EAAITM = a.S2AITM\n"
                        + "AND S2STID IN (SELECT TRIM(S2AITM)\n"
                        + "FROM M3FDBPRD.FSTLIN a, M3FDBPRD.FSTDEF b\n"
                        + "WHERE S2CONO =  '" + cono + "'\n"
                        + "AND S2SLVL = '2'\n"
                        + "AND S1CONO = a.S2CONO\n"
                        + "AND S1DIVI = a.S2DIVI\n"
                        + "AND S1STID = a.S2AITM\n"
                        + "ORDER BY S2AITM)\n"
                        + "ORDER BY S2AITM";
                System.out.println("getItemcode\n" + query);
                ResultSet mRes = stmt.executeQuery(query);

                while (mRes.next()) {
                    Map<String, Object> mMap = new HashMap<>();
                    mMap.put("S2AITM", mRes.getString(3).trim());
                    mMap.put("S2TX15", mRes.getString(4).trim());
                    mMap.put("COSTCENTER", mRes.getString(6).trim());

                    mJSonArr.put(mMap);

                }

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
        System.out.println(mJSonArr.toString());
        return mJSonArr;

    }

    public static JSONArray getItemcodedown(String order_id) throws Exception {

        JSONArray mJSonArr = new JSONArray();
        Connection conn = ConnectDB2.ConnectionDB();

        try {
            if (conn != null) {

                Statement stmt = conn.createStatement();

                String query = "SELECT  * \n"
                        + "FROM \n"
                        + "" + GBVAR.DBPRD + ".FAR_ITMTLB04 fi \n"
                        + "WHERE ORD_ID  = '" + order_id + "'";

                System.out.println("getItemcodedown\n" + query);
                ResultSet mRes = stmt.executeQuery(query);

                while (mRes.next()) {
                    Map<String, Object> mMap = new HashMap<>();

                    if (mRes.getString(11) != null) {
                        mMap.put("REG_CONO", mRes.getString(11).trim());
                    }
                    if (mRes.getString(3) != null) {
                        mMap.put("ITM_ID", mRes.getString(3).trim());
                    }
                    if (mRes.getString(4) != null) {
                        mMap.put("ITM_DESC", mRes.getString(4).trim());
                    }
                    if (mRes.getString(5) != null) {
                        mMap.put("ITM_UNIT", mRes.getString(5).trim());
                    }
                    if (mRes.getString(6) != null) {
                        mMap.put("QTY_REQT", mRes.getString(6).trim());
                    }

                    mJSonArr.put(mMap);

                }

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
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
        System.out.println(mJSonArr.toString());
        return mJSonArr;

    }

    public static JSONArray getItemcode(String warehouse, String check, String cono) throws Exception {

        JSONArray mJSonArr = new JSONArray();
        Connection conn = ConnectDB2.ConnectionDB();
        System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaa");
        System.out.println(check);
        int num = 0;
        if (check.equalsIgnoreCase("true")) {
            num = -1;
        } else {
            num = 0;
        }

        try {
            if (conn != null) {

                Statement stmt = conn.createStatement();
//                String query = " SELECT DISTINCT  mmitno ,MMPUUN,MMFUDS,mborty,Trim(mmitno) ||':'||Trim(MMFUDS)||':'|| Trim(MMPUUN) AS fullitem\n"
//                        + "							 FROM M3FDBPRD.MITMAS a,M3FDBPRD.MITBAL b\n"
//                        + "							 WHERE mmcono = '10'\n"
//                        + "							 AND mborty = '"+warehouse+"'\n"
//            						
//                        + "                                                        Limit 50";
//                System.out.println("getItemcode\n" + query);
//                ResultSet mRes = stmt.executeQuery(query);
//
//                while (mRes.next()) {
//                    Map<String, Object> mMap = new HashMap<>();
//                    mMap.put("mmitno", mRes.getString(1).trim());
//                    mMap.put("MMPUUN", mRes.getString(2).trim());
//                    mMap.put("MMFUDS", mRes.getString(3).trim());
//                    mMap.put("fullitem", mRes.getString(5).trim());
//
//                    mJSonArr.put(mMap);
//
//                }

//                String query = "  SELECT MMCONO, TRIM(MMITNO) AS MMITNO, TRIM(MMITDS) AS MMITDS, TRIM(MMITNO) || ' : ' || TRIM(MMITDS) AS ITEM, TRIM(MMFUDS) AS MMFUDS, MMPUUN AS MMUNMS, MMSUNO, TRIM(SASUNM) AS SASUNM, TRIM(MMSUNO) || ' : ' || TRIM(SASUNM) AS SUPPLIER, MMPUPR, MMVTCP, TRIM(MMCUCD) AS MMCUCD, TRIM(MBORTY) AS MBORTY \n"
//                        + "FROM M3FDBPRD.MITMAS a, M3FDBPRD.MITBAL b, M3FDBPRD.CIDADR c  \n"
//                        + "WHERE a.MMCONO = '10'  \n"
//                        + "AND a.MMSTAT = '20'  \n"
//                        + "AND a.MMMABU = '2'  \n"
//                        + "AND a.MMCUCD <> '' \n"
//                        + "AND a.MMPUPR > 0  \n"
//                        + "AND a.MMITTY NOT IN ('SP','OH','FA','') \n"
//                        + "--AND MMITNO LIKE 'BU%'\n"
//                        + "AND b.MBCONO = a.MMCONO  \n"
//                        + "AND b.MBITNO = a.MMITNO \n"
//                        + "AND b.MBWHLO = '" + warehouse + "'\n"
//                        + "AND b.MBPUIT = '2'\n"
//                        + "AND c.SACONO = a.MMCONO \n"
//                        + "AND c.SASUNO = a.MMSUNO  \n"
//                        +"AND a.MMITNO  LIKE ('IO%') \n" 
//                        +"OR a.MMITNO  LIKE ('TD%') \n" 
//                        +"OR a.MMITNO  LIKE ('RM%') \n" 
//                        +"OR a.MMITNO  LIKE ('HI%') \n" 
//                        + "AND c.SAADID = 'ADDR'";
                String query = "SELECT MMCONO, TRIM(MMITNO) AS MMITNO, TRIM(MMITDS) AS MMITDS, TRIM(MMITNO) || ' : ' || TRIM(MMITDS) AS ITEM, TRIM(MMFUDS) AS MMFUDS, MMPUUN AS MMUNMS, MMSUNO, TRIM(SASUNM) AS SASUNM, TRIM(MMSUNO) || ' : ' || TRIM(SASUNM) AS SUPPLIER, MMPUPR, MMVTCP, TRIM(MMCUCD) AS MMCUCD, TRIM(MBORTY) AS MBORTY \n"
                        + " FROM \n"
                        + "(\n"
                        + " SELECT * FROM M3FDBPRD.MITMAS a\n"
                        + "  WHERE a.MMCONO = '" + cono + "'  \n"
                        + "AND a.MMSTAT = '20'  \n"
                        + "AND a.MMMABU = '2'  \n"
                        + "AND a.MMCUCD <> '' \n"
                        + "AND a.MMPUPR > 0  \n"
                        + "AND a.MMITTY NOT IN ('SP','OH','FA','') \n"
                        + "AND  a.MMITNO  LIKE ('HI%') \n"
                        + "OR a.MMCONO = '" + cono + "'  \n"
                        + "AND a.MMSTAT = '20'  \n"
                        + "AND a.MMMABU = '2'  \n"
                        + "AND a.MMCUCD <> '' \n"
                        + "AND a.MMPUPR > 0  \n"
                        + "AND a.MMITTY NOT IN ('SP','OH','FA','') \n"
                        + "AND  a.MMITNO  LIKE ('TD%') \n"
                        + "OR a.MMCONO = '" + cono + "'  \n"
                        + "AND a.MMSTAT = '20'  \n"
                        + "AND a.MMMABU = '2'  \n"
                        + "AND a.MMCUCD <> '' \n"
                        + "AND a.MMPUPR > 0  \n"
                        + "AND a.MMITTY NOT IN ('SP','OH','FA','') \n"
                        + "AND  a.MMITNO  LIKE ('RM%') \n"
                        + "OR a.MMCONO = '" + cono + "'  \n"
                        + "AND a.MMSTAT = '20'  \n"
                        + "AND a.MMMABU = '2'  \n"
                        + "AND a.MMCUCD <> '' \n"
                        + "AND a.MMPUPR > 0  \n"
                        + "AND a.MMITTY NOT IN ('SP','OH','FA','') \n"
                        + "AND  a.MMITNO  LIKE ('IO%') \n"
                        + "OR a.MMCONO = '" + cono + "'  \n"
                        + "AND a.MMSTAT = '20'  \n"
                        + "AND a.MMMABU = '2'  \n"
                        + "AND a.MMCUCD <> '' \n"
                        + "AND a.MMPUPR > 0  \n"
                        + "AND a.MMITTY NOT IN ('SP','OH','FA','') \n"
                        + "AND  a.MMITNO  LIKE ('PL%') \n"
                        + ") AS a \n"
                        + "\n"
                        + "INNER JOIN \n"
                        + "(\n"
                        + "	SELECT * FROM  M3FDBPRD.MITBAL b \n"
                        + "	WHERE  b.MBWHLO = '" + warehouse.trim() + "'\n"
                        + "AND b.mbstqt > '" + num + "'\n"
                        + ") AS b \n"
                        + "ON  b.MBCONO = a.MMCONO  \n"
                        + "AND b.MBITNO = a.MMITNO \n"
                        + "\n"
                        + "LEFT  JOIN \n"
                        + "(\n"
                        + "	SELECT  * FROM M3FDBPRD.CIDADR c   \n"
                        + "	WHERE  c.SAADID = 'ADDR'\n"
                        + "\n"
                        + ") AS c  \n"
                        + "ON c.SACONO = a.MMCONO \n"
                        + "AND c.SASUNO = a.MMSUNO";

                System.out.println("getItemcode\n" + query);
                ResultSet mRes = stmt.executeQuery(query);

                while (mRes.next()) {
                    Map<String, Object> mMap = new HashMap<>();
                    mMap.put("MMCONO", mRes.getString(1).trim());
                    mMap.put("MMITNO", mRes.getString(2).trim());
                    mMap.put("MMITDS", mRes.getString(3).trim());
                    mMap.put("ITEM", mRes.getString(4).trim());
                    mMap.put("MMUNMS", mRes.getString(6).trim());

                    mJSonArr
                            .put(mMap);

                }

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
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
        System.out.println(mJSonArr.toString());
        return mJSonArr;

    }

    public static JSONArray getItemcode2way(String fwarehouse, String twarehouse) throws Exception {

        JSONArray mJSonArr = new JSONArray();
        Connection conn = ConnectDB2.ConnectionDB();

        try {
            if (conn != null) {

                Statement stmt = conn.createStatement();

                String query = "SELECT  * \n"
                        + "		FROM (			\n"
                        + "						  SELECT MMCONO, TRIM(MMITNO) AS MMITNO, TRIM(MMITDS) AS MMITDS, TRIM(MMITNO) || ' : ' || TRIM(MMITDS) AS ITEM, TRIM(MMFUDS) AS MMFUDS, MMPUUN AS MMUNMS, MMSUNO, TRIM(SASUNM) AS SASUNM, TRIM(MMSUNO) || ' : ' || TRIM(SASUNM) AS SUPPLIER, MMPUPR, MMVTCP, TRIM(MMCUCD) AS MMCUCD, TRIM(MBORTY) AS MBORTY \n"
                        + "FROM M3FDBPRD.MITMAS a, M3FDBPRD.MITBAL b, M3FDBPRD.CIDADR c  \n"
                        + "WHERE a.MMCONO = '10'  \n"
                        + "AND a.MMSTAT = '20'  \n"
                        + "AND a.MMMABU = '2'  \n"
                        + "AND a.MMCUCD <> '' \n"
                        + "AND a.MMPUPR > 0  \n"
                        + "AND a.MMITTY NOT IN ('SP','OH','FA','') \n"
                        + "--AND MMITNO LIKE 'BU%'\n"
                        + "AND b.MBCONO = a.MMCONO  \n"
                        + "AND b.MBITNO = a.MMITNO \n"
                        + "AND b.MBWHLO = '" + fwarehouse + "'\n"
                        + "AND b.MBPUIT = '2'\n"
                        + "\n"
                        + "AND c.SACONO = a.MMCONO \n"
                        + "AND c.SASUNO = a.MMSUNO  \n"
                        + "AND c.SAADID = 'ADDR'\n"
                        + "\n"
                        + ") AS a \n"
                        + "\n"
                        + "INNER   JOIN \n"
                        + "\n"
                        + " (			\n"
                        + "						  SELECT MMCONO, TRIM(MMITNO) AS MMITNO, TRIM(MMITDS) AS MMITDS, TRIM(MMITNO) || ' : ' || TRIM(MMITDS) AS ITEM, TRIM(MMFUDS) AS MMFUDS, MMPUUN AS MMUNMS, MMSUNO, TRIM(SASUNM) AS SASUNM, TRIM(MMSUNO) || ' : ' || TRIM(SASUNM) AS SUPPLIER, MMPUPR, MMVTCP, TRIM(MMCUCD) AS MMCUCD, TRIM(MBORTY) AS MBORTY \n"
                        + "FROM M3FDBPRD.MITMAS a, M3FDBPRD.MITBAL b, M3FDBPRD.CIDADR c  \n"
                        + "WHERE a.MMCONO = '10'  \n"
                        + "AND a.MMSTAT = '20'  \n"
                        + "AND a.MMMABU = '2'  \n"
                        + "AND a.MMCUCD <> '' \n"
                        + "AND a.MMPUPR > 0  \n"
                        + "AND a.MMITTY NOT IN ('SP','OH','FA','') \n"
                        + "--AND MMITNO LIKE 'BU%'\n"
                        + "AND b.MBCONO = a.MMCONO  \n"
                        + "AND b.MBITNO = a.MMITNO \n"
                        + "AND b.MBWHLO = '" + twarehouse + "'\n"
                        + "AND b.MBPUIT = '2'\n"
                        + "AND c.SACONO = a.MMCONO \n"
                        + "AND c.SASUNO = a.MMSUNO  \n"
                        + "AND c.SAADID = 'ADDR'\n"
                        + "\n"
                        + ") AS b \n"
                        + "\n"
                        + "ON  a.MMITNO = b.MMITNO";
                System.out.println("getItemcode\n" + query);
                ResultSet mRes = stmt.executeQuery(query);

                while (mRes.next()) {
                    Map<String, Object> mMap = new HashMap<>();
                    mMap.put("MMCONO", mRes.getString(1).trim());
                    mMap.put("MMITNO", mRes.getString(2).trim());
                    mMap.put("MMITDS", mRes.getString(3).trim());
                    mMap.put("ITEM", mRes.getString(4).trim());

                    mJSonArr.put(mMap);

                }

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
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
        System.out.println(mJSonArr.toString());
        return mJSonArr;

    }
    
    
    
    public static JSONArray gettoWarehouse(String cono, String divi, String fac) throws Exception {

        JSONArray mJSonArr = new JSONArray();
        Connection conn = ConnectDB2.ConnectionDB();

        try {
            if (conn != null) {

                Statement stmt = conn.createStatement();
                String query = "SELECT MWWHLO,MWWHNM,MWWHLO || ' : ' || MWWHNM AS WAREHOUSE \n"
                        + "FROM M3FDBPRD.MITWHL\n"
                        + "WHERE MWCONO = '" + cono + "'\n"
                        + "AND MWDIVI = '" + divi + "'     \n"
                        + "ORDER BY MWWHLO";
                System.out.println("getWarehouse\n" + query);
                ResultSet mRes = stmt.executeQuery(query);

                while (mRes.next()) {
                    Map<String, Object> mMap = new HashMap<>();
                    mMap.put("MWWHLO", mRes.getString(1).trim());
                    mMap.put("MWWHNM", mRes.getString(2).trim());
                    mMap.put("WAREHOUSE", mRes.getString(3).trim());
                    mJSonArr.put(mMap);

                }

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
        } finally {
            if (conn != null) {
                conn.close();
            }
        }

        return mJSonArr;

    }


    public static JSONArray getWarehouse(String cono, String divi, String fac) throws Exception {

        JSONArray mJSonArr = new JSONArray();
        Connection conn = ConnectDB2.ConnectionDB();

        try {
            if (conn != null) {

                Statement stmt = conn.createStatement();
                String query = "SELECT MWWHLO,MWWHNM,MWWHLO || ' : ' || MWWHNM AS WAREHOUSE \n"
                        + "FROM M3FDBPRD.MITWHL\n"
                        + "WHERE MWCONO = '" + cono + "'\n"
                        + "AND MWDIVI = '" + divi + "'   AND MWFACI  = '" + fac + "'   \n"
                        + "ORDER BY MWWHLO";
                System.out.println("getWarehouse\n" + query);
                ResultSet mRes = stmt.executeQuery(query);

                while (mRes.next()) {
                    Map<String, Object> mMap = new HashMap<>();
                    mMap.put("MWWHLO", mRes.getString(1).trim());
                    mMap.put("MWWHNM", mRes.getString(2).trim());
                    mMap.put("WAREHOUSE", mRes.getString(3).trim());
                    mJSonArr.put(mMap);

                }

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
        } finally {
            if (conn != null) {
                conn.close();
            }
        }

        return mJSonArr;

    }

    public static JSONArray Company() throws Exception {

        JSONArray mJSonArr = new JSONArray();
        Connection conn = ConnectDB2.ConnectionDB();

        try {
            if (conn != null) {

                Statement stmt = conn.createStatement();
                String query = "SELECT CCCONO,CCDIVI,CCCONM,'\"'|| TRIM(CCCONO) || ' : ' || TRIM(CCDIVI) || ' : ' || TRIM(CCCONM) || '\"' AS COMPANY\n"
                        + "FROM M3FDBPRD.CMNDIV\n"
                        + "WHERE CCDIVI != ''\n"
                        + "ORDER BY CCCONO";
                System.out.println("SelectCompany\n" + query);
                ResultSet mRes = stmt.executeQuery(query);

                while (mRes.next()) {
                    Map<String, Object> mMap = new HashMap<>();
                    mMap.put("CCCONO", mRes.getString(1).trim());
                    mMap.put("CCDIVI", mRes.getString(2).trim());
                    mMap.put("CCCONM", mRes.getString(3).trim());
                    mMap.put("COMPANY", mRes.getString(4).trim());
                    mJSonArr.put(mMap);

                }

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

        return mJSonArr;

    }

}
