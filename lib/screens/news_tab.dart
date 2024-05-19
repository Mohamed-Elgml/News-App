import 'package:flutter/material.dart';
import 'package:news_app_route_course/screens/news_item.dart';
import 'package:news_app_route_course/screens/source_items.dart';

import '../models/source_response.dart';
import '../shared/network/remote/api_manager.dart';

class NewsTab extends StatefulWidget {
  List<Sources> sources;

  NewsTab({
    required this.sources,
  });

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
            length: widget.sources.length,
            child: TabBar(
              dividerColor: Colors.transparent,
              isScrollable: true,
              onTap: (value) {
                setState(() {});
                selectedIndex = value;
              },
              tabs: widget.sources
                  .map((e) => Tab(
                        child: SourceItems(
                          isSelected:
                              widget.sources.elementAt(selectedIndex) == e,
                          sourceItem: e,
                        ),
                      ))
                  .toList(),
            )),
        FutureBuilder(
            future:
                ApiManager.getNewsData(widget.sources[selectedIndex].id ?? ""),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Text("Something wet wrong");
              }
              var articlesList = snapshot.data?.articles ?? [];
              if (articlesList.isEmpty) {
                return Text("NO Sources");
              }
              return Expanded(
                child: ListView.separated(
                  separatorBuilder:(context,index)=>SizedBox(height: 12,),

                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: NewsItem(article: articlesList[index]),
                    );
                  },
                  itemCount: articlesList.length,
                ),
              );
            })
      ],
    );

    // return Column(
    //   children: [
    //     DefaultTabController(
    //       length: widget.sources.length,
    //       child: TabBar(
    //         isScrollable: true,
    //         onTap: (value) {
    //           selectedIndex = value;
    //           setState(() {});
    //         },
    //         indicatorPadding: EdgeInsets.zero,
    //         padding: EdgeInsets.zero,
    //         indicatorColor: Colors.transparent,
    //         tabs: widget.sources
    //             .map((e) => Tab(
    //                   child: SourceItems(
    //                     sourceItem: e,
    //                     isSelected:
    //                         widget.sources.elementAt(selectedIndex) == e,
    //                   ),
    //                 ))
    //             .toList(),
    //       ),
    //     ),
    //     FutureBuilder(
    //         future:
    //             ApiManager.getNewsData(widget.sources[selectedIndex].id ?? ""),
    //         builder: (context, snapshot) {
    //           if (snapshot.connectionState == ConnectionState.waiting) {
    //             return Center(child: CircularProgressIndicator());
    //           }
    //           if (snapshot.hasError) {
    //             return Text("Something wet wrong");
    //           }
    //           var articlesList = snapshot.data?.articales ?? "";
    //           return ListView.builder(
    //             itemBuilder: (context, index) {
    //               return Text(articlesList[index].title ?? "");
    //             },
    //             itemCount: articlesList.length,
    //           );
    //         })
    //   ],
    // );
  }
}
