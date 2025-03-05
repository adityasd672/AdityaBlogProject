<%@page import="com.adi.pojo.Category"%>
<%@page import="com.adi.pojo.UserInfo"%>
<%@page import="com.adi.pojo.Post"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>

<%
UserInfo u1 = (UserInfo) session.getAttribute("currentUser");
if (u1 == null) {
	response.sendRedirect("login");
}
List<Category> list1 = (List) session.getAttribute("categoryList");
%>

<h1 style="color: #eee">Add category: </h1>
<form action="addcategory" method="post" style="color: #eee" class="mb-4">
  <div class="form-group">
    <label for="catName">Category Name</label>
    <input type="text" class="form-control" id="catName"  placeholder="Enter new category" name="catName" required>
  </div>
  <div class="form-group">
    <label for="catDescription">Category description:</label>
    <input type="text" class="form-control" id="catDescription" placeholder="Enter description" name="catDescription" required>
  </div>
  <button type="submit" class="btn btn-primary">Submit</button>
</form>
<h1 style="color: #eee">Categories</h1>
<table class="table" style="color: #eee">
	<thead>
		<tr>
			<th scope="col">catId</th>
			<th scope="col">Name</th>
			<th scope="col">Description</th>
			
			<th scope="col">Actions</th>
		</tr>
	</thead>
	<tbody>
		<% for(Category cat: list1) { 
			
		%>
		<tr>
			<th scope="row"><%= cat.getCid() %></th>
			<td><%= cat.getName() %></td>
			<%
						int wordLimit = 5;
						String content = cat.getDescription();
						String [] words = content.split("\\s+");
						String shortContent = content;
						if(words.length > wordLimit) {
							shortContent = String.join(" ", java.util.Arrays.copyOfRange(words, 0, wordLimit)) + "...";
						}
					%>
			<td><%= shortContent %></td>
			<td>
					<a href="deletecategory?catId=<%= cat.getCid() %>" class="btn btn-danger">Delete</a>
				
			
			</td>
		</tr>
		<% } %>
	</tbody>
</table>