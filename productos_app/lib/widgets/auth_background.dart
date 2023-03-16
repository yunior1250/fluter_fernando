// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  final Widget child;

  const AuthBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.cyan,
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          const _OrangeBox(),
          const _HeaderIcon(),
          this.child,
        ],
      ),
    );
  }
}

class _HeaderIcon extends StatelessWidget {
  const _HeaderIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 30),
        child: const Icon(
          Icons.person_pin,
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}

class _OrangeBox extends StatelessWidget {
  const _OrangeBox({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      decoration: _orangeBackground(),
      child: Stack(
        children: const [
          Positioned(
            child: _Bubble(),
            top: 90,
            left: 30,
          ),
          Positioned(
            child: _Bubble(),
            top: -40,
            left: -30,
          ),
          Positioned(
            child: _Bubble(),
            top: -50,
            left: -20,
          ),
          Positioned(
            child: _Bubble(),
            top: -50,
            left: 10,
          ),
          Positioned(
            child: _Bubble(),
            top: 120,
            left: 20,
          )
        ],
      ),

      //color: Colors.deepOrange,
    );
  }

  BoxDecoration _orangeBackground() => const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 250, 58, 0),
        Color.fromARGB(255, 223, 83, 41),
      ]));
}

class _Bubble extends StatelessWidget {
  const _Bubble({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: const Color.fromARGB(75, 248, 120, 80)));
  }
}
