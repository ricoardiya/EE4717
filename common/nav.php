<?php
  session_start();
  // Setting history on all pages except login page and signup page
  $actual_link = "http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
  if ($actual_link != 'http://localhost/ee4717/login/' && $actual_link != 'http://localhost/ee4717/signup/') {
    $_SESSION['history'] = $actual_link;
  }
  //for cart
  class buy_item{
    public $productID;
    public $quantity;
    public $size;
  }
  if(isset($_POST['productID']) && isset($_POST['size']) && isset($_POST['quantity'])){
    $item = new buy_item();
    $item->productID = $_POST['productID'];
    $item->quantity = $_POST['quantity'];
    $item->size = $_POST['quantity'];
    if(!isset($_SESSION['cart'])){
      $_SESSION['cart'] = array();
      array_push($_SESSION['cart'], $item);
    }
    array_push($_SESSION['cart'], $item);
  }

?>
<section>
  <header class="header-center">
    <ul>
      <?php
        $men_path = "/ee4717/men-catalog";
        $home_path = "/ee4717";
        $women_path = "/ee4717/women-catalog";

        echo '<li><a class="option" href=' . $men_path . '>Men</a></li>';
        echo '<li><a class="logo" href=' . $home_path. '>SE PA TU</a></li>';
        echo '<li><a class="option" href=' . $women_path. '>Women</a></li>';
      ?>
    </ul>
    <?php
      if(isset($_SESSION['firstname'])) {
        echo '
        <div class="topnav-right">
          Hi, ' . $_SESSION['firstname'] . ' !
          <a class="login" href="/ee4717/common/signout.php">SIGN OUT</a>
        </div>
        ';
      } else {
        echo '
        <div class="topnav-right">
          <a href="/ee4717/signup">Become a member</a>
          <a class="login" href="/ee4717/login">LOG IN</a>
        </div>
        ';
      }
    ?>
  </header>
</section>
