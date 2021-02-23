<?php

//echo getcwd();
//chdir('..\..\cgi-bin\GAMS');
//echo getcwd();
//$curdir = getcwd();
//echo "<br>";
//print_r(scandir($curdir));

//chdir('c:\inetpub\vhosts\bearllc.net\cgi-bin\GAMS');
//chdir('c:\Progra~1\Common~1\GAMS');
//echo getcwd();
exec('c:\inetpub\vhosts\bearllc.net\httpdocs\TIGGER\TSW.txt 2>&1', $out, $res);
//$gd = exec('gams  2>&1', $out, $res);
if ($res != 0) {
	echo "Error: ";
	print_r($out);
}

//echo $result_status;

echo "\n Permission: ";
echo fileperms('c:\inetpub\vhosts\bearllc.net\httpdocs\TIGGER\GAMS\PHPTest.gms');
?>
