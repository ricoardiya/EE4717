var firstname = document.getElementById("fname");
var lastname = document.getElementById("lname");
var email = document.getElementById("email");

firstname.addEventListener("change", chkName, false);
lastname.addEventListener("change", chkName, false);
email.addEventListener("change", chkEmail, false);
