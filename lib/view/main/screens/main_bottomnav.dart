import 'package:flutter/material.dart';
import 'package:netflix/controller/api_service.dart';
import 'package:netflix/view/downloads/screens/downloads.dart';
import 'package:netflix/view/fastlaugh/screens/fastlaugh.dart';
import 'package:netflix/view/main/screens/homepage.dart';
import 'package:netflix/view/main/widgets/bottomnav.dart';
import 'package:netflix/view/new_and_hot/screens/hotandnewscreen.dart';

class MainBottomNav extends StatelessWidget {
  MainBottomNav({super.key});

  List pages = [
    HomePage(),
    HotandNew(getfunctionhot: ApiService().getUpcomingMovies(), getfunctioneveryone: ApiService().getToptenMovies(),),
    FastLaugh(),
    DownloadsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(valueListenable: BottomNavigation.indexchangeNotifier, builder: (context, int index, child) {
          return pages[index];
        },),
      ),
      bottomNavigationBar: BottomNavigation(),
    );  
  }
}