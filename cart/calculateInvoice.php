
    function calculateDollar(){
      let total=0;
      for (i=0; i< <?php echo $arr_length; ?> ; i++){
          let q_field = "quantity-" + i;
          let s_field = "size-" + i;
          let quantity = document.getElementById(q_field).value;
          let size = document.getElementById(s_field).value;
          for(j=0; j < js_stock.length ; j++){
            if(js_stock[j]['row']== i){
              var price = js_stock[j]['price'];
              break;
            }
          }
          total = total + quantity*price;
      }
      document.getElementById('totalPrice').innerHTML = total;
      return total;
    }
