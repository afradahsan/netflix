import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/utils/constants.dart';

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
      if (scrollViewController!.position.userScrollDirection == ScrollDirection.reverse) {
      if (!isScrollingDown) {
        isScrollingDown = true;
        showAppbar = false;
        setState(() {});
      }
    }

    if (scrollViewController!.position.userScrollDirection == ScrollDirection.forward) {
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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.red,
        unselectedItemColor: const Color.fromARGB(100, 255, 255, 255),
        elevation: 0,
        items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: 'News'),
        BottomNavigationBarItem(icon: Icon(Icons.emoji_emotions_outlined), label: 'Fast Laughs'),
        BottomNavigationBarItem(icon: Icon(Icons.download_rounded), label: 'Downloads')
      ]),
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
            children: [
              AnimatedContainer(
                height: showAppbar ? 100 : 0,
                duration: const Duration(milliseconds: 200),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Text('For Afrad', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 24),),
                      Row(
                        children: [
                          IconButton(onPressed: (){}, icon: Icon(Icons.cast)), IconButton(onPressed: (){}, icon: Icon(Icons.search)), IconButton(onPressed: (){}, icon: Icon(Icons.person)),
                        ],
                      )
                    ],),
                    Row(
                      children: [
                        ChoiceChip(
                        label: Text('Series'),
                        labelStyle: selected ? TextStyle(color: Color.fromARGB(255, 0, 0, 0)) : TextStyle(color: Color.fromARGB(210, 255, 255, 255)),
                        labelPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        selected: selected,
                        onSelected: (value) {
                          setState(() {
                            selected = !selected;
                            debugPrint('object');
                            debugPrint('$selected');
                          });},
                        selectedColor: const Color.fromARGB(255, 255, 255, 255),
                        backgroundColor: Colors.black, showCheckmark: false,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                        side: BorderSide(color: const Color.fromARGB(192, 255, 255, 255)),
                        ),
                        Constants.sizedwten(context),
                        ChoiceChip(
                        label: Text('Films'),
                        labelStyle: selected ? TextStyle(color: Color.fromARGB(255, 0, 0, 0)) : TextStyle(color: Color.fromARGB(210, 255, 255, 255)),
                        labelPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        selected: selected,
                        onSelected: (value) {
                          setState(() {
                            selected = !selected;
                            debugPrint('object');
                            debugPrint('$selected');
                          });},
                        selectedColor: const Color.fromARGB(255, 255, 255, 255),
                        backgroundColor: Colors.black, showCheckmark: false,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                        side: BorderSide(color: const Color.fromARGB(192, 255, 255, 255)),
                        ),
                        Constants.sizedwten(context),
                        Expanded(
                          child: DropdownButtonFormField(
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.transparent, width: 2),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color:   Colors.transparent, width: 2),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              filled: true,
                              fillColor: Colors.transparent,
                            ),
                            dropdownColor: Colors.transparent,
                            items: const [
                            DropdownMenuItem(value: 'Action',child: Text('Action',),),
                            DropdownMenuItem(value: 'Romance',child: Text('Romance'),),
                            DropdownMenuItem(value: 'Sci-Fi',child: Text('Sci-Fi'),),
                            DropdownMenuItem(value: 'Blah',child: Text('Blah'),),
                          ], 
                          value: selectedvalue,
                          onChanged: (newvalue){
                            setState(() {
                              selectedvalue = newvalue;
                            });
                          }),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  controller: scrollViewController,
                  child: Column(
                    children: [
                      Image.asset('assets/images/netflix-old-logo.png'),
                      Image.asset('assets/images/netflix-old-logo.png'),Image.asset('assets/images/netflix-old-logo.png'),Image.asset('assets/images/netflix-old-logo.png'),Image.asset('assets/images/netflix-old-logo.png'),Image.asset('assets/images/netflix-old-logo.png'),
                      Image.asset('assets/images/netflix-old-logo.png'),Image.asset('assets/images/netflix-old-logo.png'),Image.asset('assets/images/netflix-old-logo.png'),Image.asset('assets/images/netflix-old-logo.png'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}