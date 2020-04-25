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
    Title: <input type="text" id="title" name="title"> <br />
    Text: <input type="text" id="tweet" name="tweet"> <br />
    <label for="img">Select image:</label>
    <input type="file" id="img" name="img" accept="image/*"> <br/>

    <Input type="submit" value="Post">
</form>

</div>
</body>
</html>

</html>
