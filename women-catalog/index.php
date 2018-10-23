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
          <form method="get" action="index.php">
            FILTERS
            <hr>
            Type
            <br>
            <input type="checkbox" name="type" value="" onchange="this.form.submit()"> All<br>
            <input type="checkbox" name="type" value="billy" onchange="this.form.submit()"> Billy<br>
            <input type="checkbox" name="type" value="elyssa" onchange="this.form.submit()"> Elyssa<br>
            <input type="checkbox" name="type" value="kelly" onchange="this.form.submit()"> Kelly<br>
            <input type="checkbox" name="type" value="ray" onchange="this.form.submit()"> Ray<br>
            <input type="checkbox" name="type" value="sienna" onchange="this.form.submit()"> Sienna<br>
            <input type="checkbox" name="type" value="terri" onchange="this.form.submit()"> Terri<br>
            <input type="checkbox" name="type" value="veronica" onchange="this.form.submit()"> Veronica<br>
            <hr>
            Color
            <br>
            <input type="checkbox" name="color" value="" onchange="this.form.submit()"> All<br>
            <input type="checkbox" name="color" value="black" onchange="this.form.submit()"> Black<br>
            <input type="checkbox" name="color" value="cognac" onchange="this.form.submit()"> Cognac<br>
            <input type="checkbox" name="color" value="silver" onchange="this.form.submit()"> Silver<br>
            <input type="checkbox" name="color" value="grey" onchange="this.form.submit()"> Grey<br>
            <input type="checkbox" name="color" value="red" onchange="this.form.submit()"> Red<br>
            <input type="checkbox" name="color" value="redwood" onchange="this.form.submit()"> Redwood<br>
            <input type="checkbox" name="color" value="tan" onchange="this.form.submit()"> Tan<br>
            <input type="checkbox" name="color" value="saddle" onchange="this.form.submit()"> Saddle<br>
          </form>
          <?php
            $type = '';
            $color = '';

            if (isset($_GET['type'])) {
              $type = $_GET['type'];
            }

            if (isset($_GET['color'])) {
              $color = $_GET['color'];
            }
          ?>
        </div>
        <div class="catalog">
          <div class="row">
            <?php
              $products_query = "SELECT * FROM products WHERE gender = 'W' AND `name` LIKE '%$type%' AND color LIKE '%$color%'";
              $products_result = mysqli_query($conn, $products_query);
              if (mysqli_num_rows($products_result) > 0) {
                while($products_row = mysqli_fetch_assoc($products_result)){
                  $picture_query = "SELECT * FROM pictures WHERE productID = ". $products_row['id'] . "";
                  $picture_result = mysqli_query($conn, $picture_query);
                  if (mysqli_num_rows($picture_result)) {
                    $picture_row = mysqli_fetch_assoc($picture_result);
                    echo '
                      <div class="col-3">
                        <div class="card">
                          <img src="../'. $picture_row['pictureURL'] .'" alt="shoes" style="width:100%">
                          <div>
                            <form method="get" action="../women-shoe">
                              <input type="hidden" id="productId" name="productID" value=' . $products_row['id'] . '>
                              <button type="submit" class="btn-shoename">' . ucwords($products_row['name']) . '</button>
                            </form>
                            <div id="price">$ '.$products_row['price'].'</div>
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
