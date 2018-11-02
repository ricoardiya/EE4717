function checkFirstNameShipping(event) {
  var myName = event.currentTarget;
  var pos = myName.value.search(/^[A-Za-z\s][A-Za-z\s]*$/);

  if (!myName.value. replace(/\s/g, '').length) {
    document.getElementById('firstname-message-shipping').style.color = 'red';
    document.getElementById('firstname-message-shipping').innerHTML = 'this field cannot contain only whitespace';
    document.getElementById('fname_shipping').placeholder = '';
    document.getElementById("fname_shipping").value = '';

    myName.focus();
    myName.select();
    return false;
  }
  if (pos == -1) {
    document.getElementById('firstname-message-shipping').style.color = 'red';
    document.getElementById('firstname-message-shipping').innerHTML = 'wrong format';
    document.getElementById('fname_shipping').placeholder = '';
    document.getElementById("fname_shipping").value = '';

    myName.focus();
    myName.select();
    return false;

  } else {
    document.getElementById('firstname-message-shipping').innerHTML = '';
  }
}

function checkLastNameShipping(event) {
  var myName = event.currentTarget;
  var pos = myName.value.search(/^[A-Za-z\s][A-Za-z\s]*$/);

  if (!myName.value. replace(/\s/g, '').length) {
    document.getElementById('lastname-message-shipping').style.color = 'red';
    document.getElementById('lastname-message-shipping').innerHTML = 'this field cannot contain only whitespace';
    document.getElementById('lname_shipping').placeholder = '';
    document.getElementById("lname_shipping").value = '';

    myName.focus();
    myName.select();
    return false;
  }

  if (pos == -1) {
    document.getElementById('lastname-message-shipping').style.color = 'red';
    document.getElementById('lastname-message-shipping').innerHTML = 'wrong format';
    document.getElementById('lname_shipping').placeholder = '';
    document.getElementById("lname_shipping").value = '';

    myName.focus();
    myName.select();
    return false;

  } else {
    document.getElementById('lastname-message-shipping').innerHTML = '';
  }
}

function checkEmailShipping(event) {
  var myEmail = event.currentTarget;
  var pos = myEmail.value.search(/^[\w.-]+@([\w]+\.){1,3}[\w]{2,3}$/);

  if (!myEmail.value. replace(/\s/g, '').length) {
    document.getElementById('email-message-shipping').style.color = 'red';
    document.getElementById('email-message-shipping').innerHTML = 'this field cannot contain only whitespace';
    document.getElementById('email_shipping').placeholder = '';
    document.getElementById('email_shipping').value = '';
    myEmail.focus();
    myEmail.select();
    return false;
  }

  if (pos == -1) {
    document.getElementById('email-message-shipping').style.color = 'red';
    document.getElementById('email-message-shipping').innerHTML = 'wrong format';
    document.getElementById('email_shipping').placeholder = '';
    document.getElementById('email_shipping').value = '';
    myEmail.focus();
    myEmail.select();
    return false;

  } else {
    document.getElementById('email-message-shipping').innerHTML = '';
  }
}

function checkPhoneShipping(event) {
  var phone = event.currentTarget;
  if (!phone.value. replace(/\s/g, '').length) {
    document.getElementById('phone-message-shipping').style.color = 'red';
    document.getElementById('phone-message-shipping').innerHTML = 'this field cannot contain only whitespace';
    document.getElementById('phone_shipping').placeholder = '';
    document.getElementById("phone_shipping").value = '';

    phone.focus();
    phone.select();
    return false;
  }
  let regex = /^\d{4}(?:[\s]*\d{4})$/; //allowed pattern (9123 2323) or (91232323) only
  if (regex.test(phone.value)){
    document.getElementById('phone-message-shipping').style.color = 'green';
    document.getElementById('phone-message-shipping').innerHTML = 'correct';
    return true;
  }else{
    document.getElementById('phone-message-shipping').style.color = 'red';
    document.getElementById('phone-message-shipping').innerHTML = 'incorrect phone';
    document.getElementById('phone_shipping').placeholder = '';
    document.getElementById("phone_shipping").value = '';
    return false;
  }
}

function checkAddressShipping(event) {
  var address = event.currentTarget;
  if (!address.value. replace(/\s/g, '').length) {
    document.getElementById('address-message-shipping').style.color = 'red';
    document.getElementById('address-message-shipping').innerHTML = 'this field cannot contain only whitespace';
    document.getElementById('address_shipping').placeholder = '';
    document.getElementById('address_shipping').value = '';

    address.focus();
    address.select();
    return false;
  } else {
    document.getElementById('address-message-shipping').innerHTML = '';
  }
}

function checkZipCodeShipping(event) {
  var zipCode = event.currentTarget;
  if (!zipCode.value. replace(/\s/g, '').length){
    document.getElementById('zipCode-message-shipping').style.color = 'red';
    document.getElementById('zipCode-message-shipping').innerHTML = 'this field cannot contain only whitespace';
    document.getElementById('zipCode_shipping').placeholder = '';
    document.getElementById('zipCode_shipping').value = '';
    address.focus();
    address.select();
    return false;
  }
  let regex = /^\d{6}$/;
  if (regex.test(zipCode.value)){
    document.getElementById('zipCode-message-shipping').style.color = 'green';
    document.getElementById('zipCode-message-shipping').innerHTML = 'correct';
    return true;
  }else{
    document.getElementById('zipCode-message-shipping').style.color = 'red';
    document.getElementById('zipCode-message-shipping').innerHTML = 'incorrect Zip Code';
    document.getElementById('zipCode_shipping').placeholder = '';
    document.getElementById('zipCode_shipping').value = '';
    return false;
  }
}

function checkFirstNameContact(event) {
  var myName = event.currentTarget;
  var pos = myName.value.search(/^[A-Za-z\s][A-Za-z\s]*$/);

  if (!myName.value. replace(/\s/g, '').length) {
    document.getElementById('firstname-message-contact').style.color = 'red';
    document.getElementById('firstname-message-contact').innerHTML = 'this field cannot contain only whitespace';
    document.getElementById('fname_contact').placeholder = '';
    document.getElementById("fname_contact").value = '';

    myName.focus();
    myName.select();
    return false;
  }
  if (pos == -1) {
    document.getElementById('firstname-message-contact').style.color = 'red';
    document.getElementById('firstname-message-contact').innerHTML = 'wrong format';
    document.getElementById('fname_contact').placeholder = '';
    document.getElementById("fname_contact").value = '';

    myName.focus();
    myName.select();
    return false;

  } else {
    document.getElementById('firstname-message-contact').innerHTML = '';
  }
}

function checkLastNameContact(event) {
  var myName = event.currentTarget;
  var pos = myName.value.search(/^[A-Za-z\s][A-Za-z\s]*$/);

  if (!myName.value. replace(/\s/g, '').length) {
    document.getElementById('lastname-message-contact').style.color = 'red';
    document.getElementById('lastname-message-contact').innerHTML = 'this field cannot contain only whitespace';
    document.getElementById('lname_contact').placeholder = '';
    document.getElementById("lname_contact").value = '';

    myName.focus();
    myName.select();
    return false;
  }

  if (pos == -1) {
    document.getElementById('lastname-message-contact').style.color = 'red';
    document.getElementById('lastname-message-contact').innerHTML = 'wrong format';
    document.getElementById('lname_contact').placeholder = '';
    document.getElementById("lname_contact").value = '';

    myName.focus();
    myName.select();
    return false;

  } else {
    document.getElementById('lastname-message-contact').innerHTML = '';
  }
}

function checkEmailContact(event) {
  var myEmail = event.currentTarget;
  var pos = myEmail.value.search(/^[\w.-]+@([\w]+\.){1,3}[\w]{2,3}$/);

  if (!myEmail.value. replace(/\s/g, '').length) {
    document.getElementById('email-message-contact').style.color = 'red';
    document.getElementById('email-message-contact').innerHTML = 'this field cannot contain only whitespace';
    document.getElementById('email_contact').placeholder = '';
    document.getElementById('email_contact').value = '';
    myEmail.focus();
    myEmail.select();
    return false;
  }

  if (pos == -1) {
    document.getElementById('email-message-contact').style.color = 'red';
    document.getElementById('email-message-contact').innerHTML = 'wrong format';
    document.getElementById('email_contact').placeholder = '';
    document.getElementById('email_contact').value = '';
    myEmail.focus();
    myEmail.select();
    return false;
  } else {
    document.getElementById('email-message-contact').innerHTML = '';
  }
}

function checkPhoneContact(event) {
  var phone = event.currentTarget;
  if (!phone.value. replace(/\s/g, '').length) {
    document.getElementById('phone-message-contact').style.color = 'red';
    document.getElementById('phone-message-contact').innerHTML = 'this field cannot contain only whitespace';
    document.getElementById('phone_contact').placeholder = '';
    document.getElementById("phone_contact").value = '';

    phone.focus();
    phone.select();
    return false;
  }
  let regex = /^\d{4}(?:[\s]*\d{4})$/; //allowed pattern (9123 2323) or (91232323) only
  if (regex.test(phone.value)){
    document.getElementById('phone-message-contact').style.color = 'green';
    document.getElementById('phone-message-contact').innerHTML = 'correct';
    return true;
  }else{
    document.getElementById('phone-message-contact').style.color = 'red';
    document.getElementById('phone-message-contact').innerHTML = 'incorrect phone';
    document.getElementById('phone_contact').placeholder = '';
    document.getElementById("phone_contact").value = '';
    return false;
  }
}

function checkAddressContact(event) {
  var address = event.currentTarget;
  if (!address.value. replace(/\s/g, '').length) {
    document.getElementById('address-message-shipping').style.color = 'red';
    document.getElementById('address-message-shipping').innerHTML = 'this field cannot contain only whitespace';
    document.getElementById('address_shipping').placeholder = '';
    document.getElementById('address_shipping').value = '';

    address.focus();
    address.select();
    return false;
  } else {
    document.getElementById('address-message-shipping').innerHTML = '';
  }
}
