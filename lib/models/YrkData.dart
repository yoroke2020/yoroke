import 'package:yoroke/navigator/PageItem.dart';

class YrkData {
  YrkData({
    required this.nextPageItem,
    this.prevPageItem,
    this.str0,
    this.str1,
    this.str2,
    this.str3,
    this.str4,
    this.i0,
    this.i1,
    this.i2,
    this.i3,
    this.i4,
  });

  final SubPageItem? nextPageItem; //SubItem
  final prevPageItem;

  //TODO: 추후 API 관련 parameter로 변경
  String? str0; // String to be printed whether the correct item is selected/tapped
  String? str1;
  String? str2;
  String? str3;
  String? str4;
  int? i0; // Usually the parentIndex of the item
  int? i1; // Usually the itemIndex of the item
  int? i2;
  int? i3;
  int? i4;
}
