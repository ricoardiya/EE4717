<!DOCTYPE html>
<html>
  <?php
      include ('../head.php');
      include ('../dbconn.php');
      $women_catalog_css = "/ee4717/women-catalog/women-catalog.css";
      echo '<link rel="stylesheet" type="text/css" media="screen" href=' . $women_catalog_css . '  />';
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
          for($x=28; $x<=49; $x++){
            // $query= "SELECT * FROM pictures WHERE productID = '.$x.'";
            $query= "SELECT * FROM pictures WHERE productID = $x";
            $result = mysqli_query($conn, $query);
            if (mysqli_num_rows($result) > 0) {
              $row = mysqli_fetch_assoc($result);
              echo '
                <div class="card">
                  <img src="../'. $row['pictureURL'] .'" alt="Avatar" style="width:100%">
              ';
            }
            else {
                echo "An error has occured. The item was not retrieved";
            }
            $query = "SELECT * FROM products WHERE id = $x";
            $result = mysqli_query($conn, $query);
            if (mysqli_num_rows($result) > 0) {
                $row = mysqli_fetch_assoc($result);
                echo '
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
            else {
              echo "An error has occured. The item was not retrieved";
            }
        }
      ?>
    </div>
  </div>
  <?php include  '../common/footer.php'?>
</body>
</html>
