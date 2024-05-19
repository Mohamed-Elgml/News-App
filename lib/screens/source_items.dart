import 'package:flutter/material.dart';
import 'package:news_app_route_course/models/source_response.dart';

class SourceItems extends StatelessWidget {
  Sources sourceItem;
  bool isSelected;

  SourceItems({
    required this.sourceItem,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.green : Colors.transparent,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: Colors.green,
          width: 2,
        ),
      ),
      child: Text(
        sourceItem.name ?? "",
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.green,
        ),
      ),
    );
  }
}
