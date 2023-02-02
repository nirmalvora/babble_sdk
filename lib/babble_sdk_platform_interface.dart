import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'babble_sdk_method_channel.dart';

abstract class BabbleSdkPlatform extends PlatformInterface {
  /// Constructs a BabbleSdkPlatform.
  BabbleSdkPlatform() : super(token: _token);

  static final Object _token = Object();

  static BabbleSdkPlatform _instance = MethodChannelBabbleSdk();

  /// The default instance of [BabbleSdkPlatform] to use.
  ///
  /// Defaults to [MethodChannelBabbleSdk].
  static BabbleSdkPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [BabbleSdkPlatform] when
  /// they register themselves.
  static set instance(BabbleSdkPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> init(Map<String, String> params) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<void> triggerSurvey(Map<String, String> params) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<void> setCustomerId(Map<String, String?> params) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
