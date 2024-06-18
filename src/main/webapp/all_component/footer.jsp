<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Footer</title>

<style>
  .footer {
    background-color: #00695c;
    color: white;
    padding: 20px 0;
  }
  .footer .container {
    padding: 2rem;
  }
  .footer .text-uppercase {
    text-transform: uppercase;
  }
  .footer .font-weight-bold {
    font-weight: bold;
  }
  .footer .btn-floating {
    margin: 0.25rem;
  }
  .footer .fab {
    color: white;
  }
  .footer a {
    color: white;
    text-decoration: none;
  }
  .footer a:hover {
    text-decoration: underline;
  }
  .footer-bottom {
  
    text-align: center;
    padding: 10px 0;
    margin-bottom:-20px;  /* Avoid gap between footer and footer-bottom */
}
</style>
</head>
<body>

  <!-- Footer -->
  <footer class="footer text-center text-lg-start" id="footer">
    <!-- Grid container -->
    <div class="container">
      <!-- Section: Links -->
      <section class="">
        <!--Grid row-->
        <div class="row">
          <!-- Grid column -->
          <div class="col-md-3 col-lg-3 col-xl-3 mx-auto mt-3">
            <h4 class="text-uppercase mb-4 font-weight-bold">
              <a href="index.jsp" style="text-decoration: none; color: white;">ParkyMyGadi</a>
            </h4>
            <p>
              Perfect Solution for your parking problems.
            </p>
          </div>
          <!-- Grid column -->

          <hr class="w-100 clearfix d-md-none" />

          <!-- Grid column -->
          <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mt-3">
            <h6 class="text-uppercase mb-4 font-weight-bold">Service</h6>
            <p><a href="#" class="text-white">Parking</a></p>
            <p><a href="#" class="text-white">Parking Security</a></p>
            <p><a href="#" class="text-white">Reservation System</a></p>
            <p><a href="#" class="text-white">Customer Support</a></p>
          </div>
          <!-- Grid column -->

          <hr class="w-100 clearfix d-md-none" />

          <!-- Grid column -->
          <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mt-3">
            <h6 class="text-uppercase mb-4 font-weight-bold">Contact</h6>
            <p><i class="fas fa-home mr-3"></i><a href="https://maps.app.goo.gl/gA3LPtNTKxhL1XjcA" target="_blank"> New Baneshwor </a></p>
            <p><i class="fas fa-envelope mr-3"></i> <a href="mailto:parkmygadi@gmail.com" target="_blank"> parkmygadi@gmail.com </a></p>
            <p><i class="fas fa-phone mr-3"></i><a href="tel:+9779869750067"> +977 9869750067</a></p>
          </div>
          <!-- Grid column -->

          <!-- Grid column -->
          <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mt-3">
            <h6 class="text-uppercase mb-4 font-weight-bold">Follow us</h6>

            <!-- Facebook -->
            <a href="https://www.instagram.com/kapil_mani_pradhan/" target="_blank" class="btn btn-primary btn-floating m-1" style="background-color: #3b5998;" role="button"><i class="fab fa-facebook-f"></i></a>

            <!-- Instagram -->
            <a href="https://www.instagram.com/kapil_mani_pradhan/" target="_blank" class="btn btn-primary btn-floating m-1" style="background-color: #ac2bac;" role="button"><i class="fab fa-instagram"></i></a>
          </div>
        </div>
        <!--Grid row-->
      </section>
      <!-- Section: Links -->
    </div>
    <!-- Grid container -->

    <!-- Copyright -->
    <div class="text-center footer-bottom p-3" style="background-color: rgba(0, 0, 0, 0.2);">
      <h5><i class="fa-regular fa-copyright"></i> Copyright Design and Developed by <a href="https://www.instagram.com/kapil_mani_pradhan/" target="_blank" style="color: white;">Kapil Mani Pradhan</a></h5>
    </div>
    <!-- Copyright -->
  </footer>
  <!-- Footer -->

</body>
</html>
