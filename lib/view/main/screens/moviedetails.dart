import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:netflix/controller/api_endpoints.dart';
import 'package:netflix/utils/constants.dart';

class MovieDetailsPage extends StatefulWidget {
  const MovieDetailsPage({super.key, required this.snapshot});

  final dynamic snapshot;

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  @override
  Widget build(BuildContext context) {
    DateFormat inputFormat = DateFormat('yyyy-MM-dd');
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                    height: 180,
                    width: screenW(context),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: NetworkImage(
                            '$baseImageURL${widget.snapshot.backDropPath}',
                          ),
                          fit: BoxFit.fill),
                    )),
                Align(
                    alignment: const Alignment(50, 0),
                    child: Container(
                      height: 40,
                      color: const Color.fromARGB(100, 0, 0, 0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                            ),
                            sizedwfive(context),
                            const Text(
                              'Watch Trailer',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.download,
                              size: 20,
                            )
                          ],
                        ),
                      ),
                    )),
                Positioned(
                    top: 0,
                    left: 0,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back))),
              ],
            ),
            sizedten(context),
            Text(
              '${widget.snapshot.title} (${inputFormat.parse(widget.snapshot.releaseDate).year})',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            sizedten(context),
            Text(widget.snapshot.overview),
            sizedten(context),
            Container(
                width: double.maxFinite,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.play_arrow, color: Colors.white,),
                  label: const Text('Watch Now', style: TextStyle(color: Colors.white, fontSize: 16),),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)))),
                ))
          ],
        ),
      )),
    );
  }
}