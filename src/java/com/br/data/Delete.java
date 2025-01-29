/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.br.data;

import com.br.connection.ConnectDB2;
import com.br.utility.GBVAR;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Wattana
 */
public class Delete {
    
    

            public static void deleteitemdatapp(String code, String id, String qty) throws Exception {

        Connection conn = ConnectDB2.ConnectionDB();

        System.out.println(code);
        System.out.println(id);
        System.out.println(qty);

        try {
            if (conn != null) {

                Statement stmt = conn.createStatement();
                String query = "DELETE  FROM "+GBVAR.DBPRD+".FAR_ITMTLB04\n"
                        + "WHERE ITM_ID = '" + code + "'\n"
                        + "AND QTY_REQT = '" + qty + "'\n"
                        + "AND ORD_ID = '" + id + "'";
                stmt.execute(query);

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
    }
    public static void deleteitemdata(String code, String itid, String id) throws Exception {

        Connection conn = ConnectDB2.ConnectionDB();

        System.out.println(code);
        System.out.println(itid);
        System.out.println(id);

        try {
            if (conn != null) {

                Statement stmt = conn.createStatement();
                String query = "DELETE  FROM "+GBVAR.DBPRD+".FAR_ITMTLB04\n"
                        + "WHERE ITM_ID = '" + code + "'\n"
                        + "AND ID = '" + itid + "'\n"
                        + "AND ORD_ID = '" + id + "'";
                stmt.execute(query);

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
    }
}
