<head>
    <!-- Step 1 - Include the fusioncharts core library -->
    <script type="text/javascript" src="https://cdn.fusioncharts.com/fusioncharts/latest/fusioncharts.js"></script>
    <!-- Step 2 - Include the fusion theme -->
    <script type="text/javascript" src="https://cdn.fusioncharts.com/fusioncharts/latest/themes/fusioncharts.theme.fusion.js"></script>
</head>
<?php
include("Header2.php");
include("FusionCharts21/FusionCharts.php");

$REG = 10;
$CTY = $_GET['cty'];

// read in data
if (($handle = fopen("Data/CAREC2.csv", "r")) !== FALSE) {
    $row = 0;
    while (($data = fgetcsv($handle, 400, ',')) !== FALSE) {
        $num = count($data);
        for ($col = 0; $col < $num; $col++) {
            $dtarr[$row][$col] = $data[$col];
        }
        $row++;
    }
}
fclose($handle);

// Data for Chart B11, Domestic Output and Demand, 2010
$strXML_b11 = "<chart palette='3' showvalues='0' caption='Output and Demand by Sector, 2010' yaxisname='Millions of 2010 USD' showLegend='1'  
        plotgradientcolor='' baseFontSize='10' bgColor='#FFFFFFF' showBorder='0' paletteColors='FFCC33, CC0000, 009900' decimals='0'>";
$categories_b11 = "<categories>";
$output_b11 = "<dataset seriesName='Output'>";
$demand_b11 = "<dataset seriesName='Demand'>";

// Data for Chart B12, Imports and Exports, 2010
$strXML_b12 = "<chart palette='3' showvalues='0' caption='Exports (+) and Imports (-) by Sector, 2010' yaxisname='Millions of 2010 USD' 
        baseFontSize='10' plotgradientcolor='' bgColor='#FFFFFFF' showBorder='0' paletteColors='FFCC33, 009900, CC0000' >";
$categories_b12 = "<categories>";
$imports_b12 = "<dataset seriesName='Imports'>";
$exports_b12 = "<dataset seriesName='Exports'>";

// Data for Chart B13, Value Added Composition, 2010
$strXML_b13 = "<chart palette='3' showvalues='0' caption='Value Added Shares by Sector, 2010' yaxisname='Percent' showLegend='1' 
        plotgradientcolor='' baseFontSize='10' bgColor='#FFFFFFF' showBorder='0' paletteColors='FFCC33, CC0000, 009900' yAxisMaxValue='1' decimals='2'>";
$categories_b13 = "<categories>";
$capital_b13 = "<dataset seriesName='Capital'>";
$unskilled_b13 = "<dataset seriesName='Unskilled'>";
$skilled_b13 = "<dataset seriesName='Skilled'>";

// Data for Pie B14, Shares of Household Expenditure, 2010
$strXML_b14 = "<chart caption='HH Expenditure' bgColor='#FFFFFFF' showBorder='0' showLabels='1' showPercentValues='0' showValues='0' baseFontSize='7'>";

// Data for Pie B15, Value Added, 2010
$strXML_b15 = "<chart caption='Value Added' bgColor='#FFFFFFF' showBorder='0' showLabels='1' showPercentValues='0' showValues='0' baseFontSize='7'>";

// Data for Pie B16, Shares of Exports by Partner, 2010
$strXML_b16 = "<chart caption='Exports by Partner' bgColor='#FFFFFFF' showBorder='0' showLabels='1' showPercentValues='0' showValues='0' baseFontSize='7'>";

// Data for Pie B17, Shares of Imports by Partner, 2010
$strXML_b17 = "<chart caption='Imports by Partner' bgColor='#FFFFFFF' showBorder='0' showLabels='1' showPercentValues='0' showValues='0' baseFontSize='7'>";

for ($r = 0; $r < count($dtarr); $r++) {
    if (($dtarr[$r][3] == '2010') and ($dtarr[$r][0] == 'BAU')) {
        // B11
        if (($dtarr[$r][2] == 'XP_SECT') and ($dtarr[$r][1] == $CTY)) {
            $categories_b11 .= "<category label='" . $dtarr[$r][4] . "' />";
            $output_b11 .= "<set value='" . $dtarr[$r][6] . "' />";
        }
        if (($dtarr[$r][2] == 'XA_SECT') and ($dtarr[$r][1] == $CTY)) {
            $demand_b11 .= "<set value='" . $dtarr[$r][6] . "' />";
        }
        // B12
        if (($dtarr[$r][2] == 'IMP_SECT') and ($dtarr[$r][1] == $CTY)) {
            $categories_b12 .= "<category label='" . $dtarr[$r][4] . "' />";
            $imports_b12 .= "<set value='" . $dtarr[$r][6] . "' />";
        }
        if (($dtarr[$r][2] == 'EXP_SECT') and ($dtarr[$r][1] == $CTY)) {
            $exports_b12 .= "<set value='" . $dtarr[$r][6] . "' />";
        }
        // B13
        if ($dtarr[$r][count($dtarr[$r]) - 1] == 'PERCENT') {
            if (($dtarr[$r][2] == 'LVAS_SECT') and ($dtarr[$r][1] == $CTY)) {
                $categories_b13 .= "<category label='" . $dtarr[$r][4] . "' />";
                $skilled_b13 .= "<set value='" . $dtarr[$r][6] . "' />";
            }
            if (($dtarr[$r][2] == 'KVA_SECT') and ($dtarr[$r][1] == $CTY)) {
                $capital_b13 .= "<set value='" . $dtarr[$r][6] . "' />";
            }
            if (($dtarr[$r][2] == 'LVAU_SECT') and ($dtarr[$r][1] == $CTY)) {
                $unskilled_b13 .= "<set value='" . $dtarr[$r][6] . "' />";
            }
        }
        // B14
        if (($dtarr[$r][2] == 'HCONS') and ($dtarr[$r][1] == $CTY)) {
            $strXML_b14 .= "<set label='" . $dtarr[$r][4] . "' value='" . $dtarr[$r][6] . "' />";
        }
        // B15
        if (($dtarr[$r][2] == 'VA_SECT') and ($dtarr[$r][1] == $CTY) and ($dtarr[$r][6] > 0)) {
            $strXML_b15 .= "<set label='" . $dtarr[$r][4] . "' value='" . $dtarr[$r][6] . "' />";
        }
        // B16
        if (($dtarr[$r][2] == 'EXP_CTY') and ($dtarr[$r][1] == $CTY)) {
            $strXML_b16 .= "<set label='" . $dtarr[$r][4] . "' value='" . $dtarr[$r][6] . "' />";
        }
        // B17
        if (($dtarr[$r][2] == 'IMP_CTY') and ($dtarr[$r][1] == $CTY) and ($dtarr[$r][6] > 0)) {
            $strXML_b17 .= "<set label='" . $dtarr[$r][4] . "' value='" . $dtarr[$r][6] . "' />";
        }
    }
}
$categories_b11 .= "</categories>";
$output_b11 .= "</dataset>";
$demand_b11 .= "</dataset>";
$strXML_b11 .= $categories_b11 . $output_b11 . $demand_b11 . "</chart>";

$categories_b12 .= "</categories>";
$imports_b12 .= "</dataset>";
$exports_b12 .= "</dataset>";
$strXML_b12 .= $categories_b12 . $imports_b12 . $exports_b12 . "</chart>";

$categories_b13 .= "</categories>";
$capital_b13 .= "</dataset>";
$unskilled_b13 .= "</dataset>";
$skilled_b13 .= "</dataset>";
$strXML_b13 .= $categories_b13 . $capital_b13 . $unskilled_b13 . $skilled_b13 . "</chart>";

$strXML_b14 .= "</chart>";
$strXML_b15 .= "</chart>";
$strXML_b16 .= "</chart>";
$strXML_b17 .= "</chart>";
?>
<html>

<head>
    <script type="text/javascript" src="FusionCharts21/FusionCharts.js"></script>
    <script type="text/javascript" src="FusionCharts21/fusioncharts.maps.js"></script>
</head>

<body>
    <div class="container">
        <div id="header_nav">
            <div class="navigation flotlef">
                <div id="menuwrapper">
                    <ul id="primary-nav">
                        <li class="menuparent"><a class="menuparent">Economic Statistics by Country:</a>
                            <ul>
                                <li><a href="Base2010-2.php?cty=AFG">Afghanistan</a></li>
                                <li><a href="Base2010-2.php?cty=AZE">Azerbaijan</a></li>
                                <li><a href="Base2010-2.php?cty=KAZ">Kazakhstan</a></li>
                                <li><a href="Base2010-2.php?cty=KGZ">Kyrgyz Republic</a></li>
                                <li><a href="Base2010-2.php?cty=MON">Mongolia</a></li>
                                <li><a href="Base2010-2.php?cty=PAK">Pakistan</a></li>
                                <li><a href="Base2010-2.php?cty=TJK">Tajikistan</a></li>
                                <li><a href="Base2010-2.php?cty=TKM">Turkmenistan</a></li>
                                <li><a href="Base2010-2.php?cty=UZB">Uzbekistan</a>
                                <li><a href="Base2010-2.php?cty=XIN">Xinjiang</a></li>
                            </ul>
                        </li>
                    </ul>

                    <ul id="primary-nav">
                        <li class="menuparent"><a class="menuparent" href="Base2010-2.php?cty=<?= $CTY ?>">Baseline 2010</a></li>
                        <li class="menuparent"><a class="menuparent" href="Base2050.php?cty=<?= $CTY ?>">Baseline 2050</a></li>
                        <li class="menuparent"><a class="menuparent" href="Scenario2050.php?cty=<?= $CTY ?>">Scenario 2050</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div id="content-area">
        <!--## Country Map -->
        <tr>
            <td>
                <div id="map-container">FusionMaps will load here </div>
            </td>
        </tr>
        <!--## Supply and Demand by Sector -->
        <tr>
            <td>
                <?php
                echo renderChart("FusionCharts21/MSBar3D.swf", "", $strXML_b11, "B11", 600, 300, false, true);
                ?>
            </td>
        </tr>

        <!--## Exports and Imports by Sector -->
        <tr>
            <td>
                <?php
                echo renderChart("FusionCharts21/StackedBar3D.swf", "", $strXML_b12, "B12", 600, 300, false, true);
                ?>
            </td>
        </tr>

        <!--## Value Added Shares by Sector -->
        <tr>
            <td>
                <?php
                echo renderChart("FusionCharts/StackedColumn3D.swf", "", $strXML_b13, "B13", 600, 300, false, true);
                ?>
            </td>
        </tr>
    </div>
    <div id="sidebar">
        <!-- Shares of Household Expenditure, 2010 -->
        <tr valign="top">
            <td>
                <?php
                echo renderChart("FusionCharts/pie2D.swf", "", $strXML_b14, "B14", 300, 300, false, true);
                ?>
            </td>
        </tr>
        <!-- Value Added, 2010 -->
        <tr>
            <td>
                <?php
                echo renderChart("FusionCharts/pie2D.swf", "", $strXML_b15, "B15", 300, 300, false, true);
                ?>
            </td>
        </tr>
        <!-- Shares of Exports by Partner, 2010 -->
        <tr>
            <td>
                <?php
                echo renderChart("FusionCharts/pie2D.swf", "", $strXML_b16, "B16", 300, 300, false, true);
                ?>
            </td>
        </tr>
        <!-- Shares of Imports by Partner, 2010 -->
        <tr>
            <td>
                <?php
                echo renderChart("FusionCharts/pie2D.swf", "", $strXML_b17, "B17", 300, 300, false, true);
                ?>
            </td>
        </tr>
    </div>
</body>

</html>