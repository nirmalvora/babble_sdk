import 'package:babble_sdk/babble_sdk.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
  GetConfiguration? configuration;
  @override
  void initState() {
    super.initState();
    BabbleSdk.instance.setCustomerId(
        customerId: "cust007", userDetails: {"firstname": "Nirmal"});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: TextButton(
                onPressed: () {
                  BabbleSdk.instance.triggerSurvey(
                      trigger: 'quizz', properties: {"test1": "Nirmal"});
                },
                child: const Text('Trigger survey'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  BabbleSdk.instance.cancelSurvey();
                },
                child: const Text('Cancel survey'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<http.Response> getConfiguration() {
    return http.get(Uri.parse(
        'https://c38f-208-59-183-252.ngrok.io/get_ios_testing_config'));
  }
}

class GetConfiguration {
  String? id;
  String? triggerName;
  String? customerId;
  String? initId;

  GetConfiguration({this.id, this.triggerName, this.customerId, this.initId});

  GetConfiguration.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    triggerName = json['trigger_name'];
    customerId = json['customer_id'];
    initId = json['init_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['trigger_name'] = triggerName;
    data['customer_id'] = customerId;
    data['init_id'] = initId;
    return data;
  }
}
