<html>
<head>

<style>
<?php include 'style.css'; ?>
</style>

</head>
<body>

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
else{
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
      mysqli_close($conn);
    }
  }


?>


 <center><h1 class="subText">Account creation was succesful!</h1> <br />

 <h1 class="clickHere">Click <a href="login.php">here</a> to login.</h1> <br />

 <center/>

 </body>