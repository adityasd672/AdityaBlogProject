<%@page import="com.adi.pojo.Comment"%>
<%@page import="com.adi.pojo.UserInfo"%>
<%@page import="com.adi.pojo.Post"%>
<%@page import="java.util.List"%>
<%@page import= "java.io.File"%>

<% 
	UserInfo u1 = (UserInfo) session.getAttribute("currentUser");
if (u1 == null) {
	response.sendRedirect("login");
}
%>


<div class="row">

<%
	
	List<Comment> comments = (List) request.getAttribute("comments");
	
	if(comments.isEmpty()) {
		out.println("<h3 class='display-3 text-center' style='color: #eee;'>No comments for this post.</h3>");
		return;
	}
%>
	<div class="col-md-12 my-2 border-bottom border-light">
		<h1 style="color: #fff"> Comments (<%= comments.size() %>): </h1>
	</div>
<%
	
	for(Comment c: comments) {
		
		%>
		
		<div class="col-md-6 mt-2">
			<div class="card">
				
				<div class="card-body">
					<h3><%= c.getUser().getName() %></h3>
					<p> <%= c.getcContent() %></p>
				</div>
				<% if(u1.getId() == c.getUser().getId() || u1.getRole().equals("admin")) {%>
				<div class="card-footer">
					
					
					
					<a href="deletecomment?comid=<%= c.getComId() %>" class="btn btn-outline-dark btn-sm"> Delete</a>		
					
				
				</div>
			
			<% } %>
			</div>
		
		</div>
		
		
		<%
		
	}



%>

</div>