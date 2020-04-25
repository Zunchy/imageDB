<?php
include "Database/dbGlobals.php";
include "Database/helpers.php";

$Tag = $_POST['tag'];
//$Image = $_POST['img'];
$ImageData = $_FILES['img']
$Image= $_FILES['img']['name']

if ($tag)
{
add_post_with_tag($userid, $Image, $Tag)
}

else
{
add_post_no_tag($userid, string $file_location)
}
?>
