import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

var _animationDuration = Duration(milliseconds: 60);

var _logger = Logger("custom_switch.dart");

// todo: refactor, cant change value outside this widget
class CustomSwitch extends StatefulWidget {
  final double width;
  final double height;
  final bool value;
  final ValueChanged<bool> onChanged;
  final double backgroundBorderRadius;
  final Color backgroundActiveColor;
  final Color backgroundInactiveColor;
  final Color indicatorActiveColor;
  final Color indicatorInactiveColor;
  final double indicatorSize;
  final EdgeInsets indicatorPadding;
  final double borderWidth;
  final Color borderColor;

  CustomSwitch({
    Key key,
    this.value,
    this.onChanged,
    this.backgroundActiveColor = Colors.transparent,
    this.backgroundInactiveColor = Colors.transparent,
    this.indicatorActiveColor = Colors.blue,
    this.indicatorInactiveColor = Colors.grey,
    this.borderColor = Colors.black,
    this.width = 70.0,
    this.height = 35.0,
    this.borderWidth = 1.0,
    this.indicatorSize = 25.0,
    this.backgroundBorderRadius = 20.0,
    this.indicatorPadding = const EdgeInsets.all(4.0),
  }) : super(key: key) {
    _logger.finest(() => "value $value");
  }

  @override
  _CustomSwitchState createState() => _CustomSwitchState(value);
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  Animation _toggleAnimation;
  AnimationController _animationController;

  bool value;

  _CustomSwitchState(this.value);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: _animationDuration,
    );

    _logger.finest(() => "initState value $value");
    _toggleAnimation = AlignmentTween(
      begin: value ? Alignment.centerRight : Alignment.centerLeft,
      end: value ? Alignment.centerLeft : Alignment.centerRight,
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.linear),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        var isActive = value;
        return InkWell(
          onTap: () {
            _reverseAnimation();
            _onValueChanged();
          },
          child: Container(
            width: widget.width,
            height: widget.height,
            padding: widget.indicatorPadding,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(widget.backgroundBorderRadius),
              border: Border.all(
                color: widget.borderColor,
                width: widget.borderWidth,
              ),
              color: isActive
                  ? widget.backgroundActiveColor
                  : widget.backgroundInactiveColor,
            ),
            child: Align(
              alignment: _toggleAnimation.value,
              child: _buildIndicator(isActive),
            ),
          ),
        );
      },
    );
  }

  Widget _buildIndicator(bool isActive) => Container(
        width: widget.indicatorSize,
        height: widget.indicatorSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isActive
              ? widget.indicatorActiveColor
              : widget.indicatorInactiveColor,
        ),
      );

  void _onValueChanged() {
    var newValue = !value;

    setState(() {
      value = newValue;
    });
    widget.onChanged(newValue);
  }

  void _reverseAnimation() {
    if (_animationController.isCompleted) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
  }
}
