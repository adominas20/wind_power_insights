import 'package:stacked/stacked.dart';
import 'package:wind_power_app/locator.dart';
import 'package:wind_power_app/services/wind_data_service.dart';

class ChartViewModel extends BaseViewModel {
  final WindDataService _dataService = locator<WindDataService>();

  String selectedLocation = 'Location 1';
  String selectedMeasurement = 'Power';

  static const List<String> _locations = ['Location 1', 'Location 2', 'Location 3', 'Location 4'];
  List<String> get locations => _locations;

  static const List<String> _measurements = ['Temperature', 'Wind Speed', 'Power'];
  List<String> get measurements => _measurements;

  Future<void> loadData() async {
    List<List<dynamic>> data = await _dataService.loadCsvData("data/Location1.csv");
    print(data);
  }

  void testMethod() {
    print("Fetching data for location: $selectedLocation");
    print("Fetching $selectedMeasurement data");
  }
}
