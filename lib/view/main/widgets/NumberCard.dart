import 'package:flutter/material.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({required this.index, super.key});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Row(
              children: [
                SizedBox(height: 160, width: 50,),
                Container(
                  width: 100,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                        'https://www.themoviedb.org/t/p/w220_and_h330_face/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg',
                    ))),
                ),
              ],
            ),
            Positioned(
              bottom: -30,
              left: 10,
              child: Text('${index+1}', style: TextStyle(fontSize: 120),))
          ],
        ),
      ],
    );
  }
}
