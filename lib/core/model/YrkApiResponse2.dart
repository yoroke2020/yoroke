import 'dart:core';

import 'package:json_annotation/json_annotation.dart';

import 'YrkBlock2.dart';

part 'YrkApiResponse2.g.dart';

@JsonSerializable(explicitToJson: true)
class YrkApiResponse2<T extends YrkBlock2> {
  YrkApiResponse2();

  String? status;
  String? message;

  @_BlockConverter()
  late List<T> body;

  factory YrkApiResponse2.fromJson(Map<String, dynamic> json) =>
      _$YrkApiResponse2FromJson(json);

  Map<String, dynamic> toJson() => _$YrkApiResponse2ToJson(this);
}

class _BlockConverter<T> implements JsonConverter<T, Object> {
  const _BlockConverter();

  @override
  T fromJson(Object json) {
    return YrkBlock2.fromJson(json as Map<String, dynamic>) as T;
  }

  @override
  Object toJson(T object) {
    return object!;
  }
}
