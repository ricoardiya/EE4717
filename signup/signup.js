function checkFirstName(event) {
  var myName = event.currentTarget;
  var testFirstName = /^[A-Za-z\s]+$/.test(myName.value);

  if (!myName.value. replace(/\s/g, '').length) {
    document.getElementById('firstname-message').style.color = 'red';
    document.getElementById('firstname-message').innerHTML = 'this field cannot contain only whitespace';
    document.getElementById('fname').placeholder = '';
    document.getElementById("fname").value = '';

    myName.focus();
    myName.select();
    return false;
  }
  if (testFirstName == false) {
    document.getElementById('firstname-message').style.color = 'red';
    document.getElementById('firstname-message').innerHTML = 'wrong format';
    document.getElementById('fname').placeholder = '';
    document.getElementById("fname").value = '';

    myName.focus();
    myName.select();
    return false;

  } else {
    document.getElementById('firstname-message').innerHTML = '';
  }
}

function checkLastName(event) {
  var myName = event.currentTarget;
  var testLastName = /^[A-Za-z\s]+$/.test(myName.value);

  if (!myName.value. replace(/\s/g, '').length) {
    document.getElementById('lastname-message').style.color = 'red';
    document.getElementById('lastname-message').innerHTML = 'this field cannot contain only whitespace';
    document.getElementById('lname').placeholder = '';
    document.getElementById("lname").value = '';

    myName.focus();
    myName.select();
    return false;
  }

  if (testLastName == false) {
    document.getElementById('lastname-message').style.color = 'red';
    document.getElementById('lastname-message').innerHTML = 'wrong format';
    document.getElementById('lname').placeholder = '';
    document.getElementById("lname").value = '';

    myName.focus();
    myName.select();
    return false;

  } else {
    document.getElementById('lastname-message').innerHTML = '';
  }
}

function checkEmail(event) {
  var myEmail = event.currentTarget;
  var testEmail = /^[\w.-]+@([\w]+\.){1,3}[\w]{2,3}$/.test(myEmail.value);

  if (!myEmail.value. replace(/\s/g, '').length) {
    document.getElementById('email-message').style.color = 'red';
    document.getElementById('email-message').innerHTML = 'this field cannot contain only whitespace';
    document.getElementById('email').placeholder = '';
    document.getElementById('email').value = '';
    myEmail.focus();
    myEmail.select();
    return false;
  }

  if (testEmail == false) {
    document.getElementById('email-message').style.color = 'red';
    document.getElementById('email-message').innerHTML = 'wrong format';
    document.getElementById('email').placeholder = '';
    document.getElementById('email').value = '';
    myEmail.focus();
    myEmail.select();
    return false;

  } else {
    document.getElementById('email-message').innerHTML = '';
  }
}

function checkPhone(event) {
  var phone = event.currentTarget;

  if (!phone.value. replace(/\s/g, '').length) {
    document.getElementById('phone-message').style.color = 'red';
    document.getElementById('phone-message').innerHTML = 'this field cannot contain only whitespace';
    document.getElementById('phone').placeholder = '';
    document.getElementById("phone").value = '';

    phone.focus();
    phone.select();
    return false;
  }
  let regex = /^\d{4}(?:[\s]*\d{4})$/; //allowed pattern (9123 2323) or (91232323) only
  if (regex.test(phone.value)){
    document.getElementById('phone-message').style.color = 'green';
    document.getElementById('phone-message').innerHTML = 'correct';
    return true;
  }else{
    document.getElementById('phone-message').style.color = 'red';
    document.getElementById('phone-message').innerHTML = 'incorrect phone';
    return false;
  }
}

function checkAddress(event) {
  var address = event.currentTarget;

  if (!address.value. replace(/\s/g, '').length) {
    document.getElementById('address-message').style.color = 'red';
    document.getElementById('address-message').innerHTML = 'this field cannot contain only whitespace';
    document.getElementById('address').placeholder = '';
    document.getElementById('address').value = '';

    address.focus();
    address.select();
    return false;
  } else {
    document.getElementById('address-message').innerHTML = '';
  }
}

function checkRepassword() {
  if (document.getElementById('password').value ==
    document.getElementById('repassword').value) {
    document.getElementById('repassword-message').style.color = 'green';
    document.getElementById('repassword-message').innerHTML = 'matched';
  } else {
    document.getElementById('repassword-message').style.color = 'red';
    document.getElementById('repassword-message').innerHTML = 'not matched';
  }
}

function checkError() {
  if (document.getElementById('repassword-message').innerHTML == 'not matched') {
    return false;
  }
}
