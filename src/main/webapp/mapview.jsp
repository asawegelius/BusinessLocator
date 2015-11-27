<%@page contentType="text/html" pageEncoding="UTF-8"
import="model.Company"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@page import = "java.util.List" %>
        <%@page import = "java.util.*" %>
        <%@page import = "java.util.ArrayList" %>

    <script src="http://maps.google.com/maps?file=api&amp;v=2&amp;
    key=ABQIAAAAcl" type="text/javascript"></script>

<script type="text/javascript">
      var map = null;
      var geocoder = null;
            //for map
      var map;
      function PointLocation(Latitude,Longtitude,color, address) {
          var point = new GLatLng(Latitude,Longtitude);
          var marker = new GMarker(point);
          map.setCenter(point,17);
          map.setMapType(G_ROADMAP)
          map.addOverlay(marker);
          
       
      }
      function load(loc) {
      if (GBrowserIsCompatible()){
            var point;
            map=new GMap2(document.getElementById("map"));
            map.addControl(new GOverviewMapControl());
            map.enableDoubleClickZoom();
            map.enableScrollWheelZoom();
            map.addControl(new GMapTypeControl());
            map.addControl(new GSmallMapControl());
            //var address='Google Sites';
            <%
            List<Company> listRoute = new ArrayList<Company>();
            //I can add n number of points here 
            listRoute.add(new Company("1",19.091533,72.865983) );
            listRoute.add(new Company("2",18.9861,72.8372) );
            Iterator<Company> itrRouter = listRoute.iterator();
            while(itrRouter.hasNext())
            {
                  Company comp = itrRouter.next();
            %>
 
            var latitude =<%=comp.getLatitude()%>
            var longitude =<%=comp.getLongitude()%>
   
            //Call the location to point
            PointLocation (latitude,longitude,"Green","Mumbai");
            <%}  
            %>
      }
           }
 
      </script>

     <title>Goolgle Map </title>
    </head>
    <body onload="load();" onunload="GUnload()" style="
        background-color:Transparent">
        <div id="map" style="width: 800px; height: 500px"></div>
    </body>

</html>

