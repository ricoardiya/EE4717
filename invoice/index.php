<?php
  session_start();
  include '../dbconn.php';
  if(!isset($_SESSION['cart'])){
    $_SESSION['cart']= array();
  }
  if(empty($_SESSION['cart']) && $_SESSION['history'] != 'http://localhost/ee4717/checkout/submitOrder.php' ){
    header('Location: /ee4717/cart/index.php');
  }
  if(!isset($_SESSION['transactionID'])){
    $_SESSION['transactionID'] = 52;
  }
  $transaction_id = $_SESSION['transactionID'];

  $query = "SELECT orders.productID, orders.quantity, orders.size, orders.dateOrder, transactions.firstname AS fname_shipping, transactions.lastname AS lname_shipping, transactions.address AS address_shipping, transactions.zipCode AS zipCode_shipping, transactions.phone AS phone_shipping, transactions.totalPrice, customers.salutation, customers.name, customers.address AS address_contact, customers.email AS email_contact, customers.phone AS phone_contact FROM transactions JOIN orders ON orders.transactionID=transactions.id JOIN customers ON transactions.customerID = customers.id WHERE transactions.id=".$transaction_id."";
  $result = mysqli_query($conn, $query);
  if(mysqli_num_rows($result)> 0){
    $row= mysqli_fetch_assoc($result);
    $dateOrder = $row["dateOrder"];
    $fname_shipping = ucwords($row["fname_shipping"]);
    $lname_shipping = ucwords($row["lname_shipping"]);
    $address_shipping = ucwords($row["address_shipping"]);
    $zipCode_shipping = $row["zipCode_shipping"];
    $phone_shipping = $row["phone_shipping"];
    $totalPrice = $row["totalPrice"];
    $salutation = ucwords($row["salutation"]);
    $name = ucwords($row["name"]);
    $address_contact = ucwords($row["address_contact"]);
    $email_contact = $row["email_contact"];
    $phone_contact = $row["phone_contact"];
  }
?>
<!DOCTYPE html>
<html>
    <?php
      include '../head.php';
      $invoice_css = "/ee4717/invoice/invoice.css";
      echo '<link rel="stylesheet" type="text/css" media="screen" href=' . $invoice_css . '  />';
    ?>
<body>
  <?php
    $path = $_SERVER['DOCUMENT_ROOT'];
    $path .= "/ee4717/common/nav.php";
    include $path;
  ?>
  <div class="content-wrapper">
    <div class="invoice-wrapper">
      <div class="invoice-content">
        <div class="invoice-header">
          Invoice
        </div>
        <div class="row">
          <div class="col-6" style="text-align: center;">
            <div class="invoice-content-header" style="border-bottom: black 1px solid;">
              Contact Details
            </div>
            <div class="details">
              <div>
                Name:<br><?php echo $salutation.' '.$name; ?>
              </div>
              <br>
              <div>
                Email:<br><?php echo $email_contact; ?>
              </div>
              <br>
              <div>
                Address:<br><?php echo $address_contact; ?>
              </div>
              <br>
              <div>
                Phone: <?php echo $phone_contact; ?>
              </div>
              <br>
            </div>
          </div>
          <div class="col-6" style="text-align: center;">
            <div class="invoice-content-header" style="border-bottom: black 1px solid;">
              Ship To
            </div>
            <div class="details">
                <div>
                  Name: <br><?php echo $fname_shipping .' '.$lname_shipping ; ?>
                </div>
                <br>
                <div>
                  Address:<br> <?php echo $address_shipping ; ?>
                </div>
                <br>
                <div>
                  Zip Code: <?php echo $zipCode_shipping; ?>
                </div>
                <br>
                <div>
                  Phone: <?php echo $phone_shipping; ?>
                </div>
                <br>
              </div>
              <br>
            </div>
          </div>
        </div>
        <div class="invoice-content-header">
          Order Items
        </div>
        <div class="row" style="margin-bottom:20px;">
          <table class="table-wrapper" border="1">
            <thead>
              <tr>
                <th>No</th>
                <th>Picture</th>
                <th>Name</th>
                <th>Price</th>
                <th>Size</th>
                <th>Quantity</th>
                <th>Price</th>
              </tr>
            </thead>
            <tbody>
              <?php
                echo "<tr>";
                $query = "SELECT orders.quantity, orders.size, orders.productID, products.name, products.price, (SELECT pictures.pictureURL FROM pictures WHERE pictures.productID=orders.productID LIMIT 1) AS picture FROM orders JOIN products ON products.id=orders.productID where orders.transactionID=".$transaction_id."";
                $result = mysqli_query($conn, $query);
                $total = 0;
                $no=1;
                if(mysqli_num_rows($result)> 0){
                  while($row= mysqli_fetch_assoc($result)){
                    $productID = $row["productID"];
                    $size = $row["size"];
                    $quantity = $row["quantity"];
                    $name=$row["name"];
                    if(!(isset($_SESSION['firstname'])&& isset($_SESSION['lastname'])&& isset($_SESSION['email']))){
                      $price=$row["price"];
                    }else{
                      $price=$row["price"] * 0.8;
                    }
                    $picture=$row["picture"];
                    $totalPrice = $quantity * $price;
                    $total += $totalPrice;
                    echo  "<td>". $no ."</td>";
                    echo "<td><img src=\"../".$picture."\" alt='shoes' width='50%' height='50%'></td>";
                    echo "<td>" .$name. "</td>";
                    echo "<td>" .$price. "</td>";
                    echo "<td>" .$size. "</td>";
                    echo "<td>" .$quantity. "</td>";
                    echo "<td>" .$totalPrice. "</td>";
                    $no = $no+1;
                    echo "</tr>";
                  }
                }
              ?>
          </tbody>
          </table>
        </div>
        <div class="row">
          <div class="col-6">
          </div>
          <div class="col-6" id="priceSummary">
            <table class="table-wrapper" border="1">
              <tr>
                <th>Total Products</th>
                <td>$ <?php echo $total; ?></td>
              </tr>
              <tr>
                <th>Total Shipping</th>
                <td>$ <?php echo $total*0.1; ?></td>
              </tr>
              <tr>
                <th>Grand Total</th>
                <td>$ <?php echo $total*1.1 ?></td>
              </tr>
            </table>
          </div>
        </div>
        <br><br><br><br>
        <div style="text-align:center;">
          <a href="../index.php"><button type="submit" class="btn-confirm-wrapper">Go Back Shopping</button></a>
        </div>
      </div>
    </div>
      </div>
    </div>
  </div>
  <?php include  '../common/footer.php'?>
</body>
</html>
