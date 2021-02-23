<?php 
	
//	$curdir = getcwd();
//	echo $curdir;
//	$filein = fopen("c:/Program Files/GAMS/EBI/testfile.csv", 'w') or die("Failed to create file");
	$filein = fopen("c:/inetpub/vhosts/bearllc.net/cgi-bin/GAMS/testfile.csv", 'w') or die("Failed to create file");
	
	if (isset($_POST['RENC'])) $RENC = ($_POST['RENC']);
	if (isset($_POST['RENJ'])) $RENJ = ($_POST['RENJ']);
	if (isset($_POST['RENI'])) $RENI = ($_POST['RENI']);
	if (isset($_POST['RENU'])) $RENU = ($_POST['RENU']);
	if (isset($_POST['RENB'])) $RENB = ($_POST['RENB']);
	if (isset($_POST['RENR'])) $RENR = ($_POST['RENR']);
	if (isset($_POST['RENE'])) $RENE = ($_POST['RENE']);
	if (isset($_POST['RENL'])) $RENL = ($_POST['RENL']);
	if (isset($_POST['RENO'])) $RENO = ($_POST['RENO']);
	if (isset($_POST['RENRW'])) $RENRW = ($_POST['RENRW']);
	if (isset($_POST['EVC'])) $EVC = ($_POST['EVC']);
	if (isset($_POST['EVJ'])) $EVJ = ($_POST['EVJ']);
	if (isset($_POST['EVI'])) $EVI = ($_POST['EVI']);
	if (isset($_POST['EVU'])) $EVU = ($_POST['EVU']);
	if (isset($_POST['EVB'])) $EVB = ($_POST['EVB']);
	if (isset($_POST['EVR'])) $EVR = ($_POST['EVR']);
	if (isset($_POST['EVE'])) $EVE = ($_POST['EVE']);
	if (isset($_POST['EVL'])) $EVL = ($_POST['EVL']);
	if (isset($_POST['EVO'])) $EVO = ($_POST['EVO']);
	if (isset($_POST['EVRW'])) $EVRW = ($_POST['EVRW']);
		
	$list = array(		
		array('dummy','VALUES'),
		array('RENC',$RENC),
		array('RENJ',$RENJ),
		array('RENI',$RENI),
		array('RENU',$RENU),
		array('RENB',$RENB),
		array('RENR',$RENR),
		array('RENE',$RENE),
		array('RENL',$RENL),
		array('RENO',$RENO),
		array('RENRW',$RENRW),
		array('EVC',$EVC),
		array('EVJ',$EVJ),
		array('EVI',$EVI),
		array('EVU',$EVU),
		array('EVB',$EVB),
		array('EVR',$EVR),
		array('EVE',$EVE),
		array('EVL',$EVL),
		array('EVO',$EVO),
		array('EVRW',$EVRW),
		
		);
	
	foreach ($list as $fields) {
		fputcsv($filein, $fields);
	}	
		
	fclose($filein);

	if(empty($_POST['region']) && empty($_POST['variable'])) {


//	chdir('c:\Program Files\GAMS\EBI');
//	$gd = exec('gams EBI_Comp', $output, $result_status);
//	chdir('c:\inetpub\vhosts\bearllc.net\cgi-bin\GAMS');
	
//	echo getcwd();	
//	echo print_r(scandir('c:/inetpub/vhosts/bearllc.net/cgi-bin/GAMS'));
//	$cmd = getenv('PATH');
//	echo $cmd;
//	$cmd = 'echo "Hello Worlds!" > TSW.txt';
//	$gd = exec('gams project 2>&1', $output, $result_status);	
//	print_r($output);
//	echo $result_status;
	
	}
	
if (isset($_POST['region'])) $REG = ($_POST['region']);
if (isset($_POST['variable'])) $VAR = ($_POST['variable']);

$REGSEL = count($REG);
$VARSEL = count($VAR);
$REGTOT = 11;
$VARTOT = 15;

for ($n=0; $n < $REGTOT; $n++) {
	if ($REG[$n] == "CHN") $REG_NAME[$n] = "China";
	if ($REG[$n] == "JPN") $REG_NAME[$n] = "Japan";
	if ($REG[$n] == "IND") $REG_NAME[$n] = "India";
	if ($REG[$n] == "USA") $REG_NAME[$n] = "U.S.";
	if ($REG[$n] == "BRA") $REG_NAME[$n] = "Brazil";
	if ($REG[$n] == "RUS") $REG_NAME[$n] = "Russia";
	if ($REG[$n] == "EUR") $REG_NAME[$n] = "Europe";
	if ($REG[$n] == "LAC") $REG_NAME[$n] = "LAC";
	if ($REG[$n] == "OPC") $REG_NAME[$n] = "OPEC";
	if ($REG[$n] == "row") $REG_NAME[$n] = "ROW";
}

for ($m=0; $m < $VARTOT; $m++) {
	if ($VAR[$m] == "rgdpmpt") $VAR_NAME[$m] = "Real GDP";
	if ($VAR[$m] == "gdp_pc") $VAR_NAME[$m] = "GDP Per Capita";
	if ($VAR[$m] == "gdp_pc_ppp") $VAR_NAME[$m] = "GDP Per Capita PPP";
	if ($VAR[$m] == "cons") $VAR_NAME[$m] = "Real Consumption";
	if ($VAR[$m] == "inv") $VAR_NAME[$m] = "Investment";
	if ($VAR[$m] == "exp") $VAR_NAME[$m] = "Exports";
	if ($VAR[$m] == "imp") $VAR_NAME[$m] = "Imports";
	if ($VAR[$m] == "tlabs") $VAR_NAME[$m] = "Employment";
	if ($VAR[$m] == "cpi") $VAR_NAME[$m] = "Consumer Price Index";
}

//	chdir('c:/Program Files/GAMS/EBI');
	if(($handle = fopen("C:/inetpub/vhosts/bearllc.net/cgi-bin/GAMS/EBIComp.csv", "r")) !== FALSE) {
//	if(($handle = fopen("EBIComp.csv", "r")) !== FALSE) {

		$row = 0;
		while (($data = fgetcsv($handle, 4000, ',')) !== FALSE) {
			$num = count($data);
			for ($col = 0; $col < $num; $col++) {
				$dtarr[$row][$col] = $data[$col];
			}
			$row++;
		}
		
		?>
		
		<html><title>Global Energy Model: Results</title>
		<head>
		<style type="text/css">
		p.sansserif
		{
		font-family: Arial,Helvetica,sans-serif;
		font-size: 14px; 
		}
		a:link 
		{
		color: #FF3300; text-decoration: none;
		}
		a:active
		{
		color: #FF3300; text-decoration: none; 
		}
		a:visited {
		color: #FF3300; text-decoration: underline; 
		}
		table
		{
		background-color: white;
		border-collapse:collapse;
		}
		table, td, th
		{
		border:1px solid black;
		}
		body
		{
		background-color:#003366;
		}
		.button
		{ 
		border:1px solid black;
		font-size: 14px; 
		color: #FFFFFF; 
		font-weight: normal; 
		font-family: arial; 
		background-color: #FF3300; 
		text-decoration: none;
		}
		</style>
		</head>
		
		<body>
		<table border = "1" align=center cellpadding=8>
		<tr>
		<td width=150><p class="sansserif"><b>1. Select Regions</b></td>
		<td width=150><p class="sansserif"><b>2. Select Variables</b></td>
		<td width=150><p class="sansserif"><b>3. Select Display</b></td>
		<td width=150><p class="sansserif"><b>4. Other Options</b></td></tr>
		<tr><td width=150 style="vertical-align: top">
		<form name="regions" method="post" action="Results.php">
		<select multiple size=10 name="region[]" style="width: 150">
		<option value="CHN">China</option>
		<option value="JPN">Japan</option>
		<option value="IND" >India</option>
		<option value="USA">United States</option>
		<option value="BRA">Brazil</option>
		<option value="RUS">Russia</option>
		<option value="EUR">Europe</option>
		<option value="LAC">Latin America</option>
		<option value="OPC">OPEC Countries</option>
		<option value="row">Rest of World</option>
		</select>
		</td><td width=150 style="vertical-align: top">
		<select multiple size=10 name="variable[]" style="width: 150">
		<option value="rgdpmpt" >Real GDP</option>
		<option value="gdp_pc">GDP Per Capita</option>
		<option value="gdp_pc_ppp">GDP Per Capita PPP</option>
		<option value="cons">Real Consumption</option>
		<option value="inv">Real Investment</option>
		<option value="exp">Exports</option>
		<option value="imp">Imports</option>
		<option value="tlabs">Employment</option>
		<option value="cpi">Consumer Price Index</option>
		</select>
		</td>
		<td align=center width=150 style="vertical-align: top">
		<p class="sansserif">Click on a button to choose a display option<br><br>
		<input type="submit" name="table" value="View as Table" class="button"><br>
		<input type="submit" name="bar" value="View as Bar Chart" class="button">
		<input type="submit" name="pie" value="View as Pie Chart" class="button">
		<p class="sansserif">
		</td>
		<td width=150 style="vertical-align: top">
		<p class="sansserif">
		<a href="Model_inputs.php"><b>> Change Inputs</b></a><br> Change your inputs by returning to the inputs page.<br><br> 
		<a href="index.html"><b>> Return Home</b></a><br> Return to the home page.
		</td>		
		
		</form>
		</tr>
		</table>
		<br>
		<br>
		</body></html>

		<?php				

		
		
	if((isset($_REQUEST['table']))) {		
		if ((isset($_POST['region'])) && (isset($_POST['variable']))) {
		echo "<table border='1' align=center cellpadding=5>";
		echo "<tr><td></td>";
		for ($i = 0; $i < $VARSEL; $i++) {			
			echo "<td width=150><p class=sansserif><b>$VAR_NAME[$i]</b></p></td>";
		}
		for ($j = 0; $j < $REGSEL; $j++) {
			for ($row1 = 1; $row1 < $REGTOT; $row1++) {
				if ($dtarr[$row1][0] == $REG[$j]) {
					echo "<tr><td width=150><p class=sansserif><b>$REG_NAME[$j]</b></p></td>";
					for ($l = 0; $l < $VARSEL; $l++) {	
						for ($k = 1; $k < $VARTOT; $k++) {
							if ($dtarr[0][$k] == $VAR[$l]) {															
								$out = $dtarr[$row1][$k]; 
								echo "<td width=150>$out</td>";			
							}		
						}
					}
				}				
				echo "</tr>";
							
				}								
			}
		}
	}

	if((isset($_REQUEST['bar']))) {
	if ((isset($_POST['region'])) && (isset($_POST['variable']))) {
	
		if(($VARSEL>1) || ($REGSEL==1)) {
			echo "<table border='1' align=center cellpadding=5>";
			echo "<tr><td><p class='sansserif'>To display bar charts must choose at least two regions. You can only choose one variable at a time.</td></tr></table>";		
		}

		if(($VARSEL==1) && ($REGSEL>1)) {			
			for ($jj = 0; $jj < $REGSEL; $jj++) {
				for ($row12 = 1; $row12 < $REGTOT; $row12++) {
					if ($dtarr[$row12][0] == $REG[$jj]) {
						for ($ll = 0; $ll < $VARSEL; $ll++) {
							for ($kk = 1; $kk < $VARTOT; $kk++) {
								if ($dtarr[0][$kk] == $VAR[$ll]) {
									$values[] = $dtarr[$row12][$kk];	
								}
							}
						}
					}
				}
			}
						
			$img_height = 350;
			$img_width = 450; 
			$margins = 20;
			$graph_width = $img_width - $margins * 2;
			$graph_height = $img_height - $margins *2;
			$img = imagecreate($img_width, $img_height);
			$bar_width = 20;
			$total_bars = $REGSEL;
			$gap = ($graph_width - $total_bars * $bar_width) / ($total_bars + 1);
			$bar_color = imagecolorallocate($img, 0, 64, 128);
			$background_color = imagecolorallocate($img, 240, 240, 255);
			$border_color = imagecolorallocate($img, 200, 200, 200);
			$line_color = imagecolorallocate($img, 220, 220, 220);
			imagefilledrectangle($img, 1, 1, $img_width-2, $img_height-2, $border_color);
			imagefilledrectangle($img, $margins, $margins, $img_width-1-$margins, $img_height-1-$margins, $background_color);
						
			$max_value = max($values);
			$ratio = $graph_height / $max_value;
			$horizontal_lines = 20;
			$horizontal_gap = $graph_height/$horizontal_lines;
			for ($m=1; $m <= $horizontal_lines; $m++) {
				$y = $img_height - $margins - $horizontal_gap * $m;
				imageline($img, $margins, $y, $image_width-$margins, $y, $line_color);
				$v = intval($horizontal_gap * $m / $ratio);
				imagestring($img, 0, 5, $y-5, $v, $bar_color);
			}
			for ($n=0; $n < $total_bars; $n++) {
				echo $i;
				$x1 = $margins + $gap + $n * ($gap + $bar_width);
				$x2 = $x1 + $bar_width;
				$y1 = $margins + $graph_height - intval($values[$n] * $ratio);
				$y2 = $img_height-$margins;
				imagestring($img, 0, $x1+3, $y1-10, $values[$n], $bar_color);
				imagestring($img, 0, $x1+3, $img_height-15, $REG_NAME[$n], $bar_color);
				imagefilledrectangle($img, $x1, $y1, $x2, $y2, $bar_color);	
			}
	//		imagejpeg($img, 'c:/xampp/htdocs/TIGGER/newchart.jpg');
//			chdir('c:/inetpub/vhosts/bearllc.net/cgi-bin/GAMS');
			imagejpeg($img, 'newchart.jpg');
			
			echo <<<_END
			<table align=center>		
			<tr><td><img src="newchart.jpg" alt="border"></td></tr>
			</table>
_END;
	}
	}

	
	}
				}
		fclose($handle);		
//				echo "<form name=graphic method=post action=Graphics.php>";
//				echo "<select onChange=graphic.submit() name=pics>";
//				echo "<option value=pi>Pie Chart</option>";
//				echo "<option value=bar chart>Bar Chart</option>";
		
		?>
