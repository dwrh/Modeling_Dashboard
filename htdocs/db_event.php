<?php

include('HeadBEAR.php') ;

$REG = 10;
$AID = $_GET['AID'] ;
$CTY = substr($AID,0,3) ;
$_GET['cty'] ;

// echo $AID, $CTY ;

include('Map_Data_Asia.php') ;

for ($i=0; $i < 24; $i++) {
	if ($mapLabel[$i][1] == $CTY) {
		$MAP = $mapLabel[$i][2] ;
 	}
}

// echo $MAP ;

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Open CSV file and read in data
if(($handle = fopen("AID_Tags.csv", "r")) !== FALSE) {

	$rid = 0 ;
	$row = 0;
		while (($data = fgetcsv($handle, 500, ',')) !== FALSE) {
			$num = count($data);
			for ($col = 0; $col < $num; $col++) {
				$dtarr[$row][$col] = $data[$col];
			}
			if ($dtarr[$row][0] == $AID) {
				$rid = $row ;
 			}
			$row++;
		}

// echo $rid, ' ', $row, ' ', $AID ;

// End CSV open statement and close CSV file
}
fclose($handle);
?>


<!DOCTYPE
td PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<link rel='stylesheet' href="CAPSIM_Styles.css" />
</head>

<body>
    
	<div id="transport-image" class="title-image" style="background: url('images/<?=$CTY?>.png') top center no-repeat;" >
		<div class="container">

        	<div class="image-holder">
            	<div class="title-holder">
                	  <span><?=$MAP?></span>                	
               </div>
			</div>

<div class="container">
<div id="header_nav">
<div class="navigation flotlef"><div id="menuwrapper">
<ul id="primary-nav">

		<li class="menuparent"><a class="menuparent" href="db_register.php?AID=<?=$AID?>">Register</a>
		<li class="menuparent"><a class="menuparent" href="db_event.php?AID=<?=$AID?>">Event</a>
		<li class="menuparent"><a class="menuparent" href="db_scan.php?AID=<?=$AID?>">Scan</a>

	</ul>
</div>
</div>
</div>

<!-- end container --></div>

<!-- end header --> 

<script type="text/javascript"><!--

// --></script>
    
    </div><!-- end wrap_all -->
</div>

<div class="container">

<div id="content-area">

<form action="script/data.php" method="post">

<p><label><h2> Date/Time : <span class="lastitem"><? echo date("l \, j F Y \, G:i:s "); ?></span></h2></label></p>    

<p><label><h2> Location: <a href="https://www.google.com/maps?q=<?=$dtarr[$rid][10] . ',' . $dtarr[$rid][11]?>"<span class="lastitem"><?= '[' . $dtarr[$rid][10] . ', ' . $dtarr[$rid][11] . ']'?></span> </a></h2></label></p>

<p><label><h2> Event Type </h2></label></p>    
<p><input type='radio' name='FarmDep'/>         <label> Farm Departure </label>   </p>
<p><input type='radio' name='MktArr'/>          <label> Market Arrival </label>   </p>
<p><input type='radio' name='MktDep'/>          <label> Market Departure </label> </p>
<p><input type='radio' name='Transit'/>         <label> Transit </label>          </p>
<p><input type='radio' name='Inspect'/>         <label> Inspection </label>       </p>
<p><input type='radio' name='AbaArr'/>          <label> Abattoir Arrival </label> </p>
<p></label> <input type='radio' name='Death'/>  <label> Slaughter/death of animal </p>
<p><input type='radio' name='Border'/>          <label> Border Crossing </label>  </p>
<p><label><h2> Current Manager : <input type="text" name="mgrnam" value="<?php echo $mgrman;?>"></h2></label></p>    
<p><label><h2> Manager Mobile : <input type="text" name="mgrmob" value="<?php echo $mgrmob;?>"></h2></label></p>        

<p><label><h2></label> Set Event as <a class="menuparent" href="db_default.php?cty=<?=$AID?>">Default</a> for Scanning<h2></p>

<p><label><h2> Report Animal </label> <a class="menuparent" href="dbmissing.php?cty=<?=$AID?>">Missing</a><h2></p>
        
</form>

        </div><!-- end content area -->

	<!-- end container --></div>
			 
            <div id="sidebar">
<form action="script/data.php" method="post">
<p><label><h2> Means of Arrival </h2></label></p>    
<p><input type='radio' name='ArrWalk'/><label> Walk </label> </p>
<p><input type='radio' name='ArrTruck'/><label> Truck </label> </p>
<p><input type='radio' name='ArrCar'/><label> Car </label> </p>
<p><input type='radio' name='ArrMoto'/><label> Moto </label> </p>
<p><input type='radio' name='ArrTrain'/><label> Train </label> </p>
<p><input type='radio' name='ArrBoat'/><label> Boat </label> </p>
<p><input type='radio' name='ArrAir'/><label> Air </label> </p>

<p><label><h2> Means of Departure </h2></label></p>    
<p><input type='radio' name='DepWalk'/><label> Walk </label></p>
<p><input type='radio' name='DepTruck'/><label> Truck </label></p>
<p><input type='radio' name='DepCar'/><label> Car </label></p>
<p><input type='radio' name='DepMoto'/><label> Moto </label></p>
<p><input type='radio' name='DepTrain'/><label> Train </label></p>
<p><input type='radio' name='DepBoat'/><label> Boat </label></p>
<p><input type='radio' name='DepAir'/><label> Air </label></p>
</form>
            </div>


		</div>
		<div class="clear"></div>
	</div>

</body>
</html>
