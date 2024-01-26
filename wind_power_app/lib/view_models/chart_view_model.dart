import 'package:stacked/stacked.dart';
import 'package:wind_power_app/core/models/power_data_model.dart';
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
    List<PowerData> data = await _dataService.loadCsvData("data/Location1.csv");
    print("Location of 400th record: ${data[400].location}");
    print("temperature of 400th record: ${data[400].temperature}");
    print("wind speed of 400th record: ${data[400].windSpeed}");
    print("wind direction of 400th record: ${data[400].windDirection}");
    print("power of 400th record: ${data[400].power}");
  }

  void testMethod() {
    print("Fetching data for location: $selectedLocation");
    print("Fetching $selectedMeasurement data");
  }
}
