import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:netflix/controller/api_endpoints.dart';
import 'package:netflix/controller/secrets.dart';

class SearchresWidget extends StatefulWidget {
  const SearchresWidget({required this.searchList, super.key});

  final List searchList;

  @override
  State<SearchresWidget> createState() => _SearchresWidgetState();
}

class _SearchresWidgetState extends State<SearchresWidget> {

  
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,       
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        childAspectRatio: 1/1.6,
      ),
      shrinkWrap: true,
      itemBuilder:(context, index) {
        

      return Padding(
          padding: EdgeInsets.fromLTRB(0,5,10,10),
          child: Container(
          width: 100,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image: DecorationImage(fit: BoxFit.fill, image: NetworkImage('${baseImageURL}${widget.searchList[index]['poster_path']}',))),
          ),
        );
      }
    );
  }
}