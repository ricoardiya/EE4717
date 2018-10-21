<!DOCTYPE html>
<html>
  <?php include './head.php' ?>
  </head>
  <body>
    <section>
      <header class="header-center">
        <ul>
          <?php
            $home_path = "/ee4717";
            echo '<li><a class="index-logo" href=' . $home_path. '>SE PA TU</a></li>';
          ?>
        </ul>
      </header>
    </section>
    <div class="index-content-wrapper">
      <div class="index-content">
        <div class="row">
          <a href="/ee4717/men-catalog/">
            <div class="column">
              <img src="/ee4717/assets/pictures/men/men.png" alt="men" height="460" width="460">
              <p id="tag">MEN</p>
            </div>
          </a>
          <a href="/ee4717/women-catalog/">
            <div class="column">
              <img src="/ee4717/assets/pictures/women/women.png" alt="women" height="460" width="460">
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
              <a href="./cart">Your Cart</a> &nbsp;&nbsp;&nbsp;
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
