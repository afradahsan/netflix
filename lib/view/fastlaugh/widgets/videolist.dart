import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/utils/constants.dart';

class VideoList extends StatefulWidget {
  final int index;
  const VideoList({required this.index, super.key});

  @override
  State<VideoList> createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {
  bool tap = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[widget.index],
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
                    const VideoReactions(
                        icon: Icons.emoji_emotions_rounded, title: 'LOL'),
                    const VideoReactions(
                        icon: CupertinoIcons.add, title: 'My List'),
                    const VideoReactions(
                        icon: Icons.send_rounded, title: 'Share'),
                    const VideoReactions(
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

class VideoReactions extends StatelessWidget {
  const VideoReactions({required this.icon, required this.title, super.key});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
      child: Column(
        children: [Icon(icon), Text(title)],
      ),
    );
  }
}