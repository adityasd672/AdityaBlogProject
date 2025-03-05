<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header primary-background text-white text-center">
					<h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container text-center">

						<img src="images/pics/<%=user.getProfile()%>" class="img-fluid"
							alt="users-profile" style="border-radius: 50%; max-width: 150px">
						<h5 class="modal-title mt-3" id="exampleModalLabel" style="color: #222831;"><%=user.getName()%></h5>
						<!-- details -->

						<div id="profile-details">

							<table class="table">

								<tbody>
									<tr>
										<th scope="row">ID:</th>
										<td><%=user.getId()%></td>

									</tr>
									<tr>
										<th scope="row">Email:</th>
										<td><%=user.getEmail()%></td>

									</tr>
									<tr>
										<th scope="row">Gender:</th>
										<td><%=user.getGender()%></td>

									</tr>
									<tr>
										<th scope="row">Status:</th>
										<td><%=user.getAbout()%></td>

									</tr>
									<tr>
										<th scope="row">Registered on:</th>
										<td><%=user.getDateTime()%></td>

									</tr>
									<tr>
										<th scope="row">Open <% if(user.getRole().equals("admin")) { 
											out.print("dashboard");
											
										} else {
											out.print("Profile");
										}
										%>: </th>
										<td><a href="openprofile"><% if(user.getRole().equals("admin")) { 
											out.print("Dashboard");
											
										} else {
											out.print("Profile");
										}
										%></a></td>

									</tr>
								</tbody>
							</table>
						</div>

						<!-- profile edit -->

						<div id="profile-edit" style="display: none">
							<h3 class="mt-2" style="color: #222831;">Please Edit carefully</h3>
							<form action="updateuser" method="post"
								enctype="multipart/form-data">
								<table class="table">

									<tr>
										<th scope="row">ID:</th>
										<td><%=user.getId()%></td>
									</tr>
									<tr>
										<th scope="row">Email:</th>
										<td><input type="email" name="user_email"
											class="form-control" value="<%=user.getEmail()%>"></td>
									</tr>
									<tr>
										<th scope="row">Name:</th>
										<td><input type="text" name="user_name"
											class="form-control" value="<%=user.getName()%>"></td>
									</tr>
									<tr>
										<th scope="row">Password:</th>
										<td><input type="text" name="user_password"
											class="form-control" value="<%=user.getPassword()%>"></td>
									</tr>

									<tr>
										<th scope="row">Gender:</th>
										<td><%=user.getGender().toUpperCase()%></td>
									</tr>
									<tr>
										<th scope="row">About:</th>
										<td><textarea class="form-control" name="user_about"
												rows="3"><%=user.getAbout()%></textarea></td>
									</tr>
									<tr>
										<th scope="row">New profile:</th>
										<td><input type="file" name="image"
											class="form-control border-0"></td>
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
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button id="edit-profile-button" type="button"
						class="btn btn-primary">EDIT</button>
				</div>
			</div>
		</div>
	</div>