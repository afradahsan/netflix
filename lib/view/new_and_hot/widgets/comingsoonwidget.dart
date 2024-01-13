import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/utils/constants.dart';
import 'package:netflix/view/new_and_hot/screens/hotandnewscreen.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 50,
          child: RichText(
              text: TextSpan(
                  text: 'FEB ',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white.withOpacity(0.5),
                      height: 1.1),
                  children: [
                TextSpan(
                    text: '11',
                    style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.w500,
                        color: Colors.white.withOpacity(0.9))),
              ])),
        ),
        Container(
          height: size.height / 1.8,
          width: size.width - 70,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                      borderRadius: kBordRadius(10),
                      child: Image.network(
                          'https://www.tallengestore.com/cdn/shop/products/LordOfTheRings-FellowshipOfTheRing-HollywoodMoviePoster_2770e0df-8b6b-4580-948d-7256db04e257.jpg?v=1630764645')),
                  Positioned(
                      right: 0,
                      bottom: 0,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(CupertinoIcons.speaker_slash),
                        iconSize: 18,
                      ))
                ],
              ),
              Row(
                children: [
                  Text(
                    'Lord of the Rings',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Spacer(),
                  IconwText(icon: CupertinoIcons.bell, title: 'Remind Me'),
                  IconwText(icon: Icons.info_outline, title: 'Info')
                ],
              ),
              Text(
                'Season 3 Coming on Friday',
                style: TextStyle(color: Colors.white.withOpacity(0.7)),
              ),
              sizedten(context),
              Row(
                children: [
                  Image.network(
                    'https://cdn4.iconfinder.com/data/icons/logos-and-brands/512/227_Netflix_logo-512.png',
                    height: 12,
                  ),
                  Text(
                    'SERIES',
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.7), fontSize: 12),
                  )
                ],
              ),
              sizedten(context),
              Text('Lord of the Rings'),
              sizedten(context),
              Text(
                '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,''',
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: TextStyle(color: Colors.white.withOpacity(0.7)),
              ),
              sizedten(context)
            ],
          ),
        ),
      ],
    );
  }
}
