import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/utils/constants.dart';
import 'package:netflix/view/main/widgets/MainImagehome.dart';
import 'package:netflix/view/main/widgets/NumberCard.dart';
import 'package:netflix/view/main/widgets/bottomnav.dart';
import 'package:netflix/view/main/widgets/homepagewidget.dart';
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
  bool showAppbar = true;
  bool isScrollingDown = false;
  String? selectedvalue;

  @override
  void initState() {
    super.initState();
    scrollViewController = ScrollController();
    scrollViewController!.addListener(() {
      if (scrollViewController!.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!isScrollingDown) {
          isScrollingDown = true;
          showAppbar = false;
          setState(() {});
        }
      }

      if (scrollViewController!.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (isScrollingDown) {
          isScrollingDown = false;
          showAppbar = true;
          setState(() {});
        }
      }
    });
  }

  @override
  void dispose() {
    scrollViewController!.dispose();
    scrollViewController!.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(18, 8, 18, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedContainer(
              height: showAppbar ? 100 : 0,
              duration: const Duration(milliseconds: 200),
              child: Column(
                children: [
                  TopBarTitle(
                    toptitle: 'For Afrad',
                  ),
                  Row(
                    children: [
                      ChoiceChip(
                        label: const Text('Series'),
                        labelStyle: selected
                            ? const TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0))
                            : const TextStyle(
                                color: Color.fromARGB(210, 255, 255, 255)),
                        labelPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        selected: selected,
                        onSelected: (value) {
                          setState(() {
                            selected = !selected;
                            debugPrint('object');
                            debugPrint('$selected');
                          });
                        },
                        selectedColor: const Color.fromARGB(255, 255, 255, 255),
                        backgroundColor: Colors.black,
                        showCheckmark: false,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        side: const BorderSide(
                            color: Color.fromARGB(192, 255, 255, 255)),
                      ),
                      sizedwten(context),
                      ChoiceChip(
                        label: const Text('Films'),
                        labelStyle: selected
                            ? const TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0))
                            : const TextStyle(
                                color: Color.fromARGB(210, 255, 255, 255)),
                        labelPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        selected: selected,
                        onSelected: (value) {
                          setState(() {
                            selected = !selected;
                            debugPrint('object');
                            debugPrint('$selected');
                          });
                        },
                        selectedColor: const Color.fromARGB(255, 255, 255, 255),
                        backgroundColor: Colors.black,
                        showCheckmark: false,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        side: const BorderSide(
                            color: Color.fromARGB(192, 255, 255, 255)),
                      ),
                      sizedwten(context),
                      // Expanded(
                      //   child: DropdownButtonFormField(
                      //     decoration: InputDecoration(
                      //       enabledBorder: OutlineInputBorder(
                      //         borderSide: BorderSide(color: Colors.transparent, width: 2),
                      //         borderRadius: BorderRadius.circular(50),
                      //       ),
                      //       border: OutlineInputBorder(
                      //         borderSide: BorderSide(color:   Colors.transparent, width: 2),
                      //         borderRadius: BorderRadius.circular(50),
                      //       ),
                      //       filled: true,
                      //       fillColor: Colors.transparent,
                      //     ),
                      //     dropdownColor: Colors.transparent,
                      //     items: const [
                      //     DropdownMenuItem(value: 'Action',child: Text('Action',),),
                      //     DropdownMenuItem(value: 'Romance',child: Text('Romance'),),
                      //     DropdownMenuItem(value: 'Sci-Fi',child: Text('Sci-Fi'),),
                      //     DropdownMenuItem(value: 'Blah',child: Text('Blah'),),
                      //   ],
                      //   value: selectedvalue,
                      //   onChanged: (newvalue){
                      //     setState(() {
                      //       selectedvalue = newvalue;
                      //     });
                      //   }),
                      // )
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                controller: scrollViewController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MainImageHome(),
                    sizedten(context),
                    const HomeWidget(
                      title: 'Released Last Year',
                    ),
                    const HomeWidget(
                      title: 'Trending Now',
                    ),
                    const MainTitle(title: 'Top 10 TV Shows'),
                    LimitedBox(
                      maxHeight: 160,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: List.generate(
                            10,
                            (index) => NumberCard(
                                  index: index,
                                )),
                      ),
                    ),
                    sizedten(context),
                    const HomeWidget(
                      title: 'Released Last Year',
                    ),
                    const HomeWidget(
                      title: 'Tense Dramas',
                    ),
                    const HomeWidget(
                      title: 'South-Indian Cinema',
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
