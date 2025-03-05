<%@page import="com.adi.pojo.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page errorPage="error"%>

<%@page import="java.sql.*"%>

<% 
UserInfo user = (UserInfo) session.getAttribute("currentUser");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP Page</title>

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
			background-color: #212121;
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
	<%@include file="normal_navbar.jsp"%>

	<!-- banner -->

	<div class="container-fluid p-0 m-0">

		<div class="jumbotron primary-background banner-background text-white">
			<div class="container">
				<h3 class="display-3">Welcome to BlogSphere – Where Ideas Take Flight! 🚀</h3>
				<p>In a world full of voices, your thoughts deserve to be heard. BlogSphere is a dynamic platform designed for writers, thinkers, and storytellers to share their ideas, experiences, and knowledge with a like-minded community. Whether you're an aspiring blogger, a passionate writer, or someone who simply enjoys reading engaging content, BlogSphere provides the perfect space to express yourself. 

</p>
				<p>At BlogSphere, we believe in the power of words to connect, inspire, and spark conversations. With a structured, user-friendly interface, seamless blog management, and a dedicated admin system for a safe and positive environment, you can focus on what truly matters – sharing your voice. Join us today and be a part of a growing network of bloggers shaping the digital narrative!</p>
				<% if(user == null) {%>
				<a href="register" class="btn btn-outline-light btn-lg">
					<span class="fa fa-user-plus"></span> Start! its Free
				</a>
				<a href="login" class="btn btn-outline-light btn-lg">
					<span class="fa fa-user-circle fa-spin"></span> Login
				</a>
				<% }%>
			</div>
		</div>

	</div>

	<br>

	<!-- cards -->

	<div class="container mb-5">

		<div class="row mb-2">
			<!-- posts -->
					
					

					<!-- posts -->
					
					<div class="container text-center" id="loader" >
						<i class="fa fa-refresh fa-4x fa-spin"></i>
						<h3 class="mt-2">Loading...</h3>
					</div>
					
					<div class="container-fluid" id="post-container">
						
					</div>
					
					

				
		</div>
		
		

	</div>
	<!--footer starts from here-->
	<%@include file="footer.jsp" %>



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

	<script src="js/myjs.js" type="text/javascript"></script>
	
	<script>
	
		function getPosts(catId, temp) {
			
			$("#loader").show();
			$("#post-container").hide();
			
			$(".c-link").removeClass('active');
			$.ajax({
				url: "loadposts",
				data: {cid: catId},
				success: function (data, textStatus, jqXHR) {
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

	<script>
		
	</script>
</body>
</html>