import 'package:flutter/material.dart';

class RadioWidget extends StatelessWidget {
  const RadioWidget({Key? key,
    required this.titleRadio}) : super(key: key);

  final String titleRadio;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Theme(
        data: ThemeData(unselectedWidgetColor: Colors.grey),
        child: RadioListTile(
          activeColor: Colors.black,
          contentPadding: EdgeInsets.zero,
          title: Transform.translate(
            offset: Offset(-22, 0),
            child: Text(
              titleRadio,
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w700
              ),
            ),
          ),
          value: 1,
          groupValue: 0,
          onChanged: (value) {

          },
        ),
      ),
    );
  }
}
