/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;

import java.sql.*;

/**
 *
 * @author akn
 */
public class likeDao {

    private Connection con;

    public likeDao(Connection con) {
        this.con = con;
    }

    public boolean insertLike(int pid, int uid) {
        boolean f = false;
        try {

            PreparedStatement pst = this.con.prepareStatement("insert into Liked(pId,uId) values(?,?)");
            pst.setInt(1, pid);
            pst.setInt(2, uid);
            pst.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public int countLikeOnPost(int pid) {
        int count = 0;
        try {

            PreparedStatement pst = this.con.prepareStatement("select count(*) from Liked where pId=?");
            pst.setInt(1, pid);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                count = rs.getInt("count(*)");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    public boolean checkIfLikedOrNot(int uid, int pid) {
        boolean f = false;

        try {

            PreparedStatement pst = this.con.prepareStatement("select * from Liked where pId=? and uId=?");
            pst.setInt(1, pid);
            pst.setInt(2, uid);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public boolean deleteLike(int pid, int uid) {
        boolean f = false;

        try {
            PreparedStatement pst = this.con.prepareStatement("delete from Liked where pid=? and uid=?");
            pst.setInt(1, pid);
            pst.setInt(2, uid);
            pst.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }
}
