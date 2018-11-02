<?php
  session_start();
  include '../dbconn.php';
  if(!isset($_SESSION['cart'])){
    $_SESSION['cart']= array();
  }
  // if(empty($_SESSION['cart']) && $_SESSION['history'] != 'http://localhost/ee4717/checkout/submitOrder.php' ){
  //   header('Location: /ee4717/cart/index.php');
  // }
  if(!isset($_SESSION['transactionID'])){
    $_SESSION['transactionID'] = 52;
  }
  $_SESSION['transactionID'] = 52;
  $transaction_id = $_SESSION['transactionID'];
  echo '<hr>';
  echo $transaction_id;
  echo '<hr>';
  $query = "SELECT orders.productID, orders.quantity, orders.size, orders.dateOrder, transactions.firstname AS fname_shipping, transactions.lastname AS lname_shipping, transactions.address AS address_shipping, transactions.zipCode AS zipCode_shipping, transactions.phone AS phone_shipping, transactions.totalPrice, customers.salutation, customers.name, customers.address AS address_contact, customers.email AS email_contact, customers.phone AS phone_contact FROM transactions JOIN orders ON orders.transactionID=transactions.id JOIN customers ON transactions.customerID = customers.id WHERE transactions.id=".$transaction_id."";
  echo '<hr>';
  echo $query;
  echo '<hr>';
  $result = mysqli_query($conn, $query);

  if(mysqli_num_rows($result)> 0){
    while($row= mysqli_fetch_assoc($result)){
    $dateOrder = $row["dateOrder"];
    echo '<hr>';
    echo $dateOrder;
    echo '<hr>';
    $fname_shipping = $row["fname_shipping"];
    echo '<hr>';
    echo $fname_shipping;
    echo '<hr>';
    $lname_shipping = $row["lname_shipping"];
    echo '<hr>';
    echo $lname_shipping;
    echo '<hr>';
    $address_shipping = $row["address_shipping"];
    echo '<hr>';
    echo $address_shipping;
    echo '<hr>';
    $zipCode_shipping = $row["zipCode_shipping"];
    echo '<hr>';
    echo $zipCode_shipping;
    echo '<hr>';
    $phone_shipping = $row["phone_shipping"];
    echo '<hr>';
    echo $phone_shipping;
    echo '<hr>';
    $totalPrice = $row["totalPrice"];
    echo '<hr>';
    echo $totalPrice;
    echo '<hr>';
    $salutation = $row["salutation"];
    echo '<hr>';
    echo $salutation;
    echo '<hr>';
    $name = $row["name"];
    echo '<hr>';
    echo $name;
    echo '<hr>';
    $address_contact = $row["address_contact"];
    echo '<hr>';
    echo $address_contact;
    echo '<hr>';
    $email_contact = $row["email_contact"];
    echo '<hr>';
    echo $email_contact;
    echo '<hr>';
    $phone_contact = $row["phone_contact"];
    echo '<hr>';
    echo $phone_contact;
    echo '<hr>';
  } }

?>
