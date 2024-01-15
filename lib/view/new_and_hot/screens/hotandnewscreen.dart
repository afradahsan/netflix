import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/model/MovieModel.dart';
import 'package:netflix/utils/constants.dart';
import 'package:netflix/view/downloads/widgets/topbardownloads.dart';
import 'package:netflix/view/fastlaugh/widgets/iconwithtext.dart';
import 'package:netflix/view/new_and_hot/widgets/comingsoonwidget.dart';
import 'package:netflix/view/new_and_hot/widgets/everyoneswatching.dart';

class HotandNew extends StatefulWidget {
  const HotandNew(
      {required this.getfunctionhot,
      required this.getfunctioneveryone,
      super.key});

  final Future<List<Movie>> getfunctionhot;
  final Future<List<Movie>> getfunctioneveryone;

  @override
  State<HotandNew> createState() => _HotandNewState();
}

class _HotandNewState extends State<HotandNew> {
  late Future<List<Movie>> hotandnewList;
  late Future<List<Movie>> everyoneswatching;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('intstate');
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    hotandnewList = widget.getfunctionhot;
    everyoneswatching = widget.getfunctioneveryone;
    print('didchangeddependencies');
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            title: TopBarDownloads(toptitle: 'New & Hot'),
            elevation: 0,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[Colors.black, Colors.transparent]),
              ),
            ),
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
          body: TabBarView(children: [
            buildComingSoon(context),
            buildEveryoneswatching(context)
          ])),
    );
  }

  buildComingSoon(context) {
    return FutureBuilder(
      future: hotandnewList,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else if (snapshot.hasData) {
          return ComingSoon(
            snapshot: snapshot,
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  buildEveryoneswatching(context) {
    return FutureBuilder(
      future: everyoneswatching,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else if (snapshot.hasData) {
          return Everyoneswatching(
            snapshot: snapshot,
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
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
