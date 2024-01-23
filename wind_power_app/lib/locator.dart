import 'package:get_it/get_it.dart';
import 'package:wind_power_app/core/neural_network_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton(() => NeuralNetworkModel());
}
