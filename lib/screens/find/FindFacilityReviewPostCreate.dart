import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/models/documents/document.dart';
import 'package:flutter_quill/widgets/controller.dart';
import 'package:flutter_quill/widgets/editor.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yoroke/screens/common/buttons/YrkButton.dart';
import 'package:yoroke/screens/common/buttons/YrkIconButton.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';
import 'package:yoroke/screens/find/FindFacilityReviewRating.dart';

class FindFacilityReviewCreatePost extends StatefulWidget {
  @override
  _FindFacilityReviewCreatePostState createState() =>
      _FindFacilityReviewCreatePostState();
}

class _FindFacilityReviewCreatePostState
    extends State<FindFacilityReviewCreatePost> {
  // PostCreate Body Controller & Document
  late QuillController _bodyController;

  // ScrollController for the Current PostCreate Body
  final ScrollController _scrollController = ScrollController();

  // Changes due to RegisterButton Activation
  Color _registerButtonFillColor = const Color(0xfff4f4f4);
  Color _registerButtonTextColor = const Color(0xffaaaaaa);
  bool _isRegisterButtonClickable = false;

  bool _isBodyEmpty = true;
  double _rating = -1;

  @override
  void initState() {
    super.initState();
    setState(() {
      _bodyController = QuillController(
          document: Document(),
          selection: const TextSelection.collapsed(offset: 0));
    });

    _bodyController.addListener(() {
      _setRegisterButtonColor();
    });
  }

  void _setRegisterButtonColor() {
    _isBodyEmpty = _bodyController.document.isEmpty();
    if (_isBodyEmpty) {
      setState(() {
        _registerButtonFillColor = const Color(0xfff4f4f4);
        _registerButtonTextColor = const Color(0xffaaaaaa);
        _isRegisterButtonClickable = false;
      });
    } else {
      setState(() {
        _registerButtonFillColor = const Color(0xffffec6a);
        _registerButtonTextColor = const Color(0x99000000);
        _isRegisterButtonClickable = true;
      });
    }
  }

  @override
  void dispose() {
    _bodyController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if(_rating == -1)
      _onPressedChangeRating(context);

    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(98.0),
          child: Column(children: <Widget>[
            Container(
                width: double.maxFinite,
                height: 49.0,
                margin:
                    EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                decoration: BoxDecoration(
                  border: Border(
                      bottom:
                          BorderSide(width: 1, color: const Color(0xffe5e5e5))),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      YrkIconButton(
                        onTap: () {
                          int result = -1;
                          Navigator.pop(context, result);
                        },
                        icon: "assets/icons/icon_clear.svg",
                        iconSize: 24.0,
                      ),
                      Spacer(),
                      YrkButton(
                        buttonType: ButtonType.solid,
                        label: "등록",
                        clickable: _isRegisterButtonClickable,
                        onPressed: () => _onPressedRegister(context),
                        width: 48.0,
                        height: 24.0,
                        fillColor: _registerButtonFillColor,
                        textStyle: YrkTextStyle(
                          fontWeight: FontWeight.w500,
                          color: _registerButtonTextColor,
                        ),
                      )
                    ],
                  ),
                )),
            InkWell(
                child: Container(
                    width: double.maxFinite,
                    height: 49.0,
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 1, color: const Color(0xffe5e5e5))),
                    ),
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            RatingBarIndicator(
                              rating: _rating,
                              itemBuilder: (context, index) => SvgPicture.asset(
                                  "assets/icons/icon_star_on.svg"),
                              itemCount: 5,
                              itemSize: 20.0,
                              direction: Axis.horizontal,
                            ),
                            Spacer(),
                            YrkButton(
                              onPressed: () => _onPressedChangeRating(context),
                              label: '별점수정',
                              buttonType: ButtonType.text,
                              textStyle: const YrkTextStyle(
                                  color: const Color(0x4d000000),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.0),
                            )
                          ],
                        )))),
          ])),
      body: Padding(
          padding:
              EdgeInsets.only(left: 16.0, right: 16.0, top: 12.0, bottom: 40.0),
          child: QuillEditor(
            controller: _bodyController,
            readOnly: false,
            autoFocus: false,
            focusNode: FocusNode(),
            scrollable: true,
            scrollController: _scrollController,
            padding: EdgeInsets.all(0),
            expands: false,
          )),
    );
  }

  void _onPressedRegister(BuildContext context) {
    String body = jsonEncode(_bodyController.document.toPlainText());
    Navigator.pop(context, body);
  }

  void _onPressedChangeRating(BuildContext context) async {
    WidgetsBinding.instance!.addPostFrameCallback ((_) async {
      final result = await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => FindFacilityReviewRating()));
      if (result == null && _rating == -1) {
        Navigator.pop(context);
      } else {
        setState(() {
          _rating = result;
        });
      }
    });
  }
}
