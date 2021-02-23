<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>

<body>
<?php
$data = array(); // define array

exec('dir', $data, $ret); // execute command, output is array

echo "<pre>";
if ($ret == 0) { // check status code. if successful
foreach ($data as $line) { // process array line by line
echo "$line \n";
}
} else {
echo "Error in command"; // if unsuccessful display error
}
echo "</pre>";
?>
</body>
</html>
