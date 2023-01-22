import 'package:flutter/material.dart';

import 'babble_utils.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BabbleUtils().initBabble();
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
    BabbleUtils().setCustomerId(customerId: "nirmalvora0910@gmail.com");
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
                BabbleUtils().triggerSurvey(trigger: "test-all-questions");
              },
              child: const Text('Trigger survey')),
        ),
      ),
    );
  }
}
