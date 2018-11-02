<?php
  session_start();

  include '../path.php';
  include '../dbconn.php';

  $username = $_POST['username'];
  $password = sha1($_POST['password']);

  $admin_check_query = "SELECT * FROM admin WHERE username = \"$username\" AND password = \"$password\"";
  $admin_check_result = mysqli_query($conn, $admin_check_query);
  if (mysqli_num_rows($admin_check_result) > 0) {
    // Set session variables
    $_SESSION['admin'] = TRUE;

    header('Location: ' . $root_path . '/admin');
  } else {
    $_SESSION['admin-login-error'] = '
      <div style="color:red;">
        Invalid username or password <br><br><br>
      </div>
    ';
    header('Location: ' . $root_path . '/admin/admin-login.php');
  }
?>
