import 'package:fedi/ui/switch/custom_switch_bloc.dart';
import 'package:flutter/material.dart';

// todo: refactor, cant change value outside this widget
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
  final EdgeInsets indicatorPadding;
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
    this.indicatorPadding = const EdgeInsets.all(8.0),
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var customSwitchBloc = ICustomSwitchBloc.of(context, listen: false);
    return StreamBuilder<bool>(
      stream: customSwitchBloc.currentValueStream,
      initialData: customSwitchBloc.currentValue,
      builder: (context, snapshot) {
        var currentValue = snapshot.data;
        return _CustomSwitchIndicator(
          value: currentValue,
          backgroundActiveColor: backgroundActiveColor,
          backgroundInactiveColor: backgroundInactiveColor,
          backgroundDisabledColor: backgroundDisabledColor,
          indicatorActiveColor: indicatorActiveColor,
          indicatorInactiveColor: indicatorInactiveColor,
          indicatorDisabledColor: indicatorDisabledColor,
          borderColor: borderColor,
          width: width,
          height: height,
          borderWidth: borderWidth,
          indicatorSize: indicatorSize,
          backgroundBorderRadius: backgroundBorderRadius,
          indicatorPadding: indicatorPadding,
          onChanged: (bool value) {
            customSwitchBloc.changeValue(value);
          },
          enabled: enabled,
        );
      },
    );
  }
}

class _CustomSwitchIndicator extends StatelessWidget {
  final bool? value;
  final double width;
  final double height;
  final ValueChanged<bool> onChanged;
  final double backgroundBorderRadius;
  final Color backgroundActiveColor;
  final Color backgroundInactiveColor;
  final Color backgroundDisabledColor;
  final Color indicatorActiveColor;
  final Color indicatorInactiveColor;
  final Color indicatorDisabledColor;
  final double indicatorSize;
  final EdgeInsets indicatorPadding;
  final double borderWidth;
  final Color borderColor;
  final bool enabled;

  _CustomSwitchIndicator({
    Key? key,
    required this.value,
    required this.onChanged,
    this.backgroundActiveColor = Colors.transparent,
    this.backgroundInactiveColor = Colors.transparent,
    this.backgroundDisabledColor = Colors.transparent,
    this.indicatorActiveColor = Colors.blue,
    this.indicatorInactiveColor = Colors.grey,
    this.indicatorDisabledColor = Colors.white24,
    this.borderColor = Colors.black,
    this.width = 70.0,
    this.height = 35.0,
    this.borderWidth = 1.0,
    this.indicatorSize = 25.0,
    this.backgroundBorderRadius = 20.0,
    this.indicatorPadding = const EdgeInsets.all(4.0),
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var child = Padding(
      padding: EdgeInsets.symmetric(
        vertical: 6.0,
        horizontal: 4.0,
      ),
      child: Container(
        width: width,
        height: height,
        padding: indicatorPadding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(backgroundBorderRadius),
          border: Border.all(
            color: borderColor,
            width: borderWidth,
          ),
          color: enabled
              ? value!
                  ? backgroundActiveColor
                  : backgroundInactiveColor
              : backgroundDisabledColor,
        ),
        child: Align(
          alignment: value! ? Alignment.centerRight : Alignment.centerLeft,
          child: _buildIndicator(value),
        ),
      ),
    );

    if (enabled) {
      return InkWell(
        onTap: () {
          onChanged(!value!);
        },
        child: child,
      );
    } else {
      return child;
    }
  }

  Widget _buildIndicator(bool? isActive) => Container(
        width: indicatorSize,
        height: indicatorSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: enabled
              ? isActive!
                  ? indicatorActiveColor
                  : indicatorInactiveColor
              : Colors.transparent,
          border: enabled ? null : Border.all(color: indicatorDisabledColor),
        ),
      );
}
