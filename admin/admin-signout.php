<?php
include '../path.php';
Session_start();
unset ($_SESSION["admin"]);

header('Location: ' . $root_path . '/admin');
?>
