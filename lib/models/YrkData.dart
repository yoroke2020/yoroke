import 'package:yoroke/navigator/PageItem.dart';

class YrkData {
  YrkData(this.currentSubItemIndex, this.data,
      {this.cardIndex = 0,
      this.appBarType = AppBarType.arrowBack,
      this.bottomNavigationType = BottomNavigationType.normal});

  final SubItem currentSubItemIndex;
  final AppBarType appBarType;
  final BottomNavigationType bottomNavigationType;

  int cardIndex;
  String data;
}
