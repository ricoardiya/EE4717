<!DOCTYPE html>
<html>
<body>
  <?php
    include '../head.php';
    include '../path.php';
    include '../dbconn.php';
  ?>
  <link rel="stylesheet" type="text/css" href="men-shoe.css">
  <link rel="stylesheet" type="text/css" href="../cart/small-cart.css">
  <body>
    <!-- Include navbar -->
    <?php
      $path = $_SERVER['DOCUMENT_ROOT'];
      $path .= $root_path . "/common/nav.php";
      include $path;
    ?>
    <!-- GET productID from URL -->
    <?php
      $productID = $_GET['productID'];
    ?>
    <!-- Session for cart -->
    <?php
      session_start();
      if (!isset($_SESSION['cart'])){
        $_SESSION['cart'] = array();
      }
      if (isset($_POST['productID']) && isset($_POST['size']) && isset($_POST['quantity'])) {
        if(empty($_SESSION['cart'])){ //if the cart still empty
          $item = new buy_item();
          $item->productID = $_POST['productID'];
          $item->size = $_POST['size'];
          $item->quantity = $_POST['quantity'];
          array_push($_SESSION['cart'], $item);
          if($_POST['action'] == 'BUY NOW'){
            header('location: /ee4717/cart/index.php');
          }else if($_POST['action'] == 'ADD TO CART'){
            header('location: ' . $_SERVER['PHP_SELF']. '?productID=' . $productID);
          }
          exit();
        }else{
          for($i=0; $i<count($_SESSION['cart']) ; $i++){
            if($_SESSION['cart'][$i]->productID == $_POST['productID'] &&  $_SESSION['cart'][$i]->size == $_POST['size'] ){
              $_SESSION['cart'][$i]->quantity = (string)((int)$_SESSION['cart'][$i]->quantity + $_POST['quantity']);
              if($_POST['action'] == 'BUY NOW'){
                header('location: /ee4717/cart/index.php');
              }else if($_POST['action'] == 'ADD TO CART'){
                header('location: ' . $_SERVER['PHP_SELF']. '?productID=' . $productID);
              }
              exit();
            }
          }
        }
        $item = new buy_item();
        $item->productID = $_POST['productID'];
        $item->size = $_POST['size'];
        $item->quantity = $_POST['quantity'];
        array_push($_SESSION['cart'], $item);
        if($_POST['action'] == 'BUY NOW'){
          header('location: /ee4717/cart/index.php');
        }else if($_POST['action'] == 'ADD TO CART'){
          header('location: ' . $_SERVER['PHP_SELF']. '?productID=' . $productID);
        }
        exit();
      }
    ?>
    <div class="content-wrapper">
      <div class="content-item">
        <div class="row">
          <a href=<?php echo $root_path . '/men-catalog' ?>>< GO BACK TO MEN CATALOG</a>
        </div>
        <div class="row">
          <div class="col-6">
            <div class="picture-wrapper">
              <!-- Display picture -->
              <?php
                $pictures_query = "SELECT * FROM pictures WHERE productID = $productID";
                $pictures_result = mysqli_query($conn, $pictures_query);

                if (mysqli_num_rows($pictures_result)) {
                  $picture_row = mysqli_fetch_assoc($pictures_result);
                  echo '
                    <div class="container">
                      <img id="expandedImg" style="width:50%" src=../' . $picture_row['pictureURL'] . '>
                    </div>
                  ';
                }

                $pictures_result = mysqli_query($conn, $pictures_query);

                echo '<div class="thumbnail">
                        <div class="row">';

                if (mysqli_num_rows($pictures_result) > 0) {
                  while($picture_row = mysqli_fetch_assoc($pictures_result)){
                    echo '
                      <div class="col">
                        <img src="../' . $picture_row['pictureURL'] . '" alt="shoes" onclick="openImg(this);" width="100%">
                      </div>
                    ';
                  }
                }

                echo '
                  </div>
                </div>'
              ?>
              <script type="text/javascript" src="./display_image.js"></script>
            </div>
          </div>
          <div class="col-5">
            <!-- Product description -->
            <?php
              $products_query = "SELECT * FROM products WHERE id = $productID";
              $products_result = mysqli_query($conn, $products_query);
              if (mysqli_num_rows($products_result) > 0) {
                $product_row = mysqli_fetch_assoc($products_result);

                if (!isset($_SESSION['firstname'])) {
                  $render_price = '<div id="price">PRICE &nbsp;$ ' . $product_row['price'] . '</div>';
                } else {
                  $render_price ='<div id="price">PRICE &nbsp;<strike>$ ' . $product_row['price'] . '</strike> $' . ceil($product_row['price'] * 0.8) . ' </div>';
                }

                echo '
                  <div class="shoe-name-item">' . ucwords($product_row['name']) . '</div>
                  <div class="description">' . $product_row['desc'] . '</div>
                  <hr>
                  ' . $render_price . '
                  <hr>
                ';
              }
              else {
                echo "An error has occured. The item was not retrieved";
              }
              ?>

          <form action="" method="POST">
            <input type="hidden" name="productID" value=<?php echo $productID; ?>>
            <div class="size">
              Choose your size:
              <select name="size" id="size" onchange="getSize();">
                <?php
                  // query inventory of the product
                  $inventory_query = "SELECT * FROM inventory WHERE productID = $productID AND stock <> 0";
                  $inventory_result = mysqli_query($conn, $inventory_query);
                  if (mysqli_num_rows($inventory_result) > 0) {
                    while($inventory_row = mysqli_fetch_assoc($inventory_result)){
                      echo '
                        <option value="' . $inventory_row['size'] . '">'. $inventory_row['size'] .'</option>
                      ';
                    }
                  }
                ?>
              </select>
            </div>
            <div class="quantity">
              Quantity:
                <?php
                  // query inventory of the product
                  $stock = array();
                  class set{
                    public $size;
                    public $quantity;
                  }
                  $inventory_query = "SELECT * FROM inventory WHERE productID = $productID AND stock <> 0";
                  $inventory_result = mysqli_query($conn, $inventory_query);
                  if (mysqli_num_rows($inventory_result) > 0) {
                    while($inventory_row = mysqli_fetch_assoc($inventory_result)){
                      $list = new set();
                      $list->size = $inventory_row['size'];
                      $list->quantity = $inventory_row['stock'];
                      array_push($stock, $list);
                    }
                  }
                  echo "<script>";
                  echo " var js_stock = ".json_encode($stock) . ";";
                  echo " console.log('var js_stock = ',".json_encode($stock) . ");";
                  echo "</script>";
                  ?>
                <input type="number" name="quantity" min=1 value=1 id="quantity" onchange="getQuantity();">
            </div>
            <hr>
            <input type="submit" name="action" value="BUY NOW" class="btn-addcart"/>
            <input type="submit" name="action" value="ADD TO CART" class="btn-addcart"/>
            <hr>
            <div class="specs">
              <div class="header">
                Specification
              </div>
              <div class="lists">
                <?php
                  $specs_query = "SELECT * FROM specifications WHERE productID = $productID";
                  $specs_result = mysqli_query($conn, $specs_query);
                  echo '<ul class="list">';
                  if (mysqli_num_rows($specs_result) > 0) {
                    while($specs_row = mysqli_fetch_assoc($specs_result)){
                      echo '<li>'. $specs_row['specification'].'</li>';
                    }
                  }
                  echo '</ul>';
                ?>
              </div>
            </div>
            <hr>
            <div class="reviews">
              <div class="header">
                Reviews
              </div>
              <div class="lists">
                <?php
                  $reviews_query = "SELECT reviews.reviews, customers.name FROM `orders`
                                    RIGHT JOIN reviews ON orders.transactionID = reviews.transactionID
                                    JOIN transactions ON orders.transactionID = transactions.id
                                    JOIN customers ON transactions.customerID = customers.id
                                    WHERE productID = $productID";

                  $reviews_result = mysqli_query($conn, $reviews_query);

                  echo '<table>';

                  if (mysqli_num_rows($reviews_result) > 0) {
                    while($reviews_row = mysqli_fetch_assoc($reviews_result)){
                      echo '<tr>
                              <td>' . $reviews_row['name'] . '</td>
                              <td>' . $reviews_row['reviews'] . '</td>
                            </tr>';
                    }
                  } else {
                    echo '<tr>
                            <td></td>
                            <td>No reviews yet</tr>
                          </tr>';
                  }
                  echo '</table>';

                  if (isset($_SESSION['email'])) {
                    $customer_query = "SELECT customers.email, orders.transactionID FROM `orders`
                                        JOIN transactions ON orders.transactionID = transactions.id
                                        JOIN customers ON transactions.customerID = customers.id
                                        WHERE productID = $productID AND customers.email =\"" . $_SESSION['email'] . "\"";

                    $customer_result = mysqli_query($conn, $customer_query);

                    if (mysqli_num_rows($customer_result) > 0) {
                      $customer_row = mysqli_fetch_assoc($customer_result);
                      $transaction_id = $customer_row['transactionID'];
                      echo '
                      <form action="submit-review.php" method="POST">
                        <input type="hidden" value="' . $transaction_id . '" name="transactionid" id="transactionid">
                        <textarea rows="4" required id="message" cols="50" name="review" placeholder="Place your review here"></textarea><br>
                        <button type="submit" class="btn-addcart">SUBMIT</button>
                      </form>
                      ';
                    }
                  }
                ?>
              </div>
            </div>
          </div>
          </form>
          <div class="col-1">
            <div class="cart">
              <?php
                include '../cart/small-cart.php';
              ?>
            </div>
          </div>
        </div>
        <div class="row recommendation-wrapper">
          <div class="recommendation-header">
            YOU MAY ALSO LIKE
          </div>
          <div class="row recommendation">
            <?php
              $recommendation_query = "SELECT * from products WHERE gender = 'M' AND NOT id = " . $product_row['id'] . " ORDER BY RAND() LIMIT 4";
              $recommendation_result = mysqli_query($conn, $recommendation_query);
              if (mysqli_num_rows($recommendation_result) > 0) {
                while($recommendation_row = mysqli_fetch_assoc($recommendation_result)){
                  $picture_query = "SELECT * FROM pictures WHERE productID = ". $recommendation_row['id'] . "";
                  $picture_result = mysqli_query($conn, $picture_query);
                  if (mysqli_num_rows($picture_result)) {
                    $picture_row = mysqli_fetch_assoc($picture_result);
                    echo '
                      <div class="col-3">
                        <div class="card">
                          <img src="../'. $picture_row['pictureURL'] .'" alt="shoes" style="width:100%">
                          <div>
                            <form method="get" action="../men-shoe">
                              <input type="hidden" id="productId" name="productID" value=' . $recommendation_row['id'] . '>
                              <button type="submit" class="btn-shoename">' . ucwords($recommendation_row['name']) . '</button>
                            </form>
                          </div>
                        </div>
                      </div>';
                  }
                }
              }
            ?>
          </div>
        </div>
      </div>
    </div>
    <?php
      include  '../common/footer.php';
      $men_shoe_handler = "/ee4717/men-shoe/setMaxStock.js";
      echo '<script type="text/javascript" src="'.$men_shoe_handler.'"></script>';
    ?>
  </body>
</html>
