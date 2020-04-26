<?php
include "Database/dbGlobals.php";
include "Database/helpers.php";

$Tag = $_POST['tag'];
global $userid;
$ImageName = $_FILES['img']['name'];
$ImageTMP = $_FILES['img']['tmp_name'];

$random = rand(1, 999);

$trialuser = 3;
if ($Tag == true)
{
add_post_with_tag($trialuser, $ImageTMP, $Tag);
}

else
{
add_post_no_tag($trialuser, $ImageTMP);
}

move_uploaded_file($ImageTMP, "images/$random.$ImageName");
?>
