<%-- 
    Document   : show_blog
    Created on : 18-Apr-2023, 5:26:28 PM
    Author     : akn
--%>

<%@page import="com.tech.blog.dao.likeDao"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.dao.BlogDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.entities.User"%>
<%
    int postId = Integer.parseInt(request.getParameter("post_id"));
//    User user = (User) session.getAttribute("current_user");
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Blogs Page</title>

        <link href="CSS/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <style>
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 88%, 62% 100%, 32% 89%, 0 100%, 0 0);
            }
        </style>
        <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v16.0" nonce="OXBjeChu"></script>
    </head>
    <body style="background:url(Images/9.webp); background-size: cover; background-attachment: fixed">

        <div id="fb-root"></div>
        <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v16.0" nonce="p8bzfjQp"></script>
         <script src="myJS.js" type="text/javascript"></script>

       
        
        <%@include file="navbar.jsp" %>
        <%
            BlogDao dao = new BlogDao(ConnectionProvider.getConnection());
            Post post = dao.getPostByPostId(postId);
            UserDao uDao = new UserDao(ConnectionProvider.getConnection());
            User use = uDao.getUserByUserId(post.getUid());
            likeDao ld = new likeDao(ConnectionProvider.getConnection());
            Category cat = dao.getCategoryBYCategoryId(post.getCatId());
            if (use == null || cat == null)
                out.println(post.getCatId());
        %>
        <div class="container text-center mr-4 ml-8" style="align-content: center; margin-top: 40px;">   
            <div class="row">
                <div class="container">
                </div>
                <div class="col-md-8 mt-1 mb-4 ml-8 mr-8">

                    <div class="card text-center" style=height: auto;">
                        <div class="card-header text-dark primary-background text-white">
                            <h4 class="text-left mt-4 text-white"><%= post.getpTitle()%></h4>
                            <h6 class="text-right mt-8 text-white" style="font-size: 16px;">Posted by<a href="#" class="text-white"> <%= use.getName()%></a></h6>
                        </div>
                        <img src="blogPic/<%= post.getpPic()%>" class="card-img-top " alt="...">
                        <div class="card-body text-Dark" height: auto ">

                            <br>
                            <h5 class="text-left"><%= post.getpContent()%></h5>
                            <br>
                            <h5 class="text-left"><%= post.getpCode()%></h5>
                        </div>
                        <div class="card-footer primary-background text-white text-left">
                            <%
                                User us = (User) session.getAttribute("current_user");
                                if (us != null) {%>
                            <a href="#" onclick="doLike(<%= post.getpId()%>, <%= user.getId()%>)" class="btn btn-outline-light btn-small text-center"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%= ld.countLikeOnPost(post.getpId())%></span></a>
                            <a href="#" class="btn btn-outline-light btn-small text-center"><i class="fa fa-commenting-o"></i><span>100</span></a>
                                    <% } else { %>
                                    <% }%>

                        </div>
                        <div class="card-footer">        
                            <div class="fb-comments" data-href="https://developers.facebook.com/docs/plugins/comments#configurator" data-width="" data-numposts="1"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End of NavBar -->

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"/>




    </body>
</html>
