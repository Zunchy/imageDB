<?php
include "dbGlobals.php";

function tag_posts(string $tag_name)
{
    global $dbservername, $dbusername, $dbpassword, $dbname;

    $conn = new mysqli($dbservername, $dbusername, $dbpassword, $dbname);

    if(! $conn )
        die('Could not connect: ' . mysqli_error($conn));

    $sql = $conn->prepare("select * from posts where tag_name = ?");
    $sql->bind_param("s", $tag_name);

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

function userid_posts(int $user)
{
    global $dbservername, $dbusername, $dbpassword, $dbname;

    $conn = new mysqli($dbservername, $dbusername, $dbpassword, $dbname);

    if(! $conn )
        die('Could not connect: ' . mysqli_error($conn));

    $sql = $conn->prepare("select * from posts where userID = ?");
    $sql->bind_param("i", $user);

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

function username_posts(string $user)
{
    global $dbservername, $dbusername, $dbpassword, $dbname;

    $conn = new mysqli($dbservername, $dbusername, $dbpassword, $dbname);

    if(! $conn )
        die('Could not connect: ' . mysqli_error($conn));

    $sql = $conn->prepare("select * from posts natural join users where userName = ?");
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

function add_post_with_tag(int $userid, string $file_location, string $tag_name)
{
    global $dbservername, $dbusername, $dbpassword, $dbname;

    $conn = new mysqli($dbservername, $dbusername, $dbpassword, $dbname);

    if(! $conn )
        die('Could not connect: ' . mysqli_error($conn));
    $datetime = date("Y-m-d H:i:s");
    $sql = $conn->prepare("INSERT INTO `posts` (`postID`, `userID`, `dateTime`, `file_location`, `view_count`, `tag_name`)
    VALUES (NULL, ?, ?, ?, '0', ?)");
    $sql->bind_param("isss", $userid, $datetime, $file_location, $tag_name);
    if (!$sql->execute()) {
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
    $sql = $conn->prepare("INSERT INTO `posts` (`postID`, `userID`, `dateTime`, `file_location`, `view_count`, `tag_name`)
    VALUES (NULL, ?, ?, ?, '0', NULL)");
        $sql->bind_param("iss", $userid, $datetime, $file_location);

    if (!$sql->execute()) {
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
    $sql = $conn->prepare("INSERT INTO `comments` (`userID`, `postID`, `dateTime`, `text`)
    VALUES (?, ?, ?, ?)");
        $sql->bind_param("iiss", $userid, $postid, $datetime, $text);

    if (!$sql->execute()) {
        trigger_error('Invalid query: ' . $conn->error);
    }

    $conn->close();
}


?>
