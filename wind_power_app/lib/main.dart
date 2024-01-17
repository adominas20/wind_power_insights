import 'package:flutter/material.dart';
import 'package:tflite_flutter/tflite_flutter.dart' as tfl;
import 'package:tflite_flutter/tflite_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Interpreter? interpreter;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Future<void> getInterpreter() async {
    interpreter = await tfl.Interpreter.fromAsset('assets/models/model.tflite');
  }

  var exampleInput = [
    [26.0, 3.4, -0.47]
  ];
  var output = List.filled(1 * 1, 0).reshape([1, 1]);

  void runModel() {
    interpreter!.run(exampleInput, output);
    print(output);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                await getInterpreter();
              },
              child: const Text("Get Interpreter"),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: runModel,
              child: const Text("Run model"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
