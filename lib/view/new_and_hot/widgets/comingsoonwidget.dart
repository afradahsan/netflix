import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/controller/api_endpoints.dart';
import 'package:netflix/utils/constants.dart';
import 'package:netflix/view/new_and_hot/screens/hotandnewscreen.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon({required this.snapshot, super.key});

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ListView.builder(
      padding: EdgeInsets.fromLTRB(10,120,10,10),
      itemCount: 20,
      itemBuilder: (context, index) {
        return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            width: 50,
            child: RichText(
                text: TextSpan(
                    text: 'JAN ',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.white.withOpacity(0.5),
                        height: 1.1),
                    children: [
                  TextSpan(
                      text: '${index+11}',
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
                            '$baseImageURL${snapshot.data[index].backDropPath}')),
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
                    Expanded(
                      child: Text(
                        '${snapshot.data[index].originalTitle}',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600
                        ),
                      ),
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
                Text('${snapshot.data[index].originalTitle}'),
                sizedten(context),
                Text(
                  '${snapshot.data[index].overview}',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: TextStyle(color: Colors.white.withOpacity(0.7)),
                ),
                sizedten(context)
              ],
            ),
          )
        ]);
      }
    );
  }
}
