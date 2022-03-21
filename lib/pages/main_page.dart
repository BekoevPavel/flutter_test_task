import 'package:flutter_test_task/data.dart';
import 'package:flutter_test_task/widgets/main_widgets/my_input_widget.dart';
import 'package:flutter_test_task/widgets/main_widgets/my_progress_bar.dart';
import 'package:flutter_test_task/widgets/main_widgets/my_row_widget.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  var angle = 0.0.obs;
  MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool snackBarShown = false;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double startValue = 0.0;

    AllData.getInstance().setScrollConntroller(context);
    AllData.getInstance().setScrollValue(0.3, height);
    angle.value =
        AllData.getInstance().getScrollValue() * AllData.progressSpeed;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
            left: -width / 2.5,
            top: -width / 2.5,
            child: Obx(() {
              return MyProgressBar(
                width: width,
                rotate: angle.value,
              );
            }),
          ),
          Obx(
            () {
              return Positioned(
                top: AllData.getInstance().getScrollValue().value,
                child: GestureDetector(
                  onTapDown: (value) {
                    startValue = value.localPosition.dy;
                  },
                  onHorizontalDragUpdate: (value) {
                    if (value.globalPosition.dy - startValue >= 0) {
                      angle.value =
                          AllData.getInstance().getScrollValue().value *
                              AllData.progressSpeed;

                      AllData.getInstance().getScrollValue().value =
                          value.globalPosition.dy - startValue;
                      snackBarShown = false;
                    } else {
                      AllData.getInstance().setScrollValue(0);
                      if (!snackBarShown) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "Login failed",
                              style: TextStyle(
                                fontSize: height * AllData.fontSizeKef,
                              ),
                            ),
                          ),
                        );
                        snackBarShown = true;
                      }
                    }
                  },
                  child: Container(
                    width: width,
                    height: height,
                    color: Colors.grey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyInputWidget(sizeKef: 0.75),
                        MyInputWidget(sizeKef: 0.9),
                        MyInputWidget(sizeKef: 0.6),
                        MyRowWidget(
                          countItems: AllData.countItems,
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
