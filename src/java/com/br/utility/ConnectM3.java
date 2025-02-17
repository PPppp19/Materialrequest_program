/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.br.utility;

import MForms.Utils.MNEHelper;
import MForms.Utils.MNEProtocol;
import MvxAPI.MvxSockJ;
import com.br.connection.ConnectDB2;
import com.br.data.Select;
import java.lang.ref.SoftReference;
import java.sql.Connection;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.swing.table.DefaultTableModel;
import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONObject;

/**
 *
 * @author Wattana
 */
public class ConnectM3 {

    //////////////////
    /////////////////
    String movexno = "";

    String purpose = "";
    String itid = "";
    String departmenthead = "";
    String towarehouse = "";
    String requester = "";
    String orderid = "";
    String companyid = "";
    String createddate = "";
    String Pcreateddate = "";

    String materiltype = "";
    String warehouselocation = "";
    String issuby = "";
    String costcenter = "";
    String id = "";
    String fromwarehouse = "";
    String departmentname = "";

    String faculty = "1A1";

    SoftReference<ArrayList<String>> itemid1 = new SoftReference<>(new ArrayList<>());
    SoftReference<ArrayList<String>> itemkid = new SoftReference<>(new ArrayList<>());
    SoftReference<ArrayList<String>> itemunit = new SoftReference<>(new ArrayList<>());
    SoftReference<ArrayList<String>> itemissu = new SoftReference<>(new ArrayList<>());
    SoftReference<ArrayList<String>> itemonhand = new SoftReference<>(new ArrayList<>());
//    protected String mneLogOnUrl = "https://bkrmvxm3.bangkokranch.com:22008/mne/servlet/MvxMCSvt"; //TST
//    protected String mneLogOnUrl = "https://bkrmvxm3.bangkokranch.com:21008/mne/servlet/MvxMCSvt";  //PRD
    protected String mneLogOnUrl = GBVAR.LoginUrlConnectionm3;

    MvxSockJ sock;
    protected int cono;
    protected String divi;
    private String appServer;
    private int appPort;
    private String m3id;
    private String m3pw;
//    private String DocNo;

    DefaultTableModel model1;

    public static String mms100 = "NO";
    public static String order_no = "";
    public static String itemis = "";
    public static int num = 0;
    public static boolean isComplete = false;

    ///////////////////
////    protected static String mneLogOnUrl = "https://bkrmvxm3.bangkokranch.com:21008/mne/servlet/MvxMCSvt"; //PRD
////    protected static int appPort = 16105; // PRD
//    protected static String mneLogOnUrl = "https://bkrmvxm3.bangkokranch.com:22008/mne/servlet/MvxMCSvt"; //TST
//    protected static int appPort = 16305; // TST
//    protected static String appServer = "192.200.9.190";
//    protected static String m3id = "MVXSECOFR";
//    protected static String m3pw = "lawson@90";
//    protected static MvxSockJ sock;
    public String SendtoM3(String type, String id, String issdate, String cono, String divi) throws Exception {
        System.out.println("movexno ==========================");

        String movexno = "";
        if ("33".equals(type)) {

            movexno = "A33";

            JSONArray jsonArray = new JSONArray(getvalue(id).toString());

            for (int i = 0; i < jsonArray.length(); i++) {
                JSONObject jsonObject1 = jsonArray.getJSONObject(i);
                String TO_WAHO = jsonObject1.optString("TO_WAHO");
                String ITM_UNIT = jsonObject1.optString("ITM_UNIT");
                String ORD_ID = jsonObject1.optString("ORD_ID");
                String ITM_ID = jsonObject1.optString("ITM_ID");
                String ISS_DATE = issdate;
                String QTY_ISSU = jsonObject1.optString("QTY_ISSU");
                String COS_CENT = jsonObject1.optString("COS_CENT");
                String ITKID = jsonObject1.optString("ITID");
                String FRM_WAHO = jsonObject1.optString("FRM_WAHO");
                String ONH_STAT = jsonObject1.optString("ONH_STAT");

                String REG_FAC = jsonObject1.optString("REG_FAC");

                //purpose = ORD_PURP;
                fromwarehouse = FRM_WAHO;

                if (TO_WAHO == null || TO_WAHO == "" || TO_WAHO.equalsIgnoreCase("")) {
                    towarehouse = FRM_WAHO;
                } else {

                    towarehouse = TO_WAHO;
                }

                createddate = GetDatePattern(ISS_DATE);
                Pcreateddate = ISS_DATE;

                if (REG_FAC == "-") {
                    faculty = "1A1";
                } else {
                    faculty = REG_FAC;

                }
                List<String> listid = itemid1.get();
                List<String> listunit = itemunit.get();
                List<String> listkid = itemkid.get();
                List<String> listonhand = itemonhand.get();
                List<String> listissu = itemissu.get();
                listid.add(ITM_ID);
                listunit.add(ITM_UNIT);
                listissu.add(QTY_ISSU);
                listkid.add(ITKID);
                listonhand.add(ONH_STAT);
                costcenter = COS_CENT;
                orderid = ORD_ID;
                System.out.println("================================123");
                System.out.println(ISS_DATE);
                System.out.println(GetDatePattern(ISS_DATE));
                System.out.println(orderid);
                System.out.println(REG_FAC);
                System.out.println("================================123");

            }
            // callMMS100A33();
            System.out.println("================================");
            System.out.println(type);
            System.out.println(id);
            System.out.println("================================");

            movexno = callMMS100A33(id, Integer.parseInt(cono), divi, type);

        } else if ("71".equals(type)) {
            //callMMS100A71();

            JSONArray jsonArray = new JSONArray(getvalue(id).toString());
            for (int i = 0; i < jsonArray.length(); i++) {
                JSONObject jsonObject1 = jsonArray.getJSONObject(i);

                String TO_WAHO = jsonObject1.optString("TO_WAHO");
                String ITM_UNIT = jsonObject1.optString("ITM_UNIT");
                String ORD_ID = jsonObject1.optString("ORD_ID");
                String ITM_ID = jsonObject1.optString("ITM_ID");
                String ISS_DATE = issdate;

                String QTY_ISSU = jsonObject1.optString("QTY_ISSU");
                String COS_CENT = jsonObject1.optString("COS_CENT");
                String ITKID = jsonObject1.optString("ITID");
                String FRM_WAHO = jsonObject1.optString("FRM_WAHO");
                String ONH_STAT = jsonObject1.optString("ONH_STAT");

                String REG_FAC = jsonObject1.optString("REG_FAC");

                fromwarehouse = FRM_WAHO;
                towarehouse = TO_WAHO;
                createddate = GetDatePattern(ISS_DATE);
                Pcreateddate = ISS_DATE;

                if (REG_FAC == "-") {
                    faculty = "1A1";
                } else {
                    faculty = REG_FAC;

                }

                List<String> listid = itemid1.get();
                List<String> listunit = itemunit.get();
                List<String> listkid = itemkid.get();
                List<String> listonhand = itemonhand.get();
                List<String> listissu = itemissu.get();
                listid.add(ITM_ID);
                listunit.add(ITM_UNIT);
                listissu.add(QTY_ISSU);
                listonhand.add(ONH_STAT);
                listkid.add(ITKID);
                costcenter = COS_CENT;
                orderid = ORD_ID;
                System.out.println("================================123");
                System.out.println(ISS_DATE);
                System.out.println(GetDatePattern(ISS_DATE));
                System.out.println(ONH_STAT);
                System.out.println(itemonhand);
                System.out.println(REG_FAC);

                System.out.println("================================123");

            }

            movexno = callMMS100A71(id, Integer.parseInt(cono), divi, type);
            System.out.println("Select type = A71");
        }

        return "movexno : " + movexno;
    }

    private void dspmsg(String msg) {
        //JOptionPane.showMessageDialog(msg);
        System.out.println("----------------------");
        System.out.println(msg);
        System.out.println("----------------------");

    }

    private JSONArray getvalue(String orderid) throws Exception {

        //System.out.println("----------------------");
        //System.out.println(Select.getloadm3(orderid));
        return Select.getloadm3(orderid);
    }

    private String getordertype(String materiltype, String faculty) throws Exception {

        //System.out.println("----------------------");
        //System.out.println(Select.getloadm3(orderid));
        return Select.GetOrderType(materiltype, faculty);
    }

    private String callMMS100A33(String id, int usercono, String userdivi, String type) {

        System.out.println("-------------------");
        System.out.println(fromwarehouse);
        System.out.println(towarehouse);
        System.out.println(createddate);
        System.out.println(itemid1);
        System.out.println(itemunit);
        System.out.println(itemissu);
        System.out.println("-------------------");

        //================================   m3 =================================
        try {

            Connection conn = ConnectDB2.ConnectionDB();
            Statement sta = conn.createStatement();

            //Connection connn = c
//            String pUnit = "";
            String checked = "YES";

            order_no = "";

            //float pQty = Float.parseFloat(xpQty);
//            double pCatchQty1 = 0d;
            try {

                m3id = "MPM_1A1";
                m3pw = "lawson@90";
                cono = usercono;
                divi = userdivi;
                appServer = "192.200.9.190";
//                appPort = 16105;
                appPort = GBVAR.DBPORT;
                int i = 0;
                System.out.println(" Start to log in");

                MNEHelper mne = new MNEHelper(appServer, appPort, mneLogOnUrl);
                mne.logInToM3(cono, divi, m3id, m3pw);

                if (!mne.logInToM3(cono, divi, m3id, m3pw)) {
                    System.out.println(" Can not login to M3 system");
                }

                String MMS100ID = mne.runM3Pgm("MMS100");
                System.out.println("MMS100ID:" + MMS100ID);

                if ((MMS100ID).equals("")) {
                    System.out.println(" ไม่สามารถเปิดโปรแกรม MMS100 ได้");
                }

                //---------------------------------------------------------
                while (!mne.panel.equals("MMS100/B1")) {
                    i++;
                    if (i >= 3) {

                        System.out.println(" ล็อคอินไม่ผ่าน");

                        dspmsg("Err-00001 : " + mne.getMsgId() + " : " + mne.getMsg());
                        mne.closeProgram(MMS100ID);
                        return mne.getMsg();
                    }
                    mne.pressKey(MNEProtocol.KeyF13);
                    mne.setField("WWSPIC", "B-Browse");
                    mne.setField("WWDSEQ", "E12");

                    mne.pressKey(MNEProtocol.KeyEnter);
                    mne.pressKey(MNEProtocol.KeyF03);
                    mne.runM3Pgm("MMS100");

                }

                System.out.println("past to MMS100/B1");

                if (mne.panel.equals("MMS100/B1")) {
                    //System.out.println(mne.panel);
                    mne.setField("WWFACI", faculty.trim());
                    mne.setField("W1TRTP", getordertype(type, faculty));

                    //mne.selectOption(MNEProtocol.OptionCreate);
                    mne.selectOption("1");

                    //========= Begin order Type A33 ==================
                    if (mne.panel.equals("MMS100/F")) {
                        //System.out.println(mne.panel);
                        mne.setField("WGWHLO", fromwarehouse.trim());
                        mne.setField("WGTWLO", towarehouse.trim());
                        mne.setField("WGTRDT", createddate.trim());
                        mne.setField("WGRIDT", createddate.trim());

                        // for check when return back to bind  in web.  
                        mne.setField("WGREMK", id.trim());
                        //txtMRNO

                        mne.pressKey(MNEProtocol.KeyEnter);
                        System.out.println("xxxxxxxxxxxxxxxxxx2");

                        int c = 0;
                        while ((mne.panel.equals("MMS100/F")) && (c <= 3)) {
                            c++;
                            mne.pressKey(MNEProtocol.KeyEnter);

                        }
                        if (c > 3) {
                            System.out.println(" หยอดไอเทมไม่ผ่าน");
                            dspmsg(mne.getMsg());
                            mne.closeProgram(MMS100ID);
                            return mne.getMsg();
                        }

                        // get item value 
                        //-------------------------------------------------------
                        List<String> listid = itemid1.get();
                        List<String> listonhand = itemonhand.get();

                        System.out.println(listonhand); // แสดงรายการทั้งหมด

                        for (String item : listonhand) {
                            System.out.println(item);
                        }

                        List<String> listunit = itemunit.get();
//                        List<String> listkid = itemkid.get();
                        List<String> listissu = itemissu.get();
                        System.out.println("size : " + listid.size());

                        for (i = 0; i <= listid.size() - 1; i++) {

                            System.out.println(listonhand); // แสดงรายการทั้งหมด

                            int index = i - 1;
                            if ("YES".equals(listonhand.get(i))) {

                                System.out.println("check MMS101/B1");
                                if (mne.panel.equals("MMS101/B1")) {

                                    System.out.println("xxxxxxxxxxxxxxxxxx555");
                                    System.out.println(mne.getFieldMap("MRTRNR").getValue());
                                    System.out.println("xxxxxxxxxxxxxxxxxx555");

                                    System.out.println(itemid1);
                                    System.out.println(itemissu);
                                    System.out.println(itemunit);
                                    System.out.println(index);

                                    mne.setField("WRITNO", listid.get(i)); // itemcode
                                    System.out.println("xxxxxxxxxxxxxxxxxx999");

                                    mne.setField("WRTRQT", listissu.get(i)); // QTY_REQ
                                    System.out.println("xxxxxxxxxxxxxxxxxx888");

                                    mne.setField("WRALUN", listunit.get(i)); //type 
                                    System.out.println("xxxxxxxxxxxxxxxxxx777");

                                    System.out.println("เข้ามาอยู่หน้าไอเทม [" + i + "]  ");

                                    System.out.println("xxxxxxxxxxxxxxxxxx5");
                                    movexno = mne.getFieldMap("MRTRNR").getValue();

                                    order_no = mne.getFieldMap("MRTRNR").getValue();
                                    System.out.println("xxxxxxxxxxxxxxxxxx4");

                                    mne.pressKey(MNEProtocol.KeyEnter);
                                    mne.pressKey(MNEProtocol.KeyEnter);
                                    
                                        if (mne.getMsg() != null) {
                            order_no = " error " + mne.panel + ",  " + mne.getMsg();
                            mne.pressKey(MNEProtocol.KeyF03);
                            mne.pressKey(MNEProtocol.KeyF03);
                            mne.closeProgram(MMS100ID);
                            return order_no;
                        }

                                    c = 0;
                                    while ((!mne.panel.equals("MMS101/B1")) && (c <= 3)) {
                                        c++;
                                        mne.pressKey(MNEProtocol.KeyEnter);
                                    }
                                    if (c > 3) {
                                        dspmsg("Err-00003 : " + mne.getMsgId() + " : " + mne.getMsg() + " mne:" + mne.panel);
                                        mne.closeProgram(MMS100ID);
                                        return mne.getMsg();
                                    }

                                    if (mne.getMsg() == null) {
                                        if (checked == "YES") {
                                            checked = "YES";
                                        } else {
                                            checked = "NO";
                                        }
                                        String Sql = "";

                                        Date d = new Date();
                                        SimpleDateFormat A = new SimpleDateFormat("dd/MM/yyyy");
                                        String DateNow = A.format(d);

                                        Sql = "UPDATE " + GBVAR.DBPRD + ".FAR_MTRREQ04\n"
                                                + "SET  MVX_ORDE  = '" + order_no + "' , ORD_STAT = '22', ORD_REMAR = '" + Pcreateddate + "'  \n"
                                                + "WHERE ORD_ID  = '" + id + "'";

                                        sta.executeUpdate(Sql);

                                    }

                                }
//                               
                            } else {
                                checked = "NO";
//                              
                            }

                        } // end of loop   input items 

                        mne.pressKey(MNEProtocol.KeyF03);
                        mne.pressKey(MNEProtocol.KeyF03);

                        c = 0;
                        while ((mne.panel.equals("MMS101/B1")) && (c <= 3)) {
                            c++;
                            mne.pressKey(MNEProtocol.KeyF03);
                        }
                        if (c <= 3) {
                            if ("YES".equals(checked)) {
                                //  JOptionPane.showMessageDialog(this, "Program Completed.. !!!!");
                            }

                            mne.closeProgram(MMS100ID);
                        }

                    }
                    // ===== End Order Type A33 =========================

                    mne.pressKey(MNEProtocol.KeyF03);
                    mne.pressKey(MNEProtocol.KeyF03);
                    mne.pressKey(MNEProtocol.KeyF03);

                    mne.closeProgram(MMS100ID);

                }

                //---------------------------------------------------------
                mne.closeProgram(MMS100ID);

            } catch (Exception e) {
                if (sock != null) {
                    System.out.println("ERR: " + sock.mvxGetLastError());
                }
            }

        } catch (Exception ex) {
        }

        return order_no;
    }

//    private boolean getComplete(String orderid) throws Exception {
//
//
//        return Select.getComplete(orderid);
//    }
    private String callMMS100A71(String id, int usercono, String userdivi, String type) {
        try {

            System.out.println("A7111111111111111111111111111111111111111111");

            System.out.println("-------------------");
            System.out.println(fromwarehouse);
            System.out.println(towarehouse);
            System.out.println(createddate);
            System.out.println(itemid1);
            System.out.println(itemunit);
            System.out.println(itemissu);

            System.out.println(faculty);

            System.out.println("-------------------");

            Connection conn = ConnectDB2.ConnectionDB();
            Statement sta = conn.createStatement();

            String pUnit = "";

            mms100 = "NO";
            order_no = "";

            String checked = "YES";
//
//            //float pQty = Float.parseFloat(xpQty);
//            double pCatchQty1 = 0d;
            //protected static String mneLogOnUrl = "https://bkrmvxm3.bangkokranch.com:21008/mne/servlet/MvxMCSvt"; //PRD
////    protected static int appPort = 16105; // PRD
//16305 //TST
//
            try {
                //m3id = "MVXSECOFR"; // "MPM_1A1"
                m3id = "MPM_1A1";
                m3pw = "lawson@90";
                cono = usercono;
                divi = userdivi;
                appServer = "192.200.9.190";
//                appPort = 16105;
//                appPort = 16305;//TST
                appPort = GBVAR.DBPORT;
                int i = 0;

                MNEHelper mne = new MNEHelper(appServer, appPort, mneLogOnUrl);
                mne.logInToM3(cono, divi, m3id, m3pw);

                if (!mne.logInToM3(cono, divi, m3id, m3pw)) {
                    System.out.println(" Can not login to M3 system");
                }

                String MMS100ID = mne.runM3Pgm("MMS100");
                System.out.println("MMS100ID:" + MMS100ID);

                if ((MMS100ID).equals("")) {
                    System.out.println(" ไม่สามารถเปิดโปรแกรม MMS100 ได้");
                }

                //---------------------------------------------------------
                while (!mne.panel.equals("MMS100/B1")) {
                    i++;
                    if (i >= 3) {

                        dspmsg("Err-00001 : " + mne.getMsgId() + " : " + mne.getMsg());
                        mne.closeProgram(MMS100ID);
                        return mne.getMsg();
                    }
                    mne.pressKey(MNEProtocol.KeyF13);
                    mne.setField("WWSPIC", "B-Browse");
                    mne.setField("WWDSEQ", "E12");
                    mne.pressKey(MNEProtocol.KeyEnter);
                    mne.pressKey(MNEProtocol.KeyF03);
                    mne.runM3Pgm("MMS100");

                }

                if (mne.panel.equals("MMS100/B1")) {
                    //System.out.println(mne.panel);
                    mne.setField("WWFACI", faculty.trim());
                    mne.setField("W1TRTP", getordertype(type, faculty));
                    mne.setField("_PSEQ", "E1");

                    //mne.selectOption(MNEProtocol.OptionCreate);
                    mne.selectOption("1");

                    //========= Begin order Type A71 ==================
                    if (mne.panel.equals("MMS100/E") ) {

                        mne.setField("WGWHLO", fromwarehouse.trim());
                        mne.setField("WGTRDT", createddate.trim());
                        mne.setField("WGDEPT", costcenter.trim());

                        mne.setField("WGREMK", id.trim());

                        mne.pressKey(MNEProtocol.KeyEnter);

                        int c = 0;
                        while ((mne.panel.equals("MMS100/F")) && (c <= 3)) {
                            c++;
                            mne.pressKey(MNEProtocol.KeyEnter);

                        }

                        if (mne.getMsg() != null) {
                            order_no = " error " + mne.panel + ",  " + mne.getMsg();
                            mne.pressKey(MNEProtocol.KeyF03);
                            mne.pressKey(MNEProtocol.KeyF03);
                            mne.closeProgram(MMS100ID);
                            return order_no;
                        }

//                        if (c > 3) {
//                            dspmsg(mne.getMsg());
//                            mne.closeProgram(MMS100ID);
//                            return mne.getMsg();
//                        }
                        //-------------------------------------------------------
                        List<String> listid = itemid1.get();
                        List<String> listunit = itemunit.get();
//                        List<String> listkid = itemkid.get();
                        List<String> listonhand = itemonhand.get();
                        List<String> listissu = itemissu.get();
                        for (i = 0; i <= listid.size() - 1; i++) {

//                            int index = i - 1;
                            if ("YES".equals(listonhand.get(i))) {

                                System.out.println("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");

                                listonhand.get(i);
                                System.out.println("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");

                                //----------------------
                                System.out.println(mne.panel);
                                System.out.println(mne.getMsg());

                                if (mne.panel.equals("MMS101/B1")) {

                                    mne.setField("WRITNO", listid.get(i));
                                    mne.setField("WRTRQT", listissu.get(i));
                                    mne.setField("WRALUN", listunit.get(i));
                                    order_no = mne.getFieldMap("MRTRNR").getValue();
                                    System.out.println(mne.getFieldMap("MRTRNR").getValue());

                                    movexno = order_no;
                                    mne.pressKey(MNEProtocol.KeyEnter);
                                    mne.pressKey(MNEProtocol.KeyEnter);

                                    if (mne.getMsg() != null) {
                                        order_no = " error " + mne.panel + ",  " + mne.getMsg();
                                        mne.pressKey(MNEProtocol.KeyF03);
                                        mne.pressKey(MNEProtocol.KeyF03);
                                        mne.closeProgram(MMS100ID);
                                        return order_no;
                                    }

                                    //---------------------
                                    if (mne.getMsg() == null) {

                                        if (checked == "YES") {
                                            checked = "YES";
                                        } else {
                                            checked = "NO";
                                        }

                                        Date d = new Date();
                                        SimpleDateFormat A = new SimpleDateFormat("dd/MM/yyyy");
                                        String DateNow = A.format(d);
                                        String Sql = "";
                                        Sql = "UPDATE " + GBVAR.DBPRD + ".FAR_MTRREQ04\n"
                                                + "SET  MVX_ORDE  = '" + order_no + "' , ORD_STAT = '22', ORD_REMAR = '" + Pcreateddate + "'  \n"
                                                + "WHERE ORD_ID  = '" + id + "'";

                                        sta.executeUpdate(Sql);
                                        System.out.println(Sql);
                                        sta.executeUpdate(Sql);

                                    } else {
                                        checked = "NO";
                                    }
                                }

                            }

                        }

                        mne.pressKey(MNEProtocol.KeyF03);
                        mne.pressKey(MNEProtocol.KeyF03);
                        c = 0;
                        while ((mne.panel.equals("MMS101/B1")) && (c <= 3)) {
                            //txtMovexOrder.setText("Error ....  !!!");
                            c++;
                            mne.pressKey(MNEProtocol.KeyF03);
                        }
                        if (c <= 3) {
                            if ("YES".equals(checked)) {
                            }
                            mne.closeProgram(MMS100ID);
                        }

                    }
                    // ===== End Order Type A33 =========================

                    mne.closeProgram(MMS100ID);

                }

                //---------------------------------------------------------
                mne.pressKey(MNEProtocol.KeyF03);
                mne.pressKey(MNEProtocol.KeyF03);
                mne.pressKey(MNEProtocol.KeyF03);

                mne.closeProgram(MMS100ID);

            } catch (Exception e) {
                if (sock != null) {
                    System.out.println("ERR: " + sock.mvxGetLastError());
                }
            }

        } catch (Exception ex) {
        }

        return order_no;
    }

    private String GetDatePattern(String date) {

        String DMYdate = "";

        date = date.replace("-", "");
        date = date.substring(6, 8) + date.substring(4, 6) + date.substring(2, 4);

        DMYdate = date;

        return DMYdate;

    }

}
