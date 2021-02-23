$strXML_ch503 = "";
//$strXML_ch503 = "<chart palette='3' showvalues='0' caption='GDP Per Capital and Share of Labor Value Added, 2010-2050' showLegend='1' yaxisname='Percent' plotgradientcolor='' baseFontSize='10' bgColor='#FFFFFFF' showBorder='0' paletteColors='009900, CC0000' decimals='0'>";
$strXML_ch503 = "<chart caption='Average Annual Growth of Output by Sector, 2010-50' numberSuffix='%' is3D='1' animation='1' clipBubbles='1' 
xAxisMinValue='-200' xAxisMaxValue='1000' showPlotBorder='0' 
xAxisName='Scenario' yAxisName='Baseline' chartRightMargin='13' 
baseFontSize='7' drawQuadrant='0' decimals='0' numDivLines='6' yAxisMinValue='-200' yAxisMaxValue='1000' 
>";
//quadrantLineThickness='1' quadrantLineColor='000080'    canvasBgAlpha='100'  bgColor='ffffff' quadrantXVal='58' quadrantYVal='0'>";
//quadrantLabelTL='Top Left Quadrant' quadrantLabelTR='Top Right Quadrant' quadrantLabelBR='Bottom Right Quadrant' quadrantLabelBL='Bottom Left Quadrant' 

$strXML_ch503 .= "<categories>";
$strXML_ch503 .= "<category label='-200%' x='-200' showVerticalLine='1'/>";
$strXML_ch503 .= "<category label='0%' x='0' showVerticalLine='1'/>";
$strXML_ch503 .= "<category label='200%' x='400' showVerticalLine='1'/>";
$strXML_ch503 .= "<category label='400%' x='400' showVerticalLine='1'/>";
$strXML_ch503 .= "<category label='600%' x='600' showVerticalLine='1'/>";
$strXML_ch503 .= "<category label='800%' x='800' showVerticalLine='1'/>";
$strXML_ch503 .= "<category label='1000%' x='1000' showVerticalLine='1'/>";
$strXML_ch503 .= "</categories>";


$strXML_ch503 .= "<dataset showValues='1'>";
for ($jj=0; $jj <= $row; $jj++) {
	if (
			($dtarr[$jj][3] == '2050') and 
			($dtarr[$jj][0] == 'TRADE') and 
			($dtarr[$jj][7] == 'BUBBLE') and
			($dtarr[$jj][1] == $CTY)
		) 	{
			$strXML_ch503 .= "<set open='" . $dtarr[$jj][6] . "' "; 
			$strXML_ch503 .= "high='" . $dtarr[$jj][6] . "' "; 
			$strXML_ch503 .= "low='" . $dtarr[$jj][9] . "' "; 
			$strXML_ch503 .= "close='" . $dtarr[$jj][9] . "' color='f9a51a' showValues='1'/>"; 
     <set open="24.6" high="25.24" low="24.58" close="25.19" x="1" volume="17856350" /> 
 			}
}
$strXML_ch503 .= "</dataset>";

$strXML_ch503 .= "<dataset showRegressionLine='1' regressionLineColor='0C864F'>";
     $strXML_ch503 .= "<set x='-200' y='-200'  name='Temp'/>";
     $strXML_ch503 .= "<set x='1000' y='1000'  name='Temp'/>";
$strXML_ch503 .= "</dataset>";

$strXML_ch503 .= "</chart>";

//echo $strXML_ch503 ;

