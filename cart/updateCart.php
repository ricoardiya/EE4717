<?php
  session_start();
  if (!isset($_SESSION['cart'])){
    $_SESSION['cart'] = array();
  }

  $shoes = array();
  class buy_item{
    public $productID;
    public $quantity;
    public $size;
  }
  $id=$_POST['productID'];
  $q_string = "quantity-".$id;
  $s_string = "size-".$id;

  $quantity = $_POST[$q_string];
  $size = $_POST[$s_string];

  if($_SESSION['cart'][$id]->size != $size){
    $_SESSION['cart'][$id]->size = $size;
  }
  if($_SESSION['cart'][$id]->quantity != $quantity){
    $_SESSION['cart'][$id]->quantity = $quantity;
  }
  header('location: ../cart/index.php');
  exit();
?>
