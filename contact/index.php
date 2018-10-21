<!DOCTYPE html>
<html>
    <?php
      include '../head.php';
      $contact_css = "/ee4717/contact/contact.css";
      $contact_js = "/ee4717/contact/contact.js";
      echo '<link rel="stylesheet" type="text/css" media="screen" href=' . $contact_css . '  />';
      echo '<script type="text/javascript" src="'. $contact_js .'"></script>';
    ?>
  </head>
<body>
  <?php
    $path = $_SERVER['DOCUMENT_ROOT'];
    $path .= "/ee4717/common/nav.php";
    include $path;
  ?>
  <div class="content-wrapper">
    <div class="content">
      <h1 align="center">Contact Page</h1>
      <br>
      <div class="row">
        <div class="left-col">
          Phone: +65-8490 6300
          <br>
          Email: contact@sepatu.com
          <br>
          Office: 3 Gateway Dr, Singapore 608532
          <br>
          Working Hour: 07:30-18:00
          <br>
        </div>
        <div class="right-col">
          <form action="/ee4717/contact/submit_contact_form.php" class="contact-form">
            <label for="fname">First Name: </label><br>
            <input type="text" required id="fname" name="firstname" placeholder="First Name">
            <br><br>
            <label for="lname">Last Name: </label><br>
            <input type="text" required id="lname" name="lastname" placeholder="Last Name">
            <br><br>
            <label for="email">Email: </label><br>
            <input type="email" required id="email" name="email" placeholder="Email">
            <br><br>
            <label for="message">Message: </label><br>
            <textarea rows="4" required id="message" cols="30" name="message" placeholder="Insert your message here ..."></textarea>
            <br><br>
            <input type="submit" value="Send">
          </form>
          <?php
            $contact_js_handler = "/ee4717/contact/contact-handler.js";
            echo '<script type="text/javascript" src="'.$contact_js_handler.'"></script>';
          ?>
        </div>
      </div>
      <br>
      <br>
      <div class="store">
        <h1 >Our Store</h1>
        <img src="../assets/pictures/contact/westgate.PNG" alt="Westgate" width="60%" height="60%">
      </div>
    </div>
  </div>
  <?php include  '../common/footer.php'?>
</body>
</html>
