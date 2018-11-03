function getQuantity(){
  let inputquantity = parseInt(document.getElementById('selected_quantity').value,10);
  let inputsize = parseInt(document.getElementById('selected_size').value,10);
  let prodID = parseInt(document.getElementById('selected_productID').value,10);
  let minVal = 1;
  function getVal(input, size, prodID) {
    console.log("inside fucnt inputsize: ", size, 'type: ' , typeof(size), 'productID: ', prodID,  typeof(prodID));
      for (let i=0; i < input.length ; i++){
        console.log("itteration ", i, 'id: ', parseInt(input[i]['id'],10), 'size: ', parseInt(input[i]['size'],10), 'stock: ', parseInt(input[i]['quantity'],10));
        if(parseInt(input[i]['size'],10) == size && parseInt(input[i]['id'],10) == prodID){
          console.log("found match!!!");
          return input[i]['quantity'];
        }
      }
      console.log("NOT found match!!!");
      return 0;
  }
  let maxVal = parseInt(getVal(js_shoes, inputsize, prodID),10);
  if(inputquantity < minVal){
    document.getElementById('selected_quantity').value = minVal;
  }
  if(inputquantity > maxVal) {
    document.getElementById('selected_quantity').value = maxVal;
  }
}

function getSize(){
  let inputsize = parseInt(document.getElementById('selected_size').value,10);
  let prodID = parseInt(document.getElementById('selected_productID').value,10);
  console.log("productID: ", prodID," inputsize ", inputsize);
  function getVal(input, size, prodID) {
    console.log("inside fucnt inputsize: ", size, 'type: ' , typeof(size), 'productID: ', prodID,  typeof(prodID));
      for (let i=0; i < input.length ; i++){
        console.log("itteration ", i, 'id: ', parseInt(input[i]['id'],10), 'size: ', parseInt(input[i]['size'],10), 'stock: ', parseInt(input[i]['quantity'],10));
        if(parseInt(input[i]['size'],10) == size && parseInt(input[i]['id'],10) == prodID){
          console.log("found match!!!");
          return input[i]['quantity'];
        }
      }
      console.log("NOT found match!!!");
      return 0;
  }
  let inputquantity = parseInt(document.getElementById('selected_quantity').value,10);
  let maxVal = parseInt(getVal(js_shoes, inputsize, prodID),10);
  console.log("max of: ", inputsize," is ", maxVal);
  document.getElementById("selected_quantity").max = maxVal;
  if(inputquantity > maxVal){
    console.log('inputquantity > maxVal');
    document.getElementById('selected_quantity').value=maxVal;
  }else{
    console.log('inputquantity <= maxVal');
    document.getElementById('selected_quantity').value = inputquantity;
  }
}
