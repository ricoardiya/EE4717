<!DOCTYPE html>
<html>
  <?php
    include '../head.php'
    include '.dbconn.php'
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
          filter
          <br>
          Type
          <ul>
            <li>Captoe</li>
            <li>Boots</li>
            <li>Longwing</li>
            <li>Loafers</li>
            <li>Derby</li>
            <li>Oxford</li>
          </ul>
        </div>
        <div class="catalog">

        </div>
      </div>
    </div>
    <?php include  '../common/footer.php'?>
  </body>
</html>
