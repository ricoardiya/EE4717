<!DOCTYPE html>
<html>
  <?php
    include '../head.php';
    include '../dbconn.php';
  ?>
  <link rel="stylesheet" type="text/css" href="men-catalog.css">
  <link rel="stylesheet" type="text/css" href="../cart/small-cart.css">
  <body>
    <?php
      $path = $_SERVER['DOCUMENT_ROOT'];
      $path .= "/ee4717/common/nav.php";
      include $path;
    ?>
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
            <hr>
            Type
            <br>
            <input type="checkbox" name="type[]" id="boots" value="boots"> Boots<br>
            <input type="checkbox" name="type[]" id="captoe" value="captoe"> Captoe<br>
            <input type="checkbox" name="type[]" id="derby" value="derby"> Derby<br>
            <input type="checkbox" name="type[]" id="loafers" value="loafers"> Loafers<br>
            <input type="checkbox" name="type[]" id="longwing" value="longwing"> Longwing<br>
            <hr>
            Color
            <br>
            <input type="checkbox" name="color[]" id="black" value="black"> Black<br>
            <input type="checkbox" name="color[]" id="brown" value="brown"> Brown<br>
            <input type="checkbox" name="color[]" id="tan" value="tan"> Tan<br>
            <input type="checkbox" name="color[]" id="whiskey" value="whiskey"> Whiskey<br>
            <input type="checkbox" name="color[]" id="oxblood" value="oxblood"> Oxblood<br>
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
            <div id="myModal" class="modal">
              <div class="modal-content">
              <span class="close" onclick="close()">&times;</span>
                  <div id="modal_name"></div>
                  <div id="modal_picture"></div>
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
                              <button id="'. $products_row['id'].'" class="btn-addcart" onclick="myFunction(this)">ADD TO CART</button>
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
        var modal = document.getElementById("myModal");
        var btn = document.getElementById("");
        var span = document.getElementsByClassName("close")[0];

        function myFunction(elem) {
            console.log(elem.id);

            // var newUrl= window.location.protocol +"//" + window.location.host + path + '?id=' + elem.id;
            var newUrl= 'http://localhost/ee4717/men-catalog?id=' + elem.id;

            console.log('newURL: ' , newUrl);
            window.history.pushState({path: newUrl}, '', newUrl);

            console.log(window.location.href);
            if (elem.id && document.getElementById("modal_name") && document.getElementById("modal_picture")){
              <?php
                if(!isset($_GET['id'])){
                  $id=$_GET['id'] ;
                }else{
                  $id=1;
                }

                $get_products = "SELECT pictures.pictureURL, products.name, products.price, products.desc FROM pictures INNER JOIN products ON pictures.productID = products.id WHERE products.id=$id";
                $products_result = mysqli_query($conn, $get_products);
                if (mysqli_num_rows($products_result) > 0) {
                  $products_row = mysqli_fetch_assoc($products_result);
                  echo '
                  document.getElementById("modal_name").innerHTML = "Product: '.$products_row['name'].'";
                  document.getElementById("modal_picture").innerHTML = "<img src=\"../'. $products_row['pictureURL'] .'\" alt=\"shoes\" style=\"height:50% width:50%\">";
                  ';
                }
              ?>
              modal.style.display = "block";
            }
        }
        function close() {
            if (document.getElementById("modal_name") && document.getElementById("modal_picture")){
              document.getElementById("modal_picture").outerHTML = "";
              document.getElementById("modal_name").innerHTML = "";
            }
            modal.style.display = "block";
        }
        span.onclick = function () {
            modal.style.display = "none";
        }
        window.onclick = function(event) {
            if (event.target == modal) {
              if (document.getElementById("modal_name") && document.getElementById("modal_picture")){
                document.getElementById("modal_picture").outerHTML = "";
                document.getElementById("modal_name").innerHTML = "";
              }
              modal.style.display = "block";
            }
        }
      </script>
    <?php include  '../common/footer.php'?>
  </body>
</html>
