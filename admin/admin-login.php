<!DOCTYPE html>
<html>
<body>
  <?php
    include '../head.php';
    include '../path.php';
    include '../dbconn.php';
  ?>
  <link rel="stylesheet" type="text/css" href="admin.css">
  <body>
    <!-- Include navbar -->
    <section>
      <header class="header-center">
        <div class="index-topnav-centered">
          <a href=<?php echo $root_path ?> class="index-logo">SE PA TU</a>
        </div>
        <?php
          session_start();

          $actual_link = "http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
          if ($actual_link != "http://localhost" . $root_path .  "/admin/admin-signin.php") {
            $_SESSION['admin-history'] = $actual_link;
          }
        ?>
      </header>
    </section>
    <div class="content-wrapper">
      <div class="admin-signin-wrapper">
        <?php
          if(isset($_SESSION['admin-login-error'])) {
            echo $_SESSION['admin-login-error'];
          }
        ?>
        <div>
          <form action="admin-submit-login.php" class="contact-form" method="POST">
            <label for="email">Username </label><br>
            <input type="text" required id="username" name="username">
            <br><br>
            <label for="email">Password </label><br>
            <input type="password" required id="password" name="password">
            <br><br>
            <input type="submit" value="LOG IN" class="btn-signin">
          </form>
        </div>
      </div>
    </div>
    <?php
      if(isset($_SESSION['admin-login-error'])) {
        unset($_SESSION['admin-login-error']);
      }
    ?>
    <?php include  '../common/footer.php'?>
  </body>
</html>
