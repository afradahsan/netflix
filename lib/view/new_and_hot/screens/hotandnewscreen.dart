import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/utils/constants.dart';
import 'package:netflix/view/downloads/widgets/topbardownloads.dart';
import 'package:netflix/view/fastlaugh/widgets/iconwithtext.dart';
import 'package:netflix/view/new_and_hot/widgets/comingsoonwidget.dart';

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
                dividerColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.tab,
                unselectedLabelColor: Colors.white,
                indicator: BoxDecoration(
                    borderRadius: kBordRadius(30), color: Colors.white),
                tabs: const [
                  Tab(
                    text: '🍿 Coming Soon',
                  ),
                  Tab(
                    text: '👀 Everyone\'s Watching',
                  ),
                ]),
          ),
          body: TabBarView(
              children: [
                buildComingSoon(context), buildEveryoneswatching(context)])),
    );
  }

buildComingSoon(context) {
    return ListView.builder(
      padding: EdgeInsets.all(10),
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, index) {
      return ComingSoon();
    });
  }
}

buildEveryoneswatching(context){
  return Container(
    
  );
}

class IconwText extends StatelessWidget {
  const IconwText({required this.icon, required this.title, super.key});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
      child: Column(
        children: [
          Icon(icon),
          Text(
            title,
            style:
                TextStyle(fontSize: 12, color: Colors.white.withOpacity(0.8)),
          )
        ],
      ),
    );
  }
}
