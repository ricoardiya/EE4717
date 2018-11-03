<?php
  session_start();

  include '../dbconn.php';

  $email = $_POST['email'];
  $password = sha1($_POST['password']);

  $member_check_query = "SELECT * FROM members WHERE email = \"$email\" AND password = \"$password\"";
  echo $member_check_query;
  $member_check_result = mysqli_query($conn, $member_check_query);
  if (mysqli_num_rows($member_check_result) > 0) {
    $member_row = mysqli_fetch_assoc($member_check_result);
    $customer_query = "SELECT * FROM customers WHERE id = " . $member_row['customerID'] . "";
    $customer_result = mysqli_query($conn, $customer_query);
    if (mysqli_num_rows($customer_result) > 0) {
      $customer_row = mysqli_fetch_assoc($customer_result);

      // Set session variables
      $name = explode(" ", $customer_row['name']);
      $_SESSION['salutation'] = $customer_row['salutation'];
      $_SESSION['firstname'] = $name[0];
      $_SESSION['lastname'] = $name[1];
      $_SESSION['email'] = $customer_row['email'];
      $_SESSION['address'] = $customer_row['address'];
      $_SESSION['phone'] = $customer_row['phone'];

      header('Location: ' . $_SESSION['history'] . '');
    }
  } else {
    $_SESSION['login-error'] = '
      <div style="color:red;">
        Invalid email or password <br><br><br>
      </div>
    ';
    header('Location: /ee4717/login/');
  }
?>
