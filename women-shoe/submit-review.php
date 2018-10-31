<?php
  session_start();
  include '../dbconn.php';

  var_dump($_POST);
  $transactionid = $_POST['transactionid'];
  $review = $_POST['review'];

  $review_query = 'INSERT INTO reviews(transactionID,reviews) VALUES ("'.$transactionid.'","'.$review.'")';
  $review_result = mysqli_query($conn, $review_query);

  if ($review_result) {
    header('Location: ' . $_SESSION['history'] . '');
  }
?>
