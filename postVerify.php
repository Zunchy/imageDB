<?php
include "Database/dbGlobals.php";

$Tag = $_post['tag']
$Image = $_post['img']

global $dbservername, $dbusername, $dbpassword, $dbname;
$conn = new mysqli($dbservername, $dbusername, $dbpassword, $dbname);

if(! $conn )
{
    die('Could not connect: ' . mysqli_error($conn));
}

$insert = "insert into posts (postID, userID, dateTime, file_location, view_count, tag_name)
values ($postID, $userID, $dateTime, $Image, 0, $Tag)"

$run = mysqli_query($con, $insert);
if ($run)
{
  echo "<script>alert('Posted')</script>";
}
/*
$sql = $conn->prepare("INSERT INTO posts (postID, userID, dateTime, file_location, view_count, tag_name) VALUES (?, ?, ?, ?, ?, ?)");
$sql->bind_param("sss", $postID, $userID, $dateTime, $file_location, $view_count, $tag_name);

$postID =
$userID =
$dateTime =
$file_location =
$view_count =
$tag_name =
*/
?>
