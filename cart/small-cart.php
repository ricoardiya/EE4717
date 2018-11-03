<div class="small-shopping-cart">
  <img src="../assets/pictures/cart/shopping-cart.png" alt="cart" width="30px">
  <div class="small-shopping-cart-content">
    <br>
    <b class="small-shopping-cart-header btnCenter" style="margin-top:10px;">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;
        YOUR CART
    </b>
    <?php
      $arr_length = empty($_SESSION['cart']) ? 0 : count($_SESSION['cart']);
      $cart_arr_length = $arr_length > 2 ? 2 : $arr_length;
      if(isset($_SESSION['cart']) && !empty($_SESSION['cart'])) {
        echo '<span class="spanCenter">';
        echo '<table>';
        echo '</span>';
        for ($i=0,$a=1; $i < $cart_arr_length; $i++, $a++){
            echo "<tr>";
            $products_query = "SELECT products.name, pictures.pictureURL, products.price FROM products INNER JOIN pictures ON products.id = pictures.productID WHERE products.id =". $_SESSION['cart'][$i]->productID. ";";
            $products_result = mysqli_query($conn, $products_query);
            if (mysqli_num_rows($products_result) > 0) {
              $products_row = mysqli_fetch_assoc($products_result);
              echo "<td><img src=\"../".$products_row['pictureURL']."\" alt='shoes' width='40px;' height='40px'></td>";
              echo "<td>".ucwords($products_row['name'])."</td>";
            }
            echo "<td>";
            echo 'x ' . $_SESSION['cart'][$i]->quantity;
            echo "</td>";
            echo "</tr>";
        }
        echo '</table>';

        if($arr_length > 2) {
          echo '<span class="btnCenter">';
          echo '<i>To see more, click on GO TO CART</i>';
          echo '</span>';
        }
      } else {
        echo '<span class="spanCenter"><br><br>';
        echo 'Your cart is empty';
        echo '</span>';
      }
    ?>
    <?php if(!empty($_SESSION['cart'])){ ?>
      <div class="btnCenter">
        <a href="../cart"><button class="btn-addSmallCart">GO TO CART</button></a>
        <a href="../checkout"><button class="btn-addSmallCart">CHECKOUT</button></a>
      </div>
    <?php } else { ?>
      <a href="../cart/">
        <br><br><br><br>
        <div class="btnCenter">
          <button class="btn-addSmallCart">GO TO CART</button>
        </div>
      </a>
    <?php } ?>
  </div>

</div>
