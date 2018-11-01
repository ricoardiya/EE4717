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
  $total=$_POST['total'];
  for($i = 0 ; $i<$total; $i++){
    $q_string = "quantity-".$i;
    $s_string = "size-".$i;

    $quantity = $_POST[$q_string];
    $size = $_POST[$s_string];

    if($_SESSION['cart'][$i]->size != $size){
      $_SESSION['cart'][$i]->size = $size;
    }

    if($_SESSION['cart'][$i]->quantity != $quantity){
      $_SESSION['cart'][$i]->quantity = $quantity;
    }

  }
  header('location: ' . $_SESSION['history']);
  exit();
?>
