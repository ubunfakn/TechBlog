<%@page import="com.tech.blog.entities.User"%>
<nav class="navbar navbar-expand-lg navbar-dark primary-background">
    <h3 class="navbar-brand"><span class="fa fa-asterisk"></span>Tech Blog</h3>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="index.jsp"><span class="fa fa-bolt"></span>Learn code <span class="sr-only">(current)</span></a>
            </li>
            <!--            <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="fa fa-caret-square-o-down"></span>Categories
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="#">Programming Language</a>
                                <a class="dropdown-item" href="#">Project Implementation</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">Data Structure</a>
                            </div>
                        </li>-->

            <%
                User user = (User) session.getAttribute("current_user");
                if (user == null) {%>
            <li class="nav-item">
                <a class="nav-link" href="login.jsp"><span class="fa fa-location-arrow fa-spin"></span>Login</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="Register.jsp"><span class="fa fa-user-plus"></span>Sign up</a>
            </li>
            <% } %>
        </ul>
        <form class="form-inline my-2 my-lg-0">

            <%
                if (user != null) {%>
            <ul class="navbar-nav mr-right text-white">
                <li class="nav-item">
                    <a class="nav-link" href="Profile.jsp"><span class="fa fa-user-circle"></span><%= user.getName()%></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link mr-4" href="logout"><span class="fa fa-reply"></span>Logout</a>
                </li>
                <% }%>
            </ul>
            <input class="form-control" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0 text-white" type="submit">Search</button>
        </form>
    </div>
</nav>