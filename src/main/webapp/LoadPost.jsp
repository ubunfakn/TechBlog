<%@page import="com.tech.blog.dao.likeDao"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.dao.BlogDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>




<script src="myJS.js" type="text/javascript"></script>


<div class="row">
    <%
        Thread.sleep(1000);
        BlogDao d1 = new BlogDao(ConnectionProvider.getConnection());
        ArrayList<Post> post = null;
        likeDao ld = new likeDao(ConnectionProvider.getConnection());
        User user = (User) session.getAttribute("current_user");

        int cid = Integer.parseInt(request.getParameter("cid"));
        if (cid == 0) {
            post = d1.getAllPosts();
        }
        if (cid > 0) {
            post = d1.getPostByCatId(cid);
        }
        if (post.size() == 0) {%>
    <div class="container text-center" style="">
        <h5 class="mt-20" style="font-size: 40px; font-family: serif;">No Posts Yet.......</h5>
    </div> 
    <%return;
        }
        for (Post p : post) {
    %>

    <div class="col-md-6 mt-2" style="">
        <div class="card" style="height: 500px;">
            <img src="blogPic/<%= p.getpPic()%>" class="card-img-top" alt="...">
            <div class="card-body" style="height: 350px;">
                <b><%= p.getpTitle()%></b>
                <p><%= p.getpContent()%></p>
            </div>
            <div class="card-footer text-center primary-background">

                <a href="#!" onClick="doLike(<%= p.getpId()%>, <%= user.getId()%>)" class="btn btn-outline-light btn-small text-center"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%= ld.countLikeOnPost(p.getpId())%></span></a>
                <a href="show_blog.jsp?post_id=<%= p.getpId()%>" class="btn btn-outline-light btn-small text-center">Read More..</a>
                <a href="#" class="btn btn-outline-light btn-small text-center"><i class="fa fa-commenting-o"></i><span>20</span></a>
            </div>
        </div>
    </div>

    <%
        }
    %>
</div>
