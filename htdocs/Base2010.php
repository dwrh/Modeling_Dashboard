<?php


	include('Header.php') ;

	// FusionChart php include statement
	include('FusionCharts/FusionCharts.php');

	// Number of regions - 1, used in for loops
	$REG = 10;
	$CTY = $_GET['cty'] ;
	if ($CTY==""){
		$CTY='AFG';
	}
	$citymap=array();
	$citymap['AFG']='afghanistan';
	$citymap['AZE']='azerbaijan';
	$citymap['KAZ']='kazakhstan';
	$citymap['KGZ']='kyrgyzstan';
	$citymap['MON']='mongolia';
	$citymap['PAK']='pakistan';
	$citymap['TJK']='tajikistan';
	$citymap['TKM']='turkmenistan';
	$citymap['UZB']='uzbekistan';
	$citymap['XIN']='xinjiang';
$cur_cty=$citymap[$CTY];
$cty=ucfirst($cur_cty);

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
	}

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Data for Chart B11, Composition of Output and Demand, 2010 Millions of USD
$strXML_ch1 = "";
$strXML_ch1 .= "<chart palette='3' showvalues='0' caption='Composition of Output and Demand, 2010' numbersuffix='%' plotgradientcolor='' bgColor='#FFFFFFF' showBorder='0'>";
$strXML_ch1 .= "<categories>";
	for ($h=0; $h <= $REG; $h++) {
			$strXML_ch1 .= "<category label='" . $dtarr[$h][1] . "' />"; }
$strXML_ch1 .= "</categories>";
$strXML_ch1 .= "<dataset seriesName='Pop'>";
	for ($i=0; $i < $row; $i++) {
			if (($dtarr[$i][2] == 'POP_GR') and ($dtarr[$i][3] == '2010')and ($dtarr[$i][0] == 'BAU')){
				$strXML_ch1 .= "<set value='" . $dtarr[$i][6] . "' />"; }
		}
$strXML_ch1 .= "</dataset>";
$strXML_ch1 .= "<dataset seriesName='GDPPC'>";
	for ($j=0; $j < $row; $j++) {
			if (($dtarr[$j][2] == 'GDP_PC_GR') and ($dtarr[$j][3] == '2010')and ($dtarr[$j][0] == 'BAU')) {
				$strXML_ch1 .= "<set value='" . $dtarr[$j][6] . "' />"; }
		
	}
$strXML_ch1 .= "</dataset>";
$strXML_ch1 .= "</chart>";


//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Data for Chart B12, Domestic Output and Demand, 2010

$strXML_ch22 = "";
$strXML_ch22 = "<chart palette='3' showvalues='0' caption='Output and Demand by Sector, 2010' yaxisname='Millions of 2010 USD' showLegend='1'  
plotgradientcolor='' baseFontSize='10' bgColor='#FFFFFFF' showBorder='0' paletteColors='FFCC33, CC0000, 009900' decimals='0'>";
//plotgradientcolor='' bgColor='#FFFFFFF' showBorder='0' paletteColors='009900, FFCC33, CC0000'>";
$strXML_ch22 .= "<categories>";
	for ($hh=0; $hh <= $row; $hh++) {
	if (($dtarr[$hh][3] == '2010') and ($dtarr[$hh][0] == 'BAU')) {
		if (($dtarr[$hh][2] == 'XP_SECT') and ($dtarr[$hh][1] == $CTY)) {
			$strXML_ch22 .= "<category label='" . $dtarr[$hh][4] . "' />"; 
		}
	}
	}
$strXML_ch22 .= "</categories>";

$strXML_ch22 .= "<dataset seriesName='Output'>";
	For ($ii=0; $ii < $row; $ii++) {
	if (($dtarr[$ii][3] == '2010') and ($dtarr[$ii][0] == 'BAU')) {
		if (($dtarr[$ii][2] == 'XP_SECT') and ($dtarr[$ii][1] == $CTY)) {
			$strXML_ch22 .= "<set value='" . $dtarr[$ii][6] . "' />"; 
		}
	}
	}
$strXML_ch22 .= "</dataset>";

$strXML_ch22 .= "<dataset seriesName='Demand'>";
	for ($jj=0; $jj < $row; $jj++) {
	if (($dtarr[$jj][3] == '2010') and ($dtarr[$jj][0] == 'BAU')) {
		if (($dtarr[$jj][2] == 'XA_SECT') and ($dtarr[$jj][1] == $CTY)) {
			$strXML_ch22 .= "<set value='" . $dtarr[$jj][6] . "' />"; 
		}
	}
	}
$strXML_ch22 .= "</dataset>";
$strXML_ch22 .= "</chart>";

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Data for Chart B13, Value Added Composition, 2010

$strXML_ch23 = "";
$strXML_ch23 = "<chart palette='3' showvalues='0' caption='Value Added Shares by Sector, 2010' yaxisname='Percent' showLegend='1' 
plotgradientcolor='' baseFontSize='10' bgColor='#FFFFFFF' showBorder='0' paletteColors='FFCC33, CC0000, 009900' yAxisMaxValue='1' decimals='2'>";

$strXML_ch23 .= "<categories>";
	for ($hh=0; $hh <= $row; $hh++) {
	if (($dtarr[$hh][3] == '2010') and ($dtarr[$hh][0] == 'BAU') and ($dtarr[$hh][7] == 'PERCENT')) {
		if (($dtarr[$hh][2] == 'LVAS_SECT') and ($dtarr[$hh][1] == $CTY)) {
			$strXML_ch23 .= "<category label='" . $dtarr[$hh][4] . "' />"; 
		}
	}
	}
$strXML_ch23 .= "</categories>";

$strXML_ch23 .= "<dataset seriesName='Capital'>";
	for ($jj=0; $jj < $row; $jj++) {
	if (($dtarr[$jj][3] == '2010') and ($dtarr[$jj][0] == 'BAU') and ($dtarr[$jj][7] == 'PERCENT')) {
		if (($dtarr[$jj][2] == 'KVA_SECT') and ($dtarr[$jj][1] == $CTY)) {
			$strXML_ch23 .= "<set value='" . $dtarr[$jj][6] . "' />"; 
		}
	}
	}
$strXML_ch23 .= "</dataset>";

$strXML_ch23 .= "<dataset seriesName='Unskilled'>";
	For ($ii=0; $ii < $row; $ii++) {
	if (($dtarr[$ii][3] == '2010') and ($dtarr[$ii][0] == 'BAU') and ($dtarr[$ii][7] == 'PERCENT')) {
		if (($dtarr[$ii][2] == 'LVAU_SECT') and ($dtarr[$ii][1] == $CTY)) {
			$strXML_ch23 .= "<set value='" . $dtarr[$ii][6] . "' />"; 
		}
	}
	}
$strXML_ch23 .= "</dataset>";

$strXML_ch23 .= "<dataset seriesName='Skilled'>";
	For ($ii=0; $ii < $row; $ii++) {
	if (($dtarr[$ii][3] == '2010') and ($dtarr[$ii][0] == 'BAU') and ($dtarr[$ii][7] == 'PERCENT')) {
		if (($dtarr[$ii][2] == 'LVAS_SECT') and ($dtarr[$ii][1] == $CTY)) {
			$strXML_ch23 .= "<set value='" . $dtarr[$ii][6] . "' />"; 
		}
	}
	}
$strXML_ch23 .= "</dataset>";

$strXML_ch23 .= "</chart>";

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Data for Chart B13, Imports and Exports, 2010

$strXML_ch2 = "";
$strXML_ch2 = "<chart palette='3' showvalues='0' caption='Exports (+) and Imports (-) by Sector, 2010' yaxisname='Millions of 2010 USD' 
baseFontSize='10' plotgradientcolor='' bgColor='#FFFFFFF' showBorder='0' paletteColors='FFCC33, 009900, CC0000' >";

$strXML_ch2 .= "<categories>";
	for ($hh=0; $hh <= $row; $hh++) {
	if (($dtarr[$hh][3] == '2010') and ($dtarr[$hh][0] == 'BAU')) {
		if (($dtarr[$hh][2] == 'IMP_SECT') and ($dtarr[$hh][1] == $CTY)) {
			$strXML_ch2 .= "<category label='" . $dtarr[$hh][4] . "' />"; 
		}
	}
	}
$strXML_ch2 .= "</categories>";

$strXML_ch2 .= "<dataset seriesName='Imports'>";
	For ($ii=0; $ii < $row; $ii++) {
	if (($dtarr[$ii][3] == '2010') and ($dtarr[$ii][0] == 'BAU')) {
		if (($dtarr[$ii][2] == 'IMP_SECT') and ($dtarr[$ii][1] == $CTY)) {
			$strXML_ch2 .= "<set value='" . $dtarr[$ii][6] . "' />"; 
		}
	}
	}
$strXML_ch2 .= "</dataset>";

$strXML_ch2 .= "<dataset seriesName='Exports'>";
	for ($jj=0; $jj < $row; $jj++) {
	if (($dtarr[$jj][3] == '2010') and ($dtarr[$jj][0] == 'BAU')) {
		if (($dtarr[$jj][2] == 'EXP_SECT') and ($dtarr[$jj][1] == $CTY)) {
			$strXML_ch2 .= "<set value='" . $dtarr[$jj][6] . "' />"; 
		}
	}
	}
$strXML_ch2 .= "</dataset>";
$strXML_ch2 .= "</chart>";
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Data for Pie B14, Shares of Household Expenditure, 2010
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
// Data for Pie B15, Value Added, 2010
$strXML_p2 = "";
$strXML_p2 = "<chart theme='fusion' caption='Value Added' bgColor='#FFFFFFF' showBorder='0' showLegend='0' showLabels='1' showPercentValues='0' showValues='0' baseFontSize='7' palettecolors = 'f7b924, f3a42a, ee8f31, ea7a37, e6643d, 
e24f43, dd3a4a, fb8a98, bd3838, ca6060, d58080, bd3838, d92550'>";

 
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
// Data for Pie B16, Shares of Exports by Partner, 2010
$strXML_p3 = "";
$strXML_p3 = "<chart theme='fusion' caption='Exports by Partner' bgColor='#FFFFFFF' showBorder='0' showLabels='1' showPercentValues='0' showLegend='0' showValues='0' baseFontSize='7' palettecolors='d8f3dc, b7e4c7, 95d5b2, 74c69d, 52b788, 
40916c, 2d6a4f'>";	
for ($k=0; $k < $row; $k++) { 
	if (($dtarr[$k][3] == '2010') and ($dtarr[$k][0] == 'BAU')) {
			if (($dtarr[$k][2] == 'EXP_CTY') and ($dtarr[$k][1] == $CTY)) {
				$strXML_p3 .= "<set label='" . $dtarr[$k][4] . "' value='" . $dtarr[$k][6] . "' />"; }
		}
	}
$strXML_p3 .= "</chart>";

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Data for Pie B17, Shares of Imports by Partner, 2010
$strXML_p4 = "";
$strXML_p4 = "<chart caption='Imports by Partner' bgColor='#FFFFFFF' showBorder='0' showLabels='1' showPercentValues='0' showValues='0' baseFontSize='7'>";
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
fclose($handle);
?>


<!DOCTYPE
td PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<script language="Javascript" SRC="FusionCharts/FusionCharts.js"></script>
		<script type="text/javascript" src="FusionCharts/fusioncharts.maps.js"></script>
		<script>FusionCharts.options.license({   key: '1nH2bqC-13D2E6E1D4H3B2C4B4D2E6D4C4sbdC8D5mmaB-8jE1G2awe1C2A3E2E3D3F3B8A4A4D4G3A2D2A33A18B14wjjB4A2H4jB2A16A7D-16buE3A3H2sudB2D3D2wikF1C10B8D5E5E3F4E2H4I3B8lffF4E2UH3vraE4D2C2pcC1DB4A2yyjD1B1G4D2B5B3A2C4E2B1D4D1B1C7p==',  
		creditLabel: false}); 
		</script>
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
    
    <div id="transport-image" class="title-image" style="background: url('uploads/images/<?=$cty?>-title.jpg') top center no-repeat;" >
		<div class="container">
        	<div class="image-holder">
            	<div class="title-holder">
                	                        <span><?=$cty?></span>
                    	
                </div>
</div>

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
		<!--## Country Map -->
		<tr>
			<td class="figs">
				<div id="map-container" align="left">FusionMaps will load here 
				<script> 
	var cur_map='maps/world';
	var cty_name='<?php echo $cur_cty; ?>';
	var mapstr="maps/<?php echo $cur_cty; ?>";
	var sample_data=Array();
	FusionCharts.options.creditLabel = false;
	FusionCharts.ready(function() {
    var countryMap = new FusionCharts({
        type: mapstr,
        renderAt: 'map-container',
        width: '600',
        height: '400',
        dataFormat: 'json',
        dataSource: {
            "chart": {
				"caption": cty_name.toUpperCase(),
                "theme": "fusion",
                "formatNumberScale": "0",
                "numberSuffix": "M",
				"entityFillHoverColor": "#FF00FF",
				"showBorder":"1",
				"borderColor":"#C0C0C0",
				"showLabels":"0",
				"includevalueinlabels": "1",
				"showCanvasBorder":"0",
				"fillColor":"#D0D0D0",
				"legendBgColor":"#FFFFFF",
				"legendBorderColor":"#FFFFFF"
            },
			"colorrange": {
				"minvalue": "0",
				"startlabel": "Low",
				"endlabel": "High",
				"code": "#FF4411",
				"gradient": "100",
				"color": [{
					"maxvalue": "25",
					"code": "#FFDD44",
					"displayValue": "Median"
				}, {
					"maxvalue": "100",
					"code": "#6baa01"
				}]
    		},
			"data": [{
                "id": "FRA",
                "value": "50",
				"label": "Icecream 50"
            }, {
                "id": "NIM",
                "value": "77",
				"label":"Juice 77"
            }],
		  }
    });
    countryMap.render();
});</script>
                
                </div>
			</td>
		</tr>

		<!--## Supply and Demand by Sector -->
		<tr>
			<td>
				<?php
					//echo renderChart("FusionCharts/MSBar3D.swf", "", $strXML_ch22, "B11", 600, 300, false, true);
                    echo renderChart("MSBar3D", "", $strXML_ch22, "B11", 600, 300, 1, true);

                    
				?>
			</td>
		</tr>
		
		<!--## Exports and Imports by Sector -->
		<tr>
			<td>
				<?php
					//echo renderChart("FusionCharts/StackedBar3D.swf", "", $strXML_ch2, "B12", 600, 300, false, true);
                    echo renderChart("StackedBar3D", "", $strXML_ch2, "B12", 600, 300, false, true);


				?>
			</td>
		</tr>

		<!--## Value Added Shares by Sector -->
		<tr>
			<td>
				<?php
					//echo renderChart("FusionCharts/StackedColumn3D.swf", "", $strXML_ch23, "B13", 600, 300, false, true);
                    echo renderChart("StackedColumn3D", "", $strXML_ch23, "B13", 600, 300, false, true);

				?>
			</td>
		</tr>
    </div><!-- end Content Area -->
            
    <div id="sidebar">
        <div class="widget flag-area">
        <img src="uploads/images/<?=$cty?>-flag.jpg" alt="" width="120" /><br />
	
	
	<td valign=top>
		<tr valign="top">
			<td>
				<?php
					//echo renderChart("FusionCharts/pie2D.swf", "", $strXML_p1, "B14", 300, 300, false, true);
                    echo renderChart("pie2D", "", $strXML_p1, "B14", 300, 300, false, true);

				?>
			</td>
		</tr>
		<tr>
			<td>
				<?php
					//echo renderChart("FusionCharts/pie2D.swf", "", $strXML_p2, "B15", 300, 300, false, true);
                    echo renderChart("pie2D", "", $strXML_p2, "B15", 300, 300, false, true);

				?>
			</td>
		</tr>
		<tr>
			<td>
				<?php
				//echo renderChart("FusionCharts/pie2D.swf", "", $strXML_p3, "B16", 300, 300, false, true);
                echo renderChart("pie2D", "", $strXML_p3, "B16", 300, 300, false, true);
                                ?>
			</td>
		</tr>
		<tr>
			<td>
				<?php
					echo renderChart("pie2D", "", $strXML_p4, "B17", 300, 300, false, true);
                    //echo renderChart("FusionCharts/pie2D.swf", "", $strXML_p4, "B17", 300, 300, false, true);
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
