<%-- 
    Document   : index
    Created on : 15-Apr-2023, 12:58:48 PM
    Author     : akn
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.dao.BlogDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>

        <link href="CSS/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <style>
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 88%, 62% 100%, 32% 89%, 0 100%, 0 0);
            }
        </style>
    </head>
    <body>

        <!--navbar-->
        <%@include file="navbar.jsp" %>

        <div class="container-fluid p-0 m-0">
            <div class="jumbotron primary-background text-white banner-background">
                <div class="container">
                    <h3 class="display-3">Welcome to TechBlog</h3>
                    <p>Welcome to technical blog, world of technology
                    </p>
                    In this TechBlog you will get to know about Programming I've included some blogs from popular websites and provided a separate section where you can post your own problem/solution.
                    <p>
                        Hope you’ll find it useful 🙂
                    </p>
                    <br>

                    <a href="Register.jsp"><button class="btn-outline-light btn-lg"><span class="fa fa-laptop"></span>Start ! its Free</button><a>
                    <a href="login.jsp" class="btn-outline-light btn-lg"><span class="fa fa-location-arrow fa-spin"></span>Login</a>
                </div>
            </div>


        </div>

        <div class="container">
            <div class="row">
                <%
                            BlogDao dao = new BlogDao(ConnectionProvider.getConnection());
                            ArrayList<Category> list = dao.getAllCategories();
                             int count = 0;
                             for (Category cat : list) 
                             {%>
                <div class="col-md-4">
                    
                    <div class="card">
                            
                        <div class="card-body">
                            <h5 class="card-title"><%= cat.getName()%></h5>
                            <p class="card-text"><%= cat.getDescription()%></p>
                            <a href="blogPage.jsp?catId=<%= cat.getCid() %>" class="btn primary-background text-white">Read More</a>
                        </div>
                        
                    </div>

                </div>
                        <% } %>
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
