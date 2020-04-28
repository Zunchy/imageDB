<html>

<head>
  <style>
  <?php include 'style.css'; ?>
  </style>

  <script type="text/javascript">
    function validateDelete() {
      var confirm=document.getElementById("confirm").value;

       if (confirm !== "Confirm") {
         alert("Text does not match what is requested");
         return false;
       }

       return true;

    }
</script>

</head>

<body>

<center><h1 class="headerText">Delete your account</h1> <br />

<div class="formContainer">
<center><h1 class="headerText">Please confirm you wish to delete your account by typing "Confirm" and entering your username</h1> <br />
<form class="infoForm" action="deleteAccount.php" onsubmit="return validateDelete()" method=post>
    <input type="text" id="confirm" name="confirm" size="20" placeholder="Confirm"><br />
    <input type="text" id="user" name="user" size="20" placeholder="UserName"><br />
    <Input type="submit" value="Submit">
</form>
</div>
<center/>

</body>
</html>
