import 'package:flutter/material.dart';
import 'package:news_app_route_course/models/category_model.dart';
import 'package:news_app_route_course/screens/category_item.dart';

class CategoryTab extends StatelessWidget {
  Function onClick;

  CategoryTab({super.key, required this.onClick});

  List<CategoryModel> allCategories = CategoryModel.getCategories();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            "Pick your category of interest",
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    onClick(allCategories[index]);
                  },
                  child: CategoryItem(
                    model: allCategories[index],
                    index: index,
                  ),
                );
              },
              itemCount: allCategories.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
