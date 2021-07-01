import 'package:flutter/cupertino.dart';
import 'package:yoroke/screens/common/YrkDotsIndicator.dart';

class FindFacilityImageListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> list = [
      "assets/images/sample_image.png",
      "assets/images/sample_image.png",
      "assets/images/sample_image.png",
      "assets/images/sample_image.png"
    ];

    PageController controller = PageController();

    return Container(
      height: 236.0,
      child: Stack(
        children: <Widget>[
          PageView.builder(
            controller: controller,
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              return Image.asset(list[index],
                  height: 236.0,
                  fit: BoxFit.fill);
            },
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(bottom: 56.0),
            child: YrkDotsIndicator(
              itemCount: list.length,
              controller: controller,
              unselectedBoarderColor: const Color(0xffffffff),
              onPageSelected: (int page) {
                controller.animateToPage(page,
                    duration: Duration(milliseconds: 100),
                    curve: Curves.ease);
              },
            ),
          )
        ],
      ),
    );
  }
}
