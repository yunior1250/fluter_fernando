import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:componentes/widgets/widgets.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarjetas'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: const [
          CustomCardType1(),
          SizedBox(height: 10,),
          CustomCardType2(imegeUrl: 'https://hips.hearstapps.com/hmg-prod/images/2023-chevrolet-corvette-z07-101-1664802216.jpg?crop=0.571xw:0.428xh;0.192xw,0.313xh&resize=1200:*', name: 'Corvete C8',),
          SizedBox(height: 10,),
          CustomCardType2(imegeUrl: 'https://hips.hearstapps.com/hmg-prod/images/2020-ford-mustang-shelby-gt500-563-1608256402.jpg?crop=0.627xw:0.468xh;0.321xw,0.480xh&resize=1200:*',name: 'Shelby GT500',),
          SizedBox(height: 10,),
          CustomCardType2(imegeUrl: 'https://hips.hearstapps.com/hmg-prod/amv-prod-cad-assets/images/17q3/685270/2018-dodge-challenger-srt-demon-first-drive-review-car-and-driver-photo-686155-s-original.jpg', name: 'Challenger Demon',),
          SizedBox(height: 10,),
          CustomCardType2(imegeUrl: 'https://hips.hearstapps.com/hmg-prod/amv-prod-cad-assets/wp-content/uploads/2017/09/2018-Chevrolet-Camaro-ZL1-1LE-103.jpg?crop=0.816xw:1.00xh;0.0863xw,0&resize=640:*', name: 'Camaro ZL1',),
        ],
      ),
    );
  }
}
