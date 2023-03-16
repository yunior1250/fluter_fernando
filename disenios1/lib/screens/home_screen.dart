import 'package:disenios1/widgets/background.dart';
import 'package:disenios1/widgets/custom_bottom_navigation.dart';
import 'package:disenios1/widgets/page_title.dart';
import 'package:flutter/material.dart';

import '../widgets/card_table.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:const [
          //backgound
          Background(),
          //home body
          _HomeBody()
        ]
      ),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          PageTitle(),
          //cards table
          CardTable(),

        ],
      ),
    );
  }
}