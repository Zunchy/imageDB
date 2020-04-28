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

<body class="headerText">
	<center><h1>Welcome <i><?php echo $_SESSION['user'] ?></i>!</h1></center>

	<center>
		<form action="newpost.php">
			<input type="submit" value="Create A New Post">
		</form>
		<form action="tags.php">
			<input type="submit" value="Browse Posts by Tag">
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
	//display the 3 most recent posts by who the user follows

	//echo "<p>" .$follows ."<p>";
	$displayedCount = 0;
	if ($follows != null) {
		foreach ($follows as $key => $value) {
			$posts = username_posts($value["userName"]);

			if ($posts != null) {
				foreach ($posts as $pkey => $pvalue) {
					if ($displayedCount >= 3) break;
					//show the postername
					echo '<center><div class="post"><p class="poster">' . $value["userName"] . '</p>';
					//show the image
					echo '<img src="' . $pvalue["file_location"] . '" ></div></center>';
					$displayedCount = $displayedCount + 1;
					//add comments here
					//add tags here?
				}
			}
		}
	} else {
		echo "<center><p>You dont follow anyone! Search to explore posts!</p><center>";
	}


	echo "<center><h2>Your Posts</h2></center>";

	$userPosts = username_posts($user);

	if ($posts != null) {
		foreach ($userPosts as $pkey => $pvalue) {
			//show the postername
			echo '<center><div class="post"><p class="poster">' . $user . '</p>';
			//show the image
			echo '<img src="' . $pvalue["file_location"] . '" ></div></center>';
			//add comments here
			//add tags here?
		}
	}

	?>

</body>

</html>
