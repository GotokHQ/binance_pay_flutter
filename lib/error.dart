import 'package:binance_pay/enums.dart';
// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'error.g.dart';

@JsonSerializable(explicitToJson: true)
class Error {
  const Error(
      {required this.type,
      this.orderInitParametersError,
      this.code,
      this.message});
  final PayErrorType type;
  final OrderInitParametersError? orderInitParametersError;
  final int? code;
  final String? message;

  factory Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorToJson(this);
}
