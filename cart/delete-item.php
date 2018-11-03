<?php
  Session_start();
  class buy_item{
    public $productID;
    public $quantity;
    public $size;
  }
  echo '<br><hr>';
  var_dump($_SESSION['cart']);
  echo '<br><hr>';
  $delete= $_GET['delete'];

  echo 'Before <br><hr>';
  var_dump($_SESSION['cart']);
  echo 'After <br><hr>';
  array_splice($_SESSION['cart'],$delete,1);
  var_dump($_SESSION['cart']);
  echo '<br><hr>';
  header('Location: ' . $_SESSION['history'] . '');
?>
