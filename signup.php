<html>

<head>
  <style>
    <?php include 'style.css'; ?>
  </style>
  <script type="text/javascript">
    function validateUser() {
        var user=document.getElementById("user").value;
        var pass=document.getElementById("pass").value;
        var confirmPass=document.getElementById("confirmPass").value;

       if (user.length == 0) {
     alert("A username must be provided");
               return false
       }
       if (pass.length < 8) {
       alert("Password must be at least 8 characters");
              return false
       }
       if (pass != confirmPass) {
       alert("Passwords do not match");
              return false
      }

    }
</script>
</head>

<body>

<center><h1 class="headerText">Create a new Account</h1> <br />
<div class="newContainer">
<form class="infoForm" action="verifySignup.php" onsubmit="return validateUser()" method=post>
    Username: <input type="text" id="user" name="user" size="20"><br />
    Password: <input type="password" id="pass" name="pass" size="20"><br />
    Reenter Password: <input type="password" id="confirmPass" size="20"> <br />
    <Input type="submit" value="Submit">
</form>

<p><?php
  if(isset($_GET['errorMessage']))
    echo($_GET['errorMessage']);
?></p>

</div>
</body>
</html>
