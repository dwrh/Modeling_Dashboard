<?php

// FusionChart php include statement
include('FusionCharts/FusionCharts.php');
?>

<html>
<head>
<script language="Javascript" SRC="FusionCharts/FusionCharts.js"></script>
<link rel='stylesheet' href="CAPSIM_Styles.css" />
<style type="text/css">
</style>
</head>
  <body> 
//    <div id="mapContainer">FusionMaps XT will load here!</div> 
    <script type="text/javascript"><!--
         
      FusionCharts.setCurrentRenderer('javascript');
         
      var myMap = new FusionCharts ("FusionCharts/Maps/FCMap_Azerbaijan.swf", "MyMapId", "800", "700", "0");
      myMap.setXMLUrl ("AzeGrowth.xml");
      myMap.render("mapContainer"); 
    // --> 
    </script>
  </body> 
</html>
