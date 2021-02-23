<?php
/*
Template Name: Results
*/
?>
<?php
global $avia_config;

	/*
	 * get_header is a basic wordpress function, used to retrieve the header.php file in your theme directory.
	 */
	 get_header();


 	 if( get_post_meta(get_the_ID(), 'header', true) != 'no') echo avia_title();
	 ?>

		<div class='container_wrap container_wrap_first main_color <?php avia_layout_class( 'main' ); ?>'>

			<div class='container'>

				<main class='template-page content  <?php avia_layout_class( 'content' ); ?> units' <?php avia_markup_helper(array('context' => 'content','post_type'=>'page'));?>>

   <?php


// FusionChart php include statement
include('FusionCharts/FusionCharts.php');

// Number of regions - 1, used in for loops
$REG = 13;
$CTY = $_GET['cty'] ;

include('Map_Data_Asia.php') ;

for ($i=0; $i < 21; $i++) {
	if ($mapLabel[$i][1] == $CTY) {
		$MAP = $mapLabel[$i][2] ;
 	}
}


//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Open CSV file and read in data
if(($handle = fopen("Data/CAREC.csv", "r")) !== FALSE) {

	$row = 0;
		while (($data = fgetcsv($handle, 4000, ',')) !== FALSE) {
			$num = count($data);
			for ($col = 0; $col < $num; $col++) {
				$dtarr[$row][$col] = $data[$col];
			}
			$row++;
		}

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Data for Chart 1, Annual GDP Growth, 2010-2030
$strXML_ch1 = "";
$strXML_ch1 .= "<chart palette='3' showvalues='0' caption='Average GDP Growth' numbersuffix='%' plotgradientcolor='' bgColor='#FFFFFFF' showBorder='0'>";
$strXML_ch1 .= "<categories>";
		for ($h=0; $h <= $REG; $h++) {
			$strXML_ch1 .= "<category label='" . $dtarr[$h][1] . "' />"; }
$strXML_ch1 .= "</categories>";
$strXML_ch1 .= "<dataset seriesName='Annual Population Growth, 2010-2030'>";
		for ($i=0; $i < $row; $i++) {
			if ($dtarr[$i][2] == 'pop_gr') {
				$strXML_ch1 .= "<set value='" . $dtarr[$i][6] . "' />"; }
		}
$strXML_ch1 .= "</dataset>";
$strXML_ch1 .= "<dataset seriesName='Annual Per Capita GDP Growth, 2010-2030'>";
		for ($j=0; $j < $row; $j++) {
			if ($dtarr[$j][2] == 'gdp_pc_gr') {
				$strXML_ch1 .= "<set value='" . $dtarr[$j][6] . "' />"; }
		}
$strXML_ch1 .= "</dataset>";
$strXML_ch1 .= "</chart>";


//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Data for Map 1, Annual GDP Growth

// 2. Second, create third column in the array that matches our regional identifier with data from the CSV file
	for ($a=0; $a < $row; $a++) {
		if (($dtarr[$a][2] == 'gdp_gr') and ($dtarr[$a][1] == $MAP)) {
			for ($b=0; $b <= $CTY; $b++) {
					if ($mapArray[$b][2] == $dtarr[$a][0]) {
					$mapArray[$b][3] = $dtarr[$a][6];
				}
			}
		}
}

// 3. Third, set map values and colors
$strXML_m1 = "";
$strXML_m1 = "<map showLabels='0' includeNameInLabels='0' borderColor='FFFFFF' showBevel='0' legendPosition='Bottom' legendCaption='Annual GDP Growth, 2010-2030' showCanvasBorder='0' legendPadding='-50'>";
$strXML_m1 .= "<colorRange>";
$strXML_m1 .= "<color minValue='0' maxValue='1.99999' displayValue='0-2%' color='CC0001' />";
$strXML_m1 .= "<color minValue='2' maxValue='3.99999' displayValue='2-4%' color='FFD33A' />";
$strXML_m1 .= "<color minValue='4' maxValue='5.99999' displayValue='4-6%' color='ABF456' />";
$strXML_m1 .= "<color minValue='6' maxValue='20' displayValue='>6%' color='069F06' />";
$strXML_m1 .= "</colorRange><data>";

// 4. Fourth, put map data in the XML script
for($c=0; $c <= $CTY; $c++) {
$strXML_m1 .= "<entity id='" . $mapArray[$c][1] . "' value='" . $mapArray[$c][3] . "' link='" . $mapArray[$c][4] . "' />";
	}
	$strXML_m1 .= "</data>";
	$strXML_m1  .= "</map>";

print_r ($strXML_m1);
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Data for Chart 2, Imports and Exports, 2010

$strXML_ch2 = "";
$strXML_ch2 = "<chart palette='3' showvalues='0' caption='Imports (-) and Exports (+) by Sector, 2010' yaxisname='Million USD (2010)' plotgradientcolor='' bgColor='#FFFFFFF' showBorder='0' paletteColors='009900, FFCC33, CC0000'>";

$strXML_ch2 .= "<categories>";
	for ($hh=0; $hh <= $row; $hh++) {
		if (($dtarr[$hh][2] == 'Imp_Sect') and ($dtarr[$hh][1] == $CTY)) {
			$strXML_ch2 .= "<category label='" . $dtarr[$hh][3] . "' />"; 
		}
	}
$strXML_ch2 .= "</categories>";

$strXML_ch2 .= "<dataset seriesName=''>";
	For ($ii=0; $ii < $row; $ii++) {
		if (($dtarr[$ii][2] == 'Imp_Sect') and ($dtarr[$ii][1] == $CTY)) {
			$strXML_ch2 .= "<set value='" . $dtarr[$ii][7] . "' />"; 
		}
	}
$strXML_ch2 .= "</dataset>";

$strXML_ch2 .= "<dataset seriesName=''>";
		for ($jj=0; $jj < $row; $jj++) {
		if (($dtarr[$jj][2] == 'Exp_Sect') and ($dtarr[$jj][1] == $CTY)) {
			$strXML_ch2 .= "<set value='" . $dtarr[$jj][7] . "' />"; 
		}
	}
$strXML_ch2 .= "</dataset>";
$strXML_ch2 .= "</chart>";
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Data for Pie, Shares of Sectoral Value Added, 2010
$strXML_p1 = "";
$strXML_p1 = "<chart caption='Value-added' bgColor='#FFFFFFF' showBorder='0' showLabels='1' showPercentValues='0' showValues='0'>";
		for ($k=0; $k < $row; $k++) {
			if (($dtarr[$k][2] == 'va_sect') and ($dtarr[$k][1] == $CTY)) {
				$strXML_p1 .= "<set label='" . $dtarr[$k][4] . "' value='" . $dtarr[$k][6] . "' />"; }
		}
$strXML_p1 .= "</chart>";

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Data for Pie, Shares of Employment Growth, 2010-2030
$strXML_p2 = "";
$strXML_p2 = "<chart caption='Employment' bgColor='#FFFFFFF' showBorder='0' showLabels='1' showPercentValues='0' showValues='0'>";
		for ($k=0; $k < $row; $k++) {
			if (($dtarr[$k][2] == 'emp_sect') and ($dtarr[$k][1] == $CTY)) {
					if ($dtarr[$k][6] > 0) {
				$strXML_p2 .= "<set label='" . $dtarr[$k][4] . "' value='" . $dtarr[$k][6] . "' />"; }
			}
		}
$strXML_p2 .= "</chart>";

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Data for Pie, Shares of Exports by Partner, 2010
$strXML_p3 = "";
$strXML_p3 = "<chart caption='Exports by Partner' bgColor='#FFFFFFF' showBorder='0' showLabels='1' showPercentValues='0' showValues='0'>";
		for ($k=0; $k < $row; $k++) {
			if (($dtarr[$k][2] == 'Exp_Cty') and ($dtarr[$k][1] == $CTY)) {
				$strXML_p3 .= "<set label='" . $dtarr[$k][4] . "' value='" . $dtarr[$k][7] . "' />"; }
		}
$strXML_p3 .= "</chart>";

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Data for Pie, Shares of Imports by Partner, 2010
$strXML_p4 = "";
$strXML_p4 = "<chart caption='Imports by Partner' bgColor='#FFFFFFF' showBorder='0' showLabels='1' showPercentValues='0' showValues='0'>";
		for ($k=0; $k < $row; $k++) {
			if (($dtarr[$k][2] == 'Imp_Cty') and ($dtarr[$k][1] == $CTY)) {
					if ($dtarr[$k][6] > 0) {
				$strXML_p4 .= "<set label='" . $dtarr[$k][4] . "' value='" . $dtarr[$k][7] . "' />"; }
			}
		}
$strXML_p4 .= "</chart>";

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
    <td width="130" class="menu_selected"><div align="center"><a class="selected"><?=$MAP?> : Baseline Economic Statistics, 2010</a></div></td>

<tr>


<td>
	<table class="main_table" cellspacing="1" cellpadding="3" width="100">
	<tr>
<td width="100" valign=TOP><br>
<p class="sansserif">
<?php include("Nav1.html"); ?>
</p>
</td>
	<td>

	<table class="left_table" cellspacing="0" >
	<tr>
	<td>
	<?php
	echo renderChart("FusionCharts/StackedColumn2D.swf", "", $strXML_ch1, "GDPPC", 800, 400, false, true);
	?>
	</td>
	</tr>

	<tr>
	<td class="figs">
	<div id="mapdiv" align="right"> 
        FusionMaps.
	</div>
	 <script type="text/javascript" src="../Data/<?=$CTY?>Growth.js" ></script>
    <script type="text/javascript">
	  
//	   var map = new FusionCharts("/FusionMaps_XT_Website/Maps/FCMap_<?=$MAP?>.swf", "MapId", "800", "400", "0", "0");
	   var map = new FusionCharts("FusionCharts/FCMap_<?=$MAP?>.swf", "MapId", "800", "400", "0", "0");
	  	map.setXMLData("Data/<?=$CTY?>Growth.js");		   	   
	   map.render("mapdiv");
	</script>
	</td>
	</tr>
	</td>
	</tr>

	<tr>
	<td class="figs">
	<?php
	echo renderChart("FusionCharts/StackedBar2D.swf", "", $strXML_ch2, "NEX", 800, 300, false, true);
	?>
	</td>
	</tr>
	</table>
	<td valign=top>
	<table cellspacing="1" >
	<tr valign="top"><td>
	<?php
	echo renderChart("FusionCharts/pie2D.swf", "", $strXML_p1, "Pie1", 500, 300, false, true);
	?>
	</td></tr>
	<tr><td>
	<?php
	echo renderChart("FusionCharts/pie2D.swf", "", $strXML_p2, "Pie2", 500, 300, false, true);
	?>
	</td></tr>
	<?php
	echo renderChart("FusionCharts/pie2D.swf", "", $strXML_p3, "Pie3", 500, 300, false, true);
	?>
	</td></tr>
	<tr><td>
	<?php
	echo renderChart("FusionCharts/pie2D.swf", "", $strXML_p4, "Pie4", 500, 300, false, true);
	?>
	</table>
	</td>
	</tr>
	</table>

</td>
</tr>
</table>


</html>
				<!--end content-->
				</main>

				<?php

				//get the sidebar
				$avia_config['currently_viewing'] = 'page';
				get_sidebar();

				?>

			</div><!--end container-->

		</div><!-- close default .container_wrap element -->



<?php get_footer(); ?>
