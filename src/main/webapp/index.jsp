<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
<script type="text/javascript">
<!--
	function validAddress(event) {
		event.preventDefault();
		var valid = true;
		if (document.addressForm.address.value == "") {
			alert("Please insert an address in the search field");
			document.addressForm.address.focus;
			$('body').scrollTo('index.jsp#work');
			valid = false;
		}
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
				document.addressForm.submit();
			} else {
				alert("Request failed.")
				valid = false;
			}
		});

		return valid;
	}
//-->
</script>
</head>

<body>


	<div class="nav">
		<a href="index.jsp#hero" class="scroll">section one</a> <a
			href="index.jsp#work" class="scroll">section two</a> <a
			href="index.jsp#networks" class="scroll">section three</a>
	</div>
	<section id="hero">
		<div class="hero-block">
			<img class="img-circle" src="assets/img/globe.png" width="200"
				height="200" class="mb-7 hero-image">
			<h1>Business Locator</h1>
			<p>Den nemme måde at vurdere en adresse til din virksomhed.</p>
		</div>
		<a href="index.jsp#work" class="scroll"><span class="down-arrow"></span></a>
	</section>


	<section id="work">
		<div class="showcase">
			<div class="showcase-tiles"></div>
			<div class="showcase-info">
				<h3>Indtaste en adresse og se, hvilke virksomheder der er
					omkring.</h3>


				<form name="addressForm" action="LocationServlet" method="post"
					onsubmit="return validAddress(event);">
					<input id="address" class="controls" type="text"
						placeholder="Indtast en adresse." size="100" /> <input
						type="hidden" name="latitude" id="latitude" required> <input
						type="hidden" name="longitude" id="longitude" required> <input
						type="submit" class="btn btn-warning" value="hent naboer" />
				</form>

			</div>
			<div id="map_canvas" class="centered"
				style="width: 800px; height: 400px"></div>
		</div>
	</section>
	
	<section id="networks">
		<div class="container">
			<h1>Ting til at evaluere</h1>
			<ul>
				<li>Plads til fremtidig ekspansion</li>
				<li>Praktisk for medarbejdere</li>
				<li>God tilgængelighed</li>
				<li>Tilgængelig arbejdsstyrke</li>
				<li>Passende forsyningsvirksomheder</li>
				<li>Praktisk til fragt og kurerfirma</li>
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
	<script type="text/javascript"
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCzhEBvl_xO07-p8AdttWnIC0kpKaE_jnU"></script>
	<script type="text/javascript"
		src="https://maps.googleapis.com/maps/api/js?libraries=places"></script>
	<script type="text/javascript">
		var input = (document.getElementById('address'));
		var autocomplete = new google.maps.places.Autocomplete(input);
	</script>
	<script type="text/javascript">
	<!--
		var geocoder = new google.maps.Geocoder();
		var address = document.getElementById("address").value;
		var latitude = 55.6545993;
		var longitude = 12.603001100000029;
		var mapOptions = {
			zoom : 15,
			center : new google.maps.LatLng(latitude, longitude),
			mapTypeId : google.maps.MapTypeId.ROADMAP
		};
		var map = new google.maps.Map(document.getElementById('map_canvas'),
				mapOptions)
	//-->
	</script>

</body>
</html>
