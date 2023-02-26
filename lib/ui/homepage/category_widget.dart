import 'package:flutter/material.dart';
import 'package:local_event_app/category/category.dart';
import 'package:local_event_app/styleguide.dart';

class CategoryWidget extends StatelessWidget {
  // category is the only widget accepted by this class CategoryWidget
  final Category1 category;

  const CategoryWidget({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      width: 90,
      height: 90,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0x99FFFFFF), width: 3),
        borderRadius: const BorderRadius.all(
          Radius.circular(16),
        ),
        color: Colors.transparent,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            category.icon,
            color: Colors.white,
            size: 40,
          ),
          const SizedBox(height: 10,),
          Text(category.name, style: categoryTextStyle,),
        ],
      ),
    );
  }
}
