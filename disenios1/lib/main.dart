import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:disenios1/screens/home_screen.dart';
import 'package:disenios1/screens/scroll_design.dart';

import 'package:disenios1/screens/basic_design.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
       theme: ThemeData.dark(),
        title: 'Material App',
        initialRoute: 'home_screen',
        routes: {
          'basic_design':(_) => BasicDesignScreen() ,
          'scroll_screen':(_) => ScrollScreen(),
           'home_screen':(_) => HomeScreen()
        },
    );
        
  }
}
