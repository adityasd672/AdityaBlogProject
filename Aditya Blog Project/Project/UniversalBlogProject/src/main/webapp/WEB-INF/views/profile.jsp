<%@page import="java.util.List"%>
<%@page import="com.adi.daoimpl.PostDaoImpl"%>
<%@page import="com.adi.dao.PostDao"%>
<%@page import="com.adi.pojo.Category"%>
<%@page import="java.util.ListIterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.adi.pojo.Message"%>
<%@page import="com.adi.pojo.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="error"%>

<%
UserInfo user = (UserInfo) session.getAttribute("currentUser");
if (user == null) {
	response.sendRedirect("login");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TechSoft</title>

<!-- css -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<link href="css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
.banner-background {
	clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 90%, 69% 85%, 35% 95%, 0 91%, 0 0);
}

body {
			background-color: #222831;
			color: #EEEEEE;
		}
		.card-img-top {
    width: 100%; /* Makes sure the image takes full width of the card */
    height: 200px; /* Set a fixed height */
    object-fit: cover; /* Ensures the image covers the area without distortion */
   /*  border-radius: 5px; */ /* Optional: Adds rounded corners */
}

</style>
<link href="css/footer.css" rel="stylesheet" type="text/css">
</head>
<body>

	<!-- navbar -->

	<%@include file="main_navbar.jsp" %>

	<!-- 	end of navbar -->

	<%
	Message m = (Message) session.getAttribute("msg");
	if (m != null) {
	%>
	<div class="alert <%=m.getCssClass()%> alert-dismissible fade show" role="alert">
		<%=m.getContent()%>
		<button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
	</div>
	<%
	session.removeAttribute("msg");

	}
	%>

<!-- 	main body of the page -->


	<main class="mb-5">
		<div class="container">
			<div class="row mt-4">
				<!-- first col -->

				<div class="col-md-4">

					<!-- categories -->

					<div class="list-group">
						<h2>Categories</h2>
						<a href="#" onclick="getPosts(0, this)" class="c-link list-group-item list-group-item-action list-group-item-dark active" aria-current="true">All Posts</a> 
							
							<%
							List<Category> list1 = (List) session.getAttribute("categoryList");
								for(Category cc: list1) { %>
									<a href="#" onclick="getPosts(<%= cc.getCid() %>, this)" class="c-link list-group-item list-group-item-action list-group-item-dark"><%= cc.getName() %></a>
								<%}
							
							
							%>
						
						 
					</div>

				</div>

				<!-- 	second col -->
				<div class="col-md-8">

					<!-- posts -->
					
					<div class="container text-center" id="loader" >
						<i class="fa fa-refresh fa-4x fa-spin"></i>
						<h3 class="mt-2">Loading...</h3>
					</div>
					
					<div class="container-fluid" id="post-container">
						
					</div>
					
					

				</div>


			</div>

		</div>
	</main>



	<!-- 	end main body of the page -->




	<!-- profile modal -->

	<%@include file="profile_modal.jsp" %>

	<!-- end of profile modal -->


	<!-- add post modal -->

	<%@include file="add_post_modal.jsp" %>
	
<%@include file="footer.jsp" %>


	<!-- end post modal -->

	<!-- javascripts -->
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"
		integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"
		integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>

	<script src="js/myjs.js" type="text/javascript"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			let editStatus = false;

			$("#edit-profile-button").click(function() {

				// Toggle logic
				if (editStatus == false) {
					$("#profile-details").hide();
					$("#profile-edit").show();
					editStatus = true;
					$(this).text("Back");
				} else {
					$("#profile-details").show();
					$("#profile-edit").hide();
					editStatus = false;
					$(this).text("EDIT");
				}

			})
		})
	</script>

	<!-- now add post js -->

	<script type="text/javascript">
		$(document)
				.ready(
						function(e) {
							// 
							$("#add-post-form")
									.on(
											"submit",
											function(event) {
												// this code gets called when form is submitted...
												event.preventDefault();
												let form = new FormData(this);

												// now requesting to server
												$
														.ajax({
															url : "addpost",
															type : "POST",
															data : form,
															success : function(
																	data,
																	textStatus,
																	jqXHR) {
																// success...
																console
																		.log(data);
																if (data.trim() == 'done') {
																	swal(
																			"Good job!",
																			"Saved Successfully!",
																			"success");
																} else {
																	swal(
																			"Error!",
																			"Something went wrong try again...",
																			"error");
																}
															},
															error : function(
																	jqXHR,
																	textStatus,
																	errorThrown) {
																// error...
																swal(
																		"Error!",
																		"Something went wrong try again...",
																		"error");
															},

															processData : false,
															contentType : false
														// kyunki form mein photo bhi hain
														})
											})
						})
	</script>

	<!-- loading post using ajax -->
	<script>
		function getPosts(catId, temp) {

			$("#loader").show();
			$("#post-container").hide();

			$(".c-link").removeClass('active');
			$.ajax({
				url : "loadposts",
				data : {
					cid : catId
				},
				success : function(data, textStatus, jqXHR) {
					console.log(data);
					$("#loader").hide();
					$("#post-container").show();
					$("#post-container").html(data);
					$(temp).addClass('active');
				}
			})
		}
		$(document).ready(function(e) {
			let allPostRef = $('.c-link')[0];
			getPosts(0, allPostRef);

		})
	</script>


</body>
</html>
