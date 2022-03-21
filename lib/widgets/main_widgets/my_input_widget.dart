import 'package:flutter/material.dart';
import 'package:flutter_test_task/data.dart';

class MyInputWidget extends StatelessWidget {
  double sizeKef;
  MyInputWidget({Key? key, required this.sizeKef}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      padding:
          EdgeInsets.only(left: 30, top: height * 0.02, bottom: height * 0.02),
      width: width * sizeKef,
      child: TextField(
        style: TextStyle(fontSize: height * AllData.fontSizeKef),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(60),
            borderSide: const BorderSide(color: Colors.green, width: 5),
          ),
        ),
      ),
    );
  }
}
