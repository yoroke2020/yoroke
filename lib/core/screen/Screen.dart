import 'package:yoroke/core/model/YrkBlock2.dart';
import 'package:yoroke/core/model/YrkRequestContext.dart';

abstract class ScreenState<T extends YrkBlock2> {
  late final YrkRequestContext _reqCtx; // context for draw widgets
  late final T _block; // top level block of a screen

  T get block => this._block;

  set block(T block) {
    this._block = block;
  }

  void initBlock();
  void updateBlockOn(String action);

  YrkRequestContext get reqCtx => _reqCtx;
}

/* Example
    Map<String, dynamic> jsonResponse = TestBoardData().jsonResponse;
    print(
        "-------------------- STEP 1. FROM \"API RESPONSE (JSON)\" TO \"BLOCK\" --------------------");
    YrkApiResponse2 apiResponse = YrkApiResponse2.fromJson(jsonResponse);
    print("RESULT: " + apiResponse.body.toString());

    print(
        "-------------------- STEP 2. SET \"BOARD BLOCK\"-------------------------------------------");
    List<YrkBlock2> blocks = apiResponse.body;
    BoardBlock boardBlock = BoardBlock()..blocks = blocks;
    this.block = boardBlock;

    print("THIS IS BoardBlock");
    int counter = 0;
    boardBlock.blocks!.forEach((element) {
      print("[block instance#" + counter.toString() + "]");
      print("  " + element.toString());
      if (element.items == null) {
        print("  [blocks of block instance#" + counter.toString() + "]");
        print("    " + element.blocks.toString());
        element.blocks!
            .forEach((block) => print("      " + block.items.toString()));
      } else {
        print("  [items of block instance#" + counter.toString() + "]");
        print("    " + element.items.toString());
      }
      counter++;
    });
 */
