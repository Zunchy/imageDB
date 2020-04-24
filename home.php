<html>
<head>
  <style>
  <?php include 'style.css'; 
  session_start();
  if(!isset($_SESSION["loggedin"]) || ($_SESSION["loggedin"] !== true)){
  	header("location: login.php");
  	exit;
  }

  ?>
  </style>
</head>

<body>
	<center><h1>Welcome <i><?php echo $_SESSION['user'] ?></i>!</h1></center>

	<center>
		<form action="newpost.php">
			<input type="submit" value="Create A New Post">
		</form>
	</center>

	<?php
	  include "Database/dbGlobals.php";
	  include "Database/routines.php";
	  include "Database/helpers.php";
  	  //$user = $_POST['user'];
  	  $user = $_SESSION['user'];

  	  echo "<center><h2>Recent Posts</h2></center>";

  	  $follows = user_following($user);
  	  $followsCount = user_following_count($user);
  	  //display the 3 most recent posts by who the user follows

  	  //echo "<p>" .$follows ."<p>";

  	  if($followsCount->fetch_array(MYSQLI_NUM) > 0){
  	  	foreach ($follows as $key => $value) {
  	  		$posts = username_posts($value["userName"]);
  	  		foreach ($posts as $pkey => $pvalue) {
  	  			//show the postername
  	  			echo '<center><div class="post"><p class="poster">' .$value["userName"] .'</p>';
  	  			//show the image
  	  			echo '<img src="' .$pvalue["file_location"] .'" ></div></center>';
  	  			//add comments here
  	  			//add tags here?
  	  		}
  	  	}

  	  }else{
  	  	echo "<center><p>You dont follow anyone! Search to explore posts!</p><center>";
  	  }

	?>

</body>

</html>