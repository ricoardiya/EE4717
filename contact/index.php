<!DOCTYPE html>
<html>
    <?php
      include '../head.php';
      $contact_css = "/ee4717/contact/contact.css";
      $contact_js = "/ee4717/contact/contact.js";
      echo '<link rel="stylesheet" type="text/css" media="screen" href=' . $contact_css . '  />';
      echo '<script type="text/javascript" src="'. $contact_js .'"></script>';
    ?>
<body>
  <?php
    $path = $_SERVER['DOCUMENT_ROOT'];
    $path .= "/ee4717/common/nav.php";
    include $path;
  ?>
  <div class="content-wrapper">
    <div class="contact-wrapper">
      <div class="contact-header">
        Contact Us
      </div>
      <div class="row contact-content">
        <div class="col left">
          Phone: +65-8490 6300
          <br>
          Email: contact@sepatu.com
          <br>
          Office: 3 Gateway Dr, Singapore 608532
          <br>
          Working Hour: 07:30-18:00
          <br>
        </div>
        <div class="col right">
          <form action="/ee4717/contact/submit_contact_form.php" class="contact-form">
            <label for="fname">*First Name: </label><br>
            <?php
              if (isset($_SESSION['firstname'])) {
                echo '
                <input type="text" required id="fname" name="firstname" value=" ' . $_SESSION['firstname'] . ' ">
                <br>
                <span id="firstname-message"></span>
                <br><br>
                <label for="lname">Last Name: </label><br>
                <input type="text" id="lname" name="lastname" value=" ' . $_SESSION['lastname'] . ' ">
                <br>
                <span id="lastname-message"></span>
                <br><br>
                <label for="email">*Email: </label><br>
                <input type="email" required id="email" name="email" value=" ' . $_SESSION['email'] . '">
                <br>
                <span id="address-message"></span>
                <br><br>
                ';
              } else {
                echo '
                <input type="text" required id="fname" name="firstname" placeholder="John">
                <br>
                <span id="firstname-message"></span>
                <br><br>
                <label for="lname">Last Name: </label><br>
                <input type="text" id="lname" name="lastname" placeholder="Doe">
                <br>
                <span id="lastname-message"></span>
                <br><br>
                <label for="email">*Email: </label><br>
                <input type="email" required id="email" name="email" placeholder="John@doe.com">
                <br>
                <span id="email-message"></span>
                <br><br>
                ';
              }
            ?>
            <label for="message">*Message: </label><br>
            <textarea rows="4" required id="message" cols="30" name="message" placeholder="Insert your message here ..."></textarea>
            <br><br>
            <input type="submit" value="Send" class="btn-contact">
          </form>
          <?php
            $contact_js_handler = "/ee4717/contact/contact-handler.js";
            echo '<script type="text/javascript" src="'.$contact_js_handler.'"></script>';
          ?>
        </div>
      </div>
      <div class="contact-header">
        Our Store
      </div>
      <div class="contact-header">
        <img src="../assets/pictures/contact/westgate.PNG" alt="Westgate" width="60%" height="60%">
      </div>
    </div>
  </div>
  <?php include  '../common/footer.php'?>
</body>
</html>
