<!DOCTYPE html>
<html>
    <?php include '../head.php' ?>
<body>
  <?php
    $path = $_SERVER['DOCUMENT_ROOT'];
    $path .= "/ee4717/common/nav.php";
    include $path;
  ?>
  <div class="content-wrapper">
    <div class="content">
      <div class="card">
        <img src="img_avatar.png" alt="Avatar" style="width:100%">
        <div class="container">
          <h4><b>John Doe</b></h4>
          <p>Architect & Engineer</p>
        </div>
      </div>
    </div>
  </div>
  <?php include  '../common/footer.php'?>
</body>
</html>
