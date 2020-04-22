<?php
include "dbGlobals.php";

function tag_posts(string $tag_name)
{
    global $dbservername, $dbusername, $dbpassword, $dbname;

    $conn = new mysqli($dbservername, $dbusername, $dbpassword, $dbname);

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
    global $dbservername, $dbusername, $dbpassword, $dbname;

    $conn = new mysqli($dbservername, $dbusername, $dbpassword, $dbname);

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
    global $dbservername, $dbusername, $dbpassword, $dbname;

    $conn = new mysqli($dbservername, $dbusername, $dbpassword, $dbname);

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

function add_post_with_tag(int $userid, string $file_location, string $tag_name)
{
    global $dbservername, $dbusername, $dbpassword, $dbname;

    $conn = new mysqli($dbservername, $dbusername, $dbpassword, $dbname);

    if(! $conn )
        die('Could not connect: ' . mysqli_error($conn));
    $datetime = date("Y-m-d H:i:s");
    $sql = "INSERT INTO `posts` (`postID`, `userID`, `dateTime`, `file_location`, `view_count`, `tag_name`) 
    VALUES (NULL, '$userid', '$datetime', '$file_location', '0', '$tag_name')";

    $success = mysqli_query($conn, $sql);

    if (!$success) {
        trigger_error('Invalid query: ' . $conn->error);
    }

    $conn->close();
}

function add_post_no_tag(int $userid, string $file_location)
{
    global $dbservername, $dbusername, $dbpassword, $dbname;

    $conn = new mysqli($dbservername, $dbusername, $dbpassword, $dbname);

    if(! $conn )
        die('Could not connect: ' . mysqli_error($conn));
    $datetime = date("Y-m-d H:i:s");
    $sql = "INSERT INTO `posts` (`postID`, `userID`, `dateTime`, `file_location`, `view_count`, `tag_name`) 
    VALUES (NULL, '$userid', '$datetime', '$file_location', '0', NULL)";

    $success = mysqli_query($conn, $sql);

    if (!$success) {
        trigger_error('Invalid query: ' . $conn->error);
    }

    $conn->close();
}

function add_comment(int $userid, int $postid, string $text)
{
    global $dbservername, $dbusername, $dbpassword, $dbname;

    $conn = new mysqli($dbservername, $dbusername, $dbpassword, $dbname);

    if(! $conn )
        die('Could not connect: ' . mysqli_error($conn));
    $datetime = date("Y-m-d H:i:s");
    $sql = "INSERT INTO `comments` (`userID`, `postID`, `dateTime`, `text`) 
    VALUES ('$userid', '$postid', '$datetime', '$text')";

    $success = mysqli_query($conn, $sql);

    if (!$success) {
        trigger_error('Invalid query: ' . $conn->error);
    }

    $conn->close();
}


?>