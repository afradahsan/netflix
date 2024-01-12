import 'package:bordered_text/bordered_text.dart';
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
                const SizedBox(
                  height: 160,
                  width: 30,
                ),
                Container(
                  width: 100, 
                  height: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: const DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            'https://media.themoviedb.org/t/p/w220_and_h330_face/vZloFAK7NmvMGKE7VkF5UHaz0I.jpg',
                          ))),
                ),
              ],
            ),
            Positioned(
                bottom: -30,
                left: -3,
                child: BorderedText(
                  strokeColor: Colors.white,
                  strokeWidth: 2,
                  child: Text(
                    '${index + 1}',
                    style: const TextStyle(fontSize: 120, color: Colors.black,
                    fontWeight: FontWeight.w600),
                  ),
                ))
          ],
        ),
      ],
    );
  }
}