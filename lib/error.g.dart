// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Error _$ErrorFromJson(Map<String, dynamic> json) => Error(
      type: json['type'],
      orderInitParametersError: json['orderInitParametersError'],
      code: json['code'] as int?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ErrorToJson(Error instance) => <String, dynamic>{
      'type': instance.type,
      'orderInitParametersError': instance.orderInitParametersError,
      'code': instance.code,
      'message': instance.message,
    };
