import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:yoroke/core/model/YrkModel.dart';
import 'package:yoroke/models/YrkData.dart';
import 'package:yoroke/screens/board/BoardReview.dart';
import 'package:yoroke/screens/common/YrkStarRating.dart';
import 'package:yoroke/screens/common/buttons/YrkIconButton.dart';

part 'HomePopularCardListItem.g.dart';

class HomePopularCardListItem extends StatelessWidget {
  HomePopularCardListItem({
    required this.width,
    required this.height,
    required this.model,
  });

  final double width;
  final double height;
  final HomePopularCardListItemModel model;

  void _onCardItemClicked(BuildContext context) async {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BoardReview(data: new YrkData())));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        // shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(16)),
        elevation: 0.0,
        margin: const EdgeInsets.only(right: 8),
        child: InkWell(
            onTap: () => _onCardItemClicked(context),
            borderRadius: BorderRadius.circular(16),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      width: width,
                      height: height,
                      child: Stack(children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            image: new DecorationImage(
                              // image: new AssetImage(testCardImage.elementAt(index)),
                              image: NetworkImage(model.imageUrl!),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                                gradient: LinearGradient(
                                    begin: Alignment(0.5, -0.0739222913980484),
                                    end: Alignment(0.5, 1),
                                    colors: [
                                      const Color(0x00ffffff),
                                      const Color(0x4d000000)
                                    ]))),
                      ])),
                  Container(
                      padding: const EdgeInsets.only(left: 8, top: 8),
                      child: Text(model.facilityName!,
                          style: const TextStyle(
                              color: const Color(0xe6000000),
                              fontWeight: FontWeight.w700,
                              fontFamily: "NotoSansCJKKR",
                              fontStyle: FontStyle.normal,
                              fontSize: 16.0),
                          textAlign: TextAlign.left)),
                  Container(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(model.address!,
                          style: const TextStyle(
                              color: const Color(0xe6000000),
                              fontWeight: FontWeight.w400,
                              fontFamily: "NotoSansCJKKR",
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0),
                          textAlign: TextAlign.left)),
                  Container(
                      width: 144,
                      height: 30,
                      child: Row(children: <Widget>[
                        Container(
                            width: 60,
                            height: 16,
                            margin: const EdgeInsets.only(left: 4),
                            child: YrkStarRating(
                                rating: model.rating!,
                                eachWidth: 12,
                                eachHeight: 11)),
                        Container(
                          margin: const EdgeInsets.only(left: 39),
                          width: 16,
                          height: 16,
                          child: YrkIconButton(icon: "icon_save_black.svg"),
                        ),
                        Container(
                            width: 25,
                            height: 16,
                            padding: const EdgeInsets.only(top: 1, bottom: 1),
                            child: Text(model.bookmarkCount!.toString(),
                                style: const TextStyle(
                                    color: const Color(0x4d000000),
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Helvetica",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14.0),
                                textAlign: TextAlign.left)),
                      ])),
                ])));
  }
}

@JsonSerializable()
class HomePopularCardListItemModel extends YrkModel {
  String? facilityName;
  String? address;
  String? imageUrl;
  double? bookmarkCount;
  double? rating;

  HomePopularCardListItemModel();

  factory HomePopularCardListItemModel.fromJson(Map<String, dynamic> json) =>
      _$HomePopularCardListItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$HomePopularCardListItemModelToJson(this);
}
