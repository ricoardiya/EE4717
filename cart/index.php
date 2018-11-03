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
                        if(!(isset($_SESSION['firstname'])&& isset($_SESSION['lastname'])&& isset($_SESSION['email']))){
                          echo "<td>".$products_row['price']."</td>";
                        }else {
                          echo "<td>".(0.8)*$products_row['price']."</td>";
                        }
                      }

                      if(isset($_GET['editCart']) && $_GET['editCart'] == $i){
                        echo '<form action="./updateCart.php" method="POST">';
                        echo '<input type="hidden" name="productID" value='.$i.'>';
                        echo "<td>" ;
                        echo '<input id="size-'.$i.'" name="size-'.$i.'" step=1 type="number" value='.$_SESSION['cart'][$i]->size.' onchange="setMaxQuantity(this);">';
                        echo "</td>";
                        echo "<td>";
                        echo '<input min=1 id="quantity-'.$i.'" name="quantity-'.$i.'" min=1 step=1 type="number" value='.$_SESSION['cart'][$i]->quantity.' onchange="getQuantity(this)">';
                        echo "</td>";
                        echo "<td>";
                        echo '<button class="btn-confirm" type="submit" id="updateBtn">Update</button>';
                        echo "</td>";
                        echo '</form>';
                        echo "<td>";
                        echo '<a href="delete-item.php?delete='.$i.'"><img src="../assets/pictures/trash/trash-can.png" id="trashBtn" alt="trash">';
                        echo "</td>";
                        $_COOKIES['editCart']= $i
                      ?>
                      <script>
                        function getMaxMinSize(input, prodID) {
                          min = 101;
                          max = 0;
                          // console.log('prodID ', prodID, 'type: ', typeof(prodID));
                          for (var i=0; i < input.length ; i++){
                            // console.log('itteration ', i, 'input prodID: ',  parseInt(input[i]['prodID'],10), 'PRODUCT ID REAL: ', );
                            if( parseInt(input[i]['prodID'],10) == parseInt(prodID,10)){
                              // console.log('prodID ', prodID, 'JS_STOCK: ', input[i]['prodID']);
                              if(parseInt(input[i]['size'],10) < min ){
                                min= parseInt(input[i]['size'],10);
                                // console.log("found min ", min);
                              }
                              if (parseInt(input[i]['size'],10) > max ){
                                max = parseInt(input[i]['size'],10);
                                // console.log("found max: ", max);
                              }
                            }
                          }
                          return [min, max];
                        }
                        function editCart(cartRow){
                          console.log('cartRow ' , cartRow);
                          // let str= elem.id;
                          // console.log('str', str);
                          // let row = parseInt(str.split("-")[1],10);
                          let row = cartRow;
                          let prodID = js_stock[row]['prodID'];
                          // console.log('prodID', prodID);
                          let minSizeVal = getMaxMinSize(js_stock,prodID)[0];
                          console.log('minSizeVal', minSizeVal);
                          let maxSizeVal = getMaxMinSize(js_stock,prodID)[1];
                          console.log('maxSizeVal', maxSizeVal);
                          // let size_field= "size-"+str.split("-")[1];
                          let size_field= "size-"+cartRow;
                          let current_size_field= document.getElementById(size_field).value;
                          console.log('size_field', size_field, typeof(size_field));
                          document.getElementById(size_field).min = minSizeVal;
                          document.getElementById(size_field).max = maxSizeVal;
                          if(current_size_field > maxSizeVal){
                            document.getElementById(size_field).value = maxSizeVal;
                          }
                          if(current_size_field < minSizeVal){
                            document.getElementById(size_field).value = minSizeVal;
                          }
                        }

                        editCart(<?php echo $_COOKIES['editCart']; ?>);

                        function getQuantityMaxWithProductID(input, size, productID) {
                          for (var i=0; i < input.length ; ++i){
                            if(parseInt(input[i]['size'],10) == parseInt(size,10) && parseInt(input[i]['row'],10) == parseInt(productID,10)){
                              console.log("found match!");
                              return input[i]['quantity'];
                            }
                          }
                          console.log("NOT found match!");
                          return 1;
                        }
                        function setMaxQuantityFirstLoad(cartRow){
                          let row = cartRow;
                          let prodID = parseInt(js_stock[row]['prodID'],10);
                          console.log('row first load', row, 'prodID ', prodID);
                          let size_field= "size-"+prodID;
                          console.log('size field first load ', size_field);
                          let inputsize = parseInt(document.getElementById(size_field).value,10);
                          console.log('inputsize first load ', inputsize);
                          let maxVal = parseInt(getQuantityMaxWithProductID(js_stock, inputsize, prodID),10);
                          console.log('maxVal first load', maxVal);
                          let quantity_field= "quantity-"+prodID;
                          console.log('quantity_field ', quantity_field);
                          let current_quantity = parseInt(document.getElementById(quantity_field).value,10);
                          console.log('current_quantity ', current_quantity);
                          let new_quantity = current_quantity >  maxVal ? maxVal : current_quantity;
                          document.getElementById(quantity_field).value = new_quantity;
                          document.getElementById(quantity_field).max = maxVal;
                        }
                        setMaxQuantityFirstLoad(<?php echo $_COOKIES['editCart']; ?>);
                      </script>
                      <?php
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
              </tbody>
            </table>
            <div class= "row" style="float:right;">
              <a href="../checkout/index.php"><button type="submit" class="btn-confirm">Checkout</button></a>
            </div>
            <br><br><br><br><br><br>
            <div>
              <p id="emptyCart">
                <a href="../index.php">Continue Shopping</a> or
                <a href="emptying-cart.php"> Empty your cart </a>
              </p>
            </div>
        </div>
      </div>
      <?php
      }else {
      ?>
        <div>
          <p id="empty" style="font-size:30px;">Your Cart is Empty!</p>
        </div>
        <div>
          <p id="empty" style="font-size:15px;">
            <a href="../men-catalog/index.php">Back To Shop</a>
          </p>
        </div>
      <?php
      }
      ?>
    </div>
    <script>
      <?php
        $arr_length = empty($_SESSION['cart']) ? $arr_length=0: count($_SESSION['cart']);
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
      function getQuantityMaxWithProductID(input, size, productID) {
        for (var i=0; i < input.length ; ++i){
          if(parseInt(input[i]['size'],10) == parseInt(size,10) && parseInt(input[i]['row'],10) == parseInt(productID,10)){
            console.log("found match!");
            return input[i]['quantity'];
          }
        }
        console.log("NOT found match!");
        return 1;
      }
      function setMaxQuantity(elem){
        let str= elem.id;
        let prodID = parseInt(str.split("-")[1],10);
        console.log('str ', str, 'prodID', prodID);
        let inputsize = parseInt(document.getElementById(str).value,10);
        console.log('inputsize ', inputsize);
        let maxVal = parseInt(getQuantityMaxWithProductID(js_stock, inputsize, prodID),10);
        console.log('maxVal ', maxVal);
        let quantity_field= "quantity-"+str.split("-")[1];
        console.log('quantity_field ', quantity_field);
        let current_quantity = parseInt(document.getElementById(quantity_field).value,10);
        console.log('current_quantity ', current_quantity);
        let new_quantity = current_quantity >  maxVal ? maxVal : current_quantity;
        document.getElementById(quantity_field).value = new_quantity;
        document.getElementById(quantity_field).max = maxVal;
        // getSize(elem);
      }
    </script>
    <?php
      include '../common/footer.php';
    ?>
  </body>
</html>
