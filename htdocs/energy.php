<?php

// FusionChart php include statement
include('FusionCharts/FusionCharts.php');

// Number of regions - 1, used in for loops
$REG = 13;
$CTY = 48 ;

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Open CSV file and read in data
if(($handle = fopen("CAREC.csv", "r")) !== FALSE) {

	$row = 0;
		while (($data = fgetcsv($handle, 4000, ',')) !== FALSE) {
			$num = count($data);
			for ($col = 0; $col < $num; $col++) {
				$dtarr[$row][$col] = $data[$col];
			}
			$row++;
		}

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Data for Maps 1&2, Per Capita Energy Use and Energy Intensity

include('Map_Data_Asia.php') ;

// 2.1 Create third column in the array that matches our regional identifier with data from the CSV file for Map 1
	for ($a=0; $a < $row; $a++) {
		if ($dtarr[$a][2] == 'en_pc') {
			for ($b=0; $b <= 48; $b++) {
					if ($mapArray[$b][2] == $dtarr[$a][0]) {
					$mapArray[$b][3] = $dtarr[$a][1];
				}
			}
		}
}

// 2.2 Create third column in the array that matches our regional identifier with data from the CSV file for Map 2
	for ($d=0; $d < $row; $d++) {
		if ($dtarr[$d][2] == 'en_int') {
			for ($e=0; $e <= 201; $e++) {
					if ($mapArray[$e][2] == $dtarr[$d][0]) {
					$mapArray[$e][5] = $dtarr[$d][1];
				}
			}
		}
}

// 3.1 Set map values and colors for Map 1
$strXML_m1 = "";
$strXML_m1 = "<map showLabels='0' includeNameInLabels='0' borderColor='FFFFFF' showBevel='0' legendPosition='Bottom' legendCaption='Per Capita Energy Use, 2030 (Mtoe/person)' showCanvasBorder='0' legendPadding='-50'>";
$strXML_m1 .= "<colorRange>";
$strXML_m1 .= "<color minValue='0' maxValue='1.9999' displayValue='0-2' color='069F06' />";
$strXML_m1 .= "<color minValue='2' maxValue='4.9999' displayValue='2-5' color='ABF456' />";
$strXML_m1 .= "<color minValue='5' maxValue='7.9999' displayValue='5-8' color='FFD33A' />";
$strXML_m1 .= "<color minValue='8' maxValue='15' displayValue='>8' color='CC0001' />";
$strXML_m1 .= "</colorRange><data>";

// 3.2 Set map values and colors for Map 2
$strXML_m2 = "";
$strXML_m2 = "<map showLabels='0' includeNameInLabels='0' borderColor='FFFFFF' showBevel='0' legendPosition='Bottom' legendCaption='Energy Intensity, 2030 (toe/1,000 USD)' showCanvasBorder='0' legendPadding='-50'>";
$strXML_m2 .= "<colorRange>";
$strXML_m2 .= "<color minValue='0' maxValue='0.1499' displayValue='0-0.15' color='069F06' />";
$strXML_m2 .= "<color minValue='0.15' maxValue='0.2999' displayValue='0.15-0.30' color='ABF456' />";
$strXML_m2 .= "<color minValue='0.30' maxValue='0.4499' displayValue='0.30-0.45' color='FFD33A' />";
$strXML_m2 .= "<color minValue='0.45' maxValue='1' displayValue='0.45-0.60' color='CC0001' />";
$strXML_m2 .= "</colorRange><data>";

// 4.1 Put map data into XML script for Map 1
for($c=0; $c <= $CTY; $c++) {
//		$strXML_m1 .= "<entity id='" . $mapArray[$c][1] . "' value='" . $mapArray[$c][3] . "' />";
$strXML_m1 .= "<entity id='" . $mapArray[$c][1] . "' value='" . $mapArray[$c][3] . "' link='" . $mapArray[$c][4] . "' />";
	}
	$strXML_m1 .= "</data>";
	$strXML_m1  .= "</map>";

// 4.2 Put map data into XML script for Map 2
for($f=0; $f <= $CTY; $f++) {
$strXML_m1 .= "<entity id='" . $mapArray[$c][1] . "' value='" . $mapArray[$c][5] . "' link='" . $mapArray[$c][4] . "' />";
//		$strXML_m2 .= "<entity id='" . $mapArray[$f][1] . "' value='" . $mapArray[$f][4] . "' />";
	}
	$strXML_m2 .= "</data>";
	$strXML_m2  .= "</map>";

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Data for Chart 2, Energy Imports and Exports, 2030
$strXML_ch2 = "";
$strXML_ch2 = "<chart palette='3' divLineColor='000000' showvalues='0' caption='Energy Imports (-) and Exports (+), 2030' yaxisname='Billion USD (2010)' plotgradientcolor='' bgColor='#FFFFFFF' showBorder='0' paletteColors='000000, 3366CC, 330099'>";
$strXML_ch2 .= "<categories>";
		for ($hh=0; $hh <= $REG; $hh++) {
			$strXML_ch2 .= "<category label='" . $dtarr[$hh][0] . "' />"; }
$strXML_ch2 .= "</categories>";
$strXML_ch2 .= "<dataset seriesName='Coal'>";
		for ($ii=0; $ii < $row; $ii++) {
			if ($dtarr[$ii][2] == 'coal_exp') {
				$strXML_ch2 .= "<set value='" . $dtarr[$ii][1] . "' />"; }
		}
$strXML_ch2 .= "</dataset>";
$strXML_ch2 .= "<dataset seriesName='Gas'>";
		for ($jj=0; $jj < $row; $jj++) {
			if ($dtarr[$jj][2] == 'gas_exp') {
				$strXML_ch2 .= "<set value='" . $dtarr[$jj][1] . "' />"; }
		}
$strXML_ch2 .= "</dataset>";
$strXML_ch2 .= "<dataset seriesName='Oil'>";
		for ($kk=0; $kk < $row; $kk++) {
			if ($dtarr[$kk][2] == 'oil_exp') {
				$strXML_ch2 .= "<set value='" . $dtarr[$kk][1] . "' />"; }
		}
$strXML_ch2 .= "</dataset>";
$strXML_ch2 .= "<dataset seriesName=''>";
		for ($ll=0; $ll < $row; $ll++) {
			if ($dtarr[$ll][2] == 'coal_imp') {
				$strXML_ch2 .= "<set value='" . $dtarr[$ll][1] . "' />"; }
		}
$strXML_ch2 .= "</dataset>";
$strXML_ch2 .= "<dataset seriesName=''>";
		for ($mm=0; $mm < $row; $mm++) {
			if ($dtarr[$mm][2] == 'gas_imp') {
				$strXML_ch2 .= "<set value='" . $dtarr[$mm][1] . "' />"; }
		}
$strXML_ch2 .= "</dataset>";
$strXML_ch2 .= "<dataset seriesName=''>";
		for ($nn=0; $nn < $row; $nn++) {
			if ($dtarr[$nn][2] == 'oil_imp') {
				$strXML_ch2 .= "<set value='" . $dtarr[$nn][1] . "' />"; }
		}
$strXML_ch2 .= "</dataset>";
$strXML_ch2 .= "</chart>";

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Data for Pie, Global Primary Energy Mix, 2030
$strXML_p1 = "";
$strXML_p1 = "<chart palette='3' caption='Global Energy Mix, 2030' bgColor='#FFFFFFF' showBorder='0' showPercentValues='0' showValues='0' paletteColors='000000, 3366CC, 330099, 339900'>";
		for ($k=0; $k < $row; $k++) {
			if ($dtarr[$k][2] == 'prim_en_shr') {
				$strXML_p1 .= "<set label='" . $dtarr[$k][0] . "' value='" . $dtarr[$k][1] . "' />"; }
		}
$strXML_p1 .= "</chart>";

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Data for Chart 3, Energy Use by Source by Region, 2030
$strXML_ch3 = "";
$strXML_ch3 = "<chart palette='3' showvalues='0' caption='Energy Use by Source by Region, 2030' yaxisname='Energy Use (Mtoe)' plotgradientcolor='' bgColor='#FFFFFFF' showBorder='0' paletteColors='000000, 3366CC, 330099, 339900'>";
$strXML_ch3 .= "<categories>";
		for ($hhh=0; $hhh <= $REG; $hhh++) {
			$strXML_ch3 .= "<category label='" . $dtarr[$hhh][0] . "' />"; }
$strXML_ch3 .= "</categories>";
$strXML_ch3 .= "<dataset seriesName='Coal'>";
		for ($iii=0; $iii < $row; $iii++) {
			if ($dtarr[$iii][2] == 'Coal') {
				$strXML_ch3 .= "<set value='" . $dtarr[$iii][1] . "' />"; }
		}
$strXML_ch3 .= "</dataset>";
$strXML_ch3 .= "<dataset seriesName='gas'>";
		for ($jjj=0; $jjj < $row; $jjj++) {
			if ($dtarr[$jjj][2] == 'gas') {
				$strXML_ch3 .= "<set value='" . $dtarr[$jjj][1] . "' />"; }
		}
$strXML_ch3 .= "</dataset>";
$strXML_ch3 .= "<dataset seriesName='oil'>";
		for ($kkk=0; $kkk < $row; $kkk++) {
			if ($dtarr[$kkk][2] == 'oil') {
				$strXML_ch3 .= "<set value='" . $dtarr[$kkk][1] . "' />"; }
		}
$strXML_ch3 .= "</dataset>";
$strXML_ch3 .= "<dataset seriesName='HNR'>";
		for ($lll=0; $lll < $row; $lll++) {
			if ($dtarr[$lll][2] == 'HNR') {
				$strXML_ch3 .= "<set value='" . $dtarr[$lll][1] . "' />"; }
		}
$strXML_ch3 .= "</dataset>";
$strXML_ch3 .= "</chart>";

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// End CSV open statement and close CSV file
}
fclose($handle);
?>

<!DOCTYPE
td PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<script language="Javascript" SRC="FusionCharts/FusionCharts.js"></script>
<link rel='stylesheet' href="CAPSIM_Styles.css" />
<style type="text/css">
</style>
</head>

<body>

<?php include('header1.html'); ?>
<tr>
<td>
	<table class="main_table" cellspacing="0" cellpadding="3" width="900">
	<tr>
	<td>

	<table class="left_table" cellspacing="0" >
	<tr>
	<td>
	<br>
	<?php
	echo renderChart("../FusionMaps_XT_Website/Maps/FCMap_Asia.swf", "", $strXML_m1, "ENPC", 500, 300, false, true);
	?>
	</td>
	</tr>
	<tr>
	<td class="figs">
	<?php
	echo renderChart("../FusionMaps_XT_Website/Maps/FCMap_Asia.swf", "", $strXML_m2, "ENINT", 500, 300, false, true);
	?>
	</td>
	</tr>
	<tr>
	<td class="figs">
	<?php
	echo renderChart("FusionCharts/StackedBar2D.swf", "", $strXML_ch2, "NEX", 500, 300, false, true);
	?>
	</td>
	</tr>
	</table>
	<td valign=top>
	<table cellspacing="0" >
	<tr valign="top"><td>
	<?php
	echo renderChart("FusionCharts/pie2D.swf", "", $strXML_p1, "ENSHR", 400, 300, false, true);
	?>
	</td></tr>
	<tr><td class="figs">
	<?php
	echo renderChart("FusionCharts/StackedBar2D.swf", "", $strXML_ch3, "RGDPPPp", 400, 300, false, true);
	?>
	</table>
	</td>
	</tr>
	</table>

</td>
</tr>
</table>


</html>
