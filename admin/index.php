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

          $product_query = "SELECT name FROM products";
          $product_result = mysqli_query($conn, $product_query);

          while($product_row = mysqli_fetch_assoc($product_result)){
            $product_php_array[] = $product_row['name'];
          }
        ?>
      </header>
    </section>
    <?php
      if(isset($_GET['inventory_id'])) {
        $link = substr($_SESSION['admin-history'], 0, strpos($_SESSION['admin-history'], "&"));
        echo '
        <div id="pop-up" class="modal">
          <div class="modal-content">
            <span class="close"><a href=' . $link . '>&times;</a></span>
            <div class="row form-content">
              <form action="update-inventory.php" method="POST">
                <input type="hidden" name="inventory_id" value=' . $_GET['inventory_id'] . '>
                <input type="hidden" name="redirect_link" value=' . $link . '>
                <table class="table-modal">
                  <tr>
                    <td>Name</td>
                    <td>:</td>
                    <td>' . ucwords($_GET['shoename']) . '</td>
                  </tr>
                  <tr>
                    <td>Size</td>
                    <td>:</td>
                    <td>' . $_GET['size'] . '</td>
                  </tr>
                  <tr>
                    <td>Stock</td>
                    <td>:</td>
                    <td><input type="number" value=' . $_GET['stock']. ' min=1 name="stock" id="stock"></td>
                  </tr>
                </table>
                <div>
                  <input class="btn-update" type="submit" value="UPDATE">
                </div>
              </form>
            </div>
          </div>
        </div>
        ';
      }

    ?>
    <div class="content-wrapper">
      <div class="admin-content">
        <div class="admin-nav">
          <ul>
            <li><a class="active" href=<?php echo $root_path .'/admin' ?>>Inventory</a></li>
            <li><a href=<?php echo $root_path .'/admin/price-list.php' ?>>Price list</a></li>
            <li><a href=<?php echo $root_path .'/admin/sales.php' ?>>Sales</a></li>
            <li><a href=<?php echo $root_path .'/admin/admin-signout.php' ?>>SIGN OUT</a></li>
          </ul>

          <div style="margin-left:20%;padding:1px 16px;">
            <h2>Inventory</h2>

              <div class="form-autocomplete">
                <form autocomplete="off" action="index.php" method="GET">
                  <input id="myInput" type="text" name="shoename" placeholder="Shoe name">
                  <input class="btn-submit" type="submit">
                </form>

              <script>
              function autocomplete(inp, arr) {
                var currentFocus;
                inp.addEventListener("input", function(e) {
                    var a, b, i, val = this.value;
                    closeAllLists();
                    if (!val) { return false;}
                    currentFocus = -1;
                    a = document.createElement("DIV");
                    a.setAttribute("id", this.id + "autocomplete-list");
                    a.setAttribute("class", "autocomplete-items");
                    this.parentNode.appendChild(a);
                    for (i = 0; i < arr.length; i++) {

                      if (arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {

                        b = document.createElement("DIV");

                        b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
                        b.innerHTML += arr[i].substr(val.length);

                        b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";

                        b.addEventListener("click", function(e) {

                            inp.value = this.getElementsByTagName("input")[0].value;

                            closeAllLists();
                        });
                        a.appendChild(b);
                      }
                    }
                });

                inp.addEventListener("keydown", function(e) {
                    var x = document.getElementById(this.id + "autocomplete-list");
                    if (x) x = x.getElementsByTagName("div");
                    if (e.keyCode == 40) {

                      currentFocus++;

                      addActive(x);
                    } else if (e.keyCode == 38) {

                      currentFocus--;

                      addActive(x);
                    } else if (e.keyCode == 13) {

                      e.preventDefault();
                      if (currentFocus > -1) {

                        if (x) x[currentFocus].click();
                      }
                    }
                });
                function addActive(x) {

                  if (!x) return false;

                  removeActive(x);
                  if (currentFocus >= x.length) currentFocus = 0;
                  if (currentFocus < 0) currentFocus = (x.length - 1);

                  x[currentFocus].classList.add("autocomplete-active");
                }
                function removeActive(x) {

                  for (var i = 0; i < x.length; i++) {
                    x[i].classList.remove("autocomplete-active");
                  }
                }
                function closeAllLists(elmnt) {

                  var x = document.getElementsByClassName("autocomplete-items");
                  for (var i = 0; i < x.length; i++) {
                    if (elmnt != x[i] && elmnt != inp) {
                      x[i].parentNode.removeChild(x[i]);
                    }
                  }
                }

                document.addEventListener("click", function (e) {
                    closeAllLists(e.target);
                });
              }


              <?php
                $product_js_array = json_encode($product_php_array);
                echo "var shoes = " . $product_js_array .";";
              ?>


              autocomplete(document.getElementById("myInput"), shoes);
              </script>
            </div>
            <?php

              if (isset($_GET['shoename'])) {
                $shoe_name = $_GET['shoename'];
                $inventory_query = "SELECT inventory.id, products.name, inventory.stock, inventory.size FROM inventory
                                    JOIN products ON inventory.productID = products.id WHERE products.name = '$shoe_name'";
                $inventory_result = mysqli_query($conn, $inventory_query);

                echo '<table id="inventory">';
                echo '
                        <tr>
                          <th>Product name</th>
                          <th>Size</th>
                          <th>Stock</th>
                          <th>Edit</th>
                        </tr>
                    ';
                if(mysqli_num_rows($inventory_result) > 0) {
                  $row = 0;
                  while($inventory_row = mysqli_fetch_assoc($inventory_result)) {
                    echo '
                      <tr>
                        <td>' . ucwords($inventory_row['name']) . '</td>
                        <td>' . $inventory_row['size'] . '</td>
                        <td>' . $inventory_row['stock'] . '</td>
                        <td><a href="' . $_SESSION['admin-history'] . '&inventory_id=' . $inventory_row['id'] .'&size=' . $inventory_row['size']. '&stock=' . $inventory_row['stock']. '"><img src="../assets/pictures/edit/edit.png" alt="edit" width="20px"></a></td>
                      </tr>
                    ';
                    $row ++;
                  }
                }

                echo '</table>';
              }
            ?>
          </div>
        </div>
      </div>
    </div>
    <?php include '../common/footer.php'?>
  </body>
</html>
