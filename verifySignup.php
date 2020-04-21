<?php
//Variables for server connection
$servername = "localhost:3306";  // if you run on local server the name is "localhost:3306". If you run on cs server, use only "localhost"
$username = "root";
$password = "";
$dbname = "imagedb";

//Variables for user Account Creation
$user = $_POST['user'];
$userPass = $_POST['pass'];

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

if(! $conn )
    die('Could not connect: ' . mysqli_error($conn));
else
    $sql = "SELECT COUNT(*) FROM users WHERE userName = '$user'";
    $retval = mysqli_query($conn, $sql);
    $duplicateUser = mysqli_fetch_assoc($retval);

    if($duplicateUser['COUNT(*)'] > 0){
      $errorMessage = "Username already taken";
      header('Location: signup.php?errorMessage='.$errorMessage);
      exit;
    }
    else{
      $sql = "INSERT INTO users ".
               "(userID,userName, password) "."VALUES ".
               "('DEFAULT','$user','$userPass')";

      $retval = mysqli_query($conn, $sql);

      if(! $retval ) {
        die('Could not create user: ' . mysqli_error($conn));
      }

      header('Location: login.php');
    }

?>
