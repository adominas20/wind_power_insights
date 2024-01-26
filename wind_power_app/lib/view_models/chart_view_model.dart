import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:stacked/stacked.dart';

class ChartViewModel extends BaseViewModel {
  static const List<String> _locations = ['Location 1', 'Location 2', 'Location 3', 'Location 4'];
  List<String> get locations => _locations;

  String selectedLocation = 'Location 1';

  final List<FlSpot> dummyData1 = List.generate(8, (index) {
    return FlSpot(index.toDouble(), index * Random().nextDouble());
  });

  final List<FlSpot> dummyData2 = List.generate(8, (index) {
    return FlSpot(index.toDouble(), index * Random().nextDouble());
  });

  final List<FlSpot> dummyData3 = List.generate(8, (index) {
    return FlSpot(index.toDouble(), index * Random().nextDouble());
  });

  final List<FlSpot> dummyData4 = List.generate(8, (index) {
    return FlSpot(index.toDouble(), index * Random().nextDouble());
  });

  void testMethod() {
    print("Fetching data for location: $selectedLocation");
  }
}
