import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/utils/constants.dart';

class MainImageHome extends StatelessWidget {
  const MainImageHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 450,
          decoration: BoxDecoration(
            borderRadius: kBordRadius(10),
            image: const DecorationImage(image: NetworkImage('https://m.media-amazon.com/images/W/MEDIAX_792452-T1/images/I/81Calh8XRBL._AC_UF1000,1000_QL80_.jpg'),
            fit: BoxFit.cover
            )
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black]
                )
              ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                const Column(
                  children: [
                    Icon(CupertinoIcons.add),
                    Text('My List')
                  ],
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: kBordRadius(10)
                    )
                  ),
                  onPressed: (){}, label: const Text('Play', style: TextStyle(color: Colors.black ),), icon: const Icon(Icons.play_arrow, color: Colors.black,),),
                const Column(
                  children: [
                    Icon(Icons.info_outline_rounded),
                    Text('Info')
                  ],
                )
              ],),
            ),
          ),
        )
      ],
    );
  }
}