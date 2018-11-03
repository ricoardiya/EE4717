<?php
  session_start();

  $actual_link = "http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
  if ($actual_link != 'http://localhost/ee4717/login/' && $actual_link != 'http://localhost/ee4717/signup/') {
    $_SESSION['history'] = $actual_link;
  }
  class buy_item {
    public $productID;
    public $size;
    public $quantity;
  }
  if(!isset($_SESSION['cart'])){
    $_SESSION['cart']= array();
  }
  if(empty($_SESSION['cart'])){
    header('Location: /ee4717/cart/index.php');
  }
  include('../dbconn.php');

  $salutation = $_POST["salutation"];
  $firstname_contact = $_POST["firstname_contact"];
  $lastname_contact = $_POST["lastname_contact"];
  $name_contact =$firstname_contact . ' '. $lastname_contact;
  $email_contact = $_POST["email_contact"];
  $address_contact = $_POST["address_contact"];
  $phone_contact = $_POST["phone_contact"];

  $firstname_shipping = $_POST["firstname_shipping"];
  $lastname_shipping = $_POST["lastname_shipping"];
  $address_shipping = $_POST["address_shipping"];
  $zipCode_shipping = $_POST["zipCode_shipping"];
  $phone_shipping = $_POST["phone_shipping"];
  $totalPrice = $_POST["total"];

  $check_member = 'SELECT * FROM `customers` WHERE email="'.$email_contact.'"';
  $result = mysqli_query($conn, $check_member);
  if(mysqli_num_rows($result) > 0 ){
    $row = mysqli_fetch_assoc($result);
    $customer_id = $row['id'];
  }else{
    $query_contact = 'INSERT INTO `customers`(`id`, `salutation`, `name`, `address`, `email`, `phone`) VALUES (NULL,"'.$salutation.'","'.$name_contact.'","'.$address_contact.'","'.$email_contact.'",'.$phone_contact.')';
    $result =  mysqli_query($conn, $query_contact);
    if (($result)) {
      $customer_id = mysqli_insert_id($conn);
    }else{
      echo "Error: " . $query . "<br>" . mysqli_error($conn);
      $message = "Error in Inserting Contact Detail!";
      echo "<script type='text/javascript'>alert('$message');
      window.location.href='/ee4717/men-catalog/index.php';
      </script>";
    }
  }

  $query_shipping = 'INSERT INTO `transactions`(`id`, `customerID`, `firstname`, `lastname`, `address`, `zipCode`, `phone`, `totalPrice`) VALUES (NULL,'.$customer_id.',"'.$firstname_shipping.'","'.$lastname_shipping.'","'.$address_shipping.'",'.$zipCode_shipping.','.$phone_shipping.','.$totalPrice.')';
  if (mysqli_query($conn, $query_shipping)) {
    $transaction_id = mysqli_insert_id($conn);
    $_SESSION['transactionID']= $transaction_id;
  }else{
    echo "Error: " . $query . "<br>" . mysqli_error($conn);
    $message = "Error in Inserting Shipping Detail!";
    echo "<script type='text/javascript'>alert('$message');
    window.location.href='/ee4717/men-catalog/index.php';
    </script>";
  }

  $dateOfOrder = date("Y-m-d");
  for($i=0; $i< count($_SESSION['cart']); $i++){
    $product_id = $_SESSION['cart'][$i]->productID;
    $size = $_SESSION['cart'][$i]->size;
    $quantity = $_SESSION['cart'][$i]->quantity;
    $insert_order = 'INSERT INTO `orders`(`id`, `transactionID`, `productID`, `dateOrder`, `quantity`, `size`) VALUES (NULL,'.$transaction_id.','.$product_id.',"'.$dateOfOrder.'",'.$quantity.','.$size.')';
    $result =  mysqli_query($conn, $insert_order);
    if (($result)) {
      $query_get_inventory = 'SELECT * FROM inventory WHERE productID='.$product_id.' AND size='.$size.'';
      $result= mysqli_query($conn, $query_get_inventory);
      if(mysqli_num_rows($result) > 0 ){
        $row = mysqli_fetch_assoc($result);
        $stock = $row['stock'];
      }
      $new_stock = $stock - $quantity;
      $query_update_inventory = "UPDATE inventory SET stock=".$new_stock. " WHERE productID=".$product_id." AND size=".$size."";
      if($result= mysqli_query($conn, $query_update_inventory)){
      }
      else{
        echo "Error: " . $query . "<br>" . mysqli_error($conn);
        $message = "Error in updating stock!";
        echo "<script type='text/javascript'>alert('$message');
        window.location.href='/ee4717/men-catalog/index.php';
        </script>";
      }
    }else{
      echo "Error: " . $query . "<br>" . mysqli_error($conn);
      $message = "Error in insert to orders!";
      echo "<script type='text/javascript'>alert('$message');
      window.location.href='/ee4717/men-catalog/index.php';
      </script>";
    }
  }
  unset($_SESSION['cart']);
  header('Location: /ee4717/invoice/index.php');
?>
