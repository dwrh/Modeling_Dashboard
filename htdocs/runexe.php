<?php
if($com=new COM("WScript.Shell")) echo "Shell game on.";

echo "<pre>";
echo exec("whoami");
echo "</pre>";

//echo exec("cd C:\\inetpub\\vhosts\\bearllc.net\\httpdocs\\TIGGER\\Model");
//echo exec("cd Model");
echo exec("where *.gms");

$cmd="gams ..\Model\PHPTest o=PHPTest.lst curdir=Output";
//$cmd="gams Model\PHPTest o=Model\PHPTest.lst sd=Model\ ";
//$cmd="gams C:\inetpub\vhosts\bearllc.net\httpdocs\TIGGER\PHPTest.gms C:\inetpub\vhosts\bearllc.net\httpdocs\TIGGER\PHPTest.lst";
//$cmd="gams C:\inetpub\vhosts\bearllc.net\httpdocs\TIGGER\PHPTest.gms";
echo "<pre>$cmd</pre>";
echo exec($cmd);

echo "<pre>";
$data = array(); // define array
$output = exec("dir");
//$output = shell_exec('dir');
echo "<pre>$output</pre>";

//echo exec('got this far');
//exec ('gams\gams project'); // execute command, output is array

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
