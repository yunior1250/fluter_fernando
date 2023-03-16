//import 'dart:html';

import 'package:componentes/theme/app_theme.dart';
import 'package:flutter/material.dart';

class Listview2Screen extends StatelessWidget {
  final options = const ['juli', 'teo', 'riki', 'meli', 'doni', 'bebi'];

  const Listview2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Listview2'),
          elevation: 0,
          backgroundColor:AppTheme.primary,
        ),
        body: ListView.separated(
          itemCount: options.length,
          itemBuilder: (context, i) => ListTile(
            title:  Text(options[i]),
            trailing: const Icon(Icons.arrow_forward_ios_outlined,color:Colors.cyan,),
            onTap: () {
                final game =options [i];
                print(game);
            },
          ) ,
          separatorBuilder: (_, __) => const Divider(),
        ));
  }
}
