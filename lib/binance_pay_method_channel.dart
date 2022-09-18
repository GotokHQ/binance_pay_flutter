import 'package:binance_pay/binance_pay_exception.dart';
import 'package:binance_pay/enums.dart';
import 'package:binance_pay/order_init_parameters.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'binance_pay_platform_interface.dart';

/// An implementation of [BinancePayPlatform] that uses method channels.
class MethodChannelBinancePay extends BinancePayPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('binance_pay');

  @override
  Future<bool> init(OrderInitParameters parameters) async {
    try {
      final success =
          await methodChannel.invokeMethod<bool?>('init', parameters.toJson());
      if (success == null) {
        throw BinancePayException(PayErrorType.canceled);
      }
      return success;
    } on PlatformException catch (error) {
      final errorType = PayErrorType.fromString(error.code);
      if (error.details != null) {
        final details = asStringKeyedMap(error.details);
        if (errorType == PayErrorType.invalidParameters) {
          throw BinancePayException(errorType,
              code: error.details,
              orderInitParametersError:
                  OrderInitParametersError.fromString(details['code']!));
        }
        if (errorType == PayErrorType.fromBinanceApp) {
          throw BinancePayException(errorType,
              code: details['code']!, message: details['message']!);
        }
      }
      throw BinancePayException(errorType, message: error.message);
    }
  }
}

Map<String, dynamic> asStringKeyedMap(Map<dynamic, dynamic> map) {
  //if (map == null) return null;
  if (map is Map<String, dynamic>) {
    return map;
  } else {
    return Map<String, dynamic>.from(map);
  }
}
