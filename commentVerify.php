<?php
include "Database/dbGlobals.php";
include "Database/helpers.php";

// Needs later include account verification

$comment = $_POST['comment'];

$trialuser = 3;
$postid = 2;
// User and post are both hard set for testing.


add_comment($trialuser, $postid, $comment)
header("Location: home.php");
?>
