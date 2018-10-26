<?php
  session_start();
  var_dump($_POST);
  $_SESSION['name'] = $_POST['firstname'];

  if ($_POST['salutation'] == 'mr') {
    header('Location: /ee4717/men-catalog/');
  } else {
    header('Location: /ee4717/women-catalog/');
  }
?>
