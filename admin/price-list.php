<!DOCTYPE html>
<html>
  <?php
    include '../head.php';
    include '../path.php';
    include '../dbconn.php';
  ?>
  <link rel="stylesheet" type="text/css" href="admin.css">
  <body>
    <section>
      <header class="header-center">
        <div class="index-topnav-centered">
          <a href=<?php echo $root_path ?> class="index-logo">SE PA TU</a>
        </div>
        <?php
          session_start();

          $actual_link = "http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
          if ($actual_link != "http://localhost" . $root_path .  "/admin/admin-login.php") {
            $_SESSION['admin-history'] = $actual_link;
          }

          if (!isset($_SESSION['admin'])) {
            header('Location: ' . $root_path . '/admin/admin-login.php');
          }

        ?>
      </header>
    </section>
    <div class="content-wrapper">
      <div class="admin-content">
        <div class="admin-nav">
          <ul>
            <li><a href=<?php echo $root_path .'/admin' ?>>Inventory</a></li>
            <li><a class="active" href=<?php echo $root_path .'/admin/price-list.php' ?>>Price list</a></li>
            <li><a href=<?php echo $root_path .'/admin/sales.php' ?>>Sales</a></li>
            <li><a href=<?php echo $root_path .'/admin/admin-signout.php' ?>>SIGN OUT</a></li>
          </ul>

          <div style="margin-left:20%;padding:1px 16px;">
            <h2>Price list</h2>

            <?php

              $product_query = "SELECT id, name, price, gender FROM products";
              $product_result = mysqli_query($conn, $product_query);

              echo '<table id="inventory">';
              echo '
                      <tr>
                        <th>Product name</th>
                        <th>Price</th>
                        <th>Gender</th>
                        <th>Edit</th>
                      </tr>
                  ';
              if(mysqli_num_rows($product_result) > 0) {
                $row = 0;
                while($product_row = mysqli_fetch_assoc($product_result)) {
                  echo '
                    <tr>
                      <td>' . ucwords($product_row['name']) . '</td>
                      <td>' . $product_row['price'] . '</td>
                      <td>' . $product_row['gender'] . '</td>
                      <td><a href="' . $_SESSION['admin-history'] . '&inventory_id=' . $product_row['id'] .'&size=' . $product_row['name']. '&stock=' . $product_row['price']. '"><img src="../assets/pictures/edit/edit.png" alt="edit" width="20px"></a></td>
                    </tr>
                  ';
                  $row ++;
                }
              }

              echo '</table>';
            ?>
          </div>
        </div>
      </div>
    </div>
    <?php include '../common/footer.php'?>
  </body>
</html>
