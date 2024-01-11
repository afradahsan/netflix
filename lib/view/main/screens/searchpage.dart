import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/utils/constants.dart';
import 'package:netflix/view/main/widgets/popularsearch.dart';
import 'package:netflix/view/main/widgets/searchresult.dart';

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
            // PopularSearch()
            Expanded(child: SearchResult())
          ]
        ),
      )),
    );
  }
}