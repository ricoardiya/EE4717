function chkName(event) {
    var myName = event.currentTarget;
    var pos = myName.value.search(/^[A-Za-z\s][A-Za-z\s]*$/);

    if (!myName.value. replace(/\s/g, '').length) {
      alert("The field cannot contain only whitespace (" + myName.value +
            ")! \n");
        document.getElementById("fname").value = '';
        document.getElementById("lname").value = '';

        myName.focus();
        myName.select();
        return false;
    }
    if (pos == -1) {
    alert("The name you entered (" + myName.value +
            ") is not in the correct form. \n");
      document.getElementById("fname").value = '';
      document.getElementById("lname").value = '';

      myName.focus();
      myName.select();
      return false;

    }
}

function chkEmail(event) {
    var myEmail = event.currentTarget;
    var pos = myEmail.value.search(/^[\w.-]+@([\w]+\.){1,3}[\w]{2,3}$/);

    if (pos == -1) {
      alert("The email you entered (" + myEmail.value +
              ") is not in the correct form.");
      document.getElementById("email").value = '';
      myEmail.focus();
      myEmail.select();
      return false;
    }
}
