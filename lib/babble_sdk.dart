import 'babble_sdk_platform_interface.dart';

class BabbleSdk {
  Future<void> init(Map<String, String> params) {
    return BabbleSdkPlatform.instance.init(params);
  }

  Future<void> triggerSurvey(Map<String, String> params) {
    return BabbleSdkPlatform.instance.triggerSurvey(params);
  }
}
