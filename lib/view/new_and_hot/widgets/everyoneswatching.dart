import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/utils/constants.dart';
import 'package:netflix/view/new_and_hot/screens/hotandnewscreen.dart';

class Everyoneswatching extends StatelessWidget {
  const Everyoneswatching({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height/2.8,
      width: double.infinity,
      child: Column(
        children: [
        ClipRRect(
          borderRadius: kBordRadius(10),
          child: Image.network('https://www.tallengestore.com/cdn/shop/products/TheDeparted-LeonardoDiCaprioJackNicholson-MartinScorseseHollywoodEnglishMoviePoster_edc47e64-e517-4d1a-9a20-b202c3220018.jpg?v=1600762008')),
          Row(
            children: [
              Text('THE DEPARTED', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
              Spacer(),
              IconwText(icon: Icons.send, title: 'Share'),
              IconwText(icon: CupertinoIcons.add, title: 'My List'),
              IconwText(icon: Icons.info_outline, title: 'Info')
            ],
          ),
          sizedten(context),
          Container(height: 1, color: Colors.white.withOpacity(0.5),)
      ],),
    );
  }
}