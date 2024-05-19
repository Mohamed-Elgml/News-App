import 'package:flutter/material.dart';
import 'package:news_app_route_course/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  CategoryModel model;
  int index;

  CategoryItem({required this.model,required this.index, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: model.color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
          bottomLeft: index.isOdd?Radius.circular(28):Radius.zero,
          bottomRight: index.isEven?Radius.circular(28):Radius.zero,
        ),
      ),
      child: Column(
        children: [
          Expanded(child: Image.asset(model.image)),
          Container(
            margin: EdgeInsets.only(bottom: 18),
            child: Text(
              model.name,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
