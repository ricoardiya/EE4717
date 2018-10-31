<?php
  if(!isset($_SESSION['cart'])){
    $_SESSION['cart'] = array();
  }
?>

<!DOCTYPE html>
<html>
  <?php
    include '../head.php';
    $cart_css = "/ee4717/cart/cart.css";
    $small_cart_css = "/ee4717/cart/small-cart.css";
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
      <div class="cart-content">
        <form action="./updateCart.php" method="POST">
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
                          echo "<td>".$products_row['price']."</td>";
                        }
                        echo "<td>" ;
                        // echo '<input id="size-'.$stock[$i]->row.'" min=1 type="number" value='.$_SESSION['cart'][$i]->size.' onchange="getSize(this)">';
                        echo '<input id="size-'.$i.'" name="size-'.$i.'" step=1 type="number" value='.$_SESSION['cart'][$i]->size.' onchange="setMaxQuantity(this)">';
                        echo "</td>";

                        echo "<td>";
                        echo '<input  id="quantity-'.$i.'" name="quantity-'.$i.'" min=1 step=1 type="number" value='.$_SESSION['cart'][$i]->quantity.' onchange="getQuantity(this)">';
                        echo "</td>";
                        echo "<td>";
                        echo '<button class="btn-confirm" type="submit" onclick="updateCart();">Update</button>';
                        echo "</td>";
                        echo "<td>";
                        echo '<img src="../assets/pictures/trash/trash-can.png" alt="trash" width="30px">';
                        echo "</td>";
                        echo "</tr>";
                    }
                    echo '<input type="hidden" name="total" value='.$arr_length.'>';
                  }
                ?>
              </tbody>
              <tfoot>
              <tr>
                <th colspan="5" align='right'>Total:</th><br>
                <th align='right'>S$<span id="totalPrice"></span>
                </th>
              </tr>
              </tfoot>
            </table>
          <button class="btn-confirm" type="submit" onclick="updateCart();">Confirm</button>

          </form>
            <div>
              <p>
                <a href="../men-catalog/index.php">Continue Shopping</a> or
                <a href="emptying-cart.php"> Empty your cart </a>
              </p>
            </div>
        </div>
      </div>
    </div>
    <script>
    <?php
      $arr_length = empty($_SESSION['cart']) ? $arr_length=0: count($_SESSION['cart'])
    ?>
    function getQuantity(elem){
      var inputquantity = document.getElementById(elem.id).value;
      calculateDollar();
      return inputquantity;
    }
    function getSize(elem){
      var inputsize = document.getElementById(elem.id).value;
      calculateDollar();
      return inputsize;
    }
    function setMaxQuantity(elem){
      var str= elem.id;
      var quantity_field= "quantity-"+str.split("-")[1];
      var inputsize = document.getElementById(elem.id).value;
      function getQuantityMax(input, key) {
        for (var i=0; i < input.length ; ++i){
          if(input[i]['size'] == key){
            return input[i]['quantity'];
          }
        }
        return 1;
      }
      var max_quantity_val = getQuantityMax(js_stock, inputsize);
      document.getElementById(quantity_field).max = max_quantity_val;
      getSize();
    }
    function startUp() {
      for (i=0; i< <?php echo $arr_length; ?>; i++){
        let q_field = "quantity-" + i;
        let s_field = "size-" + i;
        let inputsize = document.getElementById(s_field).value;
        function getQuantityMax(row, input, key) {
          for (var i=0; i < input.length ; ++i){
            if(input[i]['size'] == key && input[i]['row'] == row){
              return input[i]['quantity'];
            }
          }
          return 1;
        }
        function getSizeMax(row, input) {
          let max = 0;
          for (var i=0; i < input.length ; ++i){
            if(input[i]['size'] > max && input[i]['row'] == row){
              max = input[i]['size'];
            }
          }
          return max;
        }
        function getSizeMin(row, input) {
          let min= 45;
          for (var i=0; i < input.length ; ++i){
            if(input[i]['size'] < min && input[i]['row'] == row){
              min = input[i]['size'];
            }
          }
          return min;
        }
        var max_quantity_val = getQuantityMax(i,js_stock, inputsize);
        var max_size_val = getSizeMax(i,js_stock);
        var min_size_val = getSizeMin(i,js_stock);
        document.getElementById(q_field).max = max_quantity_val;
        document.getElementById(s_field).min = min_size_val;
        document.getElementById(s_field).max = max_size_val;
      }
    }
    window.onload=startUp();
    window.onload=calculateDollar();

    function calculateDollar(){
      let total=0;
      for (i=0; i< <?php echo $arr_length; ?> ; i++){
        let q_field = "quantity-" + i;
        let s_field = "size-" + i;
        let quantity = document.getElementById(q_field).value;
        let size = document.getElementById(s_field).value;
        for(j=0; j < js_stock.length ; j++){
          if(js_stock[j]['row']== i){
            var price = js_stock[j]['price'];
            break;
          }
        }
        total = total + quantity*price;
      }
      console.log('total', total);
      document.getElementById('totalPrice').innerHTML = total;
      return total;
    }
    function updateCart(){
      var message = document.getElementById("updateCartMessage");
      message.className="show";
      setTimeout(function(){ message.className = message.className.replace("show",""); }, 3000);
    }
    </script>
    <?php include '../common/footer.php'?>
  </body>
</html>
