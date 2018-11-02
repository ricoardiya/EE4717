<?php
  include '../dbconn.php';

  $id = $_POST['product_id'];
  $link = $_POST['redirect_link'];
  $price = $_POST['price'];

  $update_query = "UPDATE products SET price = $price WHERE id = $id";
  $update_result = mysqli_query($conn, $update_query);

  header('Location: ' . $link);
?>
