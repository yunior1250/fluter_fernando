import 'dart:math';

import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    const boxDecoration = BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.center,
            stops: [
          0.2,
          0.8
        ],
            colors: [
          Color.fromARGB(255, 6, 99, 93),
          Color.fromARGB(255, 11, 66, 63)
        ]));
    return Stack(
      children: [
        Container(
          //oolor morado
          decoration: boxDecoration,
        ),
        //caja
        const Positioned(
          top: -100,
          left: -30,
          child: _PinkBox(),
        )
      ],
    );
  }
}

class _PinkBox extends StatelessWidget {
  const _PinkBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi / 5,
      child: Container(
        width: 360,
        height: 360,
        decoration: BoxDecoration(
            // color: Colors.cyan,
            borderRadius: BorderRadius.circular(80),
            gradient: const LinearGradient(colors: [
              Color.fromARGB(255, 209, 80, 29),
              Color.fromARGB(255, 214, 146, 83),
            ])),
      ),
    );
  }
}
