function ButtonClick() {
  let x1 = document.getElementById("x1").value;
  let num1 = parseInt(x1);
 
  let x2 = document.getElementById("x2").value;
  let num2 = parseInt(x2);
  
  let rdVal;
  let elements = document.getElementsByName("rd");
  for (let i = 0; i < elements.length; i++) {
    if (elements[i].checked) {
      rdVal = elements[i].value;
    }
  }
  
	if (x1 == "" || x2 == "") {
    alert("Поля х1 и х2 должны быть заполнены!");
	}
	else if (Number.isNaN(num1) || Number.isNaN(num2)) {
    alert("В поля х1 и х2 должны быть введены числовые значения!");
	}
	else {
		if (num1 > num2) {
			  let temp=num1;
			  num1=num2;
			  num2=temp;
		}
	
    if (rdVal == "rd1") {
      sum=0;
	  for (let i = num1; i <= num2; i++) {
          sum += i;
      }
    
      let ResultDiv = document.getElementById("result");
      ResultDiv.innerHTML = "Сумма всех чисел от х1 до х2 = " + sum;
    }
	
    if (rdVal == "rd2") {
		let mult = 1;
      
        for (let i = num1; i <= num2; i++) {
          mult *= i;
        }
      
      let ResultDiv = document.getElementById("result");
      ResultDiv.innerHTML = "Произведение всех чисел от х1 до х2 = " + mult;
    }
	
    if (rdVal == "rd3") {
	  let simple = [];
      for (let i = (num1==1?2:num1); i <= num2; i++) {
		let isSimple = true;
		for(let j =2; j<i; j++){
			if (i%j ==0 ){
				isSimple=false;
				break;	
			}			
		}
		if (isSimple){
			simple.push(i)
		}
      }
      let ResultDiv = document.getElementById("result");
      ResultDiv.innerHTML = "Простые числа от х1 до х2: " + simple;
    }
  }
}

function CleanUp() {
  document.getElementById("x1").value = "";
  document.getElementById("x2").value = "";
}