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

            <p> 
                <label>Animal ID:</label> <span class="lastitem"><?=$AID?></span>
            </p>
            <p> 
               <label>Species:</label> <span class="lastitem"><?=$dtarr[$rid][1]?></span>
            </p>         
            <p> 
                <label>Breed:</label> <span class="lastitem"><?=$dtarr[$rid][2]?></span>
            </p>          
            <p> 
                <label>Production Category:</label> <span class="lastitem"><?=$dtarr[$rid][3]?></span>
            </p>          
            <p> 
                <label>Sex:</label> <span class="lastitem"><?=$dtarr[$rid][4]?></span>
            </p>          
            <p> 
                <label>Birthdate:</label> <span class="lastitem"><?=$dtarr[$rid][5]?></span>
            </p>          
            <p> 
                <label>Paternal AID:</label> <a href = "dbase.php?AID=<?=$dtarr[$rid][6]?>" <span class="lastitem"><?=$dtarr[$rid][6]?></span> </a>
            </p>          
            <p> 
                <label>Maternal AID:</label> <a href = "dbase.php?AID=<?=$dtarr[$rid][7]?>" <span class="lastitem"><?=$dtarr[$rid][7]?></span> </a>
            </p>           
            <p> 
                <label>Owner Name:</label> <span class="lastitem"><?=$dtarr[$rid][8]?></span>
            </p>           
            <p> 
                <label>Owner Mobile:</label> <span class="lastitem"><?=$dtarr[$rid][9]?></span>
            </p>            
            <p> 
                <label>Owner Location:</label> <a href="https://www.google.com/maps?q=<?=$dtarr[$rid][10] . ',' . $dtarr[$rid][11]?>"<span class="lastitem"><?= '[' . $dtarr[$rid][10] . ', ' . $dtarr[$rid][11] . ']'?></span> </a>
            </p>
                       
        </form>

        </div><!-- end content area -->

	<!-- end container --></div>
			 
            <div id="sidebar">
                 <div class="widget flag-area">
                      <img src="images/<?=$dtarr[$rid][1]?>.png" alt="" width="300" height="200" /><br />
	              </div>
            </div>

		</div>
		<div class="clear"></div>
	</div>

</body>
</html>
