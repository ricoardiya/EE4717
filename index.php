<!DOCTYPE html>
<html>
  <?php
    include './head.php';
    include './path.php';
    ?>
  </head>
  <body>
    <section>
      <header class="header-center">
        <div class="index-topnav-centered">
          <a href=<?php echo $root_path ?> class="index-logo">SE PA TU</a>
        </div>
        <?php
          session_start();

          $actual_link = "http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
          if ($actual_link != "http://localhost" . $root_path .  "/login") {
            $_SESSION['history'] = $actual_link;
          }

          if(isset($_SESSION['firstname'])) {
            echo '
            <div class="index-topnav-right">
              Hi, ' . $_SESSION['firstname'] . ' !
              <a class="login" href="' . $root_path . '/common/signout.php">SIGN OUT</a>
            </div>
            ';
          } else {
            echo '
            <div class="index-topnav-right">
              <a href="' . $root_path .  '/signup">Become a member</a>
              <a class="login" href="' . $root_path . '/login">LOG IN</a>
            </div>
            ';
          }
        ?>
      </header>
    </section>
    <div class="index-content-wrapper">
      <div class="index-content">
        <div class="landing-row">
          <a href=<?php echo $root_path . '/men-catalog' ?>>
            <div class="column">
              <img src=<?php echo $root_path . '/assets/pictures/men/men.png' ?> alt="men" height="460" width="460">
              <p id="tag">MEN</p>
            </div>
          </a>
          <a href=<?php echo $root_path . '/women-catalog' ?>>
            <div class="column">
              <img src=<?php echo $root_path . '/assets/pictures/women/women.png' ?> alt="women" height="460" width="460">
              <p id="tag">WOMEN</p>
            </div>
          </a>
        </div>
      </div>
      <section>
        <div class="index-footer-wrapper">
          <div class="index-footer">
            <div class="index-footer-left">
              &copy; Sepatu Project 2018
            </div>
            <div class="index-footer-right">
              <a href="./contact">Contact Us</a> &nbsp;&nbsp;&nbsp;
              <a href="">Facebook</a> &nbsp;&nbsp;&nbsp;
              <a href="">Instagram</a>
            </div>
          </div>
        </div>
      </section>
    </div>
  </body>
</html>
