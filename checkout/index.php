<!DOCTYPE html>
<html>
    <?php
      include '../head.php';
      include '../dbconn.php';
      $checkout_css = "/ee4717/checkout/checkout.css";
      $checkout_js = "/ee4717/checkout/checkout.js";
      echo '<link rel="stylesheet" type="text/css" media="screen" href=' . $checkout_css . '  />';
      echo '<script type="text/javascript" src="'. $checkout_js .'"></script>';
    ?>
<body>
  <?php
    $path = $_SERVER['DOCUMENT_ROOT'];
    $path .= "/ee4717/common/nav.php";
    include $path;
  ?>
  <div class="content-wrapper">
    <div class="checkout-wrapper">
      <div class="checkout-content"><form action="../checkout/submitOrder.php" method="POST" class="contact-form">
        <div class="checkout-header">
          Checkout
        </div>
        <div class="row">
          <div class="col-6" style="text-align: center;">
            <div class="checkout-content-header">
              Contact Details
            </div>
            <div>
                <label for="salutation">*Salutation</label><br>
                <input class="salution-radio" type="radio" name="salutation" value="mr" checked>Mr.
                <input class="salution-radio" type="radio" name="salutation" value="ms">Ms.
                <input class="salution-radio" type="radio" name="salutation" value="mrs">Mrs.
                <br><br>
                <label for="fname">*First Name</label><br>
                <input type="text" required id="fname_contact" name="firstname_contact" placeholder="John">
                <br>
                <span id='firstname-message-contact'></span>
                <br><br>
                <label for="lname">Last Name</label><br>
                <input type="text" id="lname_contact" name="lastname_contact" placeholder="Doe">
                <br>
                <span id='lastname-message-contact'></span>
                <br><br>
                <label for="email">*Email</label><br>
                <input type="email" required id="email_contact" name="email_contact" placeholder="John@doe.com">
                <br>
                <span id='email-message-contact'></span>
                <br><br>
            </div>
          </div>
          <div class="col-6" style="text-align: center;">
            <div class="checkout-content-header">
              Shipping Details
            </div>
            <div>
                <label for="fname">*First Name</label><br>
                <input type="text" required id="fname_shipping" name="firstname_shipping" placeholder="John">
                <br>
                <span id='firstname-message-shipping'></span>
                <br><br>
                <label for="lname">Last Name</label><br>
                <input type="text" id="lname_shipping" name="lastname_shipping" placeholder="Doe">
                <br>
                <span id='lastname-message-shipping'></span>
                <br><br>
                <label for="address">*Address</label><br>
                <input type="text" required id="address_shipping" name="address_shipping" placeholder="34 Nanyang Avenue Singapore">
                <br>
                <span id='address-message-shipping'></span>
                <br><br>
                <label for="zipCode">*ZipCode</label><br>
                <input type="text" required id="zipCode_shipping" name="zipCode_shipping" placeholder="636894">
                <br>
                <span id='zipCode-message-shipping'></span>
                <br><br>
                <label for="phone">*Phone</label><br>
                <input type="text" required id="phone_shipping" name="phone_shipping" placeholder="8657 9230">
                <br>
                <span id='phone-message-shipping'></span>
                <br><br>
              </div>
              <br>
            </div>
          </div>
          <div class="checkout-header">
            Cart Summary
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
                $total = 0;
                $arr_length = (empty($_SESSION['cart'])) ? 0: count($_SESSION['cart']);
                for ($i=0,$a=1; $i < $arr_length; $i++, $a++){
                  echo "<tr>";
                  echo  "<td>". $a ."</td>";
                  $products_query = "SELECT products.name, pictures.pictureURL, products.price FROM products INNER JOIN pictures ON products.id = pictures.productID WHERE products.id =". $_SESSION['cart'][$i]->productID. ";";
                  $products_result = mysqli_query($conn, $products_query);
                  if (mysqli_num_rows($products_result) > 0) {
                    $products_row = mysqli_fetch_assoc($products_result);
                    echo "<td><img src=\"../".$products_row['pictureURL']."\" alt='shoes' width='50%' height='50%'></td>";
                    echo "<td>".ucwords($products_row['name'])."</td>";
                    echo "<td>".$products_row['price']."</td>";
                    $totalPrice = $products_row['price'] * $_SESSION['cart'][$i]->quantity;
                    $total += $totalPrice;
                  }
                  echo "<td>" ;
                  echo $_SESSION['cart'][$i]->size;
                  echo "</td>";
                  echo "<td>";
                  echo $_SESSION['cart'][$i]->quantity;
                  echo "</td>";
                  echo "<td>";
                  echo $totalPrice;
                  echo "</td>";
                  echo "</tr>";
                }
                echo '<input type="hidden" name="total" value='.$totalPrice.'>';
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
        <div class="row" style="float:right;">
          <a href="../cart/index.php"><button type="submit" class="btn-confirm-wrapper">Go Back To Cart</button></a>
          <a href="#"><button type="submit" class="btn-confirm-wrapper">Confirm</button></a>
        </div>
        </form>
      </div>
    </div>
  </div>
  <?php
          $checkout_handler = "/ee4717/checkout/checkout-handler.js";
          echo '<script type="text/javascript" src="'.$checkout_handler.'"></script>';
          ?>
        </div>
      </div>
    </div>
  </div>
  <?php include  '../common/footer.php'?>
</body>
</html>
