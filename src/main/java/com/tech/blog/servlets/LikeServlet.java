/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.servlets;

import com.tech.blog.dao.likeDao;
import com.tech.blog.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author akn
 */
@WebServlet("/LikeServlet")
public class LikeServlet extends HttpServlet{
    
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException
    {
        PrintWriter out=response.getWriter();
        String operation=request.getParameter("operation");
        int uId=Integer.parseInt(request.getParameter("uid"));
        int pId=Integer.parseInt(request.getParameter("pid"));
        out.println(uId + " " + operation + " " + pId);
        
        if(operation.equals("like"))
        {
            likeDao dao=new likeDao(ConnectionProvider.getConnection());
            if(dao.checkIfLikedOrNot(uId, pId)==false)
            {
                boolean f=dao.insertLike(pId, uId);
                out.println(f);
                out.println("true");
            }
            else
            {
                boolean f=dao.deleteLike(pId, uId);
                out.println(f);
                out.println("false");
            }
        }
        else
        {
            out.println("error");
        }
    }
}
