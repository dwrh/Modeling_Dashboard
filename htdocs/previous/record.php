<?
// This script writes the quiz to a file

include('config.php');

// Retrieve the user entered data
$title = $_REQUEST['title'];
$email = $_REQUEST['email'];
$intro = $_REQUEST['intro'];
$types = $_REQUEST['types'];
$questions = $_REQUEST['questions'];
$title = stripslashes($title);

if(isSet($_REQUEST["page"])){
	//we're editing, not creating
	$page= $_REQUEST['page'];
	$hash = $_REQUEST['hash'];

}

if(empty($page)){
$sql = "INSERT INTO quizconfig(`hash`,`title`,`email`,`intro`) VALUES('".mysql_real_escape_string($hash)."','".mysql_real_escape_string($title)."','".mysql_real_escape_string($email)."','".mysql_real_escape_string($intro)."')";
mysql_query($sql) or die(mysql_error());
$quizid = mysql_insert_id();

}else{
$quizid = $page;
$sql = "UPDATE quizconfig SET `hash`='".mysql_real_escape_string($hash)."',`title`='".mysql_real_escape_string($title)."',`email`='".mysql_real_escape_string($email)."',`intro`='".mysql_real_escape_string($intro)."' WHERE id='$quizid'";
mysql_query($sql) or die(mysql_error());
	
}

$order = 0;
foreach($_REQUEST["pdesc"] as $pd)
{
	if(empty($page)){
		mysql_query("INSERT INTO presults(`quizid`,`order`,`title`,`description`) VALUES('$quizid','$order','".mysql_real_escape_string($_REQUEST["ptitle"][$order])."','".mysql_real_escape_string($pd)."')") or die(mysql_error());
		$order++;	
	}else{
		$quizid = $page;
		mysql_query("UPDATE presults SET `title`='".mysql_real_escape_string($_REQUEST["ptitle"][$order])."',`description`='".mysql_real_escape_string($pd)."' WHERE quizid='$quizid' AND `order`='$order'") or die(mysql_error());
	$order++;
	}
	
}


$order = 0;
foreach($_REQUEST["pquestion"] as $pq)
{
	$answers = array();
	for($j=0; $j<$types; $j++)
	{
		$answers[] = stripslashes($_REQUEST["$order-$j"]);
	}
	if(empty($page)){
		mysql_query("INSERT INTO pqa(`quizid`,`order`,`question`,`answer`) VALUES('$quizid','$order','".mysql_real_escape_string($pq)."','".serialize($answers)."')");
		$order++;	
	}else{
		$quizid = $page;
		mysql_query("UPDATE pqa SET `question`='".mysql_real_escape_string($pq)."',`answer`='".serialize($answers)."' WHERE quizid='$quizid' AND `order`='$order'") or die(mysql_error());
	$order++;
	}
}

echo "Your quiz has been saved.  You may access it through: <a href='index.php?quiz=$hash'>here</a>"
?>
