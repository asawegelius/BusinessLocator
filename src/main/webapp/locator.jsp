<%@page language="java" contentType="text/html" pageEncoding="UTF-8"
	import="java.util.ArrayList" import="model.Company"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" href="assets/ico/favicon.png">

<title>Business Locator</title>

<!-- Bootstrap core CSS -->
<link href="assets/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="assets/css/main.css" rel="stylesheet">
<link href="assets/css/font-awesome.min.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>

<body>


	<div class="nav">
		<a href="locator.jsp#hero" class="scroll">section one</a> <a
			href="locator.jsp#work" class="scroll">section two</a> <a
			href="locator.jsp#networks" class="scroll">section three</a>
	</div>
	<section id="hero">
		<div class="hero-block">
			<img class="img-circle" src="assets/img/globe.png" width="200"
				height="200" class="mb-7 hero-image">
			<h1>Business Locator</h1>
			<p>Den nemme måde at vurdere en adresse til din virksomhed.</p>
		</div>
		<a href="locator.jsp#work" class="scroll"><span class="down-arrow"></span></a>
	</section>


	<section id="work">
		<div class="showcase">
			<div class="showcase-tiles"></div>
			<div class="showcase-info">
				<h3>Indtaste en adresse og se, hvilke virksomheder der er
					omkring.</h3>
				<script type="text/javascript"
					src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCzhEBvl_xO07-p8AdttWnIC0kpKaE_jnU"></script>
				<script type="text/javascript"
					src="https://maps.googleapis.com/maps/api/js?libraries=places"></script>
				<form action="LocationServlet" method="get"
					onsubmit="return addressValidation()">
					<input id="address" class="controls" type="text"
						placeholder="Indtast en adresse." size="100" />
					<script type="text/javascript">
						var input = (document.getElementById('address'));
						var autocomplete = new google.maps.places.Autocomplete(
								input);
					</script>
					<input type="hidden" name="latitude" id="latitude"> <input
						type="hidden" name="longitude" id="longitude"> <input
						type="button" class="btn btn-warning" type="submit"
						value="hent naboer" />
				</form>
			</div>
			<div id="map_canvas" class="centered"
				style="width: 800px; height: 400px"></div>
		</div>
	</section>
	<script type="text/javascript">
	<!--
	<%
		double latit = (Double)request.getSession().getAttribute("latitude");
		double longit = (Double)request.getSession().getAttribute("longitude");
	%>	

		var geocoder = new google.maps.Geocoder();
		var address = document.getElementById("address").value;
		var latitude=<%=latit%>; 
		var longitude=<%=longit%>;
		var mapOptions = {
			zoom : 15,
			center : new google.maps.LatLng(latitude, longitude),
			mapTypeId : google.maps.MapTypeId.ROADMAP
		};
		var map = new google.maps.Map(document.getElementById('map_canvas'),
				mapOptions)
		

	//-->
	</script>



	<script type="text/javascript">
	<!--
		function addressValidation() {
			var geocoder = new google.maps.Geocoder();
			var address = document.getElementById("address").value;
			geocoder.geocode({
				'address' : address
			}, function(results, status) {
				if (status == google.maps.GeocoderStatus.OK) {
					var latitude = results[0].geometry.location.lat();
					var longitude = results[0].geometry.location.lng();
					document.getElementById("latitude").value = latitude;
					document.getElementById("longitude").value = longitude;
				} else {
					alert("Request failed.")
				}
			});
		}
	//-->
	</script>

	<section id="networks">
		<div class="container">
		

			<h1>Forretninger</h1>
			<ul>
			<%		ArrayList<Company> companies = (ArrayList<Company>)request.getSession().getAttribute("companies");
			
			for(Company company : companies) {
			    out.println("<li>" + company.getName() + ", " + company.getLatitude() + ", " + company.getLongitude() + "</li>");
			}
			%> 

			</ul>

		</div>

	</section>


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/jribbble.js"></script>
	<script src="assets/js/site-ck.js"></script>

</body>
</html>
