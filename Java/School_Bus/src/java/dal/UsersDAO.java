/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.Buses;
import model.Users;

/**
 *
 * @author ACER
 */
public class UsersDAO extends DBContext {

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

    public Buses getBusById(int id) {
        try {
            String sql = "SELECT * FROM [buses] WHERE [bus_id] = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery(sql); //nếu các câu lệnh là select -> trả về result set
            while (rs.next()) {
                Buses b = new Buses();
                b.setBusId(rs.getInt("[bus_id]"));
                b.setBusName(rs.getString("[bus_name]"));
                b.setBusStatus(rs.getString("[bus_status]"));// c.setName(rs.getString(2)); -> trỏ đến cột 2
                return b;
            }
            rs.close();
            st.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public List<Users> getUserByBid(int bid) {
        List<Users> list = new ArrayList<>();
        String sql = "SELECT [user_id]\n"
                + "      ,[user_name]\n"
                + "      ,[email]\n"
                + "      ,[password]\n"
                + "      ,[phone_number]\n"
                + "      ,[location]\n"
                + "      ,[gender]\n"
                + "      ,[birthday]\n"
                + "      ,[role]\n"
                + "      ,[bus_id]\n"
                + "  FROM [dbo].[users] WHERE [bus_id] = " + bid;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Users u = new Users();
                u.setUserId(rs.getInt("[user_id]"));
                u.setUserName(rs.getString("[user_name]"));
                u.setEmail(rs.getString("[email]"));
                u.setPassword(rs.getString("[password]"));
                u.setPhoneNumber(rs.getString("[phone_number]"));
                u.setLocation(rs.getString("[location]"));
                u.setGender(rs.getString("[gender]"));
                u.setBirthday(rs.getDate("[birthday]"));
                u.setRole(rs.getString("[role]"));
                Buses b = getBusById(rs.getInt("[bus_id]"));
                u.setBus(b);
                list.add(u);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Users> getUserByEmail(String email) {
        List<Users> list = new ArrayList<>();
        String sql = "SELECT * FROM [users] WHERE [email] = " + email;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Users u = new Users();
                u.setUserId(rs.getInt("[user_id]"));
                u.setUserName(rs.getString("[user_name]"));
                u.setEmail(rs.getString("[email]"));
                u.setPassword(rs.getString("[password]"));
                u.setPhoneNumber(rs.getString("[phone_number]"));
                u.setLocation(rs.getString("[location]"));
                u.setGender(rs.getString("[gender]"));
                u.setBirthday(rs.getDate("[birthday]"));
                u.setRole(rs.getString("[role]"));
                Buses b = getBusById(rs.getInt("[bus_id]"));
                u.setBus(b);
                list.add(u);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Users> getUserByEmailAndPassword(String email, String password) {
        List<Users> list = new ArrayList<>();
        String sql = "SELECT * FROM [users] WHERE [email] = ? AND [password] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Users u = new Users();
                u.setUserId(rs.getInt("[user_id]"));
                u.setUserName(rs.getString("[user_name]"));
                u.setEmail(rs.getString("[email]"));
                u.setPassword(rs.getString("[password]"));
                u.setPhoneNumber(rs.getString("[phone_number]"));
                u.setLocation(rs.getString("[location]"));
                u.setGender(rs.getString("[gender]"));
                u.setBirthday(rs.getDate("[birthday]"));
                u.setRole(rs.getString("[role]"));
                Buses b = getBusById(rs.getInt("[bus_id]"));
                u.setBus(b);
                list.add(u);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Users> getParentsByEmailAndPassword(String email, String password) {
        List<Users> list = new ArrayList<>();
        String sql = "SELECT * FROM [users] WHERE [email] = ? AND [password] = ? AND [role] = 'Parent'";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Users u = new Users();
                u.setUserId(rs.getInt("[user_id]"));
                u.setUserName(rs.getString("[user_name]"));
                u.setEmail(rs.getString("[email]"));
                u.setPassword(rs.getString("[password]"));
                u.setPhoneNumber(rs.getString("[phone_number]"));
                u.setLocation(rs.getString("[location]"));
                u.setGender(rs.getString("[gender]"));
                u.setBirthday(rs.getDate("[birthday]"));
                u.setRole(rs.getString("[role]"));
                list.add(u);
            }
        } catch (Exception e) {
        }
        return list;
    }
}
