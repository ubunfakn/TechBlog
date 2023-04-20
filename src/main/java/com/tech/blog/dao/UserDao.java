/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;

/**
 *
 * @author akn
 */
import com.tech.blog.entities.User;
import java.sql.*;

public class UserDao {

    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }

    public boolean saveuser(User user) {
        boolean f = false;
        try {
            String query = "insert into User(name,email,password,gender,about) values(?,?,?,?,?)";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, user.getName());
            pst.setString(2, user.getEmail());
            pst.setString(3, user.getPassword());
            pst.setString(4, user.getGender());
            pst.setString(5, user.getAbout());

            pst.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public User getUser(String email, String password) {
        User user = null;

        try {

            String query = "select * from User where email=? and password=?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, email);
            pst.setString(2, password);

            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                user = new User();
                String name = rs.getString("name");
                user.setName(name);
                String emailDB = rs.getString("email");
                user.setEmail(emailDB);
                String gender = rs.getString("gender");
                user.setGender(gender);
                String about = rs.getString("about");
                user.setAbout(about);
                user.setProfile(rs.getString("profile"));
                user.setId(rs.getInt("id"));
                user.setPassword(password);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    public boolean updateUser(User user) {
        boolean f = false;
        try {
            String query = "update User set name=? , email=? , password=? , about=? , profile=?  where id=?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, user.getName());
            pst.setString(2, user.getEmail());
            pst.setString(3, user.getPassword());
            pst.setString(4, user.getAbout());
            pst.setString(5, user.getProfile());
            pst.setInt(6, user.getId());

            pst.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public User getUserByUserId(int uId) {
        User user = null;

        try {

            PreparedStatement pst = con.prepareStatement("select * from User where id=?");
            pst.setInt(1, uId);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String password = rs.getString("password");
                String gender = rs.getString("gender");
                String about = rs.getString("about");

                user = new User(id, name, email, password, gender, about);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }
}
