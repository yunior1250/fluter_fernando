import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home'),
      ),
      body: const Center(
        child: Text(
          'HomeScreen',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
