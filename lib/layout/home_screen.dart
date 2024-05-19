import 'package:flutter/material.dart';
import 'package:news_app_route_course/models/category_model.dart';
import 'package:news_app_route_course/screens/category_tab.dart';
import 'package:news_app_route_course/screens/data_tab.dart';
import 'package:news_app_route_course/screens/news_tab.dart';
import 'package:news_app_route_course/shared/network/remote/api_manager.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage("assets/images/pattern.png"),
          )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        drawer: Drawer(),
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Icon(
                Icons.search,
                color: Colors.white,
              ),
            )
          ],
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          elevation: 0,
          shape: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.transparent,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              )),
          backgroundColor: Colors.green,
          title: Text(
            "NEWS APP",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        body: selectedCategory == null
            ? CategoryTab(onClick: onCategoryClick)
            : DataTab(
                categoryId: selectedCategory!.id,
              ),
      ),
    );
  }

  CategoryModel? selectedCategory;

  onCategoryClick(category) {
    selectedCategory = category;
    setState(() {});
  }
}
