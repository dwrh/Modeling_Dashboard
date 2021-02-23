<?
// This script shows the forms to create a new quiz.

include('config.php');

// Make sure that the page is set properly

if(!isSet($_REQUEST['page'])){
	
?>
<a href='?page=new'>create a new quiz</a><br />
<?
$result = mysql_query("select id,title from quizconfig");
if(mysql_num_rows($result)>0){
	while($row = mysql_fetch_assoc($result)){
		echo "<a href='?page=".$row["id"]."&action=edit'>edit ".$row["title"]."</a>";
		
	}

}

}else if($_REQUEST['page'] == 'new'){

	?>
	<h2>Create a new quiz</h2>
	<form action="<?php echo $_SERVER["PHP_SELF"];?>" method=POST>
	<input type=hidden name=page value=2>
	<table border=0>
	<tr>
		<td>Quiz Title:<br>
		<input type=text name="title" size=40></td>
	</tr>
	<tr>
		<td>Quiz Administrator Email:<br>
		<input type=text name="email" size=40></td>
	</tr>
	<tr>
		<td>Quiz Intro:<br>
		<textarea name="intro" rows=4 cols=30></textarea></td>
	</tr>		
	<tr>
		<td>How many Personality Types ("You are a..."):<br>
		<select name="types"><option>3</option><option>4</option><option>5</option><option>6</option><option>7</option><option>8</option><option>9</option><option>10</option></select></td>
	</tr>
	<tr>
		<td>Total Number of Questions you want to ask:<br>
		<select name="questions"><option>3</option><option>4</option><option>5</option><option>6</option><option>7</option><option>8</option><option>9</option><option>10</option><option>11</option><option>12</option><option>13</option><option>14</option><option>15</option><option>16</option><option>17</option><option>18</option><option>19</option><option>20</option></select></td>
	</tr>
	</table>
	<input type=submit value="Submit">
	</form>
	<?
}
else
{
	$spon = new spelloutnumbers();
	
	if(isSet($_REQUEST["action"])){ 
		$result = mysql_query("SELECT * FROM quizconfig WHERE quizconfig.id = '".$_REQUEST["page"]."'") or die(mysql_error());
		if(mysql_num_rows($result)>0){
			$row = mysql_fetch_assoc($result);
			$_REQUEST["title"] = $row["title"];
			$_REQUEST["email"] = $row["email"];
			$_REQUEST["intro"] = $row["intro"];
		}

		$result = mysql_query("SELECT * FROM presults WHERE quizid = '".$_REQUEST["page"]."' ORDER BY `order`") or die(mysql_error());
		if(mysql_num_rows($result)>0){
			$_REQUEST["types"] = mysql_num_rows($result);
			while($row = mysql_fetch_assoc($result)){
				$titles[] = $row["title"];
				$description[] = $row["description"];
			}

		}

		$result = mysql_query("SELECT * FROM pqa WHERE quizid = '".$_REQUEST["page"]."' ORDER BY `order`") or die(mysql_error());
		if(mysql_num_rows($result)>0){
			$_REQUEST["questions"] = mysql_num_rows($result);
			while($row = mysql_fetch_assoc($result)){
				$questionstxt[] = $row["question"];
				$answerstxt[] = unserialize($row["answer"]);
			}

		}
	}

	// Retrieve the data from the previous form
	$title = $_REQUEST['title'];
	$email = $_REQUEST['email'];
	$intro = $_REQUEST['intro'];
	$types = $_REQUEST['types'];
	$questions = $_REQUEST['questions'];
	
	
	$title = stripslashes($title);
	if(!isSet($hash)){
		$hash = md5($title.time());
	}
	settype($types, 'integer');
	settype($questions, 'integer');
	
	if(($types == 0) || ($questions == 0) || (empty($title)))
	{
		echo "<BR><font color=FF0000>ERROR: Please fill in all fields properly</font><BR><BR>";
		die();
	}
	
	?>
	<form action="record.php" method=POST>
	<?php
	if(isSet($_REQUEST["page"])){
		echo "<input type=hidden name=page value=\"".$_REQUEST["page"]."\" />";
	}
	if(isSet($_REQUEST["page"])){
		echo "<h2>Quiz information</h2>";
		echo "\nTitle<br><input type=text name=\"title\" value=\"$title\"><br>";
		echo "\nIntro<br><textarea name=\"intro\"cols=30 rows=5>".stripslashes("$intro")."</textarea><br>";
		echo "<input type=hidden name=\"hash\" value=\"$hash\">";
		echo "\nAdministration Email<br><input type=text name=\"email\" value=\"$email\"><br>";
		echo "\n<input type=hidden name=\"types\" value=\"$types\">";
		echo "\n<input type=hidden name=\"questions\" value=\"$questions\">";		
	}else{
		echo "\n<input type=hidden name=\"title\" value=\"$title\">";
		echo "\n<input type=hidden name=\"intro\" value=\"".addslashes("$intro")."\">";
		echo "\n<input type=hidden name=\"hash\" value=\"$hash\">";
		echo "\n<input type=hidden name=\"email\" value=\"$email\">";
		echo "\n<input type=hidden name=\"types\" value=\"$types\">";
		echo "\n<input type=hidden name=\"questions\" value=\"$questions\">";
	}
	?>
	<h2>Descriptions and Questions for <?php echo $title;?></h2>
	Input the title and description of each personality type here. You may use HTML code.
	<table border=0>
	<?
		for($i=0; $i<$types; $i++)
		{
			$pnum = $i+1;
			$pnumeng= $spon->spellout($pnum,1);
			echo "<tr><td>$pnumeng Personality Type Title:<br><input name=\"ptitle[]\" value=\"".$titles[$i]."\" size=20/></td></tr>\n";
			echo "<tr><td>$pnumeng Personality Type Description:<br><textarea name=\"pdesc[]\" rows=5 cols=35 wrap=virtual>".$description[$i]."</textarea></td></tr>\n";
		}
	?>
	</table><BR>
	<?
	for($i=0; $i<$questions; $i++)
	{
		$qnum = $i+1;
		$qnumeng= $spon->spellout($qnum,1);
		echo "<B>$qnumeng Question: </B><input type=text name=\"pquestion[]\" value=\"".$questionstxt[$i]."\" size=20>";
	?>
		<table border=0>
		<?
			for($j=0; $j<$types; $j++)
			{
				$anum = $j+1;
				$anumeng= $spon->spellout($anum,1);
				echo "<tr><td> Answer for $anumeng personality type:</td><td><input type=text name=\"$i-$j\" value=\"".$answerstxt[$i][$j]."\" size=20></td></tr>\n";
			}
		?>
		</table><BR>
	<?
	}

?>
<input type=submit value="Submit">
<? } ?>
</form>	
