import 'package:babble_sdk/babble_sdk.dart';

class BabbleUtils {
  final babbleSdk = BabbleSdk();
  static final BabbleUtils _singleton = BabbleUtils._internal();

  factory BabbleUtils() {
    return _singleton;
  }

  BabbleUtils._internal();
  Future<void> initBabble() async {
    babbleSdk.init({"api_key": ""});
  }

  Future<void> triggerSurvey(trigger) async {
    babbleSdk
        .triggerSurvey({"trigger": trigger, 'customer_id': 'test'}).catchError(
            (onError) => print(onError));
  }
}
