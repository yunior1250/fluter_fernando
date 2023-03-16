import 'package:flutter/material.dart';

class ScrollScreen extends StatelessWidget {
  const ScrollScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 245, 158, 187),
        body: PageView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          children: [Page1(), Page2()],
        ));
  }
}

class Page1 extends StatelessWidget {
  const Page1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //background IMG
        Background(),
        MainContex()
      ],
    );
  }
}

class MainContex extends StatelessWidget {
  const MainContex({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
        fontSize: 40, fontWeight: FontWeight.bold, color: Colors.cyanAccent);
    return SafeArea(
      bottom: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 30),
          Text(
            '99°',
            style: textStyle,
          ),
          Text(
            'Viernes',
            style: textStyle,
          ),
          Expanded(child: Container()),
          //expanded
          const Icon(
            Icons.keyboard_double_arrow_down_sharp,
            size: 100,
            color: Colors.cyanAccent,
          )
        ],
      ),
    );
  }
}

class Background extends StatelessWidget {
  const Background({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color.fromARGB(255, 245, 158, 187),
        height: double.infinity,
        alignment: Alignment.topCenter,
        child: Image(image: AssetImage('assets/coba.jpg')));
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 245, 158, 187),
      child: Center(
        child: TextButton(
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              'welcome',
              style: TextStyle(
                  color: Color.fromARGB(255, 245, 158, 187), fontSize: 30),
            ),
          ),
          style: TextButton.styleFrom(
              backgroundColor: Colors.cyanAccent, shape: StadiumBorder()),
        ),
      ),
    );
  }
}
