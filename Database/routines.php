<?php

include "dbGlobals.php";

function user_follower_count(int $userID)
{
    global $dbservername, $dbusername, $dbpassword, $dbname;

    $conn = new mysqli($dbservername, $dbusername, $dbpassword, $dbname);

    if(! $conn )
        die('Could not connect: ' . mysqli_error($conn));
    $sql = "select user_follower_count($userID);";
    $retval = mysqli_query($conn, $sql);
    if (!$retval) {
        trigger_error('Invalid query: ' . $conn->error);
    }
    $conn->close();   
    return $retval;

}

function user_following_count(int $userID)
{
    global $dbservername, $dbusername, $dbpassword, $dbname;

    $conn = new mysqli($dbservername, $dbusername, $dbpassword, $dbname);

    if(! $conn )
        die('Could not connect: ' . mysqli_error($conn));
    $sql = "select user_following_count($userID);";
    $retval = mysqli_query($conn, $sql);
    if (!$retval) {
        trigger_error('Invalid query: ' . $conn->error);
    }
    $conn->close();
    return $retval;

}

function post_like_count(int $postID)
{
    global $dbservername, $dbusername, $dbpassword, $dbname;

    $conn = new mysqli($dbservername, $dbusername, $dbpassword, $dbname);

    if(! $conn )
        die('Could not connect: ' . mysqli_error($conn));
    $sql = "select post_like_count($postID);";
    $retval = mysqli_query($conn, $sql); 
    if (!$retval) {
        trigger_error('Invalid query: ' . $conn->error);
    }
    $conn->close();   
    return $retval;
}

function post_comments(int $postID)
{
    global $dbservername, $dbusername, $dbpassword, $dbname;

    $conn = new mysqli($dbservername, $dbusername, $dbpassword, $dbname);

    if(! $conn )
        die('Could not connect: ' . mysqli_error($conn));

    $sql = "call post_comments($postID)";
    $retval = mysqli_query($conn, $sql);
    if (!$retval) {
        trigger_error('Invalid query: ' . $conn->error);
    }
    if($retval->num_rows > 0)
    {
        while($record = $retval->fetch_assoc())
        $rows[] = $record;
    }
    else
    {
        $rows = null;
    }
    $conn->close();
    return $rows;
     
}

function post_likes(int $postID)
{
    global $dbservername, $dbusername, $dbpassword, $dbname;

    $conn = new mysqli($dbservername, $dbusername, $dbpassword, $dbname);

    if(! $conn )
        die('Could not connect: ' . mysqli_error($conn));

    $sql = "call post_likes($postID)";
    $retval = mysqli_query($conn, $sql);
    if (!$retval) {
        trigger_error('Invalid query: ' . $conn->error);
    }
    if($retval->num_rows > 0)
    {
        while($record = $retval->fetch_assoc())
        $rows[] = $record;
    }
    else
    {
        $rows = null;
    }
    $conn->close();
    return $rows;
     
}

function user_followers(int $userID)
{
    global $dbservername, $dbusername, $dbpassword, $dbname;

    $conn = new mysqli($dbservername, $dbusername, $dbpassword, $dbname);

    if(! $conn )
        die('Could not connect: ' . mysqli_error($conn));

    $sql = "call user_followers($userID)";
    $retval = mysqli_query($conn, $sql);
    if (!$retval) {
        trigger_error('Invalid query: ' . $conn->error);
    }
    if($retval->num_rows > 0)
    {
        while($record = $retval->fetch_assoc())
        $rows[] = $record;
    }
    else
    {
        $rows = null;
    }
    $conn->close();
    return $rows;
     
}

function user_following(int $userID)
{
    global $dbservername, $dbusername, $dbpassword, $dbname;

    $conn = new mysqli($dbservername, $dbusername, $dbpassword, $dbname);
    if(! $conn )
        die('Could not connect: ' . mysqli_error($conn));

    $sql = "call user_following($userID)";
    $retval = mysqli_query($conn, $sql);
    if (!$retval) {
        trigger_error('Invalid query: ' . $conn->error);
    }
    if($retval->num_rows > 0)
    {
        while($record = $retval->fetch_assoc())
        $rows[] = $record;
    }
    else
    {
        $rows = null;
    }
    $conn->close();
    return $rows;
     
}

    //Usage if works example for comments?
    /*
    $comments = post_comments(postID);
    if($comments->isset())
    {
        foreach($comments as $comment)
        {
            echo $comment['userID'], "|", $comment['dateTime'], "|", $comment['text'] ;
        }
    }
    */
?>