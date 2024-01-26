import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'package:wind_power_app/core/models/power_data_model.dart';

class WindDataService {
  Future<List<PowerData>> loadCsvData(String csvPath) async {
    final csvData = await rootBundle.loadString("assets/data/location1_final.csv");
    List<List<dynamic>> rawData = const CsvToListConverter().convert(csvData);

    //As the first row contains headers, we should skip this row
    List<PowerData> powerDataList = rawData.skip(1).map((csvRow) => PowerData.fromCsv(csvRow, "Location 1")).toList();
    return powerDataList;
  }
}
