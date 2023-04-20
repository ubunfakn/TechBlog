/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author akn
 */
@WebServlet("/Register")
@MultipartConfig
public class RegisterServlet extends HttpServlet {
    public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException
    {
        PrintWriter out=response.getWriter();
        String check=request.getParameter("check");
        if(check!=null)
        {
            String name=request.getParameter("user_name");
            String email=request.getParameter("user_email");
            String password=request.getParameter("user_password");
            String gender=request.getParameter("gender");
            String about=request.getParameter("about");
           
            User user=new User(name,email,password,gender,about);
            
            UserDao dao=new UserDao(ConnectionProvider.getConnection());
            if(dao.saveuser(user))out.println("done");
            else out.println("error");
        }
        else
        {
            out.println("Please Agree to terms and conditions");
        }
    }
}
