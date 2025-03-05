<%@page import="com.adi.pojo.UserInfo"%>
<%@page import="com.adi.pojo.Post"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>

<%
UserInfo u1 = (UserInfo) session.getAttribute("currentUser");
if (u1 == null) {
	response.sendRedirect("login");
}

List<UserInfo> lst = (List) request.getAttribute("users");
%>
<h1 style="color: #eee">All Users</h1>
<table class="table" style="color: #eee">
	<thead>
		<tr>
			<th scope="col">userId</th>
			<th scope="col">Name</th>
			<th scope="col">Email</th>
			<th scope="col">Registered On</th>
			<th scope="col">Actions</th>
		</tr>
	</thead>
	<tbody>
		<% for(UserInfo user1: lst) { 
			if(user1.getRole().equals("admin")) {
				continue;
			}
		%>
		<tr>
			<th scope="row"><%= user1.getId() %></th>
			<td><%= user1.getName() %></td>
			<td><%= user1.getEmail() %></td>
			<td><%= user1.getDateTime() %></td>
			<td><%if(user1.isBlocked()) { %>
					<a href="unblockuser?userId=<%= user1.getId() %>" class="btn btn-secondary" disabled>Unblock</a>
					
				<% } else {%>
					<a href="blockuser?userId=<%= user1.getId() %>" class="btn btn-danger">Block</a>
				<% } %>
			
			</td>
		</tr>
		<% } %>
	</tbody>
</table>