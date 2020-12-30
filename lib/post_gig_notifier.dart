import 'package:flutter/material.dart';

class PostGigNotifier with ChangeNotifier {
  TabController _tabController;
  int _selectedIndex = 0;
  int _budget = 2000;

  String budgetAmount() {
    return _budget.toString();
  }

  setBudget(int value) {
    _budget = value;
    notifyListeners();
  }

  addToBudget() {
    _budget += 10;
    notifyListeners();
  }

  subtractBudget() {
    _budget -= 10;
    notifyListeners();
  }

  TabController get tabController => _tabController;

  set tabController(TabController value) {
    _tabController = value;
    notifyListeners();
  }

  int get selectedIndex => _selectedIndex;

  set setSelectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }
}
