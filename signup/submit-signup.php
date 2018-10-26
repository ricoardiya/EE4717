<?php
  session_start();
  var_dump($_POST);

  include '../dbconn.php';

  $salutation = $_POST['salutation'];
  $firstname = $_POST['firstname'];
  $lastname = $_POST['lastname'];
  $phone = $_POST['phone'];
  $address = $_POST['address'];
  $email = $_POST['email'];
  $password = hash('sha512',$_POST['password']);

  // Check if member already exists
  $member_query = "SELECT email FROM members WHERE email = $email";
  $member_result = mysqli_query($conn, $pictures_query);

  if (mysqli_num_rows($member_result) > 0) {
    echo 'error';
  } else {
    $customer_insert_query = "INSERT INTO customers(salutation,firstname,lastname,address,email,phone) VALUES ($salutation,$firstname,$lastname,$address,$email,$phone)";
    if (mysqli_query($conn, $customer_insert_query)) {
      $customer_id = mysqli_insert_id($conn);
      $member_insert_query = "INSERT INTO memebers(customerID, email, password) VALUES ($customer_id,$email,$password)";
      if (mysqli_query($conn, $member_insert_query)) {
        // set session variables
        $_SESSION['firstname'] = $_POST['firstname'];
        $_SESSION['lastname'] = $_POST['lastname'];
        $_SESSION['email'] = $_POST['email'];
        header('Location: ' . $_SESSION['history'] . '');
      } else {
        header('Location: /ee4717/signup/');
      }
    }
  }


?>
