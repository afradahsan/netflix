import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/controller/api_endpoints.dart';
import 'package:netflix/controller/secrets.dart';
import 'package:netflix/utils/constants.dart';
import 'package:netflix/view/main/widgets/popularsearch.dart';
import 'package:http/http.dart' as http;
import 'package:netflix/view/main/widgets/searchreswidget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController searchController = TextEditingController();

  List<Map<String, dynamic>> searchList = [];
  var val1;

  //Use Debounce

  Future<List<Map<String, dynamic>>> searchresult(String val) async {
    var searchUrl = '$baseURL/search/movie?query=$val&api_key=$apikey';
    var response = await http.get(Uri.parse(searchUrl));

    if (response.statusCode == 200) {
      var decodeData = jsonDecode(response.body);
      var searchdata = decodeData['results'] as List;

      for (var item in searchdata) {
        searchList.add({
          'id': item['id'],
          'poster_path': item['poster_path'],
          'overview': item['overview'],
          'title': item['title']
        });

        if (searchList.length > 18) {
          searchList.removeRange(18, searchList.length);
        }
      }
    }
    return searchList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.fromLTRB(15, 5, 15, 0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CupertinoSearchTextField(
            controller: searchController,
            prefixIcon: Icon(
              CupertinoIcons.search,
              color: Colors.grey,
            ),
            suffixIcon: Icon(
              CupertinoIcons.clear,
              color: Colors.grey,
            ),
            style: TextStyle(color: Colors.white),
            backgroundColor: Colors.grey.withOpacity(0.3),
            onChanged: (String value) {
              searchList.clear();
              setState(() {
                val1 = value;
              });
            },
            onSubmitted: (value) {
              searchList.clear();
              setState(() {
                val1 = value;
              });
              print(searchList);
            },
          ),
          sizedten(context),
          searchController.text.isEmpty
              ? PopularSearch()
              : Expanded(
                  child: FutureBuilder(
                  future: searchresult(val1),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return SearchresWidget(searchList: searchList);
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(color: Colors.white,),
                      );
                    }
                  },
                ))
        ]),
      )),
    );
  }
}
