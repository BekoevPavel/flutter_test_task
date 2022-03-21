import 'package:flutter/material.dart';
import 'package:flutter_test_task/data.dart';
import 'package:flutter_test_task/pages/select_element_page.dart';
import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class MyRowWidget extends StatelessWidget {
  int countItems = 0;
  MyRowWidget({Key? key, required this.countItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Container(
      height: height * 0.2,
      child: ListView.builder(
        controller: AllData.getInstance().getScrollController,
        scrollDirection: Axis.horizontal,
        itemCount: countItems,
        itemBuilder: (context, item) {
          return AutoScrollTag(
            key: ValueKey(item),
            controller: AllData.getInstance().getScrollController,
            index: item,
            highlightColor: Colors.green,
            child: Row(
              children: [
                const SizedBox(
                  width: 30,
                ),
                GestureDetector(onTap: () {
                  _returnEnteredIndex(
                      context,
                      item,
                      AllData.getInstance().selectedItem,
                      //AllData.getInstance().getScrollController,
                      countItems - 1);
                }, child: Obx(() {
                  return Container(
                    child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          '$item',
                          style:
                              TextStyle(fontSize: height * AllData.fontSizeKef),
                        )),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.circular(height * 0.03)),
                      color: item == AllData.getInstance().selectedItem.value
                          ? Colors.green
                          : Colors.grey[200],
                      border: Border.all(
                        color: Colors.green,
                      ),
                    ),
                    width: height * 0.15,
                    height: height * 0.15,
                  );
                })),
              ],
            ),
          );
        },
      ),
    );
  }
}

void _returnEnteredIndex(
    BuildContext context, int item, RxInt selectedItem, int maxIndex) async {
  selectedItem.value = await Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => SelectElementPage(
              selectedIndex: item,
              maxIndex: maxIndex,
            )),
  );

  AllData.getInstance().getScrollController.scrollToIndex(
      selectedItem.value - 1,
      preferPosition: AutoScrollPosition.begin);
}
