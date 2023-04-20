/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author akn
 */
@WebServlet("/login")
public class LoginSevlet extends HttpServlet {
    @Override
    public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException
    {
        PrintWriter out=response.getWriter();
        String email=request.getParameter("user_email");
        String password=request.getParameter("user_password");
        UserDao dao=new UserDao(ConnectionProvider.getConnection());
        User user=dao.getUser(email, password);
        if(user==null)
        {
            Message msg=new Message("Invalid Details ! try with another","error","alert-danger");
            
            HttpSession s=request.getSession();
            s.setAttribute("msg", msg);
            
            response.sendRedirect("login.jsp");
        }
        else
        {
            HttpSession session=request.getSession();
            session.setAttribute("current_user", user);
            response.sendRedirect("Profile.jsp");
        }
    }
}
