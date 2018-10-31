<?php
Session_start();
unset($_SESSION['cart']);

header('Location: ' . $_SESSION['history'] . '');
?>
