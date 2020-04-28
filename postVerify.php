<?php
include "Database/dbGlobals.php";
include "Database/helpers.php";
session_start();
if(!isset($_SESSION["loggedin"]) || ($_SESSION["loggedin"] !== true))
 exit;

$user = $_SESSION['user'];

global $dbservername, $dbusername, $dbpassword, $dbname;

$conn = mysqli_connect($dbservername, $dbusername, $dbpassword, $dbname);

if(! $conn )
    die('Could not connect: ' . mysqli_error($connect));


  $sql = $conn->prepare("SELECT userID FROM users WHERE userName = ? limit 1");
  $sql->bind_param("s", $user);

  if (!$sql->execute()) {
    trigger_error('Invalid query: ' . $conn->error);
}
$result = $sql->get_result();
$userid = $result->fetch_assoc()["userID"];


$Tag = $_POST['tag'];

$ImageName = $_FILES['img']['name'];
$ImageTMP = $_FILES['img']['tmp_name'];
$datetime = date("m-d-Y_hia");

$filepath = "images/$datetime.$ImageName";
$trialuser = 3;

if ($Tag == true)
{
add_post_with_tag($userid, $filepath, $Tag);
}

else
{
add_post_no_tag($userid, $filepath);
}

move_uploaded_file($ImageTMP, $filepath);
header("Location: home.php");
