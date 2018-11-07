function getQuantity(){
  let inputquantity = parseInt(document.getElementById('selected_quantity').value,10);
  let inputsize = parseInt(document.getElementById('selected_size').value,10);
  let prodID = parseInt(document.getElementById('selected_productID').value,10);
  let minVal = 1;
  function getVal(input, size, prodID) {
      for (let i=0; i < input.length ; i++){
        if(parseInt(input[i]['size'],10) == size && parseInt(input[i]['id'],10) == prodID){
          return input[i]['quantity'];
        }
      }
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
  function getVal(input, size, prodID) {
      for (let i=0; i < input.length ; i++){
        if(parseInt(input[i]['size'],10) == size && parseInt(input[i]['id'],10) == prodID){
          return input[i]['quantity'];
        }
      }
      return 0;
  }
  let inputquantity = parseInt(document.getElementById('selected_quantity').value,10);
  let maxVal = parseInt(getVal(js_shoes, inputsize, prodID),10);
  document.getElementById("selected_quantity").max = maxVal;
  if(inputquantity > maxVal){
    document.getElementById('selected_quantity').value=maxVal;
  }else{
    document.getElementById('selected_quantity').value = inputquantity;
  }
}
