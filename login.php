<html>

<head>
  <style>
  <?php include 'style.css'; ?>
  </style>
  <script type="text/javascript">
    function validateUser() {
        var user=document.getElementById("user").value;
        var pass=document.getElementById("pass").value;

       if (user.length == 0) {
     alert("A username must be provided");
               return false
       }
       if (pass.length < 8) {
       alert("A Password must be provided");
              return false
       }
    }
  </script>
</head>

<body>

<center><h1 class="headerText">Login to your account</h1> <br />

<div class="formContainer">
<form class="infoForm" action="verifyLogin.php" onsubmit="return validateUser()" method=post>
    <input type="text" id="user" name="user" size="20" placeholder="Username"><br />
    <input type="password" id="pass" name="pass" size="20" placeholder="Password"><br />
    <Input type="submit" value="Submit">
</form>
</div>

<p><?php
  if(isset($_GET['errorMessage']))
    echo($_GET['errorMessage']);
   ?></p>

<a href="signup.php">Don't have an account? Signup Today!</a>
<center/>

</body>
</html>
