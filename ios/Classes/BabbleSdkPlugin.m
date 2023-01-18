#import "BabbleSdkPlugin.h"
#if __has_include(<babble_sdk/babble_sdk-Swift.h>)
#import <babble_sdk/babble_sdk-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "babble_sdk-Swift.h"
#endif

@implementation BabbleSdkPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftBabbleSdkPlugin registerWithRegistrar:registrar];
}
@end
