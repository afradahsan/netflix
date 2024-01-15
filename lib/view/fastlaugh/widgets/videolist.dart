import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/controller/api_endpoints.dart';
import 'package:netflix/utils/constants.dart';

import 'iconwithtext.dart';

class VideoList extends StatefulWidget {
  const VideoList({super.key, required this.snapshot, required this.index});

  final AsyncSnapshot snapshot;
  final int index;

  @override
  State<VideoList> createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {
  bool tap = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
          children: [
            Positioned.fill(
              child: Image.network('$baseImageURL${widget.snapshot.data![widget.index].posterPath}', fit: BoxFit.cover,)
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.black.withOpacity(0.6),
                        child: IconButton(
                          icon: Icon(tap == true
                              ? CupertinoIcons.speaker_slash_fill
                              : CupertinoIcons.speaker_2_fill),
                          onPressed: () {
                            setState(() {
                              tap = !tap;
                            });
                          },
                          color: Colors.white,
                          iconSize: 12,
                        )),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Stack(
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundImage: NetworkImage(
                                  'https://wallpapers.com/images/hd/good-tiktok-profile-pictures-720-x-720-bb2ub8xrxvhcowiz.jpg'),
                            ),
                            Positioned(
                                right: 7,
                                bottom: -5,
                                child: Text(
                                  'FTX',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      color: Color.fromARGB(255, 0, 96, 152)),
                                ))
                          ],
                        ),
                        sizedten(context),
                        const IconwithText(
                            icon: Icons.emoji_emotions_rounded, title: 'LOL'),
                        const IconwithText(
                            icon: CupertinoIcons.add, title: 'My List'),
                        const IconwithText(
                            icon: Icons.send_rounded, title: 'Share'),
                        const IconwithText(
                            icon: CupertinoIcons.play_arrow_solid, title: 'Play'),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        );

  }
}
