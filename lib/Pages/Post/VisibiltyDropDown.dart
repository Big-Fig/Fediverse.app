import 'package:flutter/material.dart';

class VisibilityDropDown extends StatefulWidget {
  final Function(String) updateVisibility;
  VisibilityDropDown(this.updateVisibility);

  @override
  State<StatefulWidget> createState() {
    return _VisibilityDropDown();
  }
}

class _VisibilityDropDown extends State<VisibilityDropDown> {
  String dropdownValue = "Public";

  Map<String, Icon> icons = {
    "Public": Icon(Icons.public),
    "Unlisted": Icon(Icons.lock_open),
    "Private": Icon(Icons.lock)
  };

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text("Visibility:"),
        DropdownButton<String>(
          value: dropdownValue,
          onChanged: (String newValue) {
            setState(() {
              dropdownValue = newValue;
            });
          },
          items: <String>[
            'Public',
            'Unlisted',
            'Private',
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Row(
                children: <Widget>[icons[value], Text(value)],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
