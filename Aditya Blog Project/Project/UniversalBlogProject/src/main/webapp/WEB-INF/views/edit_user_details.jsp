<%@page import="com.adi.pojo.UserInfo"%>
<%@page import="com.adi.pojo.Post"%>
<%@page import="java.util.List"%>
<%@page import= "java.io.File"%>

<% 
	UserInfo u1 = (UserInfo) session.getAttribute("currentUser");

%>




	<div id="profile-details table-responsive w-100">
		<div class="text-right">
		<img src="images/pics/<%=u1.getProfile()%>" class="img-fluid my-4"
							alt="users-profile" style="border-radius: 50%; max-width: 150px">
		</div>
		<h1>Please Edit carefully.</h1>
<form action="updateuser" method="post"
								enctype="multipart/form-data">
							<table class="table">

								<tbody>
									
									<tr>
										<th scope="row">ID:</th>
										<td class="text-right"><%=u1.getId()%></td>

									</tr>
									<tr>
										<th scope="row">Email:</th>
										<td class="text-right"><input type="email" name="user_email"
											class="form-control" value="<%=u1.getEmail()%>"></td>

									</tr>
									<tr>
										<th scope="row">Name:</th>
										<td class="text-right"><input type="text" name="user_name"
											class="form-control" value="<%=u1.getName()%>"></td>

									</tr>
									<tr>
										<th scope="row">Password:</th>
										<td class="text-right"><input type="text" name="user_password"
											class="form-control" value="<%=u1.getPassword()%>"></td>

									</tr>
									<tr>
										<th scope="row">Gender:</th>
										<td class="text-right"><%=u1.getGender().toUpperCase()%></td>

									</tr>
									<tr>
										<th scope="row">Status:</th>
										<td class="text-right"><textarea class="form-control" name="user_about"
												rows="3"><%=u1.getAbout()%></textarea></td>

									</tr>
									<tr>
										<th scope="row">New Profile</th>
										<td class="text-right"><input type="file" name="image"
											class="form-control border-0"></td>

									</tr>
									
								</tbody>
							</table>
							<div class="container">
									<button type="submit" class="btn btn-outline-primary">Save</button>
								</div>
							</form>
						</div>
						
		


