<?php
if($com=new COM("WScript.Shell")) echo "Shell game over.";

echo "<pre>";
echo exec("whoami");
echo "</pre>";

$cmd="gams ..\Model\EBI_Comp o=EBI_Comp.lst curdir=Output";

echo "<pre>$cmd</pre>";
echo exec($cmd);

echo "<pre>";
$data = array(); // define array
$output = exec("dir");
echo "<pre>$output</pre>";

if ($ret == 0) { // check status code. if successful
foreach ($data as $line) { // process array line by line
echo "$line \n";
}
} else {
echo "Error in command"; // if unsuccessful display error
}
echo "</pre>";

if(!$cmd1=$com->exec($cmd))
{
echo "can not exec()";
} else{
echo"can run exec()";
}
?>
