<!DOCTYPE html>
<html>
<body>
  <?php
    include '../head.php';
    include '../path.php';
    include '../dbconn.php';
  ?>
  <link rel="stylesheet" type="text/css" href="signup.css">
  <script type="text/javascript" src="signup.js"></script>
  <body>
    <!-- Include navbar -->
    <?php
      $path = $_SERVER['DOCUMENT_ROOT'];
      $path .= $root_path . "/common/nav.php";
      include $path;
    ?>
    <div class="content-wrapper">
      <div class="signup-wrapper">
        <div class="signup-header">
          Become a member
        </div>
        <?php
          if(isset($_SESSION['signup-error'])) {
            echo $_SESSION['signup-error'];
          }
        ?>
        <div>
          <form action="submit-signup.php" method="POST" class="contact-form" onsubmit="return checkError()">
            <label for="salutation">*Salutation</label><br>
            <input class="salution-radio" type="radio" name="salutation" value="mr">Mr.
            <input class="salution-radio" type="radio" name="salutation" value="ms">Ms.
            <input class="salution-radio" type="radio" name="salutation" value="mrs">Mrs.
            <br><br>
            <label for="fname">*First Name</label><br>
            <input type="text" required id="fname" name="firstname" placeholder="John">
            <br>
            <span id='firstname-message'></span>
            <br><br>
            <label for="lname">Last Name</label><br>
            <input type="text" id="lname" name="lastname" placeholder="Doe">
            <br>
            <span id='lastname-message'></span>
            <br><br>
            <label for="phone">*Phone</label><br>
            <input type="text" required id="phone" name="phone" placeholder="8657 9230">
            <br>
            <span id='phone-message'></span>
            <br><br>
            <label for="address">*Address</label><br>
            <input type="text" required id="address" name="address" placeholder="Singapore">
            <br>
            <span id='address-message'></span>
            <br><br>
            <label for="email">*Email</label><br>
            <input type="email" required id="email" name="email" placeholder="John@doe.com">
            <br>
            <span id='email-message'></span>
            <br><br>
            <label for="password">Password</label><br>
            <input type="password" required id="password" name="password">
            <br><br>
            <label for="password">Confirm Password</label><br>
            <input type="password" required id="repassword" name="repassword" onkeyup='checkRepassword();'>
            <br>
            <span id='repassword-message'></span>
            <br><br>
            <input type="submit" value="SIGN UP" class="btn-signup">
          </form>
        </div>
        <div class="already-member">
          <span class="login-text">Already a member?</span> &nbsp; <a class="login-link" href=<?php echo $root_path . '/login' ?>>LOG IN</a>
        </div>
        <script type="text/javascript" src="signup-handler.js"></script>
      </div>
    </div>
    <?php
      if(isset($_SESSION['signup-error'])){
        unset ($_SESSION["signup-error"]);
      }
    ?>
    <?php include  '../common/footer.php'?>
  </body>
</html>
