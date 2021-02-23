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
// Data for Chart S1, Real Income and Expenditure Growth, Annual Differene from Baseline (percent)

$strXML_ch501 = "";
//$strXML_ch501 = "<chart palette='3' showvalues='0' caption='Real Income and Expenditure Growth, Annual Difference from Baseline' showLegend='1' yaxisname='Percent' plotgradientcolor='' baseFontSize='10' bgColor='#FFFFFFF' showBorder='0' paletteColors='FFFF00, FFCC33, 0080FF, 009900, FF4040' decimals='0'>";
//$strXML_ch501 = "<chart caption='Real GDP Growth, Annual Difference from Baseline' yaxisname='Percent'  clustered='0' zeroPlaneMesh='0' zeroPlaneColor='68BDFF' zeroPlaneAlpha='50' palette='3' bgColor='66D6FF,FFFFFF,ffffff' bgRatio='20,60,20' bgAlpha='10,10,40' divLineEffect='none' numDivLines='3' legendBgAlpha='90' legendShadow='0' intensity='.02' startAngX='4.5' startAngY='-6.6' endAngX='4.5' endAngY='-6.6' exeTime='2'>";
$strXML_ch501 = "<chart caption='Real GDP Growth, Annual Difference from Baseline' 
yAxisMinValue='0' yaxisname='Percent' plotgradientcolor='' baseFontSize='10' showLabels='1' showvalues='0' decimals='0' numberSuffix='%'>";

$strXML_ch501 .= "<categories>";
	for ($hh=0; $hh <= $row; $hh++) {
	if (($dtarr[$hh][0] == 'TRADE') and ($dtarr[$hh][7] == 'PERCENT')) {
		if (($dtarr[$hh][2] == 'CPI') and ($dtarr[$hh][1] == $CTY)) {
			$strXML_ch501 .= "<category label='" . $dtarr[$hh][3] . "' />"; 
		}
	}
	}
$strXML_ch501 .= "</categories>";

$strXML_ch501 .= "<dataset seriesName='Real Consumption'>";
	for ($jj=0; $jj < $row; $jj++) {
	if (($dtarr[$jj][0] == 'TRADE') and ($dtarr[$jj][7] == 'PERCENT')) {
		if (($dtarr[$jj][2] == 'CONS') and ($dtarr[$jj][1] == $CTY)) {
			$strXML_ch501 .= "<set value='" . $dtarr[$jj][6] . "' />"; 
		}
	}
	}
$strXML_ch501 .= "</dataset>";

$strXML_ch501 .= "<dataset seriesName='Real GDP'>";
	for ($jj=0; $jj < $row; $jj++) {
	if (($dtarr[$jj][0] == 'TRADE') and ($dtarr[$jj][7] == 'PERCENT')) {
		if (($dtarr[$jj][2] == 'RGDPMP') and ($dtarr[$jj][1] == $CTY)) {
			$strXML_ch501 .= "<set value='" . $dtarr[$jj][6] . "' />"; 
		}
	}
	}
$strXML_ch501 .= "</dataset>";


$strXML_ch501 .= "</chart>";

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Data for Chart S2, Growth of Trade, 2010-2050

$strXML_ch502 = "";
$strXML_ch502 = "<chart palette='3' showvalues='0' caption='Total Exports and Imports, Annual Difference from Baseline' showLegend='1' 
yAxisMinValue='0' yaxisname='Percent' plotgradientcolor='' baseFontSize='10' bgColor='#FFFFFFF' showBorder='0' paletteColors='009900, CC0000' decimals='0'>";

$strXML_ch502 .= "<categories>";
	for ($hh=0; $hh <= $row; $hh++) {
	if (($dtarr[$hh][0] == 'TRADE') and ($dtarr[$hh][7] == 'PERCENT')) {
		if (($dtarr[$hh][2] == 'CPI') and ($dtarr[$hh][1] == $CTY)) {
			$strXML_ch502 .= "<category label='" . $dtarr[$hh][3] . "' />"; 
		}
	}
	}
$strXML_ch502 .= "</categories>";

$strXML_ch502 .= "<dataset seriesName='Exports' parentYAxis='P'>";
	for ($k=0; $k < $row; $k++) {
	if (($dtarr[$k][3] == '2050') and ($dtarr[$k][0] == 'BAU')) {
			if (($dtarr[$k][2] == 'Output') and ($dtarr[$k][1] == $CTY)) {
					if ($dtarr[$k][6] > 0) {
				$strXML_p2 .= "<set label='" . $dtarr[$k][4] . "' value='" . $dtarr[$k][6] . "' />"; }
			}
		}
	}
	for ($jj=0; $jj < $row; $jj++) {
	if (($dtarr[$jj][0] == 'TRADE') and ($dtarr[$jj][7] == 'PERCENT')) {
		if (($dtarr[$jj][2] == 'EXP') and ($dtarr[$jj][1] == $CTY)) {
			$strXML_ch502 .= "<set value='" . $dtarr[$jj][6] . "' />"; 
		}
	}
	}
$strXML_ch502 .= "</dataset>";

$strXML_ch502 .= "<dataset seriesName='Imports' parentYAxis='S'>";
	for ($jj=0; $jj < $row; $jj++) {
	if (($dtarr[$jj][0] == 'TRADE') and ($dtarr[$jj][7] == 'PERCENT')) {
		if (($dtarr[$jj][2] == 'IMP') and ($dtarr[$jj][1] == $CTY)) {
			$strXML_ch502 .= "<set value='" . $dtarr[$jj][6] . "' />"; 
		}
	}
	}
$strXML_ch502 .= "</dataset>";

$strXML_ch502 .= "</chart>";

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

// Data for Chart S1, Sectoral Output Growth 2010-50

$strXML_ch503 = "";
//$strXML_ch503 = "<chart palette='3' showvalues='0' caption='Real Income and Expenditure Growth, Annual Difference from Baseline' showLegend='1' yaxisname='Percent' plotgradientcolor='' baseFontSize='10' bgColor='#FFFFFFF' showBorder='0' paletteColors='FFFF00, FFCC33, 0080FF, 009900, FF4040' decimals='0'>";
//$strXML_ch503 = "<chart caption='Real GDP Growth, Annual Difference from Baseline' yaxisname='Percent'  clustered='0' zeroPlaneMesh='0' zeroPlaneColor='68BDFF' zeroPlaneAlpha='50' palette='3' bgColor='66D6FF,FFFFFF,ffffff' bgRatio='20,60,20' bgAlpha='10,10,40' divLineEffect='none' numDivLines='3' legendBgAlpha='90' legendShadow='0' intensity='.02' startAngX='4.5' startAngY='-6.6' endAngX='4.5' endAngY='-6.6' exeTime='2'>";
$strXML_ch503 = "<chart caption='Sectoral Output Growth 2010-50' paletteColors='CC6600, 006600' formatNumberScale='0'
yAxisMinValue='0' yaxisname='Percent' plotgradientcolor='' baseFontSize='10' showLabels='1' showvalues='0' decimals='0' numberSuffix='%'>";

$strXML_ch503 .= "<categories>";
	for ($jj=0; $jj <= $row; $jj++) {
	if (($dtarr[$jj][3] == '2050') and ($dtarr[$jj][0] == 'TRADE') and ($dtarr[$jj][7] == 'BUBBLE')) {
		if (($dtarr[$jj][1] == $CTY)) {
			$strXML_ch503 .= "<category label='" . $dtarr[$jj][4] . "' />"; 
		}
	}
	}
$strXML_ch503 .= "</categories>";

$strXML_ch503 .= "<dataset seriesName='Baseline'>";
	for ($jj=0; $jj < $row; $jj++) {
	if (($dtarr[$jj][3] == '2050') and ($dtarr[$jj][0] == 'TRADE') and ($dtarr[$jj][7] == 'BUBBLE')) {
		if (($dtarr[$jj][1] == $CTY)) {
			$strXML_ch503 .= "<set value='" . $dtarr[$jj][8] . "' />"; 
		}
	}
	}
$strXML_ch503 .= "</dataset>";

$strXML_ch503 .= "<dataset seriesName='Scenario'>";
	for ($jj=0; $jj < $row; $jj++) {
	if (($dtarr[$jj][3] == '2050') and ($dtarr[$jj][0] == 'TRADE') and ($dtarr[$jj][7] == 'BUBBLE')) {
		if (($dtarr[$jj][1] == $CTY)) {
			$strXML_ch503 .= "<set value='" . $dtarr[$jj][6] . "' />"; 
		}
	}
	}
$strXML_ch503 .= "</dataset>";


$strXML_ch503 .= "</chart>";

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Data for Chart S4, Imports and Exports, 2010

$strXML_ch504 = "";
$strXML_ch504 = "<chart palette='3' showvalues='0' caption='Imports (-) and Exports (+) by Sector, 2050 Change from Baseline' yaxisname='2010 USD Millions' 
baseFontSize='8' plotgradientcolor='' bgColor='#FFFFFFF' showBorder='0' paletteColors='FFCC33, 009900, CC0000' >";

$strXML_ch504 .= "<categories>";
for ($jj=0; $jj <= $row; $jj++) {
	if (
			($dtarr[$jj][3] == '2050') and 
			($dtarr[$jj][0] == 'TRADE') and 
			($dtarr[$jj][7] == 'DIFFERENCE') and
			($dtarr[$jj][2] == 'IMPORTS') and 
			($dtarr[$jj][1] == $CTY)
		) 	{
			$strXML_ch504 .= "<category label='" . $dtarr[$jj][4] . "' />"; 
			}
	}
$strXML_ch504 .= "</categories>";

$strXML_ch504 .= "<dataset seriesName='Imports'>";
for ($jj=0; $jj <= $row; $jj++) {
	if (
			($dtarr[$jj][3] == '2050') and 
			($dtarr[$jj][0] == 'TRADE') and 
			($dtarr[$jj][7] == 'DIFFERENCE') and
			($dtarr[$jj][2] == 'IMPORTS') and 
			($dtarr[$jj][1] == $CTY)
		) 	{
			$strXML_ch504 .= "<set value='-" . $dtarr[$jj][6] . "' />"; 
			}
	}
$strXML_ch504 .= "</dataset>";

$strXML_ch504 .= "<dataset seriesName='Exports'>";
for ($jj=0; $jj <= $row; $jj++) {
	if (
			($dtarr[$jj][3] == '2050') and 
			($dtarr[$jj][0] == 'TRADE') and 
			($dtarr[$jj][7] == 'DIFFERENCE') and
			($dtarr[$jj][2] == 'EXPORTS') and 
			($dtarr[$jj][1] == $CTY)
		) 	{
			$strXML_ch504 .= "<set value='" . $dtarr[$jj][6] . "' />"; 
			}
	}
$strXML_ch504 .= "</dataset>";
$strXML_ch504 .= "</chart>";

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Data for Chart S5, Output and Demand, 2010

$strXML_ch505 = "";
$strXML_ch505 = "<chart palette='3' showvalues='0' caption='Output and Demand by Sector, 2050 Change from Baseline' yaxisname='2010 USD Millions' 
baseFontSize='8' plotgradientcolor='' bgColor='#FFFFFFF' showBorder='0' paletteColors='009900, CC0000,FFCC33' yAxisMinValue='0' >";

//$strXML_ch505 = "<chart palette='3' showvalues='0' caption='Output and Demand by Sector, 2010' yaxisname='Millions of 2010 USD' showLegend='1'  
//plotgradientcolor='' baseFontSize='10' bgColor='#FFFFFFF' showBorder='0' paletteColors='FFCC33, CC0000, 009900' decimals='0'>";

$strXML_ch505 .= "<categories>";
for ($jj=0; $jj <= $row; $jj++) {
	if (
			($dtarr[$jj][3] == '2050') and 
			($dtarr[$jj][0] == 'TRADE') and 
			($dtarr[$jj][7] == 'DIFFERENCE') and
			($dtarr[$jj][2] == 'DEMAND') and 
			($dtarr[$jj][1] == $CTY)
		) 	{
			$strXML_ch505 .= "<category label='" . $dtarr[$jj][4] . "' />"; 
			}
	}
$strXML_ch505 .= "</categories>";

$strXML_ch505 .= "<dataset seriesName='Output'>";
for ($jj=0; $jj <= $row; $jj++) {
	if (
			($dtarr[$jj][3] == '2050') and 
			($dtarr[$jj][0] == 'TRADE') and 
			($dtarr[$jj][7] == 'DIFFERENCE') and
			($dtarr[$jj][2] == 'OUTPUT') and 
			($dtarr[$jj][1] == $CTY)
		) 	{
			$strXML_ch505 .= "<set value='" . $dtarr[$jj][6] . "' />"; 
			}
	}
$strXML_ch505 .= "</dataset>";

$strXML_ch505 .= "<dataset seriesName='Demand'>";
for ($jj=0; $jj <= $row; $jj++) {
	if (
			($dtarr[$jj][3] == '2050') and 
			($dtarr[$jj][0] == 'TRADE') and 
			($dtarr[$jj][7] == 'DIFFERENCE') and
			($dtarr[$jj][2] == 'DEMAND') and 
			($dtarr[$jj][1] == $CTY)
		) 	{
			$strXML_ch505 .= "<set value='" . $dtarr[$jj][6] . "' />"; 
			}
	}
$strXML_ch505 .= "</dataset>";
$strXML_ch505 .= "</chart>";

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Data for Chart S6, Value Added Shares, 2010

$strXML_ch506 = "";
$strXML_ch506 = "<chart palette='3' showvalues='0' caption='Value Added Shares by Sector, 2050 Change from Baseline' yaxisname='Share' 
baseFontSize='8' plotgradientcolor='' bgColor='#FFFFFFF' showBorder='0' paletteColors='FFCC33, 009900, CC0000' >";

$strXML_ch506 .= "<categories>";
for ($jj=0; $jj <= $row; $jj++) {
	if (
			($dtarr[$jj][3] == '2050') and 
			($dtarr[$jj][0] == 'TRADE') and 
			($dtarr[$jj][7] == 'DIFFERENCE') and
			($dtarr[$jj][2] == 'KVA_SECT') and 
			($dtarr[$jj][1] == $CTY)
		) 	{
			$strXML_ch506 .= "<category label='" . $dtarr[$jj][4] . "' />"; 
			}
	}
$strXML_ch506 .= "</categories>";

$strXML_ch506 .= "<dataset seriesName='Capital'>";
for ($jj=0; $jj <= $row; $jj++) {
	if (
			($dtarr[$jj][3] == '2050') and 
			($dtarr[$jj][0] == 'TRADE') and 
			($dtarr[$jj][7] == 'DIFFERENCE') and
			($dtarr[$jj][2] == 'KVA_SECT') and 
			($dtarr[$jj][1] == $CTY)
		) 	{
			$strXML_ch506 .= "<set value='" . $dtarr[$jj][6] . "' />"; 
			}
	}
$strXML_ch506 .= "</dataset>";

$strXML_ch506 .= "<dataset seriesName='Unskilled'>";
for ($jj=0; $jj <= $row; $jj++) {
	if (
			($dtarr[$jj][3] == '2050') and 
			($dtarr[$jj][0] == 'TRADE') and 
			($dtarr[$jj][7] == 'DIFFERENCE') and
			($dtarr[$jj][2] == 'LVAU_SECT') and 
			($dtarr[$jj][1] == $CTY)
		) 	{
			$strXML_ch506 .= "<set value='" . $dtarr[$jj][6] . "' />"; 
			}
	}
$strXML_ch506 .= "</dataset>";

$strXML_ch506 .= "<dataset seriesName='Skilled'>";
for ($jj=0; $jj <= $row; $jj++) {
	if (
			($dtarr[$jj][3] == '2050') and 
			($dtarr[$jj][0] == 'TRADE') and 
			($dtarr[$jj][7] == 'DIFFERENCE') and
			($dtarr[$jj][2] == 'LVAS_SECT') and 
			($dtarr[$jj][1] == $CTY)
		) 	{
			$strXML_ch506 .= "<set value='" . $dtarr[$jj][6] . "' />"; 
			}
	}
$strXML_ch506 .= "</dataset>";

$strXML_ch506 .= "</chart>";

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
	echo renderChart("FusionCharts/MSColumn3D.swf", "", $strXML_ch501, "S1", 600, 300, false, true);
	?>
	</td>
	</tr>
	
<!--## Supply and Demand by Sector -->
	<tr>
	<td>
	<?php
	echo renderChart("FusionCharts/MSColumn3D.swf", "", $strXML_ch502, "S2", 600, 300, false, true);
	?>
	</td>
	</tr>
	
<!--## Exports and Imports by Sector -->
	<tr>
	<td>
	<?php
	echo renderChart("FusionCharts/StackedColumn3D.swf", "", $strXML_ch503, "S3", 600, 300, false, true);
	?>
	</td>
	</tr>

    </div><!-- end Content Area -->
            
    <div id="sidebar">

	<td valign=top>
	<tr valign="top"><td>
	<?php
	echo renderChart("FusionCharts/StackedBar3D.swf", "", $strXML_ch504, "S4", 300, 300, false, true);
	?>
	</td></tr>
	<tr><td>
	<?php
	echo renderChart("FusionCharts/MSBar3D.swf", "", $strXML_ch505, "S5", 300, 300, false, true);
	?>
	</td></tr>
	<tr><td>
	<?php
	echo renderChart("FusionCharts/StackedBar3D.swf", "", $strXML_ch506, "S6", 300, 300, false, true);
	?>

	</table>
	</td>
	</tr>
                 </div>
            </div>

</td>
</tr>
</table>
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
