import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/utils/constants.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(
        padding: EdgeInsets.fromLTRB(15, 5, 15, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CupertinoSearchTextField(
              prefixIcon: Icon(CupertinoIcons.search, color: Colors.grey,),
              suffixIcon: Icon(CupertinoIcons.clear, color: Colors.grey,),
              style: TextStyle(color: Colors.white),
              backgroundColor: Colors.grey.withOpacity(0.3),
            ),
            sizedten(context),
            Text('Popular Searches', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500,)),
            sizedten(context),
            ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) => SearchTile(), separatorBuilder: (context, index) => sizedten(context), itemCount: 4)
          ]
        ),
      )),
    );
  }
}

class SearchTile extends StatelessWidget {
  const SearchTile({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Row(
              children: [
                Container(height: size.width*0.18,width: size.width*0.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Image.network('https://i.ebayimg.com/images/g/GtEAAOSw1W9eN1cY/s-l1600.jpg', fit: BoxFit.cover,)
                ),
                sizedwten(context),
                Text('Stay Close', style: TextStyle(color: Colors.white),),
                Spacer(),
                Icon(CupertinoIcons.play_circle, color: Colors.white, size: 25,),
              ],
            );
  }
}