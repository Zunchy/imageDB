<?php

//Variables for server connection
$servername = "localhost:3306"; 
$username = "root";
$password = "";
$dbname = "imagedb";

function tag_posts(string $tag_name)
{
    global $servername, $username, $password, $dbname;

    $conn = new mysqli($servername, $username, $password, $dbname);

    if(! $conn )
        die('Could not connect: ' . mysqli_error($conn));

    $sql = "select * from posts where tag_name = \"$tag_name\"";
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

function userid_posts(int $user)
{
    global $servername, $username, $password, $dbname;

    $conn = new mysqli($servername, $username, $password, $dbname);

    if(! $conn )
        die('Could not connect: ' . mysqli_error($conn));

    $sql = "select * from posts where userID = $user";
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

function username_posts(string $user)
{
    global $servername, $username, $password, $dbname;

    $conn = new mysqli($servername, $username, $password, $dbname);

    if(! $conn )
        die('Could not connect: ' . mysqli_error($conn));

    $sql = "select * from posts natural join users where userName = \"$user\"";
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






?>