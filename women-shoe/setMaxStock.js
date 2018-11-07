let maxVal = parseInt(js_stock[0]['quantity'],10);
let quantity = 1;
let inputsize= parseInt(js_stock[0]['size'],10);
document.getElementById("quantity").max = maxVal;
function getSize(){
  let inputsize = parseInt(document.getElementById('size').value,10);
  let inputquantity = parseInt(document.getElementById('quantity').value,10);
  function getVal(input, key) {
      for (var i=0; i < input.length ; ++i){
          if(input[i]['size'] == key){
            return input[i]['quantity'];
          }
      }
  }
  let maxVal = parseInt(getVal(js_stock, inputsize),10);
  document.getElementById("quantity").max = maxVal;
  if(inputquantity > maxVal){
    document.getElementById('quantity').value=maxVal;
  }else{
    document.getElementById('quantity').value = inputquantity;
  }
}


function getQuantity(){
  let inputquantity = parseInt(document.getElementById('quantity').value,10);
  let inputsize = parseInt(document.getElementById('size').value,10);
  function getVal(input, key) {
    for (var i=0; i < input.length ; ++i){
        if(input[i]['size'] == key){
          return input[i]['quantity'];
        }
    }
  }
  let minVal = 1;
  if(inputquantity < minVal){
    document.getElementById('quantity').value = minVal;
  }
  let maxVal = parseInt(getVal(js_stock, inputsize),10);
  if(inputquantity > maxVal) {
    document.getElementById('quantity').value = maxVal;
  }
}
