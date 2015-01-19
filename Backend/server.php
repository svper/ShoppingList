<?php

function escape ($input)
{
    if (! get_magic_quotes_gpc()) {
        $input = mysql_real_escape_string($input);
    }
    return $input;
}

function toNull ($input, $quote)
{
    if ($input == "") {
        return "NULL";
    } else {
        if ($quote) {
            return "'" . $input . "'";
        } else {
            return $input;
        }
    }
}


// Public
$servername = "localhost";
$username = "deb38057_shop";
$password = "rvshop";
$dbname = "deb38057_shop";





function getShops(){
	$servername = "localhost";
$username = "deb38057_shop";
$password = "rvshop";
$dbname = "deb38057_shop";
	// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

	$sql = "SELECT * FROM `Shop`";
$result = $conn->query($sql);

$jsonData = array();
while ($array = $result->fetch_row()) {
    $jsonData[] = $array;
}
echo json_encode($jsonData);

}


function getItemLists(){
	$servername = "localhost";
$username = "deb38057_shop";
$password = "rvshop";
$dbname = "deb38057_shop";
	
	// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
	$sql = "SELECT l.*,s.Name FROM `ListItem` l , `Shop` s WHERE l.ShopId = s.Id";
$result = $conn->query($sql);

$jsonData = array();
while ($array = $result->fetch_row()) {
    $jsonData[] = $array;
}
return json_encode($jsonData);

}



echo getShops();
echo getItemLists();


?>