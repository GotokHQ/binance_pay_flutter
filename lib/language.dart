// ignore: depend_on_referenced_packages
// ignore_for_file: depend_on_referenced_packages

import 'package:binance_pay/enums.dart';
import 'package:json_annotation/json_annotation.dart';

part 'language.g.dart';

@JsonSerializable(explicitToJson: true)
class Language {
  const Language({required this.type, this.language});
  final LanguageType type;
  final String? language;

  factory Language.fromJson(Map<String, dynamic> json) =>
      _$LanguageFromJson(json);

  Map<String, dynamic> toJson() => _$LanguageToJson(this);
}
