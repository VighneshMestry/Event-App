import 'package:flutter/material.dart';

class Category1 {
  final int categoryId;
  final String name;
  final IconData icon;

  Category1({required this.categoryId, required this.name, required this.icon});
}

final allCategory = Category1(
  categoryId: 0,
  name: "All",
  icon: Icons.search,
);

final musicCategory = Category1(
  categoryId: 1,
  name: "Music",
  icon: Icons.music_note,
);

final meetUpCategory = Category1(
  categoryId: 2,
  name: "Meetup",
  icon: Icons.location_on,
);

final golfCategory = Category1(
  categoryId: 3,
  name: "Golf",
  icon: Icons.golf_course,
);

final birthdayCategory = Category1(
  categoryId: 4,
  name: "Birthday",
  icon: Icons.cake,
);

final categories = [
  allCategory,
  musicCategory,
  meetUpCategory,
  golfCategory,
  birthdayCategory,
];