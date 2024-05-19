import 'package:flutter/material.dart';
import 'package:news_app_route_course/screens/news_tab.dart';
import 'package:news_app_route_course/shared/network/remote/api_manager.dart';

class DataTab extends StatelessWidget {
  String categoryId;
   DataTab({required this.categoryId,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSources(categoryId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Text("Something wet wrong");
        }
        var sourceList = snapshot.data?.sources ?? [];
        if (sourceList.isEmpty) {
          return Text("NO Sources");
        }
        return NewsTab(sources: sourceList);
      },
    );
  }
}
