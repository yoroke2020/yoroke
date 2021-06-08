import 'dart:core';

import 'package:json_annotation/json_annotation.dart';
import 'package:yoroke/models/CardModel.dart';
import 'package:yoroke/models/PostModel.dart';

part 'YrkBlock2.g.dart';

@JsonSerializable(explicitToJson: true)
class YrkBlock2<B, M> {
  @JsonKey(name: "@type")
  late String? type;

  @JsonKey(name: "@category")
  late String? category;

  late String? title;

  @_BlockConverter()
  List<B>? blocks;

  @_ModelConverter()
  List<M>? items;

  factory YrkBlock2.fromJson(Map<String, dynamic> json) =>
      _$YrkBlock2FromJson(json);

  Map<String, dynamic> toJson() => _$YrkBlock2ToJson(this);

  YrkBlock2();
}

class _ModelConverter<M> implements JsonConverter<M, Object> {
  const _ModelConverter();

  @override
  M fromJson(Object json) {
    switch (getTypeFrom(json as Map<String, dynamic>)) {
      case "card":
        return CardModel.fromJson(json) as M;
      case "post":
        return PostModel.fromJson(json) as M;
      default:
        return json as M;
    }
  }

  @override
  Object toJson(M object) {
    return object!;
  }
}

class _BlockConverter<B> implements JsonConverter<B, Object> {
  const _BlockConverter();

  @override
  B fromJson(Object json) {
    switch (getCategoryFrom(json as Map<String, dynamic>)) {
      // case "review":
      //   return YrkBlock2.fromJson(json) as B;
      // case "qna":
      //   return YrkBlock2.fromJson(json) as B;
      default:
        return YrkBlock2.fromJson(json) as B;
    }
  }

  @override
  Object toJson(B object) {
    return object!;
  }
}

String getTypeFrom(Map<String, dynamic> json) {
  return json.containsKey('@type')
      ? json.entries.firstWhere((element) => element.key == '@type').value
      : "";
}

String getCategoryFrom(Map<String, dynamic> json) {
  return json.containsKey('@category')
      ? json.entries.firstWhere((element) => element.key == '@category').value
      : "";
}
