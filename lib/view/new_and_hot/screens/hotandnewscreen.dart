import 'package:flutter/material.dart';
import 'package:netflix/utils/constants.dart';
import 'package:netflix/view/downloads/widgets/topbardownloads.dart';

class HotandNew extends StatelessWidget {
  const HotandNew({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: TopBarDownloads(toptitle: 'New & Hot'),
          automaticallyImplyLeading: false,
          bottom: TabBar(
            isScrollable: true,
          indicatorSize: TabBarIndicatorSize.tab,
          unselectedLabelColor: Colors.white,
          indicator: BoxDecoration(
            borderRadius: kBordRadius(30),
            color: Colors.white
          ),
          tabs: const [
            Tab(text: '🍿 Coming Soon',),
            Tab(text: '👀 Everyone\'s Watching',),
          ]
          ),
        ),
        body: Text('data')
      ),
    );
  }
}