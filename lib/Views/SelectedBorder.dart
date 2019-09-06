import 'package:flutter/material.dart';

class SelectedBorder extends StatefulWidget {
  final ValueNotifier<bool> isSelected;

  SelectedBorder(this.isSelected);

  @override
  State<StatefulWidget> createState() {
    return _SelectedBorder();
  }
}

class _SelectedBorder extends State<SelectedBorder> {
  @override
  initState() {
    super.initState();
    // Call setState when the ValueNotifier changes
    widget.isSelected.addListener(didValueChange);
  }

  didValueChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            width: widget.isSelected.value ? 4.0 : 0, color: Colors.green),
      ),
    );
  }
}
