import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const fontSize30 = TextStyle(fontSize: 30);
    //variable , propiedad
    int counter = 10;

    return Scaffold(
      appBar: AppBar(
        title: const Text('encabesado'),
        elevation: 5.0,
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text('numero de clicks', style: fontSize30),
          Text('$counter', style: fontSize30),
        ]),
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          counter++;
          print('hola $counter');
        },
      ),
    );
  }
}
