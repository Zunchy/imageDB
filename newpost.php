<html>

<head>

  <style>
    <?php include 'style.css'; ?>
  </style>

</head>

<body>

<center><h1 class="headerText">Make a post</h1> <br />

<form action="postVerify.php" method=post enctype="multipart/form-data">

    <div class="tagPost">Tag: <input type="text" id="tag" name="tag"> <br /><br /></div>

    <label for="img">Select image:</label>
    <input type="file" id="img" name="img"> <br /><br />

    <Input type="submit" value="Post">

</form>

</body>
</html>

</html>
