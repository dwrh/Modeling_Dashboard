<?php 

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
	if ($REG[$n] == "USA") $REG_NAME[$n] = "United States";
	if ($REG[$n] == "BRA") $REG_NAME[$n] = "Brazil";
	if ($REG[$n] == "RUS") $REG_NAME[$n] = "Russia";
	if ($REG[$n] == "EUR") $REG_NAME[$n] = "Europe";
	if ($REG[$n] == "LAC") $REG_NAME[$n] = "Latin America";
	if ($REG[$n] == "OPC") $REG_NAME[$n] = "OPEC";
	if ($REG[$n] == "row") $REG_NAME[$n] = "Rest of World";
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

//	chdir('c:/Program Files/GAMS');
	if(($handle = fopen("C:/inetpub/vhosts/bearllc.net/cgi-bin/GAMS/EBIComp.csv", "r")) !== FALSE) {
		
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
		background-color:#b0c4de;
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
		<table border = "1" align=center cellpadding=5>
		<tr><td width=150><p class="sansserif"><b>Select Regions</b></td><td width=150><p class="sansserif"><b>Select Variables</b></td></tr>
		<tr><td width=150>
		<form name="regions" method="post" action="Results_4.php">
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
		</td><td width=150>
		<select multiple size=10 name="variable[]">
		<option value="rgdpmpt" >Real GDP</option>
		<option value="gdp_pc">GDP Per Capita</option>
		<option value="gdp_pc_ppp">GDP Per Capita PPP</option>
		<option value="cons">Real Consumption</option>
		<option value="inv">Real Investment</option>
		<option value="exp">Exports</option>
		<option value="imp">Imports</option>
		<option value="tlabs">Employment</option>
		<option value="cpi">Household Price Index</option>
		</select>
		</td></tr>
		<tr><td align=center colspan=2><input type="submit" value="Submit" class="button"></td></tr>
		</form>
		</table>
		<br>
		<br>
		<br>
		</body></html>

		<?php				

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
	
		fclose($handle);		
//				echo "<form name=graphic method=post action=Graphics.php>";
//				echo "<select onChange=graphic.submit() name=pics>";
//				echo "<option value=pi>Pie Chart</option>";
//				echo "<option value=bar chart>Bar Chart</option>";
		
		?>
