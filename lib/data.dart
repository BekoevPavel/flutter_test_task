import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class AllData {
  static const fontSizeKef = 0.02;
  static const progressSpeed = 0.002;
  static const countItems = 10;
  RxInt selectedItem = 0.obs;
  RxDouble? _scrollValue;
  AutoScrollController? _scrollController;
  double scaleTimeLine = 1;
  double scrollK = 1;

  void setScrollValue(double _value, [double height = 0]) {
    _scrollValue ??= RxDouble(_value * height);
  }

  RxDouble getScrollValue() {
    return _scrollValue ?? (_scrollValue = RxDouble(0));
  }

  void setScrollConntroller(BuildContext context) {
    _scrollController ??= AutoScrollController(
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: Axis.horizontal);
  }

  AutoScrollController get getScrollController {
    return _scrollController!;
  }

  static AllData? _instance;
  AllData._();
  static AllData getInstance() {
    return _instance ??= AllData._();
  }
}
