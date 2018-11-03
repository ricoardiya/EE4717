<?php
  include '../dbconn.php';

  $id = $_POST['inventory_id'];
  $link = $_POST['redirect_link'];
  $stock = $_POST['stock'];

  $update_query = "UPDATE inventory SET stock = $stock WHERE id = $id";
  $update_result = mysqli_query($conn, $update_query);

  header('Location: ' . $link);
?>
