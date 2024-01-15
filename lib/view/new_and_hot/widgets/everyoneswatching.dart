import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/controller/api_endpoints.dart';
import 'package:netflix/utils/constants.dart';
import 'package:netflix/view/new_and_hot/screens/hotandnewscreen.dart';

class Everyoneswatching extends StatelessWidget {
  const Everyoneswatching({required this.snapshot, super.key});

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 20,
      itemBuilder: (context, index){
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: size.height/2.8,
            width: double.infinity,
            child: Column(
              children: [
              ClipRRect(
                borderRadius: kBordRadius(10),
                child: Image.network('$baseImageURL${snapshot.data[index].backDropPath}', height: 210,)),
                Row(
                  children: [
                    Expanded(
                      child: Text('${snapshot.data[index].originalTitle}',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                    ),
                    Spacer(),
                    IconwText(icon: Icons.send, title: 'Share'),
                    IconwText(icon: CupertinoIcons.add, title: 'My List'),
                    IconwText(icon: Icons.info_outline, title: 'Info')
                  ],
                ),
                sizedten(context),
                Container(height: 1, color: Colors.white.withOpacity(0.5),)
            ],),
          ),
        );
      }
    );
  }
}