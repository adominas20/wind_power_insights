import 'package:tflite_flutter/tflite_flutter.dart';

class NeuralNetworkModel {
  Interpreter? _interpreter;
  Interpreter? get interpreter => _interpreter;

  var exampleInput = [
    [26.0, 3.4, -0.47]
  ];

  var output = List.filled(1 * 1, 0).reshape([1, 1]);

  void initialiseInterpreter() async {
    _interpreter = await Interpreter.fromAsset('assets/models/model.tflite');
  }

  void runModel() {
    if (interpreter == null) {
      print("Interpreter is null, cannot run model");
      return;
    }

    interpreter!.run(exampleInput, output);
    print(output);
  }
}
