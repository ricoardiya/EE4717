<!DOCTYPE html>
<html>
    <?php
      include ('../head.php');
      include ('../dbconn.php');
      $men_catalog_css = "/ee4717/men-catalog/men-catalog.css";
      echo '<link rel="stylesheet" type="text/css" media="screen" href=' . $men_catalog_css . '  />';
    ?>
<body>
  <?php
    $path = $_SERVER['DOCUMENT_ROOT'];
    $path .= "/ee4717/common/nav.php";
    include $path;
  ?>
  <div class="content-wrapper">
    <div class="content">
      <?php
          $query = "SELECT * FROM products";
          $result = mysqli_query($conn, $query);

          if (mysqli_num_rows($result) > 0) {
            // output data of each row
            while($row = mysqli_fetch_assoc($result)) {
              echo '

                <div class="card">
                  <img src="../assets/pictures/men/boots-captoe-brogues-espresso-crazy-horse-leather/boots-captoe-brogues-espresso-crazy-horse-leather-1.jpg" alt="Avatar" style="width:100%">
                  <div class="container">
                    <h4><b>'.ucwords($row['name']).'</b></h4>
                    <p>'.ucwords($row['color']).'</p>
                    <p>'.$row['desc'].'</p>
                    <form action="">
                      <button type="submit">Add To Cart</button>
                    </form>
                  </div>
                  </div>
                <br><br><br>

                ';
              }
          }
          else {
              echo "An error has occured. The item was not retrieved";
          }
      ?>
    </div>
  </div>
  <?php include  '../common/footer.php'?>
</body>
</html>
