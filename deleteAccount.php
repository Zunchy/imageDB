<html>
<head>

<style>
<?php include 'style.css'; ?>
</style>

</head>
<body>

<?php
include "Database/dbGlobals.php";

// Create connection
global $dbservername, $dbusername, $dbpassword, $dbname;

$conn = new mysqli($dbservername, $dbusername, $dbpassword, $dbname);
$user = $_POST['user'];

if(! $conn )
    die('Could not connect: ' . mysqli_error($conn));
else{
    $sql = "DELETE FROM users WHERE userName = '$user'";
    $retval = mysqli_query($conn, $sql);

    if(! $retval ) {
      die('Could not delete user: ' . mysqli_error($conn));
    }
    mysqli_close($conn);

  }

?>

 <center><h1 class="subText">Account deletion was succesful!</h1> <br />

 <h1 class="clickHere">Click <a href="signup.php">here</a> to return to the signup page.</h1> <br />

 <center/>

 </body>
