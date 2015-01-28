<?php
$data = file_get_contents("php://input");


function escape($input)
{
    if (!get_magic_quotes_gpc()) {
        $input = mysql_real_escape_string($input);
    }
    return $input;
}

function toNull($input, $quote)
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

class Item
{
    public $Id;
    public $ShopId;
    public $Description;
    public $Quantity;
    public $ShopName;

    // Assigning the values
    public function __construct($Id, $ShopId, $Description, $Quantity, $ShopName)
    {
        $this->Id = $Id;
        $this->ShopId = $ShopId;
        $this->Description = $Description;
        $this->Quantity = $Quantity;
        $this->ShopName = $ShopName;
    }

}

class Shop
{
    public $Id;
    public $Description;

    // Assigning the values
    public function __construct($Id, $Description)
    {
        $this->Id = $Id;
        $this->Description = $Description;
    }

}

function done()
{
    $_GET["id"];

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

    $sql = "UPDATE listitem SET Done=1 WHERE Id=" . $_GET["id"];

    if ($conn->query($sql) === TRUE) {
        return true;
    } else {
        echo "Error updating record: " . $conn->error;
    }
}

function add($item)
{

    if (!isset($item->ShopId)) $item->ShopId = 1;

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
    if (isset($item->Quantity))
        $sql = "INSERT INTO listitem (ShopId,Description, Quantity) VALUES (" . $item->ShopId . "," . toNull($item->Description,true) . "," . toNull($item->Quantity,true) . ")";
    else
        $sql = "INSERT INTO listitem (ShopId,Description) VALUES (" . $item->ShopId . "," . toNull($item->Description,true) . ")";

    if ($conn->query($sql) === TRUE) {
        return true;
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}

function getShops()
{
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

    $sql = "SELECT * FROM shop";
    $result = $conn->query($sql);

    $jsonData = array();
    while ($array = $result->fetch_row()) {
        $obj = new Shop($array[0], $array[1]);
        $jsonData[] = $obj;
    }
    return json_encode($jsonData);


}
function getItemLists()
{
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
    $sql = "SELECT l.*,s.Name FROM listitem l , shop s WHERE l.ShopId = s.Id AND l.Done = 0";
    $result = $conn->query($sql);

    $jsonData = array();
    while ($array = $result->fetch_row()) {
        $obj = new Item($array[0], $array[1], $array[2], $array[3], $array[5]);
        $jsonData[] = $obj;
    }
    return json_encode($jsonData);

}


$objData = json_decode($data);
//echo getItemLists();
switch ($_GET['method']) {
    case "items":
        echo getItemLists();
        break;
    case "shops":
        echo getShops();
        break;
    case "done":
        echo done();
        break;
    case "add":
        //echo 'test';
        //echo $data;
        //print_r($objData->item);
        echo add($objData->item);
        break;
}
?>