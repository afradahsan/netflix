import 'package:flutter/material.dart';
import 'package:netflix/controller/api_endpoints.dart';
import 'package:netflix/controller/api_service.dart';
import 'package:netflix/model/MovieModel.dart';
import 'package:netflix/utils/colors.dart';
import 'package:netflix/utils/constants.dart';
import 'package:netflix/view/downloads/widgets/downloadsimage.dart';
import 'package:netflix/view/downloads/widgets/topbardownloads.dart';


class DownloadsScreen extends StatefulWidget {
  const DownloadsScreen({super.key});

  @override
  State<DownloadsScreen> createState() => _DownloadsScreenState();
}

class _DownloadsScreenState extends State<DownloadsScreen> {

  late Future<List<Movie>> trendingMovies;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    trendingMovies = ApiService().getTrendingMovies();
    print('hey - $trendingMovies');
  }
  @override
  Widget build(BuildContext context) {
    
    final widgetList = [
      TopBarDownloads(toptitle: 'Downloads'),
      SmartDownloads(),
      FutureBuilder(
        future: trendingMovies,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if(snapshot.hasError){
            return Text(snapshot.error.toString());
          }else if(snapshot.hasData){
            return SectionTwo(snapshot: snapshot);
          }else{
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
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
  const SectionTwo({required this.snapshot, super.key});

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
                  image: '$baseImageURL${snapshot.data[0].posterPath}',
                  angle: 18,
                  pos: EdgeInsets.only(left: 140, bottom: 30),
                  w: 0.35,
                  h: 0.55),
              DownlImageWidget(
                  image: '$baseImageURL${snapshot.data[1].posterPath}',
                  angle: -18,
                  pos: EdgeInsets.only(right: 140, bottom: 30),
                  w: 0.35,
                  h: 0.55),
              DownlImageWidget(
                  image: '$baseImageURL${snapshot.data[2].posterPath}',
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
