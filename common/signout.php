<?php
Session_start();
unset ($_SESSION["firstname"]);
unset ($_SESSION["lastname"]);
unset ($_SESSION["email"]);

header('Location: ' . $_SERVER['HTTP_REFERER']);
?>
