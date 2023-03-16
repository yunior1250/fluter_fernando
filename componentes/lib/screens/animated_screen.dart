import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  const AnimatedScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double _width = 50;
  double _height = 50;
  Color _color = Colors.orange;
  BorderRadiusGeometry _borderRadius= new BorderRadius.circular(10);

  void changeShape(){
    final randon = Random();
    
    _width  = randon.nextInt(300).toDouble()+70;
    _height  = randon.nextInt(300).toDouble()+70;
    _color = Color.fromRGBO(
      randon.nextInt(255),
       randon.nextInt(255),
        randon.nextInt(255),
         1
         );
    _borderRadius = BorderRadius.circular(randon.nextInt(100).toDouble()+10);

    setState(() {
      
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AnimatedContainer"),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOutCubic,
          width: _width,
          height: _height,
          decoration: BoxDecoration(
              color: _color, 
              borderRadius: _borderRadius
              ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_circle_outline),
        onPressed: changeShape
      ),
    );
  }
}
