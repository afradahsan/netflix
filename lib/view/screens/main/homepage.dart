import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.red,
        unselectedItemColor: const Color.fromARGB(100, 255, 255, 255),
        elevation: 0,
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: 'News'),
        BottomNavigationBarItem(icon: Icon(Icons.emoji_emotions_outlined), label: 'Fast Laughs'),
        BottomNavigationBarItem(icon: Icon(Icons.download_rounded), label: 'Downloads')
      ]),
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(children: [
              Text('For Afrad'),
              SizedBox(width: 150,),
              IconButton(onPressed: (){}, icon: Icon(Icons.cast)), IconButton(onPressed: (){}, icon: Icon(Icons.search)), IconButton(onPressed: (){}, icon: Icon(Icons.person))
            ],)
          ],
        ),
      )),
    );
  }
}