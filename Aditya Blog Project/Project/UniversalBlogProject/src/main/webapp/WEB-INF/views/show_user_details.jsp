<%@page import="com.adi.pojo.UserInfo"%>
<%@page import="com.adi.pojo.Post"%>
<%@page import="java.util.List"%>
<%@page import= "java.io.File"%>

<% 
	UserInfo u1 = (UserInfo) session.getAttribute("currentUser");
	if(u1 == null) {
		response.sendRedirect("login");
	}
%>




	<div id="profile-details table-responsive w-100">
		<div class="text-right">
		<img src="images/pics/<%=u1.getProfile()%>" class="img-fluid my-4"
							alt="users-profile" style="border-radius: 50%; max-width: 150px">
		</div>
	

							<table class="table" style="color: #eee">

								<tbody>
									<tr>
										<th scope="row" colspan="2" class="text-right"><h1><%= u1.getName() %>
											<% if(u1.getRole().equals("admin")) {
												out.print(" (admin)");
											}
												%>
											
											
										</h1></th>
									</tr>
									<tr>
										<th scope="row">ID:</th>
										<td class="text-right"><%=u1.getId()%></td>

									</tr>
									<tr>
										<th scope="row">Email:</th>
										<td class="text-right"><%=u1.getEmail()%></td>

									</tr>
									<tr>
										<th scope="row">Gender:</th>
										<td class="text-right"><%=u1.getGender()%></td>

									</tr>
									<tr>
										<th scope="row">Status:</th>
										<td class="text-right"><%=u1.getAbout()%></td>

									</tr>
									<tr>
										<th scope="row">Registered on:</th>
										<td class="text-right"><%=u1.getDateTime()%></td>

									</tr>
									
								</tbody>
							</table>
						</div>
						
						<div class="rows text-right">
							<a onclick="getPages(1, this)" href="#" id="edit-profile-button" type="button"
						class="c-link btn btn-primary mr-4">EDIT</a>
							<a href="deleteuser?uid=<%= u1.getId() %>" id="delete-profile-button" type="button"
						class="btn btn-danger">DELETE</a>
						</div>


