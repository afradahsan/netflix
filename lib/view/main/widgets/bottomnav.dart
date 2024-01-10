import 'package:flutter/material.dart';

 class BottomNavigation extends StatelessWidget {
  BottomNavigation({super.key});

  static ValueNotifier<int> indexchangeNotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(valueListenable: indexchangeNotifier, builder: (context, int newIndex, _) {
      return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.black,
      selectedItemColor: Colors.red,
      currentIndex: newIndex,
      onTap: (index) => indexchangeNotifier.value = index,
      unselectedItemColor: const Color.fromARGB(100, 255, 255, 255),
      elevation: 0,
      items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'Home'),
      BottomNavigationBarItem(icon: Icon(Icons.collections), label: 'News'),
      BottomNavigationBarItem(icon: Icon(Icons.emoji_emotions_outlined), label: 'Fast Laughs'),
      BottomNavigationBarItem(icon: Icon(Icons.download), label: 'Downloads')
      ]
    );
    },);
  }
}