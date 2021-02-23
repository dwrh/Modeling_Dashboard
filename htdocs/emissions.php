<?php

// FusionChart php include statement
include('FusionCharts/FusionCharts.php');

// Number of regions - 1, used in for loops
$REG = 11;

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Open CSV file and read in data
if(($handle = fopen("CAPSIM_output.csv", "r")) !== FALSE) {

	$row = 0;
		while (($data = fgetcsv($handle, 4000, ',')) !== FALSE) {
			$num = count($data);
			for ($col = 0; $col < $num; $col++) {
				$dtarr[$row][$col] = $data[$col];
			}
			$row++;
		}

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Data for Chart 1, Residential and Industry CO2 Emissions, 2030
$strXML_ch1 = "";
$strXML_ch1 = "<chart palette='3' showvalues='0' caption='Residential and Industry CO2 Emissions, 2030' yAxisName='Million Metric Tons CO2' plotgradientcolor='' bgColor='#FFFFFFF' showBorder='0'>";
$strXML_ch1 .= "<categories>";
		for ($h=0; $h <= $REG; $h++) {
			$strXML_ch1 .= "<category label='" . $dtarr[$h][0] . "' />"; }
$strXML_ch1 .= "</categories>";
$strXML_ch1 .= "<dataset seriesName='Residential'>";
		for ($i=0; $i < $row; $i++) {
			if ($dtarr[$i][2] == 'CO2_hh_shr') {
				$strXML_ch1 .= "<set value='" . $dtarr[$i][1] . "' />"; }
		}
$strXML_ch1 .= "</dataset>";
$strXML_ch1 .= "<dataset seriesName='Industry'>";
		for ($j=0; $j < $row; $j++) {
			if ($dtarr[$j][2] == 'CO2_comm_shr') {
				$strXML_ch1 .= "<set value='" . $dtarr[$j][1] . "' />"; }
		}
$strXML_ch1 .= "</dataset>";
$strXML_ch1 .= "</chart>";

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Data for Chart 2, Transportation and Stationary CO2 Emissions, 2030
$strXML_ch2 = "";
$strXML_ch2 = "<chart palette='3' showvalues='0' caption='Transportation and Stationary CO2 Emissions, 2030' bgColor='#FFFFFFF' yAxisName='Million Metric Tons CO2' plotgradientcolor='' showBorder='0'>";
$strXML_ch2 .= "<categories>";
		for ($hh=0; $hh <= $REG; $hh++) {
			$strXML_ch2 .= "<category label='" . $dtarr[$hh][0] . "' />"; }
$strXML_ch2 .= "</categories>";
$strXML_ch2 .= "<dataset seriesName='Transportation'>";
		for ($ii=0; $ii < $row; $ii++) {
			if ($dtarr[$ii][2] == 'CO2_trans_shr') {
				$strXML_ch2 .= "<set value='" . $dtarr[$ii][1] . "' />"; }
		}
$strXML_ch2 .= "</dataset>";
$strXML_ch2 .= "<dataset seriesName='Stationary Sources'>";
		for ($jj=0; $jj < $row; $jj++) {
			if ($dtarr[$jj][2] == 'CO2_stat_shr') {
				$strXML_ch2 .= "<set value='" . $dtarr[$jj][1] . "' />"; }
		}
$strXML_ch2 .= "</dataset>";
$strXML_ch2 .= "</chart>";

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Data for Bubble Chart, Per Capita CO2 Emissions, 2010 versus 2030

// 1. Store data for x axis values in $xval
	$g=0;
		for ($gg=0; $gg < $row; $gg++) {
			if ($dtarr[$gg][2] == 'CO2_em_Base') {
				$xval[$g] = $dtarr[$gg][1];
				$g++;
			}
		}

// 2. Store data for y axis values in $yval
	$n=0;
		for ($nn=0; $nn < $row; $nn++) {
			if ($dtarr[$nn][2] == 'CO2_em_2030') {
				 $yval[$n] = $dtarr[$nn][1];
				 $n++;
			}
		}

// 3. Store data for population bubble size in $zval
	$o=0;
		for ($oo=0; $oo < $row; $oo++) {
			if ($dtarr[$oo][2] == 'pop') {
				 $zval[$o] = $dtarr[$oo][1];
				 $o++;
			}
		}

// 4. Set x axis bin sizes
		$max_x = 4;
		$min_x = 0;
		$mean_x = 2;
		$firstq_x = 1;
		$secondq_x = 3;

// 5. Set x axis bins
$strXML_b = "";
$strXML_b = "<chart caption='Per Capita CO2 Emissions, 2010 versus 2030 (bubbles proportional to population size)' palette='3' is3D='1' showBorder='0' showPlotBorder='0' xAxisName='log (tCO2 per person), 2010' yAxisName='log (tCO2 per person), 2030' chartRightMargin='30' bgcolor='#FFFFFF' yAxisMaxValue='4' xAxisMaxValue='4' adjustDiv='0' numDivLines='3' yAxisMinValue='0' clipBubbles='1'>";
$strXML_b .= "<categories>";
$strXML_b .= "<category label='" . $min_x . "' x='" . $min_x . "' showVerticalLine='1' />";
$strXML_b .= "<category label='" . $firstq_x . "' x='" . $firstq_x . "' showVerticalLine='1' />";
$strXML_b .= "<category label='" . $mean_x . "' x='" . $mean_x . "' showVerticalLine='1' />";
$strXML_b .= "<category label='" . $secondq_x . "' x='" . $secondq_x . "' showVerticalLine='1' />";
$strXML_b .= "<category label='" . $max_x . "' x='" . $max_x . "' showVerticalLine='1' />";
$strXML_b .= "</categories>";

// 6. Show region names in bubbles
$strXML_b .= "<dataSet showValues='1'>";

// 7. Put data in XML and close
		for ($p=0; $p <= $REG; $p++) {
			$strXML_b .= "<set x='" . $xval[$p] . "' y='" . $yval[$p] . "' z='" . $zval[$p] . "' name='" . $dtarr[$p][0] . "' />";
		}

$strXML_b .= "</dataSet>";
$strXML_b .= "</chart>";

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Dial Data, PPM Dial
$strXML_d = "";
$strXML_d = "<chart lowerLimit='200' showBorder='0' bgColor='#FFFFFF' upperLimit='800' gaugeStartAngle='180' gaugeEndAngle='0' palette='3' tickValueDistance='20' showValue='0' tickValueStep='1'>";
$strXML_d .= "<colorRange>";
$strXML_d .= "<color minValue='200' maxValue='350' code='8BBA00'/>";
$strXML_d .= "<color minValue='350' maxValue='550' code='F6BD0F'/>";
$strXML_d .= "<color minValue='550' maxValue='800' code='FF654F'/>";
$strXML_d .= "</colorRange>";
$strXML_d .= "<dials>";
		for ($q=0; $q < $row; $q++) {
			if ($dtarr[$q][2] == 'ppm') {
				$strXML_d .= "<dial value='" . $dtarr[$q][1] . "' rearExtension='10' />";
				$ppm = $dtarr[$q][1]; }
		}
$strXML_d .= "</dials>";
$strXML_d .= "</chart>"	;

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

<table align=center cellspacing="0">
<tr>
<td>
	<table width="900" border="0" cellspacing="0" cellpadding="9">
    <tr>
    <td width="130" class="menu"><div align="center"><a href="Economy.php">Economy</a></div></td>
    <td width="130" class="menu"><div align="center"><a href="Energy.php">Energy</a></div></td>
    <td width="130" class="menu_selected"><div align="center"><a href="Emissions.php"  class="selected">Emissions</a></div></td>
    <td align="right"><a href="Model_inputs.php" class="menu">Change Inputs</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="Docs/CAPSIM_Overview.pdf" class="menu">Help</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="CAPSIM_output.csv" class="menu">Download Data</a></td>
    </tr>
    </table></td></tr>
<tr>
<td>
	<table class="main_table" cellspacing="0" cellpadding="3" width="900">
	<tr>
	<td>

	<table class="left_table" cellspacing="0" >
	<tr>
	<td>
	<?php
	echo renderChart("FusionCharts/StackedColumn2D.swf", "", $strXML_ch1, "ENPC", 500, 300, false, true);
	?>
	</td>
	</tr>
	<tr>
	<td class="figs">
	<?php
	echo renderChart("FusionCharts/StackedColumn2D.swf", "", $strXML_ch2, "ENINT", 500, 300, false, true);
	?>
	</td>
	</tr>
	<tr>
	<td>
	<?php
//	echo renderChart("FusionCharts/StackedBar2D.swf", "", $strXML_ch2, "NEX", 500, 300, false, true);
	?>
	</td>
	</tr>
	</table>
	<td valign=top>
	<table cellspacing="0" >
	<tr><td>

	<?php
	echo renderChart("FusionCharts/Bubble.swf", "", $strXML_b, "ENSHR", 350, 350, false, true);
	?>
	</td></tr>
	<tr><td class="figs" align=center>
	<?php
	echo renderChart("FusionCharts/AngularGauge.swf", "", $strXML_d, "RGDPPPp", 365, 255, false, true);
	echo "<p class='sansserif' align=center style='color:#003366'><b>2030 CO2 ppm Gauge:  ";
	echo $ppm;
	echo " ppm</b></p>";
		?>

	</table>
	</td>
	</tr>
	</table>

</td>
</tr>
</table>


</html>
