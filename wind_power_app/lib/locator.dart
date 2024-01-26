import 'package:get_it/get_it.dart';
import 'package:wind_power_app/core/models/neural_network_model.dart';
import 'package:wind_power_app/services/wind_data_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<NeuralNetworkModel>(() => NeuralNetworkModel());
  locator.registerLazySingleton<WindDataService>(() => WindDataService());
}
