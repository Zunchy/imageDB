<?php

include "dbGlobals.php";

function user_follower_count(string $user)
{
    global $dbservername, $dbusername, $dbpassword, $dbname;

    $conn = new mysqli($dbservername, $dbusername, $dbpassword, $dbname);

    if(! $conn )
        die('Could not connect: ' . mysqli_error($conn));
    $sql = $conn->prepare("select user_follower_count((select userid from users where userName = ? limit 1))");
    $sql->bind_param("s", $user);
    if (!$sql->execute()) {
        trigger_error('Invalid query: ' . $conn->error);
    }
    $retval = $sql->get_result();
    $conn->close();   
    return $retval;

}

function user_following_count(string $user)
{
    global $dbservername, $dbusername, $dbpassword, $dbname;

    $conn = new mysqli($dbservername, $dbusername, $dbpassword, $dbname);

    if(! $conn )
        die('Could not connect: ' . mysqli_error($conn));
    $sql = $conn->prepare("select user_following_count((select userid from users where userName = ? limit 1))");
    $sql->bind_param("s", $user);
    if (!$sql->execute()) {
        trigger_error('Invalid query: ' . $conn->error);
    }
    $retval = $sql->get_result();
    $conn->close();
    return $retval;

}

function post_like_count(int $postID)
{
    global $dbservername, $dbusername, $dbpassword, $dbname;

    $conn = new mysqli($dbservername, $dbusername, $dbpassword, $dbname);

    if(! $conn )
        die('Could not connect: ' . mysqli_error($conn));
    $sql = $conn->prepare("select post_like_count(?);");
    $sql->bind_param("i", $postID);
    if (!$sql->execute()) {
        trigger_error('Invalid query: ' . $conn->error);
    }
    $retval = $sql->get_result();
    $conn->close();   
    return $retval;
}

function post_comments(int $postID)
{
    global $dbservername, $dbusername, $dbpassword, $dbname;

    $conn = new mysqli($dbservername, $dbusername, $dbpassword, $dbname);

    if(! $conn )
        die('Could not connect: ' . mysqli_error($conn));

    $sql = $conn->prepare("call post_comments(?)");
    $sql->bind_param("i", $postID);
    if (!$sql->execute()) {
        trigger_error('Invalid query: ' . $conn->error);
    }
    $retval = $sql->get_result();

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

    $sql = $conn->prepare("call post_likes(?)");
    $sql->bind_param("i", $postID);
    if (!$sql->execute()) {
        trigger_error('Invalid query: ' . $conn->error);
    }
    $retval = $sql->get_result();

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

function user_followers(string $user)
{
    global $dbservername, $dbusername, $dbpassword, $dbname;

    $conn = new mysqli($dbservername, $dbusername, $dbpassword, $dbname);

    if(! $conn )
        die('Could not connect: ' . mysqli_error($conn));

    $sql = $conn->prepare("call user_followers((select userid from users where userName = ? limit 1))");
    $sql->bind_param("s", $user);
    if (!$sql->execute()) {
        trigger_error('Invalid query: ' . $conn->error);
    }
    $retval = $sql->get_result();

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

function user_following(string $user)
{
    global $dbservername, $dbusername, $dbpassword, $dbname;

    $conn = new mysqli($dbservername, $dbusername, $dbpassword, $dbname);
    if(! $conn )
        die('Could not connect: ' . mysqli_error($conn));

    $sql = $conn->prepare("call user_following((select userid from users where userName = ? limit 1))");
    $sql->bind_param("s", $user);
    if (!$sql->execute()) {
        trigger_error('Invalid query: ' . $conn->error);
    }
    $retval = $sql->get_result();

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