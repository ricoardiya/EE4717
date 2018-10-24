<!DOCTYPE html>
<html>
<body>
  <?php
    include '../head.php';
    include '../dbconn.php';
  ?>
  <link rel="stylesheet" type="text/css" href="men-shoe.css">
  <body>
    <!-- Include navbar -->
    <?php
      $path = $_SERVER['DOCUMENT_ROOT'];
      $path .= "/ee4717/common/nav.php";
      include $path;
    ?>
    <!-- GET productID from URL -->
    <?php
      $productID = $_GET['productID'];
    ?>
    <div class="content-wrapper">
      <div class="content-item">
        <div class="row">
          <a href="/ee4717/men-catalog/">< GO BACK TO MEN CATALOG</a>
        </div>
        <div class="row">
          <div class="col-6">
            <!-- Display picture -->
            <?php
              $pictures_query = "SELECT * FROM pictures WHERE productID = $productID";
              $pictures_result = mysqli_query($conn, $pictures_query);

              if (mysqli_num_rows($pictures_result)) {
                $picture_row = mysqli_fetch_assoc($pictures_result);
                echo '
                  <div class="container">
                    <img id="expandedImg" style="width:50%" src=../' . $picture_row['pictureURL'] . '>
                  </div>
                ';
              }

              $pictures_result = mysqli_query($conn, $pictures_query);

              echo '<div class="row">';

              if (mysqli_num_rows($pictures_result) > 0) {
                while($picture_row = mysqli_fetch_assoc($pictures_result)){
                  echo '
                    <div class="col">
                      <img src="../' . $picture_row['pictureURL'] . '" alt="shoes" onclick="openImg(this);" width="100%">
                    </div>
                  ';
                }
              }

              echo '</div>'
            ?>
          <script type="text/javascript" src="./display_image.js"></script>
          </div>
          <div class="col-6">
            <!-- Product description -->
            <?php
              $products_query = "SELECT * FROM products WHERE id = $productID";
              $products_result = mysqli_query($conn, $products_query);
              if (mysqli_num_rows($products_result) > 0) {
                $product_row = mysqli_fetch_assoc($products_result);

                echo '
                  <div class="shoe-name-item">' . ucwords($product_row['name']) . '</div>
                  <div class="description">' . $product_row['desc'] . '</div>
                  <hr>
                  <div id="price">PRICE &nbsp;$ ' . $product_row['price'] . '</div>
                  <hr>
                ';
              }
              else {
                  echo "An error has occured. The item was not retrieved";
              }
            ?>
            <div class="size">
              Choose your size:
              <select name="size">
                <?php
                  // query inventory of the product
                  $inventory_query = "SELECT * FROM inventory WHERE productID = $productID AND stock <> 0";
                  $inventory_result = mysqli_query($conn, $inventory_query);
                  if (mysqli_num_rows($inventory_result) > 0) {
                    while($inventory_row = mysqli_fetch_assoc($inventory_result)){
                      echo '
                        <option value="' . $inventory_row['size'] . '">'. $inventory_row['size'] .'</option>
                      ';
                    }
                  }
                ?>
              </select>
            </div>
            <hr>
            <button type="submit" class="btn-addcart">BUY NOW</button>
            <button type="submit" class="btn-addcart">ADD TO CART</button>
          </div>
        </div>
      </div>
    </div>
    <?php include  '../common/footer.php'?>
  </body>
</html>
