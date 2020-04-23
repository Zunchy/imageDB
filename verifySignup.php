<?php
include "Database/dbGlobals.php";

//Variables for user Account Creation
$user = $_POST['user'];
$userPass = $_POST['pass'];

// Create connection
global $dbservername, $dbusername, $dbpassword, $dbname;

$conn = new mysqli($dbservername, $dbusername, $dbpassword, $dbname);

if(! $conn )
    die('Could not connect: ' . mysqli_error($conn));
else
    $sql = $conn->prepare("SELECT COUNT(*) FROM users WHERE userName = ?");
    $sql->bind_param("s", $user);
    
    if (!$sql->execute()) {
      trigger_error('Invalid query: ' . $conn->error);
    }

    $retval = $sql->get_result();
    $duplicateUser = mysqli_fetch_assoc($retval);

    if($duplicateUser['COUNT(*)'] > 0){
      $errorMessage = "Username already taken";
      header('Location: signup.php?errorMessage='.$errorMessage);
      exit;
    }
    else{
      $sql = $conn->prepare("INSERT INTO users ".
               "(userID,userName, password) "."VALUES ".
               "('DEFAULT', ? ,? )");
      $sql->bind_param("ss", $user, $userPass);
      if (!$sql->execute()) {
        die('Could not create user: ' . mysqli_error($conn));
        }

      header('Location: login.php');
    }

?>
