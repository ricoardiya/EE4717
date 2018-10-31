function checkFirstName(event) {
    var myName = event.currentTarget;
    var pos = myName.value.search(/^[A-Za-z\s][A-Za-z\s]*$/);

    if (!myName.value. replace(/\s/g, '').length) {
      document.getElementById('firstname-message').style.color = 'red';
      document.getElementById('firstname-message').innerHTML = 'this field cannot contain only whitespace';
      document.getElementById('fname').placeholder = '';
      document.getElementById("fname").value = '';
      myName.focus();
      myName.select();
      return false;
    }
    if (pos == -1) {
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
  var pos = myName.value.search(/^[A-Za-z\s][A-Za-z\s]*$/);

  if (!myName.value. replace(/\s/g, '').length) {
    document.getElementById('lastname-message').style.color = 'red';
    document.getElementById('lastname-message').innerHTML = 'this field cannot contain only whitespace';
    document.getElementById('lname').placeholder = '';
    document.getElementById("lname").value = '';

    myName.focus();
    myName.select();
    return false;
  }

  if (pos == -1) {
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
  var pos = myEmail.value.search(/^[\w.-]+@([\w]+\.){1,3}[\w]{2,3}$/);

  if (!myEmail.value. replace(/\s/g, '').length) {
    document.getElementById('email-message').style.color = 'red';
    document.getElementById('email-message').innerHTML = 'this field cannot contain only whitespace';
    document.getElementById('email').placeholder = '';
    document.getElementById('email').value = '';
    myEmail.focus();
    myEmail.select();
    return false;
  }

  if (pos == -1) {
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
