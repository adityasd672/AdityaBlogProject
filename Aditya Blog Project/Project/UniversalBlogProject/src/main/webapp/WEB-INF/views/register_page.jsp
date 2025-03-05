<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Page.</title>

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

}
</style>
</head>
<body>

	<%@include file="normal_navbar.jsp"%>


	<main class="primary-background banner-background "
		style="padding-bottom: 150px;">

		<div class="container ">

			<div class="col-md-6 offset-md-3">

				<div class="card">

					<div class="card-header text-center primary-background text-white">
						<span class="fa fa-user-circle fa-3x"></span> <br> Register
						here

					</div>
					<div class="card-body" style="color: #222831 !important;">
						<form:form modelAttribute="modelObj" id="reg-form">


							<div class="form-group">
								<label for="name">User Name</label>
								<form:input path="name" name="name" type="text"
									class="form-control" id="user_name" required="true"
									aria-describedby="emailHelp" />
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label>
								<form:input path="email" name="email" type="email"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="true"/>
								<small id="emailHelp" class="form-text text-muted">We'll
									never share your email with anyone else.</small>
							</div>




							<div class="form-group">
								<label for="exampleInputPassword1">Password</label>
								<form:input path="password" name="password"
									class="form-control" type="password" id="exampleInputPassword1" required="true"/>
									<small id="passwordHelp"
										class="form-text text-muted">Password must be at least 8 characters long, with at least one uppercase letter, one lowercase letter, one number, and one special character.</small>
							</div>

							<div class="form-group">
								<label>Select Gender</label> <br>
								<div class="form-check form-check-inline">
									<form:radiobutton path="gender" name="gender" value="male"
										cssClass="form-check-input" id="genderMale" required="true"/>
									<label class="form-check-label" for="genderMale" >Male</label>
								</div>
								<div class="form-check form-check-inline">
									<form:radiobutton path="gender" name="gender" value="female"
										cssClass="form-check-input" id="genderFemale" required="true"/>
									<label class="form-check-label" for="genderFemale" >Female</label>
								</div>
							</div>

							<div class="form-group">
								<form:textarea path="about" name="about" class="form-control"
									rows="5" placeholder="Enter something about yourself" />
							</div>

							<div class="form-group form-check">
								<form:checkbox path="agreedTerms" name="agreedTerms" class="form-check-input"
									id="exampleCheck1" />
								<label class="form-check-label" for="exampleCheck1">Agree
									to Terms and Conditions</label>
							</div>


							<br>


							<div class="container text-center" id="loader"
								style="display: none">
								<span class="fa fa-refresh fa-spin fa-4x"></span>
								<h4>Please wait...</h4>
							</div>


							<button type="submit" id="submit-btn" class="btn btn-primary">Submit</button>
						</form:form>

					</div>

				</div>

			</div>

		</div>

	</main>


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
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"
		integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>

	<script>
	
		$(document).ready(function() {
			 console.log("Form validation initialized...");
			
			$('#reg-form').on('submit', function(event) {
				event.preventDefault();
				
				let isValid = true;
		        let errorMessage = "";

		        // Get form values
		        let name = $("#user_name").val().trim();
		        let email = $("#exampleInputEmail1").val().trim();
		        let password = $("#exampleInputPassword1").val().trim();
		        let gender = $("input[name='gender']:checked").val();
		        let agreedTerms = $("#exampleCheck1").is(":checked");

		        // Validate Name
		        if (name.length < 3) {
		            errorMessage += "Name must be at least 3 characters long.\n";
		            isValid = false;
		        }

		        // Validate Email
		        let emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
		        if (!emailPattern.test(email)) {
		            errorMessage += "Invalid email format.\n";
		            isValid = false;
		        }

		        // Validate Password
		        let passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
		        if (!passwordPattern.test(password)) {
		        	errorMessage += "Password must be at least 8 characters long, with at least one uppercase letter, one lowercase letter, one number, and one special character.\n";
		            isValid = false;
		            
		        }

		        // Validate Gender Selection
		        if (!gender) {
		            errorMessage += "Please select a gender.\n";
		            isValid = false;
		        }

		        // Validate Terms and Conditions
		        if (!agreedTerms) {
		            errorMessage += "You must agree to the Terms and Conditions.\n";
		            isValid = false;
		        }

		        // Show error messages if any
		        if (!isValid) {
		            swal("Validation Error", errorMessage, "error");
		            return;
		        }
				
				let formData = {};
				$('#reg-form').serializeArray().forEach(function(field){
					formData[field.name] = field.value;
				});
				
				// Convert agreedTerms to boolean (important for validation)
				formData["agreedTerms"] = agreedTerms;
				
				$('#submit-btn').hide();
				$('#loader').show();
				// send register servlet
				
				$.ajax({
					url: "register",
					type: 'POST',
					contentType: "application/json",
					data: JSON.stringify(formData),
					success: function (data, textStatus,  jqXHR) {
						console.log(data);
						
						$('#submit-btn').show();
						$('#loader').hide();
						
						if(data.trim() === 'done') {
						swal("Registered Successfully.. we redirecting to login page.")
						.then((value) => {
						  window.location="login"
						});
						}else if(data.trim() === 'exists'){
							$('#submit-btn').show();
							$('#loader').hide();
							swal("Validation Error", "user already exists.. try with different email.", "error");
						}
						else {
							swal(data);
						}
					},
					error: function (jqXHR, textStatus, errorThrown) {
						$('#submit-btn').show();
						$('#loader').hide();
						swal("Something went wrong.. try again")
						
					}
					
					
				})
			})
		})
		
		
		
		
	</script>
</body>
</html>