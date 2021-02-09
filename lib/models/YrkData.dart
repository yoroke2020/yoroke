import 'package:yoroke/navigator/PageItem.dart';

class YrkData {
  YrkData(this.currentSubItemIndex, this.data,
      {this.appBarType = AppBarType.normal,
      this.bottomNavigationType = BottomNavigationType.normal});

  final SubItem currentSubItemIndex;
  final AppBarType appBarType;
  final BottomNavigationType bottomNavigationType;
  final String data;
}
