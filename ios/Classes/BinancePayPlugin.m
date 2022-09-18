#import "BinancePayPlugin.h"
#if __has_include(<binance_pay/binance_pay-Swift.h>)
#import <binance_pay/binance_pay-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "binance_pay-Swift.h"
#endif

@implementation BinancePayPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftBinancePayPlugin registerWithRegistrar:registrar];
}
@end
