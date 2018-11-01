<!DOCTYPE html>
<html>
<body>
  <?php
    include '../head.php';
    include '../path.php';
    include '../dbconn.php';
  ?>
  <link rel="stylesheet" type="text/css" href="login.css">
  <body>
    <!-- Include navbar -->
    <?php
      $path = $_SERVER['DOCUMENT_ROOT'];
      $path .= $root_path . "/common/nav.php";
      include $path;
    ?>
    <div class="content-wrapper">
      <div class="signin-wrapper">
        <?php
          if(isset($_SESSION['login-error'])) {
            echo $_SESSION['login-error'];
          }
        ?>
        <div>
          <form action="submit-login.php" class="contact-form" method="POST">
            <label for="email">Email </label><br>
            <input type="email" required id="email" name="email">
            <br><br>
            <label for="email">Password </label><br>
            <input type="password" required id="password" name="password">
            <br><br>
            <input type="submit" value="LOG IN" class="btn-signin">
          </form>
        </div>
        <div class="already-member">
          <span class="login-text">Not yet a member?</span> &nbsp; <a class="login-link" href=<?php echo $root_path . '/signup' ?>>SIGN UP</a>
        </div>
      </div>
    </div>
    <?php
      if(isset($_SESSION['login-error'])) {
        unset($_SESSION['login-error']);
      }
    ?>
    <?php include  '../common/footer.php'?>
  </body>
</html>
