<!DOCTYPE html>
<html>
  <?php
    include '../head.php';
    include '../path.php';
    include '../dbconn.php';
    $nav_path = $_SERVER['DOCUMENT_ROOT'];
    $nav_path .= $root_path . "/common/nav.php";
    include $nav_path;
  ?>
  <link rel="stylesheet" type="text/css" href="men-catalog.css">
  <link rel="stylesheet" type="text/css" href="../cart/small-cart.css">
  <?php
    $shoes = array();
    class set{
      public $id;
      public $name;
      public $picture;
      public $size;
      public $quantity;
      public $price;
    }
    $query = "SELECT products.id, products.name, products.price, inventory.size, inventory.stock,  (SELECT pictures.pictureURL FROM pictures WHERE  products.id=pictures.productID LIMIT 1) as pictureURL FROM inventory  INNER JOIN products ON products.id=inventory.productID WHERE products.gender='M'";
    $result = mysqli_query($conn, $query);
    if (mysqli_num_rows($result) > 0) {
      while($row = mysqli_fetch_assoc($result)){
        $list = new set();
        $list->id = $row['id'];
        $list->name = ucwords($row['name']);
        $list->picture = $row['pictureURL'];
        $list->size = $row['size'];
        $list->quantity = $row['stock'];
        $list->price = $row['price'];
        array_push($shoes, $list);
      }
    }
    echo "<script>";
    echo " var js_shoes = ".json_encode($shoes) . ";";
    echo " console.log('var js_shoes = ',".json_encode($shoes) . ");";
    echo "</script>";
  ?>
  <body>
    <div class="content-wrapper">
      <div class="cart">
        <?php include '../cart/small-cart.php' ?>
      </div>
      <div class="content-catalog">
        <div class="filter">
          <?php
            $types = array('');
            $colors = array('');

            if (isset($_GET['type'])) {
              $types = $_GET['type'];
            }

            if (isset($_GET['color'])) {
              $colors = $_GET['color'];
            }
            if (isset($_GET['productID'])) {
              $pID = $_GET['productID'];
            }
          ?>
          <form method="get" action="index.php">
            FILTERS
            <hr><br>
            Type
            <br>
            <input type="checkbox" name="type[]" id="boots" value="boots"> Boots<br>
            <input type="checkbox" name="type[]" id="captoe" value="captoe"> Captoe<br>
            <input type="checkbox" name="type[]" id="derby" value="derby"> Derby<br>
            <input type="checkbox" name="type[]" id="loafers" value="loafers"> Loafers<br>
            <input type="checkbox" name="type[]" id="longwing" value="longwing"> Longwing<br>
            <br><br>
            Color
            <br>
            <input type="checkbox" name="color[]" id="black" value="black"> Black<br>
            <input type="checkbox" name="color[]" id="brown" value="brown"> Brown<br>
            <input type="checkbox" name="color[]" id="grey" value="grey"> Grey<br>
            <input type="checkbox" name="color[]" id="tan" value="tan"> Tan<br>
            <input type="checkbox" name="color[]" id="espresso" value="espresso"> Espresso<br>
            <input type="checkbox" name="color[]" id="whiskey" value="whiskey"> Whiskey<br>
            <input type="checkbox" name="color[]" id="oxblood" value="oxblood"> Oxblood<br>
            <br><br>
            <button type="submit" class="btn-addcart">SEARCH</button>
            <button type="reset" class="btn-addcart">CLEAR FILTER</button>
          </form>
        </div>
        <script type='text/javascript'>
          <?php
          $types_php_array = $types;
          $types_js_array = json_encode($types_php_array);
          echo 'var types_js_array = '. $types_js_array . ';
                if (types_js_array[0] != "") {
                  for(i = 0; i < types_js_array.length; i++ ) {
                    document.getElementById(types_js_array[i]).checked = true;
                  }
                };';

          $colors_php_array = $colors;
          $colors_js_array = json_encode($colors_php_array);
          echo 'var colors_js_array = '. $colors_js_array . ';
                if (colors_js_array[0] != "") {
                  for(i = 0; i < colors_js_array.length; i++ ) {
                    document.getElementById(colors_js_array[i]).checked = true;
                  }
                };';
          ?>
        </script>
        <div class="catalog">
          <div class="row">
            <div id="pop-up" class="modal">
              <div class="modal-content">
              <span class="close" onclick="close()">&times;</span>
                  <div class="row">
                    <div class="col-6" id="modal_picture"></div>
                    <div class="col-6 font-modal">
                      <div id="modal_name"></div>
                      <div id="modal_price"></div>
                      <form class="modal-form" action="./addToCart.php" method="POST">
                        <div id="modal_productID"></div>
                        <br>
                        <div id="modal_size">Select your size: <select name="selected_size" id="selected_size" onchange="getSize();"></select></div>
                        <div id="modal_quantity">Quantity: <input type="number" value=1 min=1 name="selected_quantity" id="selected_quantity" onchange="getQuantity();"></div>
                        <div id="modal_button"><button class="btn-addcart" onclick="addToCart()">ADD TO CART</button></div>
                      </form>
                    </div>
                  </div>
                </div>
            </div>
            <?php
              // convert array to string
              foreach($types as $type){
                $type_sql[] = 'name LIKE \'%'.$type.'%\'';
              }
              $type_sql = implode(" OR ", $type_sql);

              // convert array to string
              foreach($colors as $color){
                $color_sql[] = 'color LIKE \'%'.$color.'%\'';
              }
              $color_sql = implode(" OR ", $color_sql);
              $products_query = "SELECT * FROM products WHERE gender = 'M' AND ( $type_sql ) AND ( $color_sql )";
              $products_result = mysqli_query($conn, $products_query);
              if (mysqli_num_rows($products_result) > 0) {
                while($products_row = mysqli_fetch_assoc($products_result)){
                  $picture_query = "SELECT * FROM pictures WHERE productID = ". $products_row['id'] . "";
                  $picture_result = mysqli_query($conn, $picture_query);
                  if (mysqli_num_rows($picture_result)) {
                    $picture_row = mysqli_fetch_assoc($picture_result);

                    if (!isset($_SESSION['firstname'])) {
                      $render_price = '<div id="price">$ '.$products_row['price'].'</div>';
                    } else {
                      $render_price ='
                        <div id="price"><strike>$ ' . $products_row['price'] . '</strike></div>
                        <div id="price">$ ' . ceil($products_row['price'] * 0.8) . '</div>';
                    }

                    // <button id="'. $products_row['id'].'" class="btn-addcart" onclick="myFunction(this)">ADD TO CART</button> -- dibawah $render.price
                    echo '
                      <div class="col-3">
                        <div class="card">
                          <img src="../'. $picture_row['pictureURL'] .'" alt="shoes" style="width:100%">
                          <div>
                            <form method="get" action="../men-shoe">
                              <input type="hidden" id="productId" name="productID" value=' . $products_row['id'] . '>
                              <button type="submit" class="btn-shoename">' . ucwords($products_row['name']) . '</button>
                            </form>
                            ' . $render_price . '
                              <button id="'. $products_row['id'].'" class="btn-addcart" onclick="popup(this);">ADD TO CART</button>
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
        var modal = document.getElementById("pop-up");
        var span = document.getElementsByClassName("close")[0];

        function popup(elem){
          document.getElementById("selected_size").innerHTML = "";
          console.log('elem.id: ', elem.id);
          let prodID = elem.id;
          let btn = document.getElementById(elem.id);
          console.log('btn.id: ', btn.id);
          if(elem.id && btn.id && document.getElementById("modal_name") && document.getElementById("modal_price")){
            document.getElementById("modal_productID").innerHTML = "<input type='hidden' name='productID' id='selected_productID' value="+ prodID +">";
            for (var i=0; i < js_shoes.length ; i++){
              if(js_shoes[i]['id'] == btn.id){
                document.getElementById("modal_name").innerHTML = js_shoes[i]['name'] + "<br>";
                document.getElementById("modal_picture").innerHTML = "<img src=\"../" + js_shoes[i]['picture'] + "\" alt='shoes' width=50% style='margin:auto;'><br>";
                document.getElementById("modal_price").innerHTML = "PRICE $ " + js_shoes[i]['price']+ "<br>";
                document.getElementById("selected_size").innerHTML += "<option value=\"" + js_shoes[i]['size'] + "\">" + js_shoes[i]['size'] + "</option>";
                console.log( js_shoes[i]['id'] ,'avail size : ', js_shoes[i]['size']);
              }
            }
            modal.style.display = "block";
          }
          getSize();
        }
        function addToCart(){
          var inputsize = document.getElementById('selected_size').value;
          var inputsize = document.getElementById('selected_quantity').value;
        }
      </script>
    <?php
      include  '../common/footer.php';
      $men_shoe_catalog_handler = "/ee4717/men-catalog/setMaxStock.js";
      $men_shoe_catalog_function = "/ee4717/men-catalog/men-catalog.js";
      echo '<script type="text/javascript" src="'.$men_shoe_catalog_handler.'"></script>';
      echo '<script type="text/javascript" src="'.$men_shoe_catalog_function.'"></script>';
    ?>
  </body>
</html>
