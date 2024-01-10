import 'package:flutter/material.dart';
import 'package:netflix/view/downloads/widgets/topbardownloads.dart';

class HotandNew extends StatelessWidget {
  const HotandNew({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.fromLTRB(18, 8, 18, 8),
        child: Column(
          children: [
            TopBarDownloads(toptitle: 'Hot & New'),
          ],
        ),
      )),
    );
  }
}