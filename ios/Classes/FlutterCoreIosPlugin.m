#import "FlutterCoreIosPlugin.h"
#if __has_include(<realtimekit_core_ios/realtimekit_core_ios-Swift.h>)
#import <realtimekit_core_ios/realtimekit_core_ios-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "realtimekit_core_ios-Swift.h"
#endif

@implementation FlutterCorePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterCoreIosPlugin registerWithRegistrar:registrar];
}
@end
