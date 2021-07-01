import 'package:flutter/cupertino.dart';
import 'package:yoroke/core/model/YrkBlock2.dart';
import 'package:yoroke/core/model/YrkModel2.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';
import 'package:yoroke/screens/common/buttons/YrkButton.dart';

class FindSortOption extends StatefulWidget {
  FindSortOption({required this.block, required this.onPressed});

  final YrkBlock2 block;
  final ValueChanged<int> onPressed;

  @override
  _FindSortOptionState createState() => _FindSortOptionState();
}

class _FindSortOptionState extends State<FindSortOption> {
  int selectedIndex = 0;

  get _optionButtons {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < 4; i++) {
      list.add(Padding(
          padding: EdgeInsets.only(
              left: i == 0 ? 16.0 : 3.5, right: i == 3 ? 16.0 : 3.0),
          child: YrkButton(
              width: i != 2 ? 80.0 : 66.0,
              height: 32.0,
              buttonType: ButtonType.outlinechip,
              borderWidth: 1,
              fillColor: i == selectedIndex
                  ? const Color(0xfff5df4d)
                  : const Color(0xffffffff),
              borderColor: i == selectedIndex
                  ? const Color(0xfff5df4d)
                  : const Color(0x4d000000),
              label: widget.block.items!.cast<YrkModel2>()[i].title,
              textStyle: YrkTextStyle(
                  color: i == selectedIndex
                      ? const Color(0xe6000000)
                      : const Color(0x99000000),
                  fontSize: 13.0),
              onPressed: () => onPressed(i))));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.maxFinite,
        height: 56.0,
        child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: _optionButtons)));
  }

  onPressed(int index) {
    setState(() {
      selectedIndex = index;
      widget.onPressed(index);
    });
  }
}
