import 'package:flutter/cupertino.dart';

class AppState extends ChangeNotifier {
  int selectedCategoryId = 0;

  void updateCategoryId (int selectedCategoryId){
    this.selectedCategoryId = selectedCategoryId;
    notifyListeners();
  }
}