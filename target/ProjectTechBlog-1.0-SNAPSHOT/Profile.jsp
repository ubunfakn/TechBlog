<%-- 
    Document   : Profile
    Created on : 16-Apr-2023, 11:29:07 AM
    Author     : akn
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.dao.BlogDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="Error.jsp" %>


<!-- Getting user from session-->
<%
    User user = (User) session.getAttribute("current_user");
    if (user == null) {
        response.sendRedirect("login.jsp");
    }
%>
<!--End of Getting user from session-->

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile Page</title>

        <link href="CSS/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <style>
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 88%, 62% 100%, 32% 89%, 0 100%, 0 0);
            }
        </style>
    </head>
    <body style="background:url(Images/9.webp); background-size: cover; background-attachment: fixed">


        <!-- Start of NavBar -->
        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
            <a class="navbar-brand" href="index.jsp"><span class="fa fa-asterisk"></span>Tech Blog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="index.jsp"><span class="fa fa-bolt"></span>Learn code <span class="sr-only">(current)</span></a>
                    </li>
                    
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="modal" data-target="#addpost"><span class="fa fa-file-text"></span>Do Post</a>
                    </li>
                    
                </ul>

                <ul class="navbar-nav mr-right text-white">
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="modal" data-target="#profile-modal" href="#"><span class="fa fa-user-circle"></span><%= user.getName()%></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="logout"><span class="fa fa-reply"></span>Logout</a>
                    </li>
                </ul>
            </div>
        </nav>
        <!-- End of NavBar -->

        <!-- Feting categories for Do Post -->
        <%
            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);
        %>


        <%
            Message m = (Message) session.getAttribute("msg");
            if (m != null) {
        %>
        <div class="alert <%= m.getCssClass()%> text-center" role="alert">
            <%= m.getContent()%>
        </div>
        <%
                session.removeAttribute("msg");
            }
        %>
        <!-- End of JAVA Scriplet-->


        <!-- main body of the profile page-->
        <main>
            <div class="container">
                <div class="row mt-4">
                    <div class="col-md-4">
                        <!--First column of categories-->
                        <div class="list-group">
                            <a href="#" onclick="getPosts(0, this)" class="c-link list-group-item list-group-item-action active" aria-current="true">
                                All Posts
                            </a>


                            <%
                                BlogDao da = new BlogDao(ConnectionProvider.getConnection());
                                ArrayList<Category> list1 = da.getAllCategories();
                                for (Category cc : list1) {
                            %>
                            <a href="#" onClick="getPosts(<%= cc.getCid()%>, this)" class="c-link list-group-item list-group-item-action "><%= cc.getName()%></a>
                            <% }
                            %>

                        </div>

                    </div>
                    <div class="col-md-8">
                        <!--second column of posts-->
                        <div class="container text-center" id="loader">
                            <i class="fa fa-refresh fa-2x fa-spin"></i>
                            <h3 mt-2>Loading.....</h3>
                        </div>
                        <div class="container-fluid" id="post-container">

                        </div>

                    </div>
                </div>
            </div>
        </main>
        <!--end of main body of the profile page-->


        <!--profile modal-->
        <div class="modal fade" id="profile-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header primary-background text-white">
                        <h1 class="modal-title fs-5 text-center" style="font-size:25px" id="exampleModalLabel">TechBlog</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">
                            <img src="profilePic/<%= user.getProfile()%>" class="img-fluid" style="border-radius:50%; max-width: 150px;max-height: 200px" />
                            <h5 class="modal-title fs-5 text-center mt-3" style="font-size:25px" id="exampleModalLabel"><%= user.getName()%></h5>

                            <!-- table start-->

                            <div id="profile-detail">
                                <table class="table">

                                    <tbody>
                                        <tr>
                                            <th scope="row">ID</th>
                                            <td><%= user.getId()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">E-mail</th>
                                            <td><%= user.getEmail()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Gender</th>
                                            <td><%=user.getGender()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Status</th>
                                            <td><%=user.getAbout()%></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                            <!--table end-->

                            <!--EDit profile modal--->
                            <div id="profile-edit" style="display:none">
                                <h4 class="mt-2">Please Edit carefully</h4>
                                <form action="Edit" method="post" enctype="multipart/form-data">
                                    <table class="table">
                                        <tr>
                                            <td>ID :</td>
                                            <td><%= user.getId()%></td>
                                        </tr>
                                        <tr>
                                            <td>E-Mail :</td>
                                            <td><input type="email" class="form-control" name="user_email" value="<%= user.getEmail()%>"<</td>
                                        </tr>
                                        <tr>
                                            <td>Name :</td>
                                            <td><input type="text" class="form-control" name="user_name" value="<%= user.getName()%>"<</td>
                                        </tr>
                                        <tr>
                                            <td>Password :</td>
                                            <td><input type="password" class="form-control" name="user_password" value="<%= user.getPassword()%>"<</td>
                                        </tr>
                                        <tr>
                                            <td>Gender :</td>
                                            <td><%= user.getGender().toUpperCase()%></td>
                                        </tr>
                                        <tr>
                                            <td>About :</td>
                                            <td>
                                                <textarea class="form-control" rows="4" name="user_about"><%= user.getAbout()%></textarea>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>New Profile :</td>
                                            <td>
                                                <input type="file" name="profile_pic" class="form-control">
                                            </td>
                                        </tr>
                                    </table>
                                    <div class="container">
                                        <button type="submit" class="btn btn-outline-primary">Save</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button id="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
                    </div>
                </div>
            </div>
        </div>
        <!--End of profile edit modal-->


        <!--Add post modal-->
        <div class="modal fade" id="addpost" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Provide the post details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="addpostform" action="addpostservlet" method="post">
                            <div class="form-group">
                                <select class="form-control" name="Cid">
                                    <option selected disabled>---Select Category---</option>

                                    <%
                                        BlogDao dao = new BlogDao(ConnectionProvider.getConnection());
                                        ArrayList<Category> list = dao.getAllCategories();
                                        for (Category c : list) {
                                            String desc = c.getDescription();
                                    %>
                                    <option value="<%= c.getCid()%>"><%= c.getName()%></option>
                                    <% }%>
                                </select>
                            </div>

                            <div class="form-group">
                                <input type="text" placeholder="Enter post title" class="form-control" name="pTitle"/>
                            </div>

                            <div class="form-group">
                                <textarea class="form-control" style="height: 200px" placeholder="Enter your content" name="pContent"></textarea>
                            </div>
                            <div class="form-group">
                                <textarea class="form-control" style="height: 200px" placeholder="Enter your Program(If any)" name="pCode"></textarea>
                            </div>
                            <div class="form-group">
                                <label>Select your pic</label>
                                <br>
                                <input type="file" name="pPic"/>
                            </div>


                            <div class="container text-center">
                                <button type="submit" class="btn btn-outline-primary">Post</button>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>
        <!--End of post modal-->



        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"/>
        <script src="JS/myJS.js" type="text/javascript"></script>


        <!--Profile button and edit--> 
        <script>
                                $(document).ready(function () {

                                    let editStatus = false;


                                    $('#edit-profile-button').click(function ()
                                    {

                                        if (editStatus === false)
                                        {
                                            $("#profile-detail").hide();

                                            $("#profile-edit").show();

                                            editStatus = true;

                                            $(this).text("Back");
                                        } else
                                        {
                                            $("#profile-detail").show();

                                            $("#profile-edit").hide();

                                            editStatus = false;

                                            $(this).text("Edit");
                                        }

                                    });
                                });
        </script>

        <!-- add post Js-->
        <script>
            $(document).ready(function (e) {

                $("#addpostform").on("submit", function (event) {
                    //This means form is submitted
                    event.preventDefault();
                    console.log("Submiting...");

                    let form = new FormData(this);

                    //now requestiong to server

                    $.ajax({
                        url: "addpostservlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            //Success...

                            console.log(data);

                            if (data.trim() == 'done')
                            {
                                swal("Post Uploaded", "Saved Successfully", "success");
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            //error....

                            swal("Error!!", "Something went wrong", "error");
                        },

                        processData: false,
                        contentType: false


                    });

                });


            });
        </script>


        <!-- loading posts-->
        <script>

            function getPosts(catId, temp) {
                $("#loader").show();
                $("#post-container").hide();

                $(".c-link").removeClass('active');

                $.ajax({
                    url: "LoadPost.jsp",
                    data: {cid: catId},

                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        $("#loader").hide();
                        $("#post-container").show();
                        $("#post-container").html(data);

                        $(temp).addClass('active');
                    }
                });
            }
            
            $(document).ready(function(e){
                let ref=$('.c-link')[0]
                getPosts(0,ref);
            })
            
        </script>


    </body>
</html>
