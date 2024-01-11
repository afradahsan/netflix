import 'package:flutter/material.dart';
import 'package:netflix/utils/colors.dart';
import 'package:netflix/utils/constants.dart';
import 'package:netflix/view/downloads/widgets/downloadsimage.dart';
import 'package:netflix/view/downloads/widgets/topbardownloads.dart';

class DownloadsScreen extends StatelessWidget {
  const DownloadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final widgetList = [
      TopBarDownloads(toptitle: 'Downloads'),
      SmartDownloads(),
      SectionTwo(),
      SectionThree()
    ];

    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.fromLTRB(18, 8, 18, 8),
              child: ListView.separated(
                itemBuilder: (context, index) => widgetList[index],
                separatorBuilder: (context, index) => sizedtwenty(context),
                itemCount: widgetList.length,
              ))),
    );
  }
}

class SmartDownloads extends StatelessWidget {
  const SmartDownloads({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(Icons.settings),
        SizedBox(
          width: 5,
        ),
        Text(
          'Smart Downloads',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}

class SectionTwo extends StatelessWidget {
  const SectionTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final imageList = [
      'https://www.themoviedb.org/t/p/w220_and_h330_face/4m1Au3YkjqsxF8iwQy0fPYSxE0h.jpg',
      'https://www.themoviedb.org/t/p/w220_and_h330_face/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg',
      'https://www.themoviedb.org/t/p/w220_and_h330_face/a6syn9qcU4a54Lmi3JoIr1XvhFU.jpg'
    ];

    return Column(
      children: [
        const Text(
          'Introducing Downloads for you!',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
        sizedten(context),
        const Text(
            'We\'ll download a personalised selection \nof movies and shows for you, so there\'s \nalways something to watch on your \ndevice.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey)),
        SizedBox(
          height: size.width - 24,
          width: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: size.width / 2.5,
                backgroundColor: const Color.fromARGB(70, 255, 255, 255),
              ),
              DownlImageWidget(
                  image: imageList[0],
                  angle: 18,
                  pos: EdgeInsets.only(left: 140, bottom: 30),
                  w: 0.35,
                  h: 0.55),
              DownlImageWidget(
                  image: imageList[2],
                  angle: -18,
                  pos: EdgeInsets.only(right: 140, bottom: 30),
                  w: 0.35,
                  h: 0.55),
              DownlImageWidget(
                  image: imageList[1],
                  angle: 0,
                  pos: EdgeInsets.only(right: 0),
                  w: 0.4,
                  h: 0.6),
            ],
          ),
        ),
      ],
    );
  }
}

class SectionThree extends StatelessWidget {
  const SectionThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MaterialButton(
            color: buttonblue,
            minWidth: double.infinity,
            onPressed: () {},
            child: const Text(
              'Setup Now',
              style: TextStyle(color: Colors.white),
            )),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                side: BorderSide(width: 1, color: Colors.white),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5))),
            onPressed: () {},
            child: const Text('See what you can download',
                style: TextStyle(
                  color: Colors.white,
                )))
      ],
    );
  }
}
