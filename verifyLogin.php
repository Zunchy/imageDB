<?php
session_start();
include "Database/dbGlobals.php";

$user = $_POST['user'];
$userPass = $_POST['pass'];

global $dbservername, $dbusername, $dbpassword, $dbname;

$conn = new mysqli($dbservername, $dbusername, $dbpassword, $dbname);

if(! $conn){
	die('Could not connect: ' . mysqli_error($conn));
} else {
	//$sql = $conn->prepare("SELECT id, password FROM users WHERE userName = ?");
	if($sql = $conn->prepare("SELECT userId, password FROM users WHERE userName = ?")){
			$sql->bind_param("s", $user);
	}else{
		$error = $conn->errno . ' ' . $conn->error;
		echo $error;
	}

	if(!$sql->execute()){
		trigger_error('Invalid query: ' . $conn->error);
	}

	$retval=$sql->get_result();

	if($retval->num_rows == 1){
		$resultRow = mysqli_fetch_assoc($retval);
		if($resultRow["password"] == $userPass){
			//login sucessful
			$_SESSION["loggedin"] = true;
			$_SESSION["id"] = $resultRow["userId"];
			$_SESSION["user"] = $user;
			header('location: home.php');
			exit;
		}else{
			//wrong password
			$errorMessage = "Incorrect Password";
		}
	} else {
		//user doesnt exist
		$errorMessage = "User does not exist";
	}
	header('location: login.php?errorMessage=' . $errorMessage);
}

?>