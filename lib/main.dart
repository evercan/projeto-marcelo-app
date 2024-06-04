import 'package:flutter/material.dart';
import 'package:namer_app/screens/tela1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
 
  @override
  Widget build(BuildContext context) {
      return const MaterialApp(
        home:Tela1(),
      );
  }
}


/* void main(){
  print("Hello world");
  Calculadora calc = new Calculadora();
  num somaValores = calc.somaDoisValores(10, 20);
  Tela display = new Tela();

 display.mostrarMensagem("Resultado:  ${somaValores}");
  
}
*/

