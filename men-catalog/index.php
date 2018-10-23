<!DOCTYPE html>
<html>
  <?php
    include '../head.php';
    include '../dbconn.php';
  ?>
  <link rel="stylesheet" type="text/css" href="men-catalog.css">
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
            <input type="checkbox" name="type" value="boots" onchange="this.form.submit()"> Boots<br>
            <input type="checkbox" name="type" value="captoe" onchange="this.form.submit()"> Captoe<br>
            <input type="checkbox" name="type" value="derby" onchange="this.form.submit()"> Derby<br>
            <input type="checkbox" name="type" value="loafers" onchange="this.form.submit()"> Loafers<br>
            <input type="checkbox" name="type" value="longwing" onchange="this.form.submit()"> Longwing<br>
            <hr>
            Color
            <br>
            <input type="checkbox" name="color" value="" onchange="this.form.submit()"> All<br>
            <input type="checkbox" name="color" value="black" onchange="this.form.submit()"> Black<br>
            <input type="checkbox" name="color" value="brown" onchange="this.form.submit()"> Brown<br>
            <input type="checkbox" name="color" value="tan" onchange="this.form.submit()"> Tan<br>
            <input type="checkbox" name="color" value="whiskey" onchange="this.form.submit()"> Whiskey<br>
            <input type="checkbox" name="color" value="oxblood" onchange="this.form.submit()"> Oxblood<br>
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
              $products_query = "SELECT * FROM products WHERE gender = 'M' AND `name` LIKE '%$type%' AND color LIKE '%$color%'";
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
                            <form method="get" action="../men-shoe">
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
