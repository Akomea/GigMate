import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

enum SelectedDateType { Single, Multiple, Range, None }

class PostGigNotifier with ChangeNotifier {
  SelectedDateType _selectedDateType = SelectedDateType.None;
  TabController _tabController;
  int _selectedIndex = 0;
  int _budget = 2000;
  String _gigType = '';
  String _dateType = '';
  String _eventType = '';
  String _performanceDuration = '';
  String _selectedDate = 'No dates selected';
  String _multiDateCount = '0 dates selected';
  SfRangeValues _sliderValues = SfRangeValues(1.0, 4.0);

  bool isDragged = false;

  void setDrag(bool value) {
    isDragged = value;
    notifyListeners();
  }

  String get multiDateCount => _multiDateCount;

  void setMultiDateCount(String value) {
    _multiDateCount = value;
    notifyListeners();
  }

  String get selectedDate => _selectedDate;

  SfRangeValues get sliderValues => _sliderValues;

  SelectedDateType get selectedDateType => _selectedDateType;

  void setSelectedDate(String value) {
    _selectedDate = value;
  }

  void setSelectedDateType(SelectedDateType dateType) {
    _selectedDateType = dateType;
    notifyListeners();
  }

  void setSliderValue(SfRangeValues newValues) {
    _sliderValues = SfRangeValues(newValues.start, newValues.end);
    notifyListeners();
  }

  String get performanceDuration => _performanceDuration;

  String get eventType => _eventType;

  String get dateType => _dateType;

  void setDateType(String value) {
    _dateType = value;
    notifyListeners();
  }

  void setEventType(String value) {
    _eventType = value;
    notifyListeners();
  }

  void setPerformanceDuration(String value) {
    _performanceDuration = value;
    notifyListeners();
  }

  String get gigType {
    return _gigType;
  }

  setGigType(String value) {
    _gigType = value;
    notifyListeners();
  }

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
