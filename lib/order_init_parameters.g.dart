// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_init_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderInitParameters _$OrderInitParametersFromJson(Map<String, dynamic> json) =>
    OrderInitParameters(
      merchantId: json['merchantId'] as String,
      prepayId: json['prepayId'] as String,
      timestamp: json['timestamp'] as int,
      noncestr: json['noncestr'] as String,
      certSn: json['certSn'] as String,
      sign: json['sign'] as String,
      redirectScheme: json['redirectScheme'] as String,
    );

Map<String, dynamic> _$OrderInitParametersToJson(
        OrderInitParameters instance) =>
    <String, dynamic>{
      'merchantId': instance.merchantId,
      'prepayId': instance.prepayId,
      'timestamp': instance.timestamp,
      'noncestr': instance.noncestr,
      'certSn': instance.certSn,
      'sign': instance.sign,
      'redirectScheme': instance.redirectScheme,
    };
