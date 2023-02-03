import 'package:babble_sdk/babble_sdk.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BabbleSdk.instance.init(userId: "1PilLLqANCHjpAvTUhFt");
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    BabbleSdk.instance.setCustomerId(customerId: null);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: TextButton(
              onPressed: () {
                BabbleSdk.instance.triggerSurvey(trigger: "test3");
              },
              child: const Text('Trigger survey')),
        ),
      ),
    );
  }
}
