import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test_task/data.dart';

class SelectElementPage extends StatelessWidget {
  int selectedIndex;
  int maxIndex;
  late TextEditingController _textEditingController =
      TextEditingController(text: '$selectedIndex');

  static GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  SelectElementPage(
      {Key? key, required this.selectedIndex, required this.maxIndex})
      : super(key: key);

  // ignore: prefer_final_fields

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
        floatingActionButton: Container(
          width: width * 0.3,
          height: width * 0.3,
          child: FloatingActionButton.extended(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                //_formKey.currentState!.save();

                Navigator.pop(context, int.parse(_textEditingController.text));
              }
            },
            label: Text(
              'Save',
              style: TextStyle(fontSize: height * 0.02),
            ),
            icon: Icon(
              Icons.save,
              size: width * 0.1,
            ),
            backgroundColor: Colors.pink,
          ),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(30),
                child: TextFormField(
                  controller: _textEditingController,
                  style:
                      TextStyle(fontSize: height * AllData.fontSizeKef * 1.8),
                  keyboardType: TextInputType.number,
                  autofocus: true,
                  inputFormatters: [
                    FilteringTextInputFormatter(RegExp(r'^[\d]{0,9}$'),
                        allow: true)
                  ],
                  validator: (value) => _validatorIndex(value ?? '', maxIndex)
                      ? null
                      : 'Uncurrect',
                  decoration: InputDecoration(
                    label: Text(
                      'Index: ',
                      style: TextStyle(fontSize: height * AllData.fontSizeKef),
                    ),
                    helperText: 'Enter an index less than ${maxIndex + 1}',
                    helperStyle:
                        TextStyle(fontSize: height * AllData.fontSizeKef),
                    errorStyle:
                        TextStyle(fontSize: height * AllData.fontSizeKef),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Colors.black)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Colors.green)),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

bool _validatorIndex(String input, int maxIndex) {
  if (input == '') {
    return false;
  } else if (int.parse(input) > maxIndex) return false;

  return true;
}
