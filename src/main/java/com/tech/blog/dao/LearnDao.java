/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;

import com.tech.blog.entities.LearnCode;
import java.sql.*;
import java.util.ArrayList;

/**
 *
 * @author akn
 */
public class LearnDao {
    private Connection con;
    
   public LearnDao(Connection con)
    {
        this.con=con;
    }
    
    
    
    public ArrayList<LearnCode> getAll()
    {
        ArrayList<LearnCode> list=new ArrayList<>();
        
        try{
            
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("select * from Learn");
            while(rs.next())
            {
                int lId=rs.getInt("lId");
                String cTitle=rs.getString("cTitle");
                String siteName=rs.getString("siteName");
                String siteLink=rs.getString("siteLink");
                String ytLink=rs.getString("ytLink");
                LearnCode code=new LearnCode(lId, cTitle, siteName, siteLink, ytLink);
                list.add(code);
            }
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return list;
    }
}
