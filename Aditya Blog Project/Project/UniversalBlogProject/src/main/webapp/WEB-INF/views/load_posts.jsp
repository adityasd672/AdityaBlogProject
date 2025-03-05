<%@page import="com.adi.pojo.UserInfo"%>
<%@page import="com.adi.pojo.Post"%>
<%@page import="java.util.List"%>
<%@page import= "java.io.File"%>

<% 
	UserInfo u1 = (UserInfo) session.getAttribute("currentUser");

%>


<div class="row">

<%
	
	List<Post> posts = (List) request.getAttribute("posts");
	
	if(posts.isEmpty()) {
		out.println("<h3 class='display-3 text-center'>No post available.</h3>");
		return;
	}
	
	/* for(Post p: posts) { */
		for(int i = posts.size()-1; i>=0; i--) {
			Post p = posts.get(i);
		
		
		%>
		
		<div class="col-md-6 mt-2">
			<div class="card">
				 <img src="images/blog_pics/<%= p.getpPic() %>" class="card-img-top" alt="...">
				
				<div class="card-body">
					<b style="color: #222831;"><%= p.getpTitle() %></b>
					<%
						int wordLimit = 20;
						String content = p.getpContent();
						String [] words = content.split("\\s+");
						String shortContent = content;
						if(words.length > wordLimit) {
							shortContent = String.join(" ", java.util.Arrays.copyOfRange(words, 0, wordLimit)) + "...";
						}
					%>
					<p style="color: #222831;"> <%= shortContent %></p>
				</div>
				
				<div class="card-footer primary-background text-center">
					
					
					<% if(u1 != null) {%>
					<a href="#!" onClick="doLike(<%= p.getPid() %>, <%= u1.getId() %>)" class="btn btn-outline-light btn-sm"> <i class="fa fa-thumbs-o-up"> <span class="like-counter-<%= p.getPid() %>"><%= request.getAttribute("likeCount_"+p.getPid()) %></span></i></a>
					<a href="blogpage?pid=<%= p.getPid() %>" class="btn btn-outline-light btn-sm"> Read More..</a>
					<a href="#!" class="btn btn-outline-light btn-sm"> <i class="fa fa-commenting-o"> <span><%= request.getAttribute("commentCount_"+p.getPid()) %></span></i></a>				
					<% } else { %>
						<a href="login" class="btn btn-outline-light btn-sm">Login to Read this blog...</a>
					<% }
					%>
				
				</div>
			
			
			</div>
		
		</div>
		
		
		<%
		
	}



%>

</div>