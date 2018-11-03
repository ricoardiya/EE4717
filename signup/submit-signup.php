<?php
  session_start();

  include '../dbconn.php';

  $salutation = $_POST['salutation'];
  $firstname = trim($_POST['firstname']);
  $lastname = trim($_POST['lastname']);
  $name = $firstname . ' ' . $lastname;
  $phone = trim($_POST['phone']);
  $address = trim($_POST['address']);
  $email = trim($_POST['email']);
  $password = sha1($_POST['password']);

  // Check if member already exists
  $member_query = "SELECT * FROM members WHERE email = \"$email\"";
  $member_result = mysqli_query($conn, $member_query);

  if (mysqli_num_rows($member_result)) {
    $_SESSION['signup-error'] = '
      <div style="color:red;">
        Account already exists<br><br><br>
      </div>
      ';
    header('Location: /ee4717/signup/');
  } else {
    $customer_insert_query = "INSERT INTO customers(salutation,name,address,email,phone) VALUES (\"$salutation\",\"$name\",\"$address\",\"$email\",\"$phone\")";
    if (mysqli_query($conn, $customer_insert_query)) {
      $customer_id = mysqli_insert_id($conn);
      $member_insert_query = "INSERT INTO members(customerID, email, password) VALUES ($customer_id,\"$email\",\"$password\")";
      if (mysqli_query($conn, $member_insert_query)) {
        // set session variables
        $_SESSION['salutation'] = $_POST['salutation'];
        $_SESSION['firstname'] = $_POST['firstname'];
        $_SESSION['lastname'] = $_POST['lastname'];
        $_SESSION['email'] = $_POST['email'];
        $_SESSION['address'] = $_POST['address'];
        $_SESSION['phone'] = $_POST['phone'];
        header('Location: ' . $_SESSION['history'] . '');
      } else {
        header('Location: /ee4717/signup/');
      }
    }
  }


?>
