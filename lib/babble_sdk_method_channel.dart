import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'babble_sdk_platform_interface.dart';

/// An implementation of [BabbleSdkPlatform] that uses method channels.
class MethodChannelBabbleSdk extends BabbleSdkPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('babble_sdk');

  @override
  Future<void> init(Map<String, String> params) async {
    methodChannel.invokeMethod<void>('init', params);
  }

  @override
  Future<void> triggerSurvey(Map<String, dynamic> params) async {
    methodChannel.invokeMethod<void>('trigger_survey', params);
  }

  @override
  Future<void> setCustomerId(Map<String, dynamic> params) async {
    methodChannel.invokeMethod<void>('set_customer_id', params);
  }
}
