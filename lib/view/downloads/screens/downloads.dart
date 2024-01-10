import 'package:flutter/material.dart';
import 'package:netflix/utils/constants.dart';
import 'package:netflix/view/downloads/widgets/topbardownloads.dart';
import 'package:netflix/view/main/widgets/topbar_title_icon.dart';

class DownloadsScreen extends StatelessWidget {
  const DownloadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.fromLTRB(18, 8, 18, 8),
        child: Column(
          children: [
            TopBarDownloads(toptitle: 'Downloads'),
            Constants.sizedten(context),
            Row(
              children: [
                Icon(Icons.settings),
                SizedBox(width: 5,),
                Text('Smart Downloads', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),)
              ],
            ),
            const Text('Introducing Downloads for you!'),
            const Text('We\'ll download a personalised selection of movies and shows for you, so there\'s always something to watch on your device.'),
          ],
        ),
      )),
    );
  }
}