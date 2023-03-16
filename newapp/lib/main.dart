import 'package:flutter/material.dart';

import 'package:newapp/src/theme/tema.dart';

import 'src/pages/tabs_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        title: 'Material App',
        theme: miTema,
        debugShowCheckedModeBanner: false,
        home: TabsPage());
  }
}
