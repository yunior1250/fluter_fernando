import 'package:flutter/material.dart';

class Listview1Screen extends StatelessWidget {
  final options = const ['juli', 'teo', 'riki', 'meli', 'doni', 'bebi'];

  const Listview1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Listview'),
        ),
        body: ListView(
          children: [
            ...options
                .map((game) => ListTile(
                      title: Text(game),
                      trailing: const Icon(Icons.arrow_back_ios_new_outlined),
                    ))
                .toList()
          ],
        ));
  }
}
