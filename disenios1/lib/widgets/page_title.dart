import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('dogo',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white)),
            SizedBox(height: 10,),
            Text('infraestructra de datos para la necesidad',style: TextStyle(fontSize: 16,color: Colors.white)),
          ],
        ),
      ),
    );
  }
}