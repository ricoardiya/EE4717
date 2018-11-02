let firstname_shipping = document.getElementById("fname_shipping");
let lastname_shipping = document.getElementById("lname_shipping");
let address_shipping = document.getElementById("address_shipping");
let zipCode_shipping = document.getElementById("zipCode_shipping");
let phone_shipping = document.getElementById("phone_shipping");
firstname_shipping.addEventListener("change", checkFirstNameShipping, false);
lastname_shipping.addEventListener("change", checkLastNameShipping, false);
address_shipping.addEventListener("change", checkAddressShipping, false);
zipCode_shipping.addEventListener("change", checkZipCodeShipping, false);
phone_shipping.addEventListener("change", checkPhoneShipping, false);

let firstname_contact = document.getElementById("fname_contact");
let lastname_contact = document.getElementById("lname_contact");
let email_contact = document.getElementById("email_contact");
let address_contact = document.getElementById("address_contact");
let phone_contact = document.getElementById("phone_contact");

firstname_contact.addEventListener("change", checkFirstNameContact, false);
lastname_contact.addEventListener("change", checkLastNameContact, false);
email_contact.addEventListener("change", checkEmailContact, false);
address_contact.addEventListener("change", checkAddressContact, false);
phone_contact.addEventListener("change", checkPhoneContact, false);


