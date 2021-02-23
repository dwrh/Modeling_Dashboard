<?
// This script determines the results of the quiz
// and displays them to the user
include("config.php");


// Display the header
if(file_exists($headerfile)){
include($headerfile);
}

$quizhash = $_REQUEST['quizhash'];
$result = mysql_query("SELECT id from quizconfig where hash = '".mysql_real_escape_string($quizhash)."'");
if(mysql_num_rows($result)>0){
	$row = mysql_fetch_assoc($result);	
	$quizid = $row["id"];
}

$result = mysql_query("SELECT * from presults where quizid = '$quizid'");
if(mysql_num_rows($result)>0){


// Set up the current max value sets
	while ($row = mysql_fetch_assoc($result))
	{
		$ptitle[] = $row["title"];
		$pdesc[] = $row["description"];
		$nowval[$row["order"]] = 0;
	}

}
// Add up each question's answers
$result = mysql_query("SELECT count(*) AS 'count' from pqa where quizid= '$quizid'");
if(mysql_num_rows($result)>0){
	$row = mysql_fetch_assoc($result);	
}

for ($i=0; $i<$row["count"]; $i++)
{
	$qvar = "q_$i";
$nowval[$_REQUEST[$qvar]]++;
//echo "response > ".$_REQUEST[$qvar];	
}
arsort($nowval);

foreach($nowval AS $k=>$v){
	$winner = $k;
	$wincount = $v;
	break;
}
?>
<h2>Your Quiz Results:</h2>
<?

//print_r($nowval);

echo "<h3>".$ptitle[$winner]."</h3>";
echo $pdesc[$winner];

$result = mysql_query("SELECT * FROM data WHERE IP = '".$_SERVER["REMOTE_ADDR"]."' AND ts > date_sub(now(), INTERVAL 1 month)") or die(mysql_error());

if(mysql_num_rows($result)>0){
	echo $nextmonthtxt;
}else{
	mysql_query("INSERT INTO data(`quizid`,`result`,`IP`,`ts`) VALUES('$quizid','$winner','".$_SERVER["REMOTE_ADDR"]."',now())");
	
}

// Display the footer
if(file_exists($footerfile)){
include($footerfile);
}

?>
