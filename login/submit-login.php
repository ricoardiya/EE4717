<?php
  session_start();

  include '../dbconn.php';

  $email = $_POST['email'];
  $password = hash('sha512',$_POST['password']);

  $member_check_query = "SELECT * FROM members WHERE email = $email AND password = $password";
  $member_check_result = mysqli_query($conn, $member_check_query)
  if (mysqli_num_rows($member_check_result) > 0) {
    $member_row = mysqli_fetch_assoc($member_check_result);
    $customer_query = "SELECT * FROM customers WHERE id = $member_row['customerID']";
    $customer_result = mysqli_query($conn, $customer_query);
    if (mysqli_num_rows($customer_result) > 0) {
      $customer_row = mysqli_fetch_assoc($customer_result);

      // Set session variables
      $_SESSION['firstname'] = $customer_row['firstname'];
      $_SESSION['lastname'] = $customer_row['lastname'];
      $_SESSION['email'] = $customer_row['email'];

      header('Location: ' . $_SESSION['history'] . '');
    }
  } else {
    echo 'error';
    header('Location: /ee4717/login/');
  }
?>
