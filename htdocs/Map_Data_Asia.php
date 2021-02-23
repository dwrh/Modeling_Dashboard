<?php
// 1. First create n x 2 array with FusionMaps country ID in the first column and our regional identifier in the second column
$mapArray[0][0]="001"; $mapArray[0][1]="AFG"; // $mapArray[0][4]="n-Base2010.php";    //  001   AF Afghanistan
$mapArray[1][0]="002"; $mapArray[1][1]="ROA";    //  002   AM Armenia
$mapArray[1][0]="003"; $mapArray[2][1]="AZE"; // $mapArray[1][4]="n-../Economy_AZE.php";    //  003   AZ Azerbaijan
$mapArray[3][0]="005"; $mapArray[3][1]="ROA";    //  005   BD Bangladesh
$mapArray[4][0]="006"; $mapArray[4][1]="ROA";    //  006   BT Bhutan
$mapArray[5][0]="007"; $mapArray[5][1]="ROA";    //  007   BN Brunei
$mapArray[6][0]="008"; $mapArray[6][1]="ROA";    //  008   MM Burma 
$mapArray[7][0]="009"; $mapArray[7][1]="ROA";    //  009   KH Cambodia
$mapArray[8][0]="010"; $mapArray[8][1]="XIN"; // $mapArray[8][4]="n-../Economy_PRC.php";    //  010   CN China
$mapArray[9][0]="012"; $mapArray[9][1]="ROA";    //  012   TP East Timor
$mapArray[10][0]="013"; $mapArray[10][1]="ROA";    //  013   GE Georgia
$mapArray[11][0]="014"; $mapArray[11][1]="IND";    //  014   IN India
$mapArray[12][0]="015"; $mapArray[12][1]="ROA";    //  015   ID Indonesia
$mapArray[13][0]="016"; $mapArray[13][1]="ROA";    //  016   IR Iran
$mapArray[14][0]="019"; $mapArray[14][1]="ROA";    //  019   JP Japan
$mapArray[15][0]="021"; $mapArray[15][1]="KAZ"; // $mapArray[15][4]="n-../Economy_KAZ.php";    //  021   KZ Kazakhstan
$mapArray[16][0]="022"; $mapArray[16][1]="ROA";    //  022   KP Korea (north)
$mapArray[17][0]="023"; $mapArray[17][1]="ROA";    //  023   KR Korea (south)
$mapArray[18][0]="025"; $mapArray[18][1]="KGZ"; // $mapArray[18][4]="n-../Economy_KGZ.php";    //  025   KG Kyrgyzstan
$mapArray[19][0]="026"; $mapArray[19][1]="ROA";    //  026   LA Laos
$mapArray[20][0]="028"; $mapArray[20][1]="ROA";    //  028   MY Malaysia
$mapArray[21][0]="030"; $mapArray[21][1]="MNG"; // $mapArray[21][4]="n-../Economy_MON.php";    //  030   MN Mongolia
$mapArray[22][0]="031"; $mapArray[22][1]="ROA";    //  031   NP Nepal
$mapArray[23][0]="033"; $mapArray[23][1]="PAK"; // $mapArray[23][4]="n-../Economy_PAK.php";    //  033   PK Pakistan
$mapArray[24][0]="034"; $mapArray[24][1]="ROA";    //  034   PH Philippines
$mapArray[25][0]="036"; $mapArray[25][1]="RUS"; // $mapArray[25][4]="n-../Economy_RUS.php";    //  036   RU Russian Federation
$mapArray[26][0]="038"; $mapArray[26][1]="ROA";    //  038   SG Singapore
$mapArray[27][0]="039"; $mapArray[27][1]="ROA";    //  039   LK Sri Lanka
$mapArray[28][0]="041"; $mapArray[28][1]="TJK"; //$mapArray[28][4]="n-../Economy_TJK.php";    //  041   TJ Tajikistan
$mapArray[29][0]="042"; $mapArray[29][1]="ROA";    //  042   TH Thailand
$mapArray[30][0]="044"; $mapArray[30][1]="TKM"; //$mapArray[30][4]="n-../Economy_TKM.php";    //  044   TM Turkmenistan
$mapArray[31][0]="046"; $mapArray[31][1]="UZB"; //$mapArray[31][4]="n-../Economy_UZB.php";    //  046   UZ Uzbekistan
$mapArray[32][0]="047"; $mapArray[32][1]="ROA";    //  047   VN Vietnam
$mapArray[33][0]="049"; $mapArray[33][1]="ROA";    //  049   TW Taiwan
$mapArray[34][0]="050"; $mapArray[34][1]="PRC";    //  050   HK Hong Kong
$mapArray[35][0]="051"; $mapArray[35][1]="ROA";    //  051   MO Macau
$mapArray[36][0]="052"; $mapArray[36][1]="ROA";    //  052   TU Turkey
$mapArray[37][0]="053"; $mapArray[37][1]="ROA";    //  053   SY Syria
$mapArray[38][0]="054"; $mapArray[38][1]="ROA";    //  054   IZ Iraq
$mapArray[39][0]="055"; $mapArray[39][1]="ROA";    //  055   SA Saudi Arabia
$mapArray[40][0]="056"; $mapArray[40][1]="ROA";    //  056   YM Yemen
$mapArray[41][0]="057"; $mapArray[41][1]="ROA";    //  057   MU Oman
$mapArray[42][0]="058"; $mapArray[42][1]="ROA";    //  058   AE United Arab Emirates
$mapArray[43][0]="059"; $mapArray[43][1]="ROA";    //  059   QA Qatar
$mapArray[44][0]="060"; $mapArray[44][1]="ROA";    //  060   BA Bahrain
$mapArray[45][0]="061"; $mapArray[45][1]="ROA";    //  061   KU Kuwait
$mapArray[46][0]="062"; $mapArray[46][1]="ROA";    //  062   JO Jordan
$mapArray[47][0]="063"; $mapArray[47][1]="ROA";    //  063   IS Israel
$mapArray[48][0]="064"; $mapArray[48][1]="ROA";    //  064   LE Lebanon

$mapLabel[0][0]="AFG"; $mapLabel[0][1]="Afghanistan";
$mapLabel[1][0]="AZE"; $mapLabel[1][1]="Azerbaijan";
$mapLabel[1][0]="KAZ"; $mapLabel[2][1]="Kazakhstan";
$mapLabel[3][0]="KGZ"; $mapLabel[3][1]="Kyrgyz Republic";
$mapLabel[4][0]="MON"; $mapLabel[4][1]="Mongolia";
$mapLabel[5][0]="PAK"; $mapLabel[5][1]="Pakistan";
$mapLabel[6][0]="PRC"; $mapLabel[6][1]="China";
$mapLabel[7][0]="TJK"; $mapLabel[7][1]="Tajikistan";
$mapLabel[8][0]="TKM"; $mapLabel[8][1]="Turkmenistan";
$mapLabel[9][0]="UZB"; $mapLabel[9][1]="Uzbekistan";
$mapLabel[10][0]="RUS"; $mapLabel[10][1]="Russian Federation";
$mapLabel[11][0]="IND"; $mapLabel[11][1]="India";
$mapLabel[12][0]="HYA"; $mapLabel[12][1]="High Income Asia";
$mapLabel[13][0]="ROA"; $mapLabel[13][1]="Asia";
$mapLabel[14][0]="EUR"; $mapLabel[14][1]="EU";
$mapLabel[15][0]="USA"; $mapLabel[15][1]="United States";
$mapLabel[16][0]="AMS"; $mapLabel[16][1]="Other Americas";
$mapLabel[17][0]="ROW"; $mapLabel[17][1]="Rest of World";
$mapLabel[18][0]="XIN"; $mapLabel[18][1]="Xinjiang";
$mapLabel[19][0]="Asia"; $mapLabel[19][1]="Asia";
$mapLabel[20][0]="LAO"; $mapLabel[20][1]="Lao";
$mapLabel[21][0]="MMR"; $mapLabel[21][1]="Myanmar";
$mapLabel[22][0]="KHM"; $mapLabel[22][1]="Cambodia";
$mapLabel[23][0]="World"; $mapLabel[23][1]="WorldwithCountries";
?>
