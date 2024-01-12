import 'package:flutter/material.dart';

class MainTitle extends StatelessWidget {
  const MainTitle({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.white
    ));
  }
}