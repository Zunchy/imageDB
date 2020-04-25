<html>

<head>

  <style>
    <?php include 'style.css'; ?>
  </style>

</head>

<body>

<center><h1 class="headerText">Make a post</h1> <br />
<div class="newContainer">
<form action="postVerify.php" method=post >
    Tag: <input type="text" id="tag" name="tag"> <br />
    <label for="img">Select image:</label>
    <input type="file" id="img" name="img" accept="image/*"> <br/>

    <Input type="submit" value="Post">
</form>

</div>
</body>
</html>

</html>
