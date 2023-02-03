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

  Future<void> triggerSurvey({required String trigger}) {
    return BabbleSdkPlatform.instance.triggerSurvey({"trigger": trigger});
  }

  Future<void> setCustomerId({required String? customerId}) {
    return BabbleSdkPlatform.instance
        .setCustomerId({"customer_id": customerId});
  }
}
