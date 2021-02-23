<?php


// FusionChart php include statement
include('FusionCharts/FusionCharts.php');


// Number of regions - 1, used in for loops
$REG = 13;
//$CTY = isset($_GET['cty']) ;
$CTY = $_GET['cty'] ;

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

/*
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Data for Chart 1, Annual GDP Growth, 2010-2030
$strXML_ch1 = "";
$strXML_ch1 = "<chart palette='3' showvalues='0' caption='Annual GDP Growth, 2010-2030' numbersuffix='%' plotgradientcolor='' bgColor='#FFFFFFF' showBorder='0'>";
$strXML_ch1 .= "<categories>";
		for ($h=0; $h <= $REG; $h++) {
			$strXML_ch1 .= "<category label='" . $dtarr[$h][0] . "' />"; }
$strXML_ch1 .= "</categories>";
$strXML_ch1 .= "<dataset seriesName='Annual Population Growth, 2010-2030'>";
		for ($i=0; $i < $row; $i++) {
			if ($dtarr[$i][2] == 'pop_gr') {
				$strXML_ch1 .= "<set value='" . $dtarr[$i][1] . "' />"; }
		}
$strXML_ch1 .= "</dataset>";
$strXML_ch1 .= "<dataset seriesName='Annual Per Capita GDP Growth, 2010-2030'>";
		for ($j=0; $j < $row; $j++) {
			if ($dtarr[$j][2] == 'gdp_pc_gr') {
				$strXML_ch1 .= "<set value='" . $dtarr[$j][1] . "' />"; }
		}
$strXML_ch1 .= "</dataset>";
$strXML_ch1 .= "</chart>";
*/

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Data for Map 1, Annual GDP Growth

// 1. First create n x 2 array with FusionMaps country ID in the first column and our regional identifier in the second column
include('Map_Data_Asia.php') ;
// 2. Second, create third column in the array that matches our regional identifier with data from the CSV file
	for ($a=0; $a < $row; $a++) {
		if ($dtarr[$a][2] == 'gdp_gr') {
			for ($b=0; $b <= 48; $b++) {
					if ($mapArray[$b][2] == $dtarr[$a][0]) {
					$mapArray[$b][3] = $dtarr[$a][1];
				}
			}
		}
}

// 3. Third, set map values and colors
$strXML_m1 = "";
$strXML_m1 = "<map showLabels='0' includeNameInLabels='0' borderColor='FFFFFF' showBevel='0' legendPosition='Bottom' legendCaption='Annual GDP Growth, 2010-2030' showCanvasBorder='0'>";
$strXML_m1 .= "<colorRange>";
$strXML_m1 .= "<color minValue='0' maxValue='1.99999' displayValue='0-2%' color='CC0001' />";
$strXML_m1 .= "<color minValue='2' maxValue='3.99999' displayValue='2-4%' color='FFD33A' />";
$strXML_m1 .= "<color minValue='4' maxValue='5.99999' displayValue='4-6%' color='ABF456' />";
$strXML_m1 .= "<color minValue='6' maxValue='20' displayValue='>6%' color='069F06' />";
$strXML_m1 .= "</colorRange><data>";

// 4. Fourth, put map data in the XML script
for($c=0; $c <= 48; $c++) {
$strXML_m1 .= "<entity id='" . $mapArray[$c][1] . "' value='" . $mapArray[$c][3] . "' link='" . $mapArray[$c][4] . "' />";
	}
	$strXML_m1 .= "</data>";
	$strXML_m1  .= "</map>";

/*
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Data for Chart 2, Imports and Exports, 2030
$strXML_ch2 = "";
$strXML_ch2 = "<chart palette='3' showvalues='0' caption='Imports (-) and Exports (+), 2030' yaxisname='Million USD (2010)' plotgradientcolor='' bgColor='#FFFFFFF' showBorder='0' paletteColors='009900, FFCC33, CC0000'>";
$strXML_ch2 .= "<categories>";
		for ($hh=0; $hh <= $REG; $hh++) {
			$strXML_ch2 .= "<category label='" . $dtarr[$hh][0] . "' />"; }
$strXML_ch2 .= "</categories>";
$strXML_ch2 .= "<dataset seriesName='Agriculture'>";
		for ($ii=0; $ii < $row; $ii++) {
			if ($dtarr[$ii][2] == 'agfd_imp') {
				$strXML_ch2 .= "<set value='" . $dtarr[$ii][1] . "' />"; }
		}
$strXML_ch2 .= "</dataset>";
$strXML_ch2 .= "<dataset seriesName='Manufacturing'>";
		for ($iii=0; $iii < $row; $iii++) {
			if ($dtarr[$iii][2] == 'mfg_imp') {
				$strXML_ch2 .= "<set value='" . $dtarr[$iii][1] . "' />"; }
		}
$strXML_ch2 .= "</dataset>";
$strXML_ch2 .= "<dataset seriesName='Services'>";
		for ($iiii=0; $iiii < $row; $iiii++) {
			if ($dtarr[$iiii][2] == 'serv_imp') {
				$strXML_ch2 .= "<set value='" . $dtarr[$iiii][1] . "' />"; }
		}
$strXML_ch2 .= "</dataset>";
$strXML_ch2 .= "<dataset seriesName=''>";
		for ($jj=0; $jj < $row; $jj++) {
			if ($dtarr[$jj][2] == 'agfd_exp') {
				$strXML_ch2 .= "<set value='" . $dtarr[$jj][1] . "' />"; }
		}
$strXML_ch2 .= "</dataset>";
$strXML_ch2 .= "<dataset seriesName=''>";
		for ($jjj=0; $jjj < $row; $jjj++) {
			if ($dtarr[$jjj][2] == 'mfg_exp') {
				$strXML_ch2 .= "<set value='" . $dtarr[$jjj][1] . "' />"; }
		}
$strXML_ch2 .= "</dataset>";
$strXML_ch2 .= "<dataset seriesName=''>";
		for ($jjjj=0; $jjjj < $row; $jjjj++) {
			if ($dtarr[$jjjj][2] == 'serv_exp') {
				$strXML_ch2 .= "<set value='" . $dtarr[$jjjj][1] . "' />"; }
		}
$strXML_ch2 .= "</dataset>";
$strXML_ch2 .= "</chart>";

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Data for Pie, Shares of Asian GDP, 2030
$strXML_p1 = "";
$strXML_p1 = "<chart caption='Shares of Asian GDP, 2030' bgColor='#FFFFFFF' showBorder='0' showLabels='1' showPercentValues='0' showValues='0' legendPosition='bottom' palette='3'>";
		for ($k=0; $k < $row; $k++) {
			if ($dtarr[$k][2] == 'gdp') {
				$strXML_p1 .= "<set label='" . $dtarr[$k][0] . "' value='" . $dtarr[$k][1] . "' />"; }
		}
$strXML_p1 .= "</chart>";

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Data for Pie, Shares of Employment Growth, 2010-2030
$strXML_p2 = "";
$strXML_p2 = "<chart palette='3' caption='Shares of Employment Growth, 2010-2030' bgColor='#FFFFFFF' showBorder='0' showPercentValues='0' showValues='0'>";
		for ($k=0; $k < $row; $k++) {
			if ($dtarr[$k][2] == 'emp_gr') {
					if ($dtarr[$k][1] > 0) {
				$strXML_p2 .= "<set label='" . $dtarr[$k][0] . "' value='" . $dtarr[$k][1] . "' />"; }
			}
		}
$strXML_p2 .= "</chart>";
*/

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// End CSV open statement and close CSV file
}
fclose($handle);
//$CTY="AFG";
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

	<table class="main_table" cellspacing="0" cellpadding="3" width="1000">
	<tr>
	<td>
	<table class="left_table" cellspacing="0" >
	<tr>
	<td>

	<div id="mapdiv" align="center"> 
        FusionMaps.
	</div>
	 <script type="text/javascript" src="../Data/<?=$CTY?>Growth.js" ></script>
    <script type="text/javascript">
	  
	   var map = new FusionCharts("../FusionMaps_XT_Website/Maps/FCMap_Afghanistan.swf", "MapId", "980", "820", "0", "0");
	  	   map.setXMLData( dataString );		   	   
	   map.render("mapdiv");
	</script>

	</td>
	</tr>

</td>
</tr>
</table>


</html>
