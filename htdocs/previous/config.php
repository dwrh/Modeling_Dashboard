<?
$dbh = 'eilat';
$dbu = 'simplequiz';
$dbp = 'simplequiz';
$dbd = 'simplequiz';

$quizdatapath = "quizzes/"; //keep trailing slash
$headerfile = '';
$footerfile = '';

$nextmonthtxt = "<br>Have some fun! You're welcome to take the quiz as many times as you like, but we'll only add your response to our results once a month.";

$link=mysql_connect($dbh,$dbu,$dbp) or die("Error 01: Failed to connect to database.");
mysql_select_db($dbd) or die("Error 02: Failed to select database.");

class spelloutnumbers {
/*
Grabbed from http://www.phpclasses.org/browse/file/3745.html

Here's the license information:
This class may be used for free for non-commercial purposes.
Commercial use requires a one-time fee of $50 per Web site.
Paypal: soaking@spray.se
*/ 
function hundreds($number) {
$lasts = array('one','two','three','four','five','six','seven','eight','nine');
$teens = array('eleven','twelve','thirteen','fourteen','fifteen','sixteen','seventeen','eighteen','nineteen');
$tens = array('ten','twenty-','thirty-','forty-','fifty-','sixty-','seventy-','eighty-','ninety-');

$string = "";
$j = strlen($number);
$done = false;
for($i=0; $i<strlen($number); $i++) {
if($j==2) {
if(strlen($number)>2) {
if($number[0]!=0) {$string .= ' hundred ';}
}
if($number[$i]==1) {
if($number[$i+1]==0) {$string .= $tens[$number[$i]-1];}
else {
$string .= $teens[$number[$i+1]-1];
$done = true;
}
}
else {
if(!empty($tens[$number[$i]-1])) {$string .= $tens[$number[$i]-1].' ';}
}
}
elseif($number[$i]!=0 && !$done) {$string .= $lasts[$number[$i]-1];}
$j--;
}
return $string;
}    

function spellout($number,$suffix=0,$caps=1,$uk=0) {
$many = array('', ' thousand ',' million ',' billion ',' trillion ');

$number = strval($number);
$string = "";

if(strlen($number)%3!=0) {
$string .= $this->hundreds(substr($number,0,strlen($number)%3));
$string .= $many[floor(strlen($number)/3)];
}

for($i=0; $i<floor(strlen($number)/3); $i++) {
$string .= $this->hundreds(substr($number,strlen($number)%3+($i*3),3));
if($number[strlen($number)%3+($i*3)]!=0) {
$string .= $many[floor(strlen($number)/3)-1-$i];
}
}

$match = array('/ +/','/- /','/-$/','/-thousand/','/-million/','/-billion/','/-trillion/');
$replace = array(' ','-','',' thousand',' million',' billion',' trillion');
$string = preg_replace($match,$replace,$string);

if($uk) {
$match = array('/billion/','/trillion/');
$replace = array('milliard','billion');
$string = preg_replace($match,$replace,$string);
}

if($suffix) {
$match = array('/ve$/','/t$/','/y$/','/one$/','/two$/','/three$/','/e$/');
$replace = array('fth','th','ieth','first','second','third','th');
$string = preg_replace($match,$replace,$string);
if(!preg_match("/first$|second$|third$|th$/",$string)) {
$string .= "th";
}
}

if($caps) {
$string = ucwords($string);
$string = preg_replace("/(-[A-Z])/",strtolower("\\1"),$string);
}

$foo = strrpos($string," ");
if($foo!==false) {
$string = substr($string,0,$foo)." and".substr($string,$foo);
}

return $string;
}
} 

?>
