import 'package:json_annotation/json_annotation.dart';

part 'YrkModel2.g.dart';

@JsonSerializable(explicitToJson: true)
class YrkModel2 {
  @JsonKey(name: "@type")
  late String? type;

  @JsonKey(name: "@category")
  late String? category;

  late String? title;

  factory YrkModel2.fromJson(Map<String, dynamic> json) =>
      _$YrkModel2FromJson(json);

  Map<String, dynamic> toJson() => _$YrkModel2ToJson(this);

  YrkModel2();
}
