import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yoroke/screens/common/YrkTextStyle.dart';
import 'package:yoroke/screens/common/appbars/YrkAppBar.dart';

class FindFacilityReviewRating extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _rating = 0.0;

    void _onTapNext() async {
      Navigator.pop(context, _rating);
    }

    print(MediaQuery.of(context).size.width);
    return Scaffold(
        appBar: YrkAppBar(
          type: YrkAppBarType.arrowBackOnly,
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 128 / 640 * MediaQuery.of(context).size.height,
              ),
              InkWell(
                onTap: () => _onTapNext(),
                child: Padding(
                  padding:
                      EdgeInsets.only(right: 16.0, left: 16.0, bottom: 32.0),
                  child: Text(
                    "시설 이용 \n경험은 어떠셨나요?",
                    style: const YrkTextStyle(
                        fontWeight: FontWeight.w700,
                        height: 1.5,
                        fontSize: 22.0),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(
                    horizontal:
                        9.5 / 360.0 * MediaQuery.of(context).size.width),
                child: RatingBar(
                  initialRating: 0,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemCount: 5,
                  ratingWidget: RatingWidget(
                    full: SvgPicture.asset("icon_star_on.svg"),
                    half: SvgPicture.asset("icon_star_on.svg"),
                    empty: SvgPicture.asset("icon_star_off.svg"),
                  ),
                  itemPadding: EdgeInsets.symmetric(
                      horizontal:
                          6.5 / 360.0 * MediaQuery.of(context).size.width),
                  itemSize: 54.0 / 360.0 * MediaQuery.of(context).size.width,
                  onRatingUpdate: (rating) {
                    _rating = rating;
                  },
                ),
              )
            ]));
  }
}
