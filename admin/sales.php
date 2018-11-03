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
            <li><a href=<?php echo $root_path .'/admin/price-list.php' ?>>Price list</a></li>
            <li><a class="active" href=<?php echo $root_path .'/admin/sales.php' ?>>Sales</a></li>
            <li><a href=<?php echo $root_path .'/admin/admin-signout.php' ?>>SIGN OUT</a></li>
          </ul>

          <div style="margin-left:20%;padding:1px 16px;">
            <h2>Sales</h2>
            <?php
              $quantity_query = "SELECT products.name, SUM(orders.quantity) AS total_quantity
                                  FROM orders
                                  JOIN products ON orders.productID = products.id
                                  GROUP BY productID";

              $quantity_result = mysqli_query($conn, $quantity_query);

              echo '<table id="inventory">';
              echo '
                      <tr>
                        <th>Product name</th>
                        <th>Total quantity sold</th>
                      </tr>
                  ';
              if(mysqli_num_rows($quantity_result) > 0) {
                while($quantity_row = mysqli_fetch_assoc($quantity_result)) {
                  echo '
                    <tr>
                      <td>' . ucwords($quantity_row['name']) . '</td>
                      <td>' . $quantity_row['total_quantity'] . '</td>
                    </tr>
                  ';
                }
              }

              echo '</table>';

              $total_quantity_query = "SELECT SUM(orders.quantity) AS total_quantity
                                        FROM orders
                                        JOIN products ON orders.productID = products.id";

              $total_quantity_result = mysqli_query($conn, $total_quantity_query);

              echo '<br><br>';

              if(mysqli_num_rows($total_quantity_result) > 0) {
                $total_quantity_row = mysqli_fetch_assoc($total_quantity_result);
              }
              echo '<h2>Total pairs sold : ' . $total_quantity_row['total_quantity'] . '</h2>';

              $total_revenue_query = "SELECT SUM(totalPrice) AS total_revenue FROM transactions";

              $total_revenue_result = mysqli_query($conn, $total_revenue_query);

              if(mysqli_num_rows($total_revenue_result) > 0) {
                $total_revenue_row = mysqli_fetch_assoc($total_revenue_result);
              }
              echo '<h2>Total revenue : $ ' . $total_revenue_row['total_revenue'] . '</h2>';

              echo '<br>';
            ?>
          </div>
        </div>
      </div>
    </div>
    <?php include '../common/footer.php'?>
  </body>
</html>
