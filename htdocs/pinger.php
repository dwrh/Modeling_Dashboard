<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>

<body>
<?php

/*
the host whose service status has to be checked out
*/
$host_to_ping = "www.bearllc.net" ;

/*
I ping twice the host (a higher number of ping would only result the execute script time to be MUCH high).
The result of the output ping command is stored into a variable. This can be done beacuse of the properties and features of the shell_exec() function, see above to know more.
*/
$outputShell = shell_exec("ping -c2 -w2 $host_to_ping") ;

/*
Now the only thing i have to do is to look up the '0 received' string into the output to know whether the server is down or up.
*/

if(strpos($outputShell, '0 received')) {
  
   #SERVER is DOWN so i include an error message

}
else {

   #SERVER is UP so i include the normal code that is meant to be included by default

}

?>
</body>
</html>
