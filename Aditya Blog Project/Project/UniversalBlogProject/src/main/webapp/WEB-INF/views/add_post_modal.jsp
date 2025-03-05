<div class="modal fade" id="add-post-modal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel" style="color:#222831;">Provide the
						post details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<form id="add-post-form" enctype="multipart/form-data">

						<div class="form-group rows">
							<select class="form-control col-md-6" name="category">
								<option selected disabled>----Select Category----</option>

								<%
								List<Category> list = (List) session.getAttribute("categoryList");

								for (Category c : list) {
								%>
								<option value="<%=c.getCid()%>"><%=c.getName()%></option>
								<%
								}
								%>
							</select>
						</div>

						<div class="form-group">

							<input name="pTitle" type="text"
								placeholder="Enter post title..." class="form-control">

						</div>

						<div class="form-group">

							<textarea name="pContent" class="form-control"
								style="height: 200px" rows="" cols=""
								placeholder="Enter your content"></textarea>
						</div>

						<div class="form-group">

							<textarea name="pCode" class="form-control" style="height: 100px"
								rows="" cols="" placeholder="Enter your program (if any)"></textarea>
						</div>
						<div class="form-group">
							<label style="color:#222831;">Select your pic : </label> <input name="pic" type="file"
								class="form-control border-0">
						</div>


						<div class="container text-center">
							<button type="submit" class="btn btn-outline-primary">Post</button>

						</div>


					</form>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<!-- <button type="button" class="btn btn-primary">Save changes</button> -->
				</div>
			</div>
		</div>
	</div>