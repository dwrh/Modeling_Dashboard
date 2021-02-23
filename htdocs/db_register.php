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

<p><label><h2> Owner : <input type="text" name="ownnam" value="<?php echo $ownman;?>"></h2></label></p>    
<p><label><h2> Owner Mobile : <input type="text" name="ownmob" value="<?php echo $ownmob;?>"></h2></label></p>        

<p><label><h2> Species </h2></label></p>    
<p><input type='radio' name='SpecCat'/>         <label> Cattle </label>   </p>
<p><input type='radio' name='SpecBuf'/>         <label> Buffalo </label>   </p>
<p><input type='radio' name='SpecPig'/>         <label> Pig </label>   </p>
<p><input type='radio' name='SpecChk'/>         <label> Chicken </label>   </p>
<p><input type='radio' name='SpecDuc'/>         <label> Duck </label>   </p>

<p><label><h2> Breed : <input type="text" name="breed" value="<?php echo $breed;?>"></h2></label></p>    

<p><label><h2> Production Category </h2></label></p>    
<p><input type='radio' name='meat'/>        <label> Meat </label>   </p>
<p><input type='radio' name='dairy'/>       <label> Dairy </label>   </p>
<p><input type='radio' name='egg'/>         <label> Egg </label>   </p>
<p><input type='radio' name='breeding'/>    <label> Breeding </label>   </p>
<p><input type='radio' name='traction'/>    <label> Traction </label>   </p>

<p><label><h2> Sex </h2></label></p>    
<p><input type="radio" name="sex" value="male" checked> Male</p>
<p><input type="radio" name="sex" value="female" checked> Female</p>

<p><label><h2> Date of Birth: <input type="date" name="bday"></label></p>

<p><label><h2></label><a class="menuparent" href="db_default.php?cty=<?=$AID?>">Record</a> Animal Record<h2></p>

</form>

        </div><!-- end content area -->

	<!-- end container --></div>
			 
            <div id="sidebar">
                 <div class="widget flag-area">
<--!Box here for image with button to activate camera -->
                      <img src="images/<?=$dtarr[$rid][1]?>.png" alt="" width="300" height="200" /><br />
	              </div>
            </div>

		</div>
		<div class="clear"></div>
	</div>

</body>
</html>
