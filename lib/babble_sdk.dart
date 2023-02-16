import 'babble_sdk_platform_interface.dart';

class BabbleSdk {
  static final BabbleSdk _instance = BabbleSdk();

  /// The default instance of [BabbleSdkPlatform] to use.
  ///
  /// Defaults to [MethodChannelBabbleSdk].
  static BabbleSdk get instance => _instance;
  Future<void> init({required String userId}) {
    return BabbleSdkPlatform.instance.init({"user_id": userId});
  }

  Future<void> triggerSurvey(
      {required String trigger, Map<String, dynamic>? properties}) {
    return BabbleSdkPlatform.instance
        .triggerSurvey({"trigger": trigger, "properties": properties});
  }

  Future<void> setCustomerId(
      {required String? customerId, Map<String, dynamic>? userDetails}) {
    return BabbleSdkPlatform.instance.setCustomerId(
        {"customer_id": customerId, 'user_details': userDetails});
  }
}
