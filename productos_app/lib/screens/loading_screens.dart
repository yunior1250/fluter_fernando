import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
   
  const LoadingScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('dodoria'),
      ),
      body: const Center(
         child:CircularProgressIndicator(
          color: Colors.deepOrange,
         )
      ),
    );
  }
}