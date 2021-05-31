import 'dart:core';

abstract class YrkApiResponse {
  String? status;
  String? message;

  factory YrkApiResponse.fromJson(Map<String, dynamic> json) =>
      _YrkApiResponseImpl();
  Map<String, dynamic> toJson();

  YrkApiResponse();
}

class _YrkApiResponseImpl implements YrkApiResponse {
  @override
  Map<String, dynamic> toJson() {
    return new Map();
  }

  @override
  String? message;

  @override
  String? status;
}
