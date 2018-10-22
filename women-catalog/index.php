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
          filter
        </div>
        <div class="catalog">
          <div class="row">
            <?php
              $products_query = "SELECT * FROM products WHERE gender = 'W'";
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
                            <div id="shoe-name">' . ucwords($products_row['name']) . '</div>
                            <div id="price">$ ' . $products_row['price'] . '</div>
                            <form action="">
                              <button type="submit" class="btn-addcart">Add To Cart</button>
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
