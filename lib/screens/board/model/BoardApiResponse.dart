import 'dart:math';

import 'package:json_annotation/json_annotation.dart';
import 'package:yoroke/core/model/YrkApiResponse.dart';
import 'package:yoroke/core/model/YrkBlock2.dart';

part 'BoardApiResponse.g.dart';

@JsonSerializable(explicitToJson: true)
class BoardApiResponse<T extends YrkBlock2> extends YrkApiResponse {
  BoardApiResponse();

  @_BlockConverter()
  late List<T> body;

  factory BoardApiResponse.fromJson(Map<String, dynamic> json) =>
      _$BoardApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BoardApiResponseToJson(this);
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