<?php
  if(!isset($_SESSION['cart'])){
    $_SESSION['cart'] = array();
  }
?>

<!DOCTYPE html>
<html>
  <?php
    include '../head.php';
    include '../path.php';
    $cart_css = $root_path . "/cart/cart.css";
    $small_cart_css = $root_path . "/cart/small-cart.css";
    echo '<link rel="stylesheet" type="text/css" media="screen" href=' . $cart_css . '>';
    echo '<link rel="stylesheet" type="text/css" media="screen" href=' . $small_cart_css . '>';
    include '../common/nav.php';
    include '../dbconn.php';
    ?>
    <?php
      $stock = array();
      class set{
        public $row;
        public $prodID;
        public $size;
        public $quantity;
        public $price;
      }

      $arr_length=empty($_SESSION['cart']) ? 0 : count($_SESSION['cart']);

      for ($i=0; $i < $arr_length; $i++){
          $inventory_query = "SELECT products.price, inventory.size, inventory.stock FROM inventory  INNER JOIN products ON products.id=inventory.productID WHERE inventory.productID =". $_SESSION['cart'][$i]->productID. ";";
          $inventory_result = mysqli_query($conn, $inventory_query);
          if (mysqli_num_rows($inventory_result) > 0) {
            while($inventory_row = mysqli_fetch_assoc($inventory_result)){
              $list = new set();
              $list->row = $i;
              $list->prodID = $_SESSION['cart'][$i]->productID;
              $list->size = $inventory_row['size'];
              $list->quantity = $inventory_row['stock'];
              $list->price = $inventory_row['price'];
              array_push($stock, $list);
            }
          }
      }
      echo "<script>";
      echo " var js_stock = ".json_encode($stock) . ";";
      echo " console.log('var js_stock = ',".json_encode($stock) . ");";
      echo "</script>";
    ?>
  <body>
    <div class="content-wrapper">
      <div class="cart-header">
        Shopping Cart
      </div>
      <?php
      if (!empty($_SESSION['cart'])){
      ?>
      <div class="cart-content">
        <table class="table-wrapper" border="1">
          <thead>
            <tr>
              <th>No</th>
              <th>Picture</th>
              <th>Name</th>
              <th>Price</th>
              <th>Size</th>
              <th>Quantity</th>
              <th>Update</th>
              <th>Delete</th>
            </tr>
          </thead>
          <tbody>
            <!-- <form action="../cart/submitOrder.php" method="POST"> -->
                <?php
                  $total = 0;
                  if (isset($_SESSION['cart'])){
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
                      }

                      if(isset($_GET['editCart']) && $_GET['editCart'] == $i){
                            echo '<form action="./updateCart.php" method="POST">';
                            echo '<input type="hidden" name="productID" value='.$i.'>';
                            echo "<td>" ;
                            echo '<input id="size-'.$i.'" name="size-'.$i.'" step=1 type="number" value='.$_SESSION['cart'][$i]->size.' onchange="setMaxQuantity(this)">';
                            echo "</td>";
                            echo "<td>";
                            echo '<input  id="quantity-'.$i.'" name="quantity-'.$i.'" min=1 step=1 type="number" value='.$_SESSION['cart'][$i]->quantity.' onchange="getQuantity(this)">';
                            echo "</td>";
                            echo "<td>";
                            echo '<button class="btn-confirm" type="submit" id="updateBtn" onclick="updateCart();">Update</button>';
                            echo "</td>";
                            echo '</form>';
                            echo "<td>";
                            echo '<a href="delete-item.php?delete='.$i.'"><img src="../assets/pictures/trash/trash-can.png" id="trashBtn" alt="trash">';
                            echo "</td>";
                          } else {
                            echo "<td>" ;
                            echo $_SESSION['cart'][$i]->size;
                            echo "</td>";
                            echo "<td>";
                            echo $_SESSION['cart'][$i]->quantity;
                            echo "</td>";
                            echo "<td>";
                            echo '<a href="/ee4717/cart/?editCart='.$i.'"><button class="btn-confirm" id="editBtn" >Edit</button></a>';
                            echo "</td>";
                            echo "<td>";
                            echo '<a href="delete-item.php?delete='.$i.'"><img src="../assets/pictures/trash/trash-can.png" id="trashBtn" alt="trash">';
                            echo "</td>";
                          }
                          echo "</tr>";
                    }
                    echo '<input type="hidden" name="total" value='.$arr_length.'>';
                  }
                ?>
                <!-- </form> -->
              </tbody>
            </table>
            <div class= "row" style="float:right;">
              <a href="../men-catalog/index.php"><button class="btn-confirm">Continue Shopping</button></a>
              <a href="../checkout/index.php"><button type="submit" class="btn-confirm">Checkout</button></a>
            </div>
            <br><br><br><br><br><br>
            <div>
              <p id="emptyCart">
                <a href="../men-catalog/index.php">Continue Shopping</a> or
                <a href="emptying-cart.php"> Empty your cart </a>
              </p>
            </div>
        </div>
      </div>
      <?php
      }else {
      ?>
        <div class= "row" id="empty">
          <p style="font-size:30px;">Your Cart is Empty!</p>
        </div>
        <div class= "row">
          <p>
            <a href="../men-catalog/index.php">Continue Shopping</a>
          </p>
        </div>
      <?php
      }
      ?>
    </div>
    <script>
      <?php
        $arr_length = empty($_SESSION['cart']) ? $arr_length=0: count($_SESSION['cart'])
      ?>
      function getQuantity(elem){
        var inputquantity = document.getElementById(elem.id).value;
        return inputquantity;
      }
      function getSize(elem){
        var inputsize = document.getElementById(elem.id).value;
        return inputsize;
      }
      function getQuantityMax(input, key) {
        for (var i=0; i < input.length ; ++i){
          if(input[i]['size'] == key){
            return input[i]['quantity'];
          }
        }
        return 1;
      }
      function setMaxQuantity(elem){
        let str= elem.id;
        console.log("elem.id", id);
        let inputsize = document.getElementById(str).value;
        let max_quantity_val = getQuantityMax(js_stock, inputsize);
        let quantity_field= "quantity-"+str.split("-")[1];
        let current_quantity = document.getElementById(quantity_field).value;
        let new_quantity = current_quantity >  max_quantity_val ? max_quantity_val : current_quantity;
        document.getElementById(quantity_field).value = new_quantity;
        document.getElementById(quantity_field).max = max_quantity_val;
        getSize(elem);
      }
      // function startUp() {
      //   for (i=0; i< <?php echo $arr_length; ?>; i++){
      //         let q_field = "quantity-" + i;
      //         let s_field = "size-" + i;
      //         console.log("size: ", s_field);
      //         if(!!document.getElementById(s_field)){
      //           let inputsize = document.getElementById(s_field).value;
      //         }
      //         function getQuantityMax(row, input, key) {
      //           for (var i=0; i < input.length ; ++i){
      //             if(input[i]['size'] == key && input[i]['row'] == row){
      //               return input[i]['quantity'];
      //             }
      //           }
      //           return 1;
      //         }
      //         function getSizeMax(row, input) {
      //           let max = 0;
      //           for (var i=0; i < input.length ; ++i){
      //             if(input[i]['size'] > max && input[i]['row'] == row){
      //               max = input[i]['size'];
      //             }
      //           }
      //           return max;
      //         }
      //         function getSizeMin(row, input) {
      //           let min= 45;
      //           for (var i=0; i < input.length ; ++i){
      //             if(input[i]['size'] < min && input[i]['row'] == row){
      //               min = input[i]['size'];
      //             }
      //           }
      //           return min;
      //         }
      //         var max_quantity_val = getQuantityMax(i,js_stock, inputsize);
      //         var max_size_val = getSizeMax(i,js_stock);
      //         var min_size_val = getSizeMin(i,js_stock);
      //         document.getElementById(q_field).max = max_quantity_val;
      //         document.getElementById(s_field).min = min_size_val;
      //         document.getElementById(s_field).max = max_size_val;
      //   }
      // }
      function updateCart(){
        startUp();
        let message = document.getElementById("updateCartMessage");
        message.className="show";
        setTimeout(function(){ message.className = message.className.replace("show",""); }, 3000);
      }
    </script>
    <?php include '../common/footer.php'?>
  </body>
</html>
