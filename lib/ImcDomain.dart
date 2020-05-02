

import 'dart:math';

class IMC{
   static String Calculate(double weigth, double height) {

     double imc = weigth / pow(height, 2);

     if(imc < 18.6){
       return "Abaixo do peso (${imc}";
     } else if(imc >= 18.6 && imc < 24.9){
       return "Abaixo do peso (${imc}";
     } else if(imc >= 24.9 && imc < 29.9){
       return "Levemente acima do peso (${imc}";
     } else if(imc >= 29.9 && imc < 34.9){
       return "Obesidade Grau I (${imc}";
     }  else if(imc >= 34.9 && imc < 39.9){
       return "Obesidade Grau II (${imc}";
     } else if(imc >= 40){
       return "Obesidade Grau III (${imc}";
     }
   }
}