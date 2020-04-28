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
	<center><h1><i><?php echo $_SESSION['user'] ?>'s Profile</i>!</h1></center>

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

  	  echo "<center><h2>Your Posts</h2></center>";


		      $posts = username_posts($_SESSION['user']);

  				if($posts != null)
  				{
  					foreach ($posts as $pkey => $pvalue) {
  						//show the postername
  						echo '<center><div class="post"><p class="poster">' .$_SESSION['user'] .'</p>';
  						//show the image
  						echo '<img src="' .$pvalue["file_location"] .'" ></div></center>';
  						//add comments here
  						//add tags here?
  					}
  				}

    	   else{
           echo "<center><p>You dont have any posts yet! Create a new post to get started!</p><center>";
         }

	?>

</body>

</html>
