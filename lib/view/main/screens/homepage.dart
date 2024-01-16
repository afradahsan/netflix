import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/controller/api_service.dart';
import 'package:netflix/utils/constants.dart';
import 'package:netflix/view/main/widgets/MainImagehome.dart';
import 'package:netflix/view/main/widgets/NumberCard.dart';
import 'package:netflix/view/main/widgets/bottomnav.dart';
import 'package:netflix/view/main/widgets/homepagewidget.dart';
import 'package:netflix/view/main/widgets/hometop10.dart';
import 'package:netflix/view/main/widgets/maintitle.dart';
import 'package:netflix/view/main/widgets/topbar_title_icon.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool selected = false;
  ScrollController? scrollViewController;
  String? selectedvalue;
  ValueNotifier<bool> scrollNotifier = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: scrollNotifier,
      builder: (BuildContext context, index, _) {
        return NotificationListener<UserScrollNotification>(
          onNotification: (notification){
            final ScrollDirection direction = notification.direction;
            if(direction == ScrollDirection.reverse){
              scrollNotifier.value = false;
            }else if(direction == ScrollDirection.forward){
              scrollNotifier.value = true;
            }
            return true;
          },
          child: Scaffold(
            backgroundColor: Colors.black,
            body: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      controller: scrollViewController,
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(18, 8, 18, 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const MainImageHome(),
                                sizedten(context),
                                HomeWidget(
                                  title: 'Trending Now',
                                  getfunction: ApiService().getTrendingMovies(),
                                ),
                                HomeWidget(
                                  title: 'Upcoming Movies',
                                  getfunction: ApiService().getUpcomingMovies(),
                                ),
                                // const MainTitle(title: 'Top 10 TV Shows'),
                                Top10widget(title: 'Top 10 TV Shows', getfunction: ApiService().getToptenMovies()),
                                // LimitedBox(
                                //   maxHeight: 160,
                                //   child: FutureBuilder(future: future, builder: builder),
                                //   // child: ListView(
                                //   //   scrollDirection: Axis.horizontal,
                                //   //   children: List.generate(
                                //   //       10,
                                //   //       (index) => NumberCard(
                                //   //             index: index,
                                //   //           )),
                                //   // ),
                                // ),
                                sizedten(context),
                                HomeWidget(
                                  title: 'Tense Dramas',
                                  getfunction: ApiService().getTrendingMovies(),
                                ),
                                HomeWidget(
                                  title: 'South-Indian Cinema',
                                  getfunction: ApiService().getTrendingMovies(),
                                )
                              ],
                            ),
                          ),
                          scrollNotifier.value ? Container(
                            width: double.infinity,
                            height: 90,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Colors.black,
                                Colors.transparent
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter
                              )
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(8,0,8,0),
                                  child: Row(children: [
                                    Image.asset('assets/images/4846304.png', height: 35,),
                                    const Spacer(),
                                    IconButton(onPressed: (){}, icon: const Icon(Icons.cast)),
                                    const Icon(Icons.person)
                                  ],),
                                ),
                                sizedten(context),
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text('TV Shows'),
                                    Text('Movies'),
                                    Text('Categories')
                                  ],
                                )
                              ],
                            ),
                          ) : const SizedBox(height: 10,)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
