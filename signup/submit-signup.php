<?php
  session_start();
  var_dump($_POST);
  $_SESSION['name'] = $_POST['firstname'];

  header('Location: ' . $_SESSION['history'] . '');
?>
