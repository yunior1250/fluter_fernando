import 'package:dart_fernando/dart_fernando.dart' as dart_fernando;

void main(List<String> arguments) {
  
	print('Estamos a punto de pedir datos');
  
  httpGet('https://api.nasa.com/aliens').then( (data) {
    
    print( data );
    
  });
  
  
  print('Ultima línea');
}

Future<String> httpGet(String url) {
  
  return Future.delayed( new Duration( seconds: 4 ), () {
    return 'Hola Mundo';
  });
  
}
//funciones 
  
