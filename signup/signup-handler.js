var firstname = document.getElementById("fname");
var lastname = document.getElementById("lname");
var email = document.getElementById("email");
var phone = document.getElementById("phone");
var address = document.getElementById("address");

firstname.addEventListener("change", checkFirstName, false);
lastname.addEventListener("change", checkLastName, false);
email.addEventListener("change", checkEmail, false);
phone.addEventListener("change", checkPhone, false);
address.addEventListener("change", checkAddress, false);
