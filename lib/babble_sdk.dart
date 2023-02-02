import 'babble_sdk_platform_interface.dart';

class BabbleSdk {
  Future<void> init({required String userId}) {
    return BabbleSdkPlatform.instance.init({"user_id": userId});
  }

  Future<void> triggerSurvey({required String trigger}) {
    return BabbleSdkPlatform.instance.triggerSurvey({"trigger": trigger});
  }

  Future<void> setCustomerId({required String? customerId}) {
    return BabbleSdkPlatform.instance
        .setCustomerId({"customer_id": customerId});
  }
}
