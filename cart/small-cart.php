<div class="small-shopping-cart">
  <img src="../assets/pictures/cart/shopping-cart.png" alt="cart" width="30px">
  <div class="small-shopping-cart-content">
    <div class="small-shopping-cart-header">
      YOUR CART
    </div>
    <?php
      $arr_length = empty($_SESSION['cart']) ? 0 : count($_SESSION['cart']);
      $cart_arr_length = $arr_length > 2 ? 2 : $arr_length;
      if(isset($_SESSION['cart']) && !empty($_SESSION['cart'])) {
        echo '<table>';
        for ($i=0,$a=1; $i < $cart_arr_length; $i++, $a++){
            echo "<tr>";
            $products_query = "SELECT products.name, pictures.pictureURL, products.price FROM products INNER JOIN pictures ON products.id = pictures.productID WHERE products.id =". $_SESSION['cart'][$i]->productID. ";";
            $products_result = mysqli_query($conn, $products_query);
            if (mysqli_num_rows($products_result) > 0) {
              $products_row = mysqli_fetch_assoc($products_result);
              echo "<td><img src=\"../".$products_row['pictureURL']."\" alt='shoes' width='50px;' height='50px'></td>";
              echo "<td>".ucwords($products_row['name'])."</td>";
            }
            echo "<td>";
            echo 'x ' . $_SESSION['cart'][$i]->quantity;
            echo "</td>";
            echo "</tr>";

        }
        echo '</table>';
        if($arr_length > 2) {
          echo 'To see more, click on GO TO CART<br><br>';
        }
      } else {
        echo '<br><br>Your cart is empty<br><br>';
      }
    ?>
    <a href="../cart"><button class="btn-addcart">GO TO CART</button></a>
    <?php if(!empty($_SESSION['cart'])){ ?>
      <a href="../checkout"><button class="btn-addcart">CHECKOUT</button></a>
    <?php }?>
  </div>
</div>
