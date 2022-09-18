import 'package:binance_pay/order_init_parameters.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'binance_pay_method_channel.dart';

abstract class BinancePayPlatform extends PlatformInterface {
  /// Constructs a BinancePayPlatform.
  BinancePayPlatform() : super(token: _token);

  static final Object _token = Object();

  static BinancePayPlatform _instance = MethodChannelBinancePay();

  /// The default instance of [BinancePayPlatform] to use.
  ///
  /// Defaults to [MethodChannelBinancePay].
  static BinancePayPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [BinancePayPlatform] when
  /// they register themselves.
  static set instance(BinancePayPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<bool> init(OrderInitParameters parameters) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
