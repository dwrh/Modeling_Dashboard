<?php

include('Header.php') ;

// FusionChart php include statement
include('FusionCharts/FusionCharts.php');

// Number of regions - 1, used in for loops
$REG = 10;
$CTY = $_GET['cty'] ;
//$CTY = 'KAZ' ;

include('Map_Data_Asia.php') ;

for ($i=0; $i < 21; $i++) {
	if ($mapLabel[$i][1] == $CTY) {
		$MAP = $mapLabel[$i][2] ;
 	}
}

//echo $MAP ;
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Open CSV file and read in data
if(($handle = fopen("Data/CAREC2.csv", "r")) !== FALSE) {

	$row = 0;
		while (($data = fgetcsv($handle, 400, ',')) !== FALSE) {
			$num = count($data);
			for ($col = 0; $col < $num; $col++) {
				$dtarr[$row][$col] = $data[$col];
			}
			$row++;
		}

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Data for Chart B51, GDP Components, 2010-2050

$strXML_ch501 = "";
$strXML_ch501 = "<chart palette='3' showvalues='0' caption='GDP Components, Baseline Growth 2010-2050' showLegend='1' 
yaxisname='Millions of 2010 USD' plotgradientcolor='' baseFontSize='10' bgColor='#FFFFFFF' showBorder='0' 
paletteColors='FFFF00, FFCC33, 0080FF, 009900, FF4040' decimals='0'>";

$strXML_ch501 .= "<categories>";
	for ($hh=0; $hh <= $row; $hh++) {
	if (($dtarr[$hh][0] == 'BAU') and ($dtarr[$hh][7] == 'PERCENT')) {
		if (($dtarr[$hh][2] == 'CPI') and ($dtarr[$hh][1] == $CTY)) {
			$strXML_ch501 .= "<category label='" . $dtarr[$hh][3] . "' />"; 
		}
	}
	}
$strXML_ch501 .= "</categories>";

$strXML_ch501 .= "<dataset seriesName='Exports'>";
	for ($jj=0; $jj < $row; $jj++) {
	if ($dtarr[$jj][0] == 'BAU') {
		if (($dtarr[$jj][2] == 'EXP') and ($dtarr[$jj][1] == $CTY)) {
			$strXML_ch501 .= "<set value='" . $dtarr[$jj][6] . "' />"; 
		}
	}
	}
$strXML_ch501 .= "</dataset>";

$strXML_ch501 .= "<dataset seriesName='Investment'>";
	for ($jj=0; $jj < $row; $jj++) {
	if ($dtarr[$jj][0] == 'BAU') {
		if (($dtarr[$jj][2] == 'INV') and ($dtarr[$jj][1] == $CTY)) {
			$strXML_ch501 .= "<set value='" . $dtarr[$jj][6] . "' />"; 
		}
	}
	}
$strXML_ch501 .= "</dataset>";

$strXML_ch501 .= "<dataset seriesName='Government'>";
	for ($jj=0; $jj < $row; $jj++) {
	if ($dtarr[$jj][0] == 'BAU') {
		if (($dtarr[$jj][2] == 'INV') and ($dtarr[$jj][1] == $CTY)) {
			$strXML_ch501 .= "<set value='" . $dtarr[$jj][6] . "' />"; 
		}
	}
	}
$strXML_ch501 .= "</dataset>";

$strXML_ch501 .= "<dataset seriesName='Consumption'>";
	for ($jj=0; $jj < $row; $jj++) {
	if ($dtarr[$jj][0] == 'BAU') {
		if (($dtarr[$jj][2] == 'CONS') and ($dtarr[$jj][1] == $CTY)) {
			$strXML_ch501 .= "<set value='" . $dtarr[$jj][6] . "' />"; 
		}
	}
	}
$strXML_ch501 .= "</dataset>";

$strXML_ch501 .= "<dataset seriesName='Imports'>";
	for ($jj=0; $jj < $row; $jj++) {
	if ($dtarr[$jj][0] == 'BAU') {
		if (($dtarr[$jj][2] == 'IMP') and ($dtarr[$jj][1] == $CTY)) {
			$strXML_ch501 .= "<set value='" . $dtarr[$jj][6] . "' />"; 
		}
	}
	}
$strXML_ch501 .= "</dataset>";

$strXML_ch501 .= "</chart>";

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Data for Chart B52, Real GDP and Population, 2010-2050

$strXML_ch502 = "";
$strXML_ch502 = "<chart bgColor='FFFFFF' showBorder='0' outCnvBaseFontColor='666666' caption='Growth of Real GDP and Population, 2010-2050'  xAxisName='Year' yAxisName='Index: 2010=100' showLabels='1' showValues='0' 
plotFillAlpha='0' numVDivLines='10' showAlternateVGridColor='1' AlternateVGridColor='e1f5ff' divLineColor='999999' baseFontColor='666666'
canvasBorderThickness='1' showPlotBorder='0' plotBorderThickness='0' zgapplot='0' zdepth='120' exeTime='1.2' dynamicShading='1' YZWallDepth='5' ZXWallDepth='5' XYWallDepth='5' canvasBgColor='FBFBFB' startAngX='0' startAngY='0' endAngX='5' endAngY='-25' divLineEffect='bevel'>";
$strXML_ch502 .= "<categories>";
	for ($hh=0; $hh <= $row; $hh++) {
	if (($dtarr[$hh][0] == 'TRADE') and ($dtarr[$hh][7] == 'PERCENT')) {
		if (($dtarr[$hh][2] == 'CPI') and ($dtarr[$hh][1] == $CTY)) {
			$strXML_ch502 .= "<category label='" . $dtarr[$hh][3] . "' />"; 
		}
	}
	}
$strXML_ch502 .= "</categories>";

$strXML_ch502 .= "<dataset seriesName='Real GDP' color='00AD2E' plotBorderColor='B1D1DC' renderAs='line'>";
	for ($jj=0; $jj < $row; $jj++) {
	if ($dtarr[$jj][0] == 'TRADE') {
		if (($dtarr[$jj][2] == 'IGDPMP') and ($dtarr[$jj][1] == $CTY)) {
			$strXML_ch502 .= "<set value='" . $dtarr[$jj][6] . "' />"; 
		}
	}
	}
$strXML_ch502 .= "</dataset>";

$strXML_ch502 .= "<dataset seriesName='Population' color='293CE9' plotBorderColor='293CE9' renderAs='line'>";
	for ($jj=0; $jj < $row; $jj++) {
	if ($dtarr[$jj][0] == 'TRADE') {
		if (($dtarr[$jj][2] == 'HPOP') and ($dtarr[$jj][1] == $CTY)) {
			$strXML_ch502 .= "<set value='" . $dtarr[$jj][6] . "' />"; 
		}
	}
	}
$strXML_ch502 .= "</dataset>";

$strXML_ch502 .= "</chart>";

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Data for Chart B53, GDP Per Capita and Share of Labor Value Added, 2010-2050

$strXML_ch503 = "";
//$strXML_ch503 = "<chart palette='3' showvalues='0' caption='GDP Per Capita and Share of Labor in Value Added, 2010-2050' showLegend='1' yaxisname='Percent' plotgradientcolor='' baseFontSize='10' bgColor='#FFFFFFF' showBorder='0' paletteColors='009900, CC0000' decimals='0'>";
$strXML_ch503 = "<chart bgColor='FFFFFF' showBorder='0' outCnvBaseFontColor='666666' caption='GDP Per Capita and Share of Labor in Value Added, 2010-2050'  
xAxisName='Year' yAxisName='2010 USD' numberPrefix='$' showLabels='1' showValues='0' plotFillAlpha='70' numVDivLines='10' showAlternateVGridColor='1' 
AlternateVGridColor='e1f5ff' divLineColor='e1f5ff' vdivLineColor='e1f5ff'  baseFontColor='666666' canvasBorderThickness='0' 
showPlotBorder='0' plotBorderThickness='0' startAngX='7' endAngX='7' startAngY='-18' endAngY='-18' zgapplot='20' zdepth='60' exeTime='2'>";
$strXML_ch503 .= "<categories>";
	for ($hh=0; $hh <= $row; $hh++) {
	if (($dtarr[$hh][0] == 'TRADE') and ($dtarr[$hh][7] == 'PERCENT')) {
		if (($dtarr[$hh][2] == 'CPI') and ($dtarr[$hh][1] == $CTY)) {
			$strXML_ch503 .= "<category label='" . $dtarr[$hh][3] . "' />"; 
		}
	}
	}
$strXML_ch503 .= "</categories>";

$strXML_ch503 .= "<dataset seriesName='GDP per Capita' color='005C1F' plotBorderColor='B1D1DC' renderAs='Area'>";
	for ($jj=0; $jj < $row; $jj++) {
	if ($dtarr[$jj][0] == 'TRADE') {
		if (($dtarr[$jj][2] == 'GDP_PC') and ($dtarr[$jj][1] == $CTY)) {
			$strXML_ch503 .= "<set value='" . $dtarr[$jj][6] . "' />"; 
		}
	}
	}
$strXML_ch503 .= "</dataset>";

$strXML_ch503 .= "<dataset seriesName='Labor Share of Value Added' color='FFBF00' plotBorderColor='C8A1D1' renderAs='Line' parentYAxis='S'>";
	for ($jj=0; $jj < $row; $jj++) {
	if ($dtarr[$jj][0] == 'TRADE') {
		if (($dtarr[$jj][2] == 'LVASH') and ($dtarr[$jj][1] == $CTY)) {
			$strXML_ch503 .= "<set value='" . $dtarr[$jj][6] . "' />"; 
		}
	}
	}
$strXML_ch503 .= "</dataset>";

$strXML_ch503 .= "</chart>";

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Data for Pie B54, Shares of Household Expenditure, 2010
$strXML_p1 = "";
$strXML_p1 = "<chart caption='HH Expenditure' bgColor='#FFFFFFF' showBorder='0' showLabels='1' showPercentValues='0' showValues='0' baseFontSize='7'>"; 
	for ($k=0; $k < $row; $k++) {
	if (($dtarr[$k][3] == '2010') and ($dtarr[$k][0] == 'BAU')) {
			if (($dtarr[$k][2] == 'HCONS') and ($dtarr[$k][1] == $CTY)) {
				$strXML_p1 .= "<set label='" . $dtarr[$k][4] . "' value='" . $dtarr[$k][6] . "' />"; }
		}
	}
$strXML_p1 .= "</chart>";

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Data for Pie B55, Value Added, 2010
$strXML_p2 = "";
$strXML_p2 = "<chart caption='Value Added' bgColor='#FFFFFFF' showBorder='0' showLabels='1' showPercentValues='0' showValues='0'baseFontSize='7'>";
	for ($k=0; $k < $row; $k++) {
	if (($dtarr[$k][3] == '2010') and ($dtarr[$k][0] == 'BAU')) {
			if (($dtarr[$k][2] == 'VA_SECT') and ($dtarr[$k][1] == $CTY)) {
					if ($dtarr[$k][6] > 0) {
				$strXML_p2 .= "<set label='" . $dtarr[$k][4] . "' value='" . $dtarr[$k][6] . "' />"; }
			}
		}
	}
$strXML_p2 .= "</chart>";

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Data for Pie B56, Shares of Exports by Partner, 2010
$strXML_p3 = "";
$strXML_p3 = "<chart caption='Exports by Partner' bgColor='#FFFFFFF' showBorder='0' showLabels='1' showPercentValues='0' showValues='0'baseFontSize='7'>";
	for ($k=0; $k < $row; $k++) { 
	if (($dtarr[$k][3] == '2010') and ($dtarr[$k][0] == 'BAU')) {
			if (($dtarr[$k][2] == 'EXP_CTY') and ($dtarr[$k][1] == $CTY)) {
				$strXML_p3 .= "<set label='" . $dtarr[$k][4] . "' value='" . $dtarr[$k][6] . "' />"; }
		}
	}
$strXML_p3 .= "</chart>";

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Data for Pie B57, Shares of Imports by Partner, 2010
$strXML_p4 = "";
$strXML_p4 = "<chart caption='Imports by Partner' bgColor='#FFFFFFF' showBorder='0' showLabels='1' showPercentValues='0' showValues='0'baseFontSize='7'>";
	for ($k=0; $k < $row; $k++) {
	if (($dtarr[$k][3] == '2010') and ($dtarr[$k][0] == 'BAU')) {
			if (($dtarr[$k][2] == 'IMP_CTY') and ($dtarr[$k][1] == $CTY)) {
					if ($dtarr[$k][6] > 0) {
				$strXML_p4 .= "<set label='" . $dtarr[$k][4] . "' value='" . $dtarr[$k][6] . "' />"; }
			}
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
    <div id="breadcrumbs">
    	<div class="container">
        	<a href="index.html">Home</a> &gt;&gt; <a href="index-page=carec-countries.php.html">CARGO Results</a> &gt;&gt; 			<span class="lastitem"><?=$MAP?></span>
            <div class="clear"></div>
        </div>
    </div>
    
    <div id="transport-image" class="title-image" style="background: url('uploads/images/<?=$MAP?>-title.jpg') top center no-repeat;" >
		<div class="container">
        	<div class="image-holder">
            	<div class="title-holder">
                	                        <span><?=$MAP?></span>
                    	
                </div>
</div>

<div class="container">

<div class="container">
<div id="header_nav">
<div class="navigation flotlef"><div id="menuwrapper">
<ul id="primary-nav">

	<li class="menuparent"><a class="menuparent">Economic Statistics by Country:</a>
	<ul>
	<li><a href="Base2010.php?cty=AFG"	>Afghanistan</a></li>
	<li><a href="Base2010.php?cty=AZE"	>Azerbaijan</a></li>
	<li><a href="Base2010.php?cty=KAZ"	>Kazakhstan</a></li>
	<li><a href="Base2010.php?cty=KGZ"  >Kyrgyz Republic</a></li>
	<li><a href="Base2010.php?cty=MON"	>Mongolia</a></li>
	<li><a href="Base2010.php?cty=PAK"	>Pakistan</a></li>
	<li><a href="Base2010.php?cty=TJK"	>Tajikistan</a></li>
	<li><a href="Base2010.php?cty=TKM"	>Turkmenistan</a></li>
	<li><a href="Base2010.php?cty=UZB"  >Uzbekistan</a>
	<li><a href="Base2010.php?cty=XIN"  >Xinjiang</a></li>
	</li></ul>
	</li>
	</ul>
</li></ul>

<div align="right"><div id="menuwrapper">

<ul id="primary-nav">

	<li class="menuparent"><a class="menuparent" href="Base2010.php?cty=<?=$CTY?>">Baseline 2010</a>
	<li class="menuparent"><a class="menuparent" href="Base2050.php?cty=<?=$CTY?>">Baseline 2050</a>
	<li class="menuparent"><a class="menuparent" href="Scenario2050.php?cty=<?=$CTY?>">Scenario 2050</a>

	</ul>
</div>
</div>
</div>


<!-- end container --></div>

<!-- end footer --> 

<script type="text/javascript"><!--

	$(document).ready(function(){

		$("#footer-menu #primary-nav .menuparent").hover(function(){

			$("#footer-menu li.menuparent ul").hide();

		});

	});

// --></script>


    
    </div><!-- end wrap_all -->
</div>


            <div id="content-area">

<!--## GDP Trends -->
	<tr>
	<td>
	<?php
	echo renderChart("FusionCharts/StackedColumn3D.swf", "", $strXML_ch501, "B51", 600, 300, false, true);
	?>
	</td>
	</tr>
	
<!--## Supply and Demand by Sector -->
	<tr>
	<td>
	<?php
	echo renderChart("FusionCharts/MSCombi3D.swf", "", $strXML_ch502, "B52", 600, 300, false, true);
	?>
	</td>
	</tr>
	
<!--## Exports and Imports by Sector -->
	<tr>
	<td>
	<?php
	echo renderChart("FusionCharts/StackedColumn3DLineDY.swf", "", $strXML_ch503, "B53", 600, 300, false, true);
	?>
	</td>
	</tr>


	

    </div><!-- end Content Area -->
            
    <div id="sidebar">

	<td valign=top>
	<tr valign="top"><td>
	<?php
	echo renderChart("FusionCharts/pie2D.swf", "", $strXML_p1, "B54", 300, 300, false, true);
	?>
	</td></tr>
	<tr><td>
	<?php
	echo renderChart("FusionCharts/pie2D.swf", "", $strXML_p2, "B55", 300, 300, false, true);
	?>
	</td></tr>
	<?php
	echo renderChart("FusionCharts/pie2D.swf", "", $strXML_p3, "B56", 300, 300, false, true);
	?>
	</td></tr>
	</table>
                 </div>
            </div>

</td>
</tr>

         </div>
        </div>
	</div>
    
        </div><!-- end container -->
			 
		</div>
		<div class="clear"></div>
	</div>

</body>
</html>
<?php
include('Footer.php') ;
?>
