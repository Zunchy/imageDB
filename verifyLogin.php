

<?php
// Start the session
session_start();
?>

<?php
include "Database/dbGlobals.php";


// Create connection
global $dbservername, $dbusername, $dbpassword, $dbname;

$conn = mysqli_connect($dbservername, $dbusername, $dbpassword, $dbname);

if(! $conn )
    die('Could not connect: ' . mysqli_error($connect));
else{

  //defines user variables
  $user = mysqli_real_escape_string($conn, $_POST['user']);
  $userPass = mysqli_real_escape_string($conn, $_POST['pass']);

  //sql statement and execution
  $sql = "SELECT userID FROM users WHERE userName = '$user' AND password = '$userPass';";
  $results = mysqli_query($conn, $sql);

  //compareing the sql input to user given input
  if(mysqli_num_rows($results) == 1){
    $_SESSION["loggedin"] = true;
    $_SESSION['user'] = $user;
    header("location: home.php");
  } else {
    $errorMessage = "Invalid Login!";
    header('Location: login.php?errorMessage='.$errorMessage);
    exit;
  }

 }


?>
