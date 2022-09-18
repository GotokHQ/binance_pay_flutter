import 'package:binance_pay/enums.dart';


class BinancePayException implements Exception {
  final PayErrorType errorType;
  final int? code;
  final String? message;
  final OrderInitParametersError? orderInitParametersError;

  BinancePayException(this.errorType,
      {this.code, this.message, this.orderInitParametersError});

  Map<String, dynamic> toMap() {
    return {
      'errorType': errorType,
      'code': code,
      'message': message,
    };
  }

  @override
  String toString() {
    return '${toMap()}';
  }
}
