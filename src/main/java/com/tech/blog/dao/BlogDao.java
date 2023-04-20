/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;

/**
 *
 * @author akn
 */
import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
import java.sql.*;
import java.util.ArrayList;

public class BlogDao {

    Connection con;

    public BlogDao(Connection con) {
        this.con = con;
    }

    public ArrayList<Category> getAllCategories() {
        ArrayList<Category> list = null;

        try {
            String query = "select * from Category";
            Statement st = this.con.createStatement();
            ResultSet rs = st.executeQuery(query);

            list = new ArrayList<>();
            while (rs.next()) {
                int cid = rs.getInt("cid");
                String category = rs.getString("cname");
                String description = rs.getString("cdescription");
                Category cat = new Category(cid, category, description);
                list.add(cat);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public Category getCategoryBYCategoryId(int cId)
    {
        Category cat=null;
        System.out.println(cId);
        
        try
        {
            
            PreparedStatement pst=con.prepareStatement("select * from Category where cid=?");
            pst.setInt(1, cId);
            ResultSet rs=pst.executeQuery();
            if(rs.next())
            {
                String cName=rs.getString("cname");
                System.out.println(cName);
                String cDescription=rs.getString("cdescription");
                cat = new Category(cName, cDescription);
            }
            else
            {
                System.out.println("nooooooo");
            }
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return cat;
    }

    public boolean savePost(Post p) throws SQLException {
        boolean f = false;
        String query = "insert into Post(pTitle,pContent,pCode,pPic,catId,userId) values(?,?,?,?,?,?)";
        PreparedStatement pst = con.prepareStatement(query);
        pst.setString(1, p.getpTitle());
        pst.setString(2, p.getpContent());
        pst.setString(3, p.getpCode());
        pst.setString(4, p.getpPic());
        pst.setInt(5, p.getCatId());
        pst.setInt(6, p.getUid());

        pst.executeUpdate();
        f = true;

        return f;
    }

    public ArrayList<Post> getAllPosts() {
        ArrayList<Post> list = new ArrayList<>();

        try {

            PreparedStatement pst = con.prepareStatement("select * from Post order by pid desc");
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                int pid = rs.getInt("pid");
                String pTitle = rs.getString("pTitle");
                String pContent = rs.getString("pContent");
                String pCode = rs.getString("pCode");
                String pPic = rs.getString("pPic");
                int catId = rs.getInt("catId");
                int uId = rs.getInt("userId");

                Post post = new Post(pid, pTitle, pContent, pCode, pPic, catId, uId);
                list.add(post);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public ArrayList<Post> getPostByCatId(int catId) {
        ArrayList<Post> list = new ArrayList<>();

        try {

            PreparedStatement pst = con.prepareStatement("select * from Post where catId=? order by pid desc");
            pst.setInt(1, catId);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                int pid = rs.getInt("pid");
                String pTitle = rs.getString("pTitle");
                String pContent = rs.getString("pContent");
                String pCode = rs.getString("pCode");
                String pPic = rs.getString("pPic");
                int uId = rs.getInt("userId");

                Post post = new Post(pid, pTitle, pContent, pCode, pPic, catId, uId);
                list.add(post);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public ArrayList<Post> getPostByUserId(int uId) {
        ArrayList<Post> list = new ArrayList<Post>();

        try {
            PreparedStatement pst = con.prepareStatement("select * from Post where userId=? order by pid desc");
            pst.setInt(1, uId);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                int pid = rs.getInt("pid");
                String pTitle = rs.getString("pTitle");
                String pContent = rs.getString("pContent");
                String pCode = rs.getString("pCode");
                String pPic = rs.getString("pPic");

                Post post = new Post(pid, pTitle, pContent, pCode, pPic, uId);
                list.add(post);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
    
    
    public Post getPostByPostId(int pid)
    {
        Post post=null;
        
        String query="select * from Post where pid=?";
        try
        {       
            PreparedStatement pst=con.prepareStatement(query);
            pst.setInt(1, pid);
            ResultSet rs=pst.executeQuery();
            
            if(rs.next())
            {
                int pId=rs.getInt("pid");
                String pTitle=rs.getString("pTitle");
                String pContent=rs.getString("pContent");
                String pCode=rs.getString("pCode");
                String pPic=rs.getString("pPic");
                int uId=rs.getInt("userId");
                int catId=rs.getInt("catId");
                post=new Post(pId, pTitle, pContent, pCode, pPic, catId, uId);
            }
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return post;
    }
}
