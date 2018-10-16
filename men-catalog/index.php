<!DOCTYPE html>
<html>
  <?php include '../head.php' ?>
  <link rel="stylesheet" type="text/css" href="men-catalog.css">
  <body>
    <?php
      $path = $_SERVER['DOCUMENT_ROOT'];
      $path .= "/ee4717/common/nav.php";
      include $path;
    ?>
    <div class="content-wrapper">
      <div class="content">
        <div class="filter">
          filter
          <br>
          type
          <br>

        </div>
        <div class="catalog">
          this is men catalog page
        </div>
      </div>
    </div>
    <?php include  '../common/footer.php'?>
  </body>
</html>
