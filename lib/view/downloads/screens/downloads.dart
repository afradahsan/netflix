import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix/utils/colors.dart';
import 'package:netflix/utils/constants.dart';
import 'package:netflix/view/downloads/widgets/downloadsimage.dart';
import 'package:netflix/view/downloads/widgets/topbardownloads.dart';

class DownloadsScreen extends StatelessWidget {
  const DownloadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
      final imageList = [
        'https://www.themoviedb.org/t/p/w220_and_h330_face/qVKirUdmoex8SdfUk8WDDWwrcCh.jpg',
        'https://www.themoviedb.org/t/p/w220_and_h330_face/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg',
        'https://www.themoviedb.org/t/p/w220_and_h330_face/a6syn9qcU4a54Lmi3JoIr1XvhFU.jpg'
      ];

    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.fromLTRB(18, 8, 18, 8),
        child: Column(
          children: [
            TopBarDownloads(toptitle: 'Downloads'),
            Constants.sizedten(context),
            const Row(
              children: [
                Icon(Icons.settings),
                SizedBox(width: 5,),
                Text('Smart Downloads', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),)
              ],
            ),
            const Text('Introducing Downloads for you!'),
            const Text('We\'ll download a personalised selection of movies and shows for you, so there\'s always something to watch on your device.'),

            Container(
              height: size.width-18,
              width: size.width,
              color: Colors.white,
              child: Stack(
                alignment: Alignment.center,
                children: [
                CircleAvatar(radius: size.width/2.5,),
                DownlImageWidget(image: imageList[0], angle: 20, pos: EdgeInsets.only(left: 100)),
                DownlImageWidget(image: imageList[1], angle: -20, pos: EdgeInsets.only(right: 100)),
              ],),
            ),

            MaterialButton(color: buttonblue,minWidth: double.infinity, onPressed: (){}, child: const Text('Setup Now', style: TextStyle(color: Colors.white),)),
            MaterialButton(color: Colors.white, onPressed: (){}, child: const Text('See what you can download'))
          ],
        ),
      )),
    );
  }
}