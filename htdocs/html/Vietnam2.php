<?php

// FusionChart php include statement
include('FusionMaps.php');

// Number of regions - 1, used in for loops
$REG = 11;

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Open CSV file and read in data
if(($handle = fopen("vnout.csv", "r")) !== FALSE) {

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

// 1. Create n x 2 array with FusionMaps country ID in the first column and our regional identifier in the second column
$mapArray[0][1]= "VN.AG"; $mapArray[0][2]= "AG";  // 01	AG	An Gianguda
$mapArray[1][1]= "VN.BG"; $mapArray[1][2]= "BG";  // 02	BG	Bac Giang
$mapArray[2][1]= "VN.BK"; $mapArray[2][2]= "BK";  // 03	BK	Bac Can
$mapArray[3][1]= "VN.BL"; $mapArray[3][2]= "BL";  // 04	BL	Bac Lieu
$mapArray[4][1]= "VN.BN"; $mapArray[4][2]= "BN";  // 05	BN	Bac Ninh
$mapArray[5][1]= "VN.BV"; $mapArray[5][2]= "BV";  // 06	BV	BaRia-VungTau 
$mapArray[6][1]= "VN.BR"; $mapArray[6][2]= "BR";  // 07	BR	Ben Tre
$mapArray[7][1]= "VN.BD"; $mapArray[7][2]= "BD";  // 08	BD	Binh Dinh
$mapArray[8][1]= "VN.BI"; $mapArray[8][2]= "BI";  // 09	BI	Binh Duong
$mapArray[9][1]= "VN.BP"; $mapArray[9][2]= "BP";  // 10	BP	Binh Phuoc
$mapArray[10][1]="VN.BU"; $mapArray[10][2]="BU";  // 11	BU	Binh Thuan
$mapArray[11][1]="VN.CM"; $mapArray[11][2]="CM";  // 12	CM	Ca Mau
$mapArray[12][1]="VN.CN"; $mapArray[12][2]="CN";  // 13	CN	Can Tho
$mapArray[13][1]="VN.CB"; $mapArray[13][2]="CB";  // 14	CB	Cao Bang
$mapArray[14][1]="VN.DA"; $mapArray[14][2]="DA";  // 15	DA	Da Nang
$mapArray[15][1]="VN.DC"; $mapArray[15][2]="DC";  // 16	DC	Dac Lac
$mapArray[16][1]="VN.DO"; $mapArray[16][2]="DO";  // 17	DO	Dac Nong
$mapArray[17][1]="VN.DB"; $mapArray[17][2]="DB";  // 18	DB	Dien Bien
$mapArray[18][1]="VN.DN"; $mapArray[18][2]="DN";  // 19	DN	Dong Nais
$mapArray[19][1]="VN.DT"; $mapArray[19][2]="DT";  // 20	DT	Dong Thap
$mapArray[20][1]="VN.GL"; $mapArray[20][2]="GL";  // 21	GL	Gia Laie Grenadines
$mapArray[21][1]="VN.HG"; $mapArray[21][2]="HG";  // 22	HG	Ha Giango
$mapArray[22][1]="VN.HM"; $mapArray[22][2]="HM";  // 23	HM	Ha Nam
$mapArray[23][1]="VN.HN"; $mapArray[23][2]="HN";  // 24	HN	Hanoi
$mapArray[24][1]="VN.HA"; $mapArray[24][2]="HA";  // 25	HA	Ha Tay
$mapArray[25][1]="VN.HT"; $mapArray[25][2]="HT";  // 26	HT	Ha Tinh
$mapArray[26][1]="VN.HD"; $mapArray[26][2]="HD";  // 27	HD	Hai Duong
$mapArray[27][1]="VN.HP"; $mapArray[27][2]="HP";  // 28	HP	HaiPhong
$mapArray[28][1]="VN.HU"; $mapArray[28][2]="HU";  // 29	HU	Hau Giang
$mapArray[29][1]="VN.HC"; $mapArray[29][2]="HC";  // 30	HC	Ho Chi Minh
$mapArray[30][1]="VN.HO"; $mapArray[30][2]="HO";  // 31	HO	Hoa Binh
$mapArray[31][1]="VN.HY"; $mapArray[31][2]="HY";  // 32	HY	Hung Yen
$mapArray[32][1]="VN.KH"; $mapArray[32][2]="KH";  // 33	KH	Khanh Hoa
$mapArray[33][1]="VN.KG"; $mapArray[33][2]="KG";  // 34	KG	Kien Giang
$mapArray[34][1]="VN.KT"; $mapArray[34][2]="KT";  // 35	KT	Kon Tum
$mapArray[35][1]="VN.LI"; $mapArray[35][2]="LI";  // 36	LI	Lai Chau
$mapArray[36][1]="VN.LD"; $mapArray[36][2]="LD";  // 37	LD	Lam Dong
$mapArray[37][1]="VN.LS"; $mapArray[37][2]="LS";  // 38	LS	Lang Son
$mapArray[38][1]="VN.LO"; $mapArray[38][2]="LO";  // 39	LO	Lao Cai
$mapArray[39][1]="VN.LA"; $mapArray[39][2]="LA";  // 40	LA	Long An
$mapArray[40][1]="VN.ND"; $mapArray[40][2]="ND";  // 41	ND	Nam Dinh
$mapArray[41][1]="VN.NA"; $mapArray[41][2]="NA";  // 42	NA	Nghe An
$mapArray[42][1]="VN.NB"; $mapArray[42][2]="NB";  // 43	NB	Ninh Binh
$mapArray[43][1]="VN.NT"; $mapArray[43][2]="NT";  // 44	NT	Ninh Thuan
$mapArray[44][1]="VN.PT"; $mapArray[44][2]="PT";  // 45	PT	Phu Tho
$mapArray[45][1]="VN.PY"; $mapArray[45][2]="PY";  // 46	PY	Phu Yen
$mapArray[46][1]="VN.QB"; $mapArray[46][2]="QB";  // 47	QB	Quang BinhRepublic
$mapArray[47][1]="VN.QM"; $mapArray[47][2]="QM";  // 48	QM	Quang Nam
$mapArray[48][1]="VN.QG"; $mapArray[48][2]="QG";  // 49	QG	Quang Ngai
$mapArray[49][1]="VN.QN"; $mapArray[49][2]="QN";  // 50	QN	Quang Ninh
$mapArray[50][1]="VN.QT"; $mapArray[50][2]="QT";  // 51	QT	Quang Trilic of the Congo
$mapArray[51][1]="VN.ST"; $mapArray[51][2]="ST";  // 52	ST	Soc Trang
$mapArray[52][1]="VN.SL"; $mapArray[52][2]="SL";  // 53	SL	Son La
$mapArray[53][1]="VN.TN"; $mapArray[53][2]="TN";  // 54	TN	Tay Ninha
$mapArray[54][1]="VN.TB"; $mapArray[54][2]="TB";  // 55	TB	Thai Binh
$mapArray[55][1]="VN.TY"; $mapArray[55][2]="TY";  // 56	TY	Thai Nguyen
$mapArray[56][1]="VN.TH"; $mapArray[56][2]="TH";  // 57	TH	Thanh Hoa
$mapArray[57][1]="VN.TT"; $mapArray[57][2]="TT";  // 58	TT	Thua Thien Hue
$mapArray[58][1]="VN.TG"; $mapArray[58][2]="TG";  // 59	TG	Tien Giang
$mapArray[59][1]="VN.TV"; $mapArray[59][2]="TV";  // 60	TV	Tra Vinh
$mapArray[60][1]="VN.TQ"; $mapArray[60][2]="TQ";  // 61	TQ	Tuyen Quang
$mapArray[61][1]="VN.VL"; $mapArray[61][2]="VL";  // 62	VL	Vinh Long
$mapArray[62][1]="VN.VC"; $mapArray[62][2]="VC";  // 63	VC	Vinh Phuc
$mapArray[63][1]="VN.YB"; $mapArray[63][2]="YB";  // 64	YB	Yen Bai

// 2.1 Create third column in the array that matches our regional identifier with data from the CSV file for Map 1
	for ($a=0; $a < $row; $a++) {
		if ($dtarr[$a][2] == 'growth') {
			for ($b=0; $b <= 63; $b++) {
					if ($mapArray[$b][2] == $dtarr[$a][0]) {
					$mapArray[$b][3] = $dtarr[$a][1];
				}
			}
		}
}

// 3.1 Set map values and colors for Map 1
$strXML_m1 = "";
$strXML_m1 = "<map showLabels='0' includeNameInLabels='0' borderColor='FFFFFF' showBevel='0' legendPosition='Bottom' legendCaption='Per Capita Energy Use, 2030 (Mtoe/person)' showCanvasBorder='0'>";
$strXML_m1 .= "<colorRange>";
$strXML_m1 .= "<color minValue='0' maxValue='1.' displayValue='0-2' color='069F06' />";
$strXML_m1 .= "<color minValue='2' maxValue='2.' displayValue='2-5' color='ABF456' />";
$strXML_m1 .= "<color minValue='3' maxValue='3.' displayValue='5-8' color='FFD33A' />";
$strXML_m1 .= "<color minValue='4' maxValue='15' displayValue='>8' color='CC0001' />";
$strXML_m1 .= "</colorRange><data>";


// 4.1 Put map data into XML script for Map 1
for($c=0; $c <= 63; $c++) {
		$strXML_m1 .= "<entity id='" . $mapArray[$c][1] . "' value='" . $mapArray[$c][3] . "' />";
	}
	$strXML_m1 .= "</data>";
	$strXML_m1  .= "</map>";

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// End CSV open statement and close CSV file
}
fclose($handle);
?>

<!DOCTYPE
td PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<script language="Javascript" SRC="Fusioncharts/FusionMaps.js"></script>
<link rel='stylesheet' href="style.css" />
</head>

<body>
<table width="98%" border="0" cellspacing="0" cellpadding="3" align="center">
  <tr> 
	<td class="figs">
	<?php
	echo renderChart("FCMap_Vietnam.swf", "", $strXML_m1, "GDPM", 330, 220, false, true);
	?>
	</td>
  </tr>
</table>
</body>
</html>
