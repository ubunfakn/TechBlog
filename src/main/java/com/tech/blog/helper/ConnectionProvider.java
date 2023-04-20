/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.helper;

import java.sql.*;
/**
 *
 * @author akn
 */
public class ConnectionProvider {
    private static Connection con;
    public static Connection getConnection()
    {
        try
        {
            if(con==null)
            {
                Class.forName("com.mysql.cj.jdbc.Driver");
                
                con=DriverManager.getConnection("jdbc:mysql://localhost:3306/TechBlog","root","Ankit@2003");
            }
        }catch(Exception e)
        {
            e.getStackTrace();
            System.out.println(e.getMessage());
        }
        return con;
    }
}
