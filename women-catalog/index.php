<!DOCTYPE html>
<html>
  <?php
    include '../head.php';
    include '../dbconn.php';
  ?>
  <link rel="stylesheet" type="text/css" href="women-catalog.css">
  <body>
    <?php
      $path = $_SERVER['DOCUMENT_ROOT'];
      $path .= "/ee4717/common/nav.php";
      include $path;
    ?>
    <div class="content-wrapper">
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
          ?>
          <form method="get" action="index.php">
            FILTERS
            <hr>
            Type
            <br>
            <input type="checkbox" name="type[]" id="billy" value="billy" > Billy<br>
            <input type="checkbox" name="type[]" id="elyssa" value="elyssa" > Elyssa<br>
            <input type="checkbox" name="type[]" id="kelly" value="kelly" > Kelly<br>
            <input type="checkbox" name="type[]" id="ray" value="ray" > Ray<br>
            <input type="checkbox" name="type[]" id="sienna" value="sienna" > Sienna<br>
            <input type="checkbox" name="type[]" id="terri" value="terri" > Terri<br>
            <input type="checkbox" name="type[]" id="veronica" value="veronica" > Veronica<br>
            <hr>
            Color
            <br>
            <input type="checkbox" name="color[]" id="black" value="black" > Black<br>
            <input type="checkbox" name="color[]" id="cognac" value="cognac" > Cognac<br>
            <input type="checkbox" name="color[]" id="silver" value="silver" > Silver<br>
            <input type="checkbox" name="color[]" id="grey" value="grey" > Grey<br>
            <input type="checkbox" name="color[]" id="red" value="red" > Red<br>
            <input type="checkbox" name="color[]" id="redwood" value="redwood" > Redwood<br>
            <input type="checkbox" name="color[]" id="tan" value="tan" > Tan<br>
            <input type="checkbox" name="color[]" id="saddle" value="saddle" > Saddle<br>
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

              $products_query = "SELECT * FROM products WHERE gender = 'W' AND ( $type_sql ) AND ( $color_sql )";
              $products_result = mysqli_query($conn, $products_query);
              if (mysqli_num_rows($products_result) > 0) {
                while($products_row = mysqli_fetch_assoc($products_result)){
                  $picture_query = "SELECT * FROM pictures WHERE productID = ". $products_row['id'] . "";
                  $picture_result = mysqli_query($conn, $picture_query);
                  if (mysqli_num_rows($picture_result)) {
                    $picture_row = mysqli_fetch_assoc($picture_result);

                    if (!isset($_SESSION['name'])) {
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
                            <form method="get" action="../women-shoe">
                              <input type="hidden" id="productId" name="productID" value=' . $products_row['id'] . '>
                              <button type="submit" class="btn-shoename">' . ucwords($products_row['name']) . '</button>
                            </form>
                            ' . $render_price . '
                            <form action="">
                              <button type="submit" class="btn-addcart">ADD TO CART</button>
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
    <?php include  '../common/footer.php'?>
  </body>
</html>
