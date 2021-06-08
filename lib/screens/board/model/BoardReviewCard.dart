import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:yoroke/core/model/YrkModel.dart';
import 'package:yoroke/models/CardModel.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';

part 'BoardReviewCard.g.dart';

class BoardReviewCards extends StatefulWidget {
  BoardReviewCards(
      {this.index = -1, required this.models, required this.onTap});

  final int index;
  final List<CardModel> models;
  final ValueChanged<int> onTap;

  @override
  _BoardReviewCardsState createState() => _BoardReviewCardsState();
}

class _BoardReviewCardsState extends State<BoardReviewCards> {
  late int curIndex;

  @override
  void initState() {
    super.initState();
    curIndex = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100.0,
        alignment: Alignment.centerLeft,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.models.length,
            itemBuilder: (BuildContext context, int index) {
              return _BoardReviewCard(
                model: widget.models[index],
                isBorder: curIndex == index,
                onTap: () {
                  curIndex = index;
                  widget.onTap(index);
                },
              );
            }));
  }
}

class _BoardReviewCard extends StatelessWidget {
  _BoardReviewCard(
      {this.isBorder = false, required this.onTap, required this.model});

  final bool isBorder;
  final VoidCallback onTap;
  final CardModel? model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 48.0,
                    height: 48.0,
                    margin: EdgeInsets.only(bottom: 8.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        image: new DecorationImage(
                          image: new AssetImage(model!.imagePath!),
                          fit: BoxFit.fill,
                        ),
                        border: isBorder
                            ? Border.all(
                                color: const Color(0xfff5df4d), width: 2)
                            : null),
                  ),
                  Text(
                    model!.title!,
                    style: const YrkTextStyle(
                        color: const Color(0x99000000),
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0),
                  ),
                ])));
  }
}

@JsonSerializable()
class BoardReviewCardModel extends YrkModel {
  String? imagePath;
  String? title;

  BoardReviewCardModel();

  factory BoardReviewCardModel.fromJson(Map<String, dynamic> json) =>
      _$BoardReviewCardModelFromJson(json);

  Map<String, dynamic> toJson() => _$BoardReviewCardModelToJson(this);
}
