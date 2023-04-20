/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.servlets;

import com.tech.blog.dao.BlogDao;
import com.tech.blog.entities.Post;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import static org.graalvm.compiler.options.OptionType.User;

/**
 *
 * @author akn
 */
@WebServlet("/addpostservlet")
@MultipartConfig
public class PostServlet extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException  {
            PrintWriter out = response.getWriter();
            int cid =Integer.parseInt(request.getParameter("Cid"));
            String pTitle = request.getParameter("pTitle");
            String pContent = request.getParameter("pContent");
            String pCode = request.getParameter("pCode");
            
            //getting current user id
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("current_user");
            
            Part part = request.getPart("pPic");
            //out.print(part.getSubmittedFileName());
            
            Post p = new Post(pTitle, pContent, pCode, part.getSubmittedFileName(), cid, user.getId());
            BlogDao dao = new BlogDao(ConnectionProvider.getConnection());
            
            
            String path = request.getRealPath("/") + "blogPic/" + File.separator + part.getSubmittedFileName();
                helper.saveFile(part.getInputStream(), path);
                //System.out.println("done...");
            
        try {
            if (dao.savePost(p)) {
                out.println("done");
            }
            else{
                out.println("error");
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
