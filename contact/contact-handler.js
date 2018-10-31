var firstname = document.getElementById("fname");
var lastname = document.getElementById("lname");
var email = document.getElementById("email");

firstname.addEventListener("change", checkFirstName, false);
lastname.addEventListener("change", checkLastName, false);
email.addEventListener("change", checkEmail, false);
