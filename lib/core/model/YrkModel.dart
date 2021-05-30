abstract class YrkModel {
  factory YrkModel.fromJson(Map<String, dynamic> json) => _YrkModelImpl();
  Map<String, dynamic> toJson();

  YrkModel();
}

class _YrkModelImpl implements YrkModel {
  @override
  Map<String, dynamic> toJson() {
    return new Map();
  }
}
