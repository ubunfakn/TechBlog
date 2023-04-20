/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author akn
 */
@WebServlet("/Edit")
@MultipartConfig
public class EditServlet extends HttpServlet {

    /**
     *
     * @param request
     * @param response
     * @throws IOException
     * @throws ServletException
     */
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        PrintWriter out = response.getWriter();

        //Fetching new data from Profile.jsp
        String email = request.getParameter("user_email");
        String name = request.getParameter("user_name");
        String password = request.getParameter("user_password");
        String about = request.getParameter("user_about");
        Part part = request.getPart("profile_pic");
        String imageName = part.getSubmittedFileName();

        //Fetching data from session means unedited data
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("current_user");
        user.setEmail(email);
        user.setName(name);
        user.setPassword(password);
        user.setAbout(about);
        String oldFile=user.getProfile();
        user.setProfile(imageName);

        UserDao dao = new UserDao(ConnectionProvider.getConnection());
        boolean f = dao.updateUser(user);

        if (f) {

            String path = request.getRealPath("/") + "profilePic" + File.separator + user.getProfile();
            
            String path1 = request.getRealPath("/") + "profilePic" + File.separator + oldFile;

            if(!"default.png".equals(oldFile))
            helper.deleteFile(path1);
            
            
            if (helper.saveFile(part.getInputStream(),path1)) {
                
                
                Message msg = new Message("Details Updated", "success", "alert-success");

                HttpSession s = request.getSession();
                s.setAttribute("msg", msg);

            } else {
                
                
                Message msg = new Message("Something went wrong", "error", "alert-danger");

                HttpSession s = request.getSession();
                s.setAttribute("msg", msg);
            }
        } else {
            
            
            Message msg = new Message("Something went wrong", "error", "alert-danger");

            HttpSession s = request.getSession();
            s.setAttribute("msg", msg);;
        }

        response.sendRedirect("Profile.jsp");
    }
}
