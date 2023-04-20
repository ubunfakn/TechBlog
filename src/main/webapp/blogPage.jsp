<%-- 
    Document   : blogPage
    Created on : 18-Apr-2023, 10:28:28 PM
    Author     : akn
--%>

<%@page import="com.tech.blog.dao.likeDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.dao.BlogDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Blog Page</title>
        <link href="CSS/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        
        <script src="JS/myJS.js" type="text/javascript"></script>
        <style>
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 88%, 62% 100%, 32% 89%, 0 100%, 0 0);
            }
        </style>
    <div id="fb-root"></div>
</head>
<body style="background:url(Images/9.webp); background-size: cover; background-attachment: fixed">

    
    <script src="JS/myJS.js" type="text/javascript"></script>
    <%@include file="navbar.jsp" %>
    <div class="container">
        <div class="row">

            <%
                int catId = Integer.parseInt(request.getParameter("catId"));
                BlogDao dao = new BlogDao(ConnectionProvider.getConnection());
                likeDao ld=new likeDao(ConnectionProvider.getConnection());
                ArrayList<Post> list = dao.getPostByCatId(catId);
                if (list.size() == 0) {%>
            <div class="container text-center mt-4">
                <br><br><br><h2 style="font-size: 50px; font-family: serif">No Posts Yet...</h2>
            </div>
            <% return;
                        }
                        for (Post p : list) {%>
            <div class="col-md-4 mt-4">
                <div class="card mt-4 mb-4" style="height: 500px;word-wrap: break-word;">
                    <img src="blogPic/<%= p.getpPic()%>" class="card-img-top" alt="...">
                    <div class="card-body" style="height: 100px;word-wrap: break-word">
                        <b><%= p.getpTitle()%></b>
                        <p><%= p.getpContent()%></p>
                    </div>
                    <div class="card-footer text-center primary-background">

                        <%
                            User us = (User) session.getAttribute("current_user");
                            if (us != null) {%>
                        <a href="#" onclick="doLike(<%= p.getpId()%>, <%= user.getId()%>)" class="btn btn-outline-light btn-small text-center"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%= ld.countLikeOnPost(p.getpId())%></span></a>

                        <a href="show_blog.jsp?post_id=<%= p.getpId()%>" class="btn btn-outline-light btn-small text-center">Read More..</a>
                        <a href="#" class="btn btn-outline-light btn-small text-center"><i class="fa fa-commenting-o"></i><span>100</span></a>
                                <% } else {%>
                        <a href="show_blog.jsp?post_id=<%= p.getpId()%>" class="btn btn-outline-light btn-small text-center">Read More..</a>
                        <% } %>
                    </div>
                </div>
            </div>
            <%}
            %>
        </div>
    </div>
</div>
</div>






<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="JS/myJS.js" type="text/javascript"></script>
</body>
</html>
