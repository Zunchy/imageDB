<html>
<head>
  <style>
  <?php include 'style.css';
  session_start();

  ?>
  </style>
</head>

<body>
    <center>
<?php
include "Database/helpers.php";

  if(!isset($_SESSION["loggedin"]) || ($_SESSION["loggedin"] !== true))
  {


  }

  if(isset($_GET["currentTag"]))
  {

      $currentTag = $_GET["currentTag"];
      echo "<h1 class='headerText'>", $currentTag, " Posts", "</h1>";
      $posts = tag_posts($currentTag);
      if($posts != null)
      {
        foreach($posts as $post)
        {
            echo "<div class=\"post\">", "<img src=\"", $post["file_location"], "\" height =\"50\" width=\"50\"></img>", "<p class='subText'>", $post['postID'], " | ",
             $post['dateTime'], "</p>", "</div>";
        }

      }
  }
  else
  {
    echo "<h1 class='headerText'> Tags </h1>";
      $taglist = tag_list();
    //"tag_name" "description" "post_count"
      foreach($taglist as $tag)
      {
        echo "<div class=\"tag\">", "<a id=\"clickHere\" href=\"?currentTag=", $tag["tag_name"], "\">", $tag["tag_name"], " | Posts: ", $tag["post_count"], "</a>",
          "<p class='subText'>", $tag["description"], "</p></div>";

      }
  }




?>

</center>



</body>
</html>
