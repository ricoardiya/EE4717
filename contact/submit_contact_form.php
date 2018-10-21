<?php
  echo 'contact us';

  $firstname = trim($_GET["firstname"]);
  $lastname = trim($_GET["lastname"]);
  $email = trim($_GET["email"]);
  $message = trim($_GET["message"]);

  $servername = "localhost";
  $username = "root";
  $password = "";
  $dbname = "sepatu";
  // Create connection
  $conn = mysqli_connect($servername, $username, $password, $dbname);
  // Check connection
  if (!$conn) {
      die("Connection failed: " . mysqli_connect_error());
  }

  $query = 'INSERT INTO `contact`(`id`, `firstname`, `lastname`, `email`, `message`) VALUES (NULL,"'.$firstname.'","'.$lastname.'","'.$email.'","'.$message.'")';

  if (mysqli_query($conn, $query)) {
    $message = "Message has been sent!";
    echo "<script type='text/javascript'>alert('$message');
    window.location.href='/ee4717/contact/index.php';
      </script>";
  } else {
      echo "Error: " . $query . "<br>" . mysqli_error($conn);
  }

?>
