// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'order_init_parameters.g.dart';

@JsonSerializable(explicitToJson: true)
class OrderInitParameters {
  const OrderInitParameters(
      {required this.merchantId,
      required this.prepayId,
      required this.timestamp,
      required this.noncestr,
      required this.certSn,
      required this.sign,
      required this.redirectScheme});
  final String merchantId;
  final String prepayId;
  final int timestamp;
  final String noncestr;
  final String certSn;
  final String sign;
  final String redirectScheme;

  factory OrderInitParameters.fromJson(Map<String, dynamic> json) =>
      _$OrderInitParametersFromJson(json);

  Map<String, dynamic> toJson() => _$OrderInitParametersToJson(this);
}
