<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="com.DB.DBconnect"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Parking Management System : Index Page</title>
<%@ include file="all_component/all_links.jsp"%>

<style type="text/css">
body {
    background-color: #f7f7f7;
}
.back-img {
    display: flex;
    align-items: center;
    justify-content: center;
    text-align: center;
    color: white;
    background-image: url("IMG/b.jpg");
    background-repeat: no-repeat;
    background-size: cover;
    height: 550px;
    padding: 20px;
    margin-bottom: 40px;
}
.content-container {
    padding: 20px;
    background-color: rgba(0, 0, 0, 0.5);
    border-radius: 10px;
}
.container h3 {
    margin-top: 20px;
    margin-bottom: 28px;
}
.card {
    margin-bottom: 20px;
}
.disabled-link {
    pointer-events: none;
    cursor: not-allowed;
}
.btn-white-outline {
    color: white;
    border: 2px solid white;
    background-color: transparent;
}
.btn-white-outline:hover {
    color: #333;
    background-color: white;
}
footer.footer {
    margin-top: 50px;
    background-color: #00695c;
    color: white;
}
#we-provide-section {
    margin-bottom: 40px;
}
.about_section {
    padding: 60px 0;
}
.about_section_2 {
    background-color: #00695c;
    color: white;
    padding: 60px 0;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    margin-bottom: 40px;
}
.about_taital {
    font-size: 40px;
    color: #191919;
    font-weight: bold;
    text-align: center;
    padding: 20px;
    border-radius: 10px;
    margin-bottom: 30px;
}
.about_taital_main {
    background-color: #00695c;
    border-radius: 10px;
    padding: 30px;
    text-align: center;
}
.yoga_taital {
    font-size: 26px;
    color: white;
    font-weight: bold;
}
.about_text {
    font-size: 16px;
    color: white;
    margin-top: 20px;
}
.read_bt a {
    font-size: 16px;
    color: #00695c;
    background-color: white;
    font-weight: bold;
    text-transform: uppercase;
    text-align: center;
    border-radius: 40px;
    padding: 12px;
    display: inline-block;
    margin-top: 20px;
}
.read_bt a:hover {
    color: white;
    background-color: #004d40;
}
.about_img img {
    border-radius: 10px;
    width: 100%;
    height: auto;
}
html, body {
    height: 100%;
    margin: 0;
    display: flex;
    flex-direction: column;
}
body {
    flex: 1;
}
.wrapper {
    display: flex;
    flex-direction: column;
    min-height: 100vh;
}
.main-content {
    flex: 1;
}
</style>

</head>
<body>
    <div class="wrapper">
        <div class="main-content">
            <%@ include file="all_component/navbar.jsp"%>
            <div class="container-fluid back-img">
                <div class="content-container">
                    <h1>Parking Management System</h1>
                    <p>Your Parking Solution</p>
                    <p>
                        <a href="#we-provide-section" class="btn btn-warning me-2">Book Now</a> 
                        <a href="#about-us" class="btn btn-white-outline">Explore</a>
                    </p>
                </div>
            </div>

            <!-- Start of we provide section -->
            <div class="container" id="we-provide-section">
                <h3 class="text-center about_taital">We Provide</h3>
                <div class="row">
                    <div class="col-md-6">
                        <div class="card text-center">
                            <div class="card-body">
                                <img alt="Image of a bike" src="Vehicle/classic.jpg" class="img-thumbnail">
                                <h5>Two Wheelers</h5>
                                <div>
                                    <!-- Add vehicle type as a parameter in the URL -->
                                    <a href="home.jsp" class="btn btn-success btn-lg"><i class="fas fa-motorcycle"></i> Book Parking</a> 
                                    <a href="#" class="btn btn-danger btn-lg disabled-link">Nrs 20/h</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card text-center">
                            <div class="card-body">
                                <img alt="Image of a car" src="Vehicle/i5.jpg" class="img-thumbnail">
                                <h5>Four Wheelers</h5>
                                <div>
                                    <!-- Add vehicle type as a parameter in the URL -->
                                    <a href="home.jsp" class="btn btn-success btn-lg"><i class="fas fa-car"></i> Book Parking</a> 
                                    <a href="#" class="btn btn-danger btn-lg disabled-link">Nrs 25/h</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End of we provide section -->

            <!-- About section start -->
            <div class="about_section">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12" id="about-us">
                            <div class="about_taital">About Us</div>
                        </div>
                    </div>
                </div>
                <div class="about_section_2">
                    <div class="container">
                        <div class="row align-items-center">
                            <div class="col-md-6">
                                <div class="about_img">
                                    <img src="IMG/carimage.jpg" alt="About Image">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="about_taital_main mb-4">
                                    <div class="yoga_taital">ParkMyGadi</div>
                                    <p class="about_text">ParkMyGadi is a leading company offering convenient parking solutions for both two and four wheelers. Our state-of-the-art facilities ensure that your vehicle is safe and secure, allowing you to park with confidence. Whether you need short-term or long-term parking, ParkMyGadi provides a hassle-free experience with competitive rates.</p>
                                    <div class="read_bt">
                                        <a href="#footer" style="text-decoration: none">Read More</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- About section end -->

         <!-- Carousel wrapper -->
	<div id="carouselExampleControls"
		class="carousel slide text-center carousel-dark"
		data-bs-ride="carousel" data-bs-interval="3000"
		style="padding: 60px 0; margin-bottom: 40px;">
		<div class="carousel-inner">
			<div class="about_taital">Customer Review</div>
			<div class="carousel-item active">
				<img class="rounded-circle shadow-1-strong mb-4"
					src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(10).webp"
					alt="avatar" style="width: 150px;" />
				<div class="row d-flex justify-content-center">
					<div class="col-lg-8">
						<h5 class="mb-3">Marie Pahari</h5>

						<p class="text-muted">
							<i class="fas fa-quote-left pe-2"></i> Best choice for parking
							your vehicles. The service is reliable, and the staff are always
							friendly and helpful. Highly recommend!
						</p>
					</div>
				</div>
				<ul
					class="list-unstyled d-flex justify-content-center text-warning mb-0">
					<li><i class="fas fa-star fa-sm"></i></li>
					<li><i class="fas fa-star fa-sm"></i></li>
					<li><i class="fas fa-star fa-sm"></i></li>
					<li><i class="fas fa-star fa-sm"></i></li>
					<li><i class="fas fa-star fa-sm"></i></li>
					
				</ul>
			</div>
			<div class="carousel-item">
				<!-- Content for the second carousel item -->
				<img class="rounded-circle shadow-1-strong mb-4"
					src="IMG/p2.jpeg"
					alt="avatar" style="width: 150px;" />
				<div class="row d-flex justify-content-center">
					<div class="col-lg-8">
						<h5 class="mb-3">Sundari Shrestha</h5>

						<p class="text-muted">
							<i class="fas fa-quote-left pe-2"></i> I love the convenience of
							ParkMyGadi. As a photographer, I travel a lot, and knowing my car
							is secure gives me peace of mind. The rates are also very
							reasonable.
						</p>
					</div>
				</div>
				<ul
					class="list-unstyled d-flex justify-content-center text-warning mb-0">
					<li><i class="fas fa-star fa-sm"></i></li>
					<li><i class="fas fa-star fa-sm"></i></li>
					<li><i class="fas fa-star fa-sm"></i></li>
					<li><i class="fas fa-star fa-sm"></i></li>
					<li><i class="far fa-star fa-sm"></i></li>

				</ul>
			</div>
			<div class="carousel-item">
				<!-- Content for the third carousel item -->
				<img class="rounded-circle shadow-1-strong mb-4"
					src="IMG/p1.jpeg"
					alt="avatar" style="width: 150px;" />
				<div class="row d-flex justify-content-center">
					<div class="col-lg-8">
						<h5 class="mb-3">Subodh Rai</h5>

						<p class="text-muted">
							<i class="fas fa-quote-left pe-2"></i> Excellent parking service
							with top-notch security. It's the best place to park my car when
							I'm out on business trips. The booking process is simple and
							efficient.
					</div>
				</div>
				<ul
					class="list-unstyled d-flex justify-content-center text-warning mb-0">
					<li><i class="fas fa-star fa-sm"></i></li>
					<li><i class="fas fa-star fa-sm"></i></li>
					<li><i class="fas fa-star fa-sm"></i></li>
					<li><i class="fas fa-star fa-sm"></i></li>
					<li><i class="far fa-star fa-sm"></i></li>
				</ul>
			</div>
		</div>
		<!-- Previous button -->
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleControls" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<!-- Next button -->
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleControls" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>
	<!-- Carousel wrapper -->

        </div>
        <%@ include file="all_component/footer.jsp"%>
        <script>
		// Manually trigger the carousel initialization
		var carousel = document.getElementById('carouselExampleControls');
		new mdb.Carousel(carousel).init();
	</script>
    </div>
</body>
</html>
