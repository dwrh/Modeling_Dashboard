<?php

include('Header.php') ;

// FusionChart php include statement
include('FusionCharts/FusionCharts.php');

// Number of regions - 1, used in for loops
$REG = 10;
//$CTY = $_GET['cty'] ;
//$CTY = 'AFG' ;

include('Map_Data_Asia.php') ;

for ($i=0; $i < 20; $i++) {
	if ($mapLabel[$i][1] == $CTY) {
		$MAP = $mapLabel[$i][2] ;
 	}
}

echo $MAP ;
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
// Data for Chart 1, Composition of Output and Demand, 2010 Millions of USD
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
// Data for Map 1, Annual GDP Growth

// 2. Second, create third column in the array that matches our regional identifier with data from the CSV file
	for ($a=0; $a < $row; $a++) {
	if (($dtarr[$a][2] == 'GDP_GR') and ($dtarr[$a][3] == '2010')and ($dtarr[$a][0] == 'BAU')){
			for ($b=0; $b <= 48; $b++) {
					if ($mapArray[$b][2] == $dtarr[$a][1]) {
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
for($c=0; $c <= 48; $c++) {
$strXML_m1 .= "<entity id='" . $mapArray[$c][1] . "' value='" . $mapArray[$c][3] . "' link='" . $mapArray[$c][4] . "' />";
	}
	$strXML_m1 .= "</data>";
	$strXML_m1  .= "</map>";

print_r ($strXML_m1);

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
        	<a href="index.html">Home</a> &raquo; <span class="lastitem">Cargo Model</span>
            <div class="clear"></div>
        </div>
    </div>
    
    <div id="transport-image" class="title-image" style="background: url('uploads/images/publications-title.jpg') top center no-repeat;" >
		<div class="container">
        	<div class="image-holder">
            	<div class="title-holder">
                	                        <span>CARGO Model</span>
                    	
                </div>
            </div>
        </div>
	</div>
    
	<div id="content" class="sectors">
		<div class="container">

            <div id="content-area">
            	<h2>The Central Asian Regional General equilibrium mOdel (CARGO)</h2>
<p>To elucidate the benefits of CAREC initiatives to promote regional economic integration, ADB commissioned the development of a new scenario and data analysis tool. CARGO is a dynamic forecasting tool that captures detailed structural characteristics of member countries and their trading partners. The approach used here, multi-country general equilibrium modeling, is particularly suited to estimating the extensive indirect effects of such commitments in all of CAREC’s major sector areas, Transport, Trade Facilitation, Energy, and Trade Policy. In it’s first application, CARGO results show that the overall benefits of the CAREC Corridors dramatically outweigh their costs. Transboundary spillovers confer significant growth leverage on other regional economies and benefit even distant trade partners.</p>
<p>These findings are fully consistent with intuition and regional policy expectation, that large and coordinated infrastructure investments are a potent catalyst for long term economic growth. More detailed analysis reveals the inclusive features of infrastructure, driving down information and transit costs to expand the profitable horizon of investment for enterprises of all scales and workers of all income levels. As expected, infrastructure confers market access that is the key to self-directed poverty reduction.</p>
<p>More extensive model application and scenario analysis will improve our understanding of a wider range of policy options. In parallel, more intensive data development, possibly including models for each individual CAREC member economy, can improve resolution of the analysis, allowing identification of more beneficiaries as well those who might need targeted incentives or adjustment assistance. Finally, innovative user interfaces will help integrate all these quantitative tools into decision making and dialog, facilitating more evidence based policy across this region and helping to realize its vast economic potential.</p>
            	<div class="widget">
<h3>Links to CAREC Country Results</h3>
<ul class="publications-list">
<h2><a href="images/Afghanistan.png"><img class="alignnone size-full wp-image-3346" src="images/Afghanistan.png" alt="Afghanistan" width="24" height="24" /></a><a title="Afghanistan" href="Base2010.php?cty=AFG">  Afghanistan</a></h2>
<h2><a href="images/Azerbaijan.png"><img class="alignnone size-full wp-image-3346" src="images/Azerbaijan.png" alt="Azerbaijan" width="24" height="24" /></a><a title="Azerbaijan" href="Base2010.php?cty=AZE">  Azerbaijan</a></h2>
<h2><a href="images/Kazakhstan.png"><img class="alignnone size-full wp-image-3346" src="images/Kazakhstan.png" alt="Kazakhstan" width="24" height="24" /></a><a title="Kazakhstan" href="Base2010.php?cty=KAZ">  Kazakhstan</a></h2>
<h2><a href="images/Kyrgyzstan.png"><img class="alignnone size-full wp-image-3346" src="images/Kyrgyzstan.png" alt="Kyrgyz Republic" width="24" height="24" /></a><a title="Kyrgyz Republic" href="Base2010.php?cty=KGZ">  Kyrgyz Republic</a></h2>
<h2><a href="images/Mongolia.png"><img class="alignnone size-full wp-image-3346" src="images/Mongolia.png" alt="Mongolia" width="24" height="24" /></a><a title="Mongolia" href="Base2010.php?cty=MON">  Mongolia</a></h2>
<h2><a href="images/Pakistan.png"><img class="alignnone size-full wp-image-3346" src="images/Pakistan.png" alt="Pakistan" width="24" height="24" /></a><a title="Pakistan" href="Base2010.php?cty=PAK">  Pakistan</a></h2>
<h2><a href="images/Tajikistan.png"><img class="alignnone size-full wp-image-3346" src="images/Tajikistan.png" alt="Tajikistan" width="24" height="24" /></a><a title="Tajikistan" href="Base2010.php?cty=TJK">  Tajikistan</a></h2>
<h2><a href="images/Turkmenistan.png"><img class="alignnone size-full wp-image-3346" src="images/Turkmenistan.png" alt="Turkmenistan" width="24" height="24" /></a><a title="Turkmenistan" href="Base2010.php?cty=TKM">  Turkmenistan</a></h2>
<h2><a href="images/Uzbekistan.png"><img class="alignnone size-full wp-image-3346" src="images/Uzbekistan.png" alt="Uzbekistan" width="24" height="24" /></a><a title="Uzbekistan" href="Base2010.php?cty=UZB">  Uzbekistan</a></h2>
<h2><a href="images/China.png"><img class="alignnone size-full wp-image-3346" src="images/China.png" alt="Xinjiang, PRC" width="24" height="24" /></a><a title="Xinjiang, PRC" href="Base2010.php?cty=XIN">  Xinjiang, People's Republic of China</a></h2>
</ul>
<div><br /></div>
	<tr>
	<td class="figs">
	<?php
	echo renderChart("FusionCharts/FCMap_Asia.swf", "", $strXML_m1, "GDPM", 800, 480, false, true);
	?>
	</td>
	</tr>
</div>
            </div><!-- end Content Area -->
            
			 
		</div>
		<div class="clear"></div>
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
