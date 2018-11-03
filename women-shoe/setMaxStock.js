
// let maxVal = js_stock[0]['quantity'];
// console.log('maxVal 0 : ' , maxVal);
// let quantity = 1;
// let inputsize= js_stock[0]['size'];
// document.getElementById("quantity").max = maxVal;
// function getSize(){
//   let inputsize = document.getElementById('size').value;
//   console.log('inputsize: ' , inputsize);
//   let inputquantity = parseInt(document.getElementById('quantity').value,10);
//   console.log('inputquantity: ' , inputquantity, 'type: ', typeof(inputquantity));
//   function getVal(input, key) {
//       for (var i=0; i < input.length ; ++i){
//           if(input[i]['size'] == key){
//             return input[i]['quantity'];
//           }
//       }
//   }
//   let maxVal = parseInt(getVal(js_stock, inputsize),10);
//   console.log('maxVal: ' , maxVal , 'type: ', typeof(maxVal));
//   document.getElementById("quantity").max = maxVal;
//   if(inputquantity > maxVal){
//     console.log('inputquantity > maxVal');
//     document.getElementById('quantity').value=maxVal;
//   }else{
//     console.log('inputquantity <= maxVal');
//     document.getElementById('quantity').value = inputquantity;
//   }
// }



let maxVal = parseInt(js_stock[0]['quantity'],10);
// console.log('maxVal 0 : ' , maxVal);
let quantity = 1;
let inputsize= parseInt(js_stock[0]['size'],10);
document.getElementById("quantity").max = maxVal;
function getSize(){
  let inputsize = parseInt(document.getElementById('size').value,10);
  // console.log('inputsize: ' , inputsize);
  let inputquantity = parseInt(document.getElementById('quantity').value,10);
  // console.log('inputquantity: ' , inputquantity, 'type: ', typeof(inputquantity));
  function getVal(input, key) {
      for (var i=0; i < input.length ; ++i){
          if(input[i]['size'] == key){
            return input[i]['quantity'];
          }
      }
  }
  let maxVal = parseInt(getVal(js_stock, inputsize),10);
  // console.log('maxVal: ' , maxVal , 'type: ', typeof(maxVal));
  document.getElementById("quantity").max = maxVal;
  if(inputquantity > maxVal){
    // console.log('inputquantity > maxVal');
    document.getElementById('quantity').value=maxVal;
  }else{
    // console.log('inputquantity <= maxVal');
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
