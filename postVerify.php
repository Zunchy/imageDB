<?php
include "Database/dbGlobals.php";
include "Database/helpers.php";

$Tag = $_POST['tag'];
global $userid;
$ImageName = $_FILES['img']['name'];
$ImageTMP = $_FILES['img']['tmp_name'];

$random = rand(1, 999);

if ($Tag)
{
add_post_with_tag($userid, $ImageTMP, $Tag);
}

else
{
add_post_no_tag($userid, $ImageTMP);
}

move_uploadedfile($ImageTMP, "images/$img.$random");
?>
