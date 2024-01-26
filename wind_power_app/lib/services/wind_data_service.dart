import 'package:csv/csv.dart';
import 'package:flutter/services.dart';

class WindDataService {
  Future<List<List<dynamic>>> loadCsvData(String csvPath) async {
    final csvData = await rootBundle.loadString("assets/data/location1_final.csv");
    List<List<dynamic>> data = const CsvToListConverter().convert(csvData);
    return data;
  }
}
