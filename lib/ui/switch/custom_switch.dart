import 'package:fedi/ui/switch/custom_switch_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

// ignore_for_file: no-magic-number
class CustomSwitch extends StatelessWidget {
  final double width;
  final double height;
  final double backgroundBorderRadius;
  final Color backgroundActiveColor;
  final Color backgroundInactiveColor;
  final Color backgroundDisabledColor;
  final Color indicatorActiveColor;
  final Color indicatorInactiveColor;
  final Color indicatorDisabledColor;
  final double indicatorSize;
  final double borderWidth;
  final Color borderColor;
  final bool enabled;

  CustomSwitch({
    Key? key,
    this.backgroundActiveColor = Colors.transparent,
    this.backgroundInactiveColor = Colors.transparent,
    this.backgroundDisabledColor = Colors.transparent,
    this.indicatorActiveColor = Colors.blue,
    this.indicatorInactiveColor = Colors.grey,
    this.indicatorDisabledColor = Colors.grey,
    this.borderColor = Colors.black,
    this.width = 70.0,
    this.height = 35.0,
    this.borderWidth = 1.0,
    this.indicatorSize = 25.0,
    this.backgroundBorderRadius = 20.0,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var customSwitchBloc = ICustomSwitchBloc.of(context);

    return StreamBuilder<bool>(
      stream: customSwitchBloc.currentValueStream,
      initialData: customSwitchBloc.currentValue,
      builder: (context, snapshot) {
        var currentValue = snapshot.data == true;

        return FlutterSwitch(
          disabled: !enabled,
          width: width,
          height: height,
          switchBorder: Border.all(
            color: borderColor,
            width: borderWidth,
          ),
          activeColor:
              enabled ? backgroundActiveColor : backgroundDisabledColor,
          inactiveColor:
              enabled ? backgroundInactiveColor : backgroundDisabledColor,
          toggleSize: indicatorSize,
          toggleColor: indicatorActiveColor,
          activeToggleColor:
              enabled ? indicatorActiveColor : indicatorDisabledColor,
          inactiveToggleColor:
              enabled ? indicatorInactiveColor : indicatorDisabledColor,
          value: currentValue,
          borderRadius: backgroundBorderRadius,
          // padding: 8.0,
          showOnOff: false,
          onToggle: (value) {
            customSwitchBloc.changeValue(value);
          },
        );
      },
    );
  }
}
