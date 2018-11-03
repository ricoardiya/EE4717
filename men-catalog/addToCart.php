<?php
  session_start();

  $shoes = array();
  class buy_item{
    public $productID;
    public $quantity;
    public $size;
  }

  if (!isset($_SESSION['cart'])){
    $_SESSION['cart'] = array();
  }

  if (isset($_POST['productID']) && isset($_POST['selected_size']) && isset($_POST['selected_quantity'])) {
    if(empty($_SESSION['cart'])){
      $item = new buy_item();
      $item->productID = $_POST['productID'];
      $item->size = $_POST['selected_size'];
      $item->quantity = $_POST['selected_quantity'];
      array_push($_SESSION['cart'], $item);
      header('location: ' . $_SESSION['history']);
      exit();
    }
    else{
      for($i=0; $i<count($_SESSION['cart']) ; $i++){
        if($_SESSION['cart'][$i]->productID == $_POST['productID'] &&  $_SESSION['cart'][$i]->size == $_POST['selected_size'] ){
          $_SESSION['cart'][$i]->quantity = (string)((int)$_SESSION['cart'][$i]->quantity + (int)$_POST['selected_quantity']);
          header('location: ' . $_SESSION['history']);
          exit();
        }
      }
    }
    $item = new buy_item();
    $item->productID = $_POST['productID'];
    $item->size = $_POST['selected_size'];
    $item->quantity = $_POST['selected_quantity'];
    array_push($_SESSION['cart'], $item);
    header('location: ' . $_SESSION['history']);
    exit();
  }
?>

