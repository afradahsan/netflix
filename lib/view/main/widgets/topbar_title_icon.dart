import 'package:flutter/material.dart';
import 'package:netflix/view/main/screens/searchpage.dart';

class TopBarTitle extends StatelessWidget {
  TopBarTitle({required this.toptitle, super.key});

  String? toptitle;
  
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(toptitle!, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 24),),
      Row(children: [
        IconButton(onPressed: (){}, icon: Icon(Icons.cast)),
        IconButton(onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context){ return SearchPage();}));
        }, icon: Icon(Icons.search)),
        IconButton(onPressed: (){}, icon: Icon(Icons.person)
        ),
      ])
    ]);
  }
}