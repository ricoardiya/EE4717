<!DOCTYPE html>
<html>
  <?php
    include '../head.php';
    include '../path.php';
  ?>
  <link rel="stylesheet" type="text/css" href="admin.css">
  <body>
    <section>
      <header class="header-center">
        <div class="index-topnav-centered">
          <a href=<?php echo $root_path ?> class="index-logo">SE PA TU</a>
        </div>
        <?php
          session_start();

          $actual_link = "http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
          if ($actual_link != "http://localhost" . $root_path .  "/admin/admin-login.php") {
            $_SESSION['admin-history'] = $actual_link;
          }

          if (!isset($_SESSION['admin'])) {
            header('Location: ' . $root_path . '/admin/admin-login.php');
          }

        ?>
      </header>
    </section>
    <div class="content-wrapper">
      <div class="index-content">

      </div>
      <section>
        <div class="index-footer-wrapper">
          <div class="index-footer">
            <div class="index-footer-left">
              &copy; Sepatu Project 2018
            </div>
          </div>
        </div>
      </section>
    </div>
  </body>
</html>
