import 'package:flutter/material.dart';

class TopBarDownloads extends StatelessWidget {
  TopBarDownloads({required this.toptitle, super.key});

  String? toptitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(toptitle!, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 24),),
      Row(children: [
        IconButton(onPressed: (){}, icon: Icon(Icons.cast, color: Colors.white,)),
        IconButton(onPressed: (){}, icon: Icon(Icons.person, color: Colors.white,)
        ),
      ])
    ]);
  }
}