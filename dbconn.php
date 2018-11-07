<?php
  $servername = "localhost";
  $username = "f37ee";
  $password = "f37ee";
  $dbname = "f37ee";
  // Create connection
  $conn = mysqli_connect($servername, $username, $password, $dbname);
  // Check connection
  if (!$conn) {
      die("Connection failed: " . mysqli_connect_error());
  }
?>
