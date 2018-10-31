<!DOCTYPE html>
<html>
<body>
  <?php
    include '../head.php';
    include '../dbconn.php';
  ?>
  <link rel="stylesheet" type="text/css" href="men-shoe.css">
  <body>
    <!-- Include navbar -->
    <?php
      $path = $_SERVER['DOCUMENT_ROOT'];
      $path .= "/ee4717/common/nav.php";
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
        if(empty($_SESSION['cart'])){
          $item = new buy_item();
          $item->productID = $_POST['productID'];
          $item->size = $_POST['size'];
          $item->quantity = $_POST['quantity'];
          array_push($_SESSION['cart'], $item);
          header('location: ' . $_SERVER['PHP_SELF']. '?productID=' . $productID);
          exit();
        }else{
          for($i=0; $i<count($_SESSION['cart']) ; $i++){
            if($_SESSION['cart'][$i]->productID == $_POST['productID'] &&  $_SESSION['cart'][$i]->size == $_POST['size'] ){
              // echo '<script> console.log("sum: '.(int)$_POST['quantity'] + (int)$_SESSION['cart'][$i]->quantity.'");</script>';
              $_SESSION['cart'][$i]->quantity = (string)((int)$_SESSION['cart'][$i]->quantity + $_POST['quantity']);
              header('location: ' . $_SERVER['PHP_SELF']. '?productID=' . $productID);
              exit();
            }
          }
        }
        $item = new buy_item();
        $item->productID = $_POST['productID'];
        $item->size = $_POST['size'];
        $item->quantity = $_POST['quantity'];
        array_push($_SESSION['cart'], $item);
        header('location: ' . $_SERVER['PHP_SELF']. '?productID=' . $productID);
        exit();
      }
    ?>
    <div class="content-wrapper">
      <div class="content-item">
        <div class="row">
          <a href="/ee4717/men-catalog/">< GO BACK TO MEN CATALOG</a>
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
          <div class="col-6">
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
              <select name="size" id="size" onload="getSize();" onchange="getSize();">
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
                  echo "</script>";
                  ?>
                <input type="number" name="quantity" min=1 value=1 id="quantity" onchange="getQuantity();">
                <script>
                  var inv = js_stock[0]['quantity'];
                  var quantity = 1;
                  var inputsize= js_stock[0]['size'];
                  function getSize(){
                    var inputsize = document.getElementById('size').value;
                    function getVal(input, key) {
                        for (var i=0; i < input.length ; ++i){
                            if(input[i]['size'] == key){
                              return input[i]['quantity'];
                            }
                        }
                    }
                    var inv = getVal(js_stock, inputsize);
                    document.getElementById("quantity").max = inv;
                  }
                  function getQuantity(){
                    var quantity= document.getElementById("quantity").value;
                  }
                </script>
            </div>
            <hr>
            <button type="submit" class="btn-addcart">BUY NOW</button>
            <button type="submit" class="btn-addcart">ADD TO CART</button>
          </div>
          </form>
            <!-- <button class="btn-addcart" id="myBtn">MODAL</button> -->
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
      <script type="text/javascript">
          var modal = document.getElementById('myModal');
          var btn = document.getElementById("myBtn");
          var span = document.getElementsByClassName("close")[0];
          btn.onclick = function() {
              modal.style.display = "block";
          }
          span.onclick = function() {
              modal.style.display = "none";
          }
          window.onclick = function(event) {
              if (event.target == modal) {
                  modal.style.display = "none";
              }
          }
      </script>
    <?php include  '../common/footer.php'?>
  </body>
</html>
