/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Buses;
import java.sql.Statement;
import java.sql.ResultSet;

/**
 *
 * @author ACER
 */
public class BusesDAO extends DBContext {

    public List<Buses> getAllBuses() {
        List<Buses> listBuses = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [buses]";
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                Buses b = new Buses();
                b.setBusId(rs.getInt("[bus_id]"));
                b.setBusName(rs.getString("[bus_name]"));
                b.setBusStatus(rs.getString("[bus_status]"));
                listBuses.add(b);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listBuses;
    }
}
