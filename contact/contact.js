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
