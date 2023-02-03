import 'package:babble_sdk/babble_sdk.dart';

class BabbleUtils {
  final babbleSdk = BabbleSdk();
  static final BabbleUtils _singleton = BabbleUtils._internal();

  factory BabbleUtils() {
    return _singleton;
  }

  BabbleUtils._internal();
  Future<void> initBabble() async {
    babbleSdk.init(userId: "1PilLLqANCHjpAvTUhFt");
  }

  Future<void> triggerSurvey({required String trigger}) async {
    babbleSdk
        .triggerSurvey(trigger: trigger)
        .catchError((onError) => print(onError));
  }

  Future<void> setCustomerId({String? customerId}) async {
    babbleSdk
        .setCustomerId(customerId: customerId)
        .catchError((onError) => print(onError));
  }
}
