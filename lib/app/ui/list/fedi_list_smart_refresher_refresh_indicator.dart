import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'
    hide RefreshIndicator, RefreshIndicatorState;
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

final _logger = Logger('fedi_list_smart_refresher_refresh_indicator.dart');

// ignore_for_file: no-magic-number
/// mostly use flutter inner's RefreshIndicator
class FediListSmartRefresherRefreshIndicator extends RefreshIndicator {
  /// see flutter RefreshIndicator documents,the meaning same with that
  final String? semanticsLabel;

  /// see flutter RefreshIndicator documents,the meaning same with that
  final String? semanticsValue;

  /// see flutter RefreshIndicator documents,the meaning same with that
  final Color? color;

  /// Distance from the top when refreshing
  final double distance;

  /// see flutter RefreshIndicator documents,the meaning same with that
  final Color? backgroundColor;

  const FediListSmartRefresherRefreshIndicator({
    Key? key,
    double height = 80.0,
    this.semanticsLabel,
    this.semanticsValue,
    this.color,
    double offset = 0,
    this.distance = 50.0,
    this.backgroundColor,
  }) : super(
          key: key,
          refreshStyle: RefreshStyle.Front,
          offset: offset,
          height: height,
        );

  @override
  State<StatefulWidget> createState() =>
      _FediListSmartRefresherRefreshIndicatorState();
}

class _FediListSmartRefresherRefreshIndicatorState
    extends RefreshIndicatorState<FediListSmartRefresherRefreshIndicator>
    with TickerProviderStateMixin {
  Animation<Offset>? _positionFactor;

  // ignore: avoid-late-keyword
  late AnimationController _scaleFactor;

  // ignore: avoid-late-keyword
  late AnimationController _positionController;

  // ignore: avoid-late-keyword
  late AnimationController _valueAni;

  @override
  void initState() {
    _valueAni = AnimationController(
      vsync: this,
      value: 0.0,
      lowerBound: 0.0,
      upperBound: 1.0,
      duration: Duration(milliseconds: 500),
    );
    _valueAni.addListener(() {
      try {
        // frequently setState will decline the performance
        var pixels = Scrollable.of(context)?.position.pixels;
        if (mounted && pixels != null && pixels <= 0) {
          // ignore: no-empty-block
          setState(() {});
        }
      } catch (e, stackTrace) {
        _logger.warning(() => '_valueAni.addListener', e, stackTrace);
      }
    });
    _positionController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _scaleFactor = AnimationController(
      vsync: this,
      value: 1.0,
      lowerBound: 0.0,
      upperBound: 1.0,
      duration: Duration(milliseconds: 300),
    );
    _positionFactor = _positionController.drive(Tween<Offset>(
      begin: Offset(0.0, -1.0),
      end: Offset(0.0, widget.height / 44.0),
    ));
    super.initState();
  }

  @override
  Widget buildContent(BuildContext context, RefreshStatus? mode) {
    return _buildIndicator(widget.backgroundColor ?? Colors.white);
  }

  Widget _buildIndicator(Color outerColor) {
    return SlideTransition(
      position: _positionFactor!,
      child: ScaleTransition(
        scale: _scaleFactor,
        child: Align(
          alignment: Alignment.topCenter,
          child:
              FediCircularProgressIndicator.buildForRefreshIndicator(context),
        ),
      ),
    );
  }

  @override
  void onOffsetChange(double offset) {
    // ignore: non_bool_negation_expression, avoid_dynamic_calls
    if (!floating) {
      _valueAni.value = offset / configuration!.headerTriggerDistance;
      _positionController.value = offset / configuration!.headerTriggerDistance;
    }
  }

  @override
  void onModeChange(RefreshStatus? mode) {
    if (mode == RefreshStatus.refreshing) {
      _positionController.value = widget.distance / widget.height;
      _scaleFactor.value = 1;
    }
    super.onModeChange(mode);
  }

  @override
  void resetValue() {
    _scaleFactor.value = 1.0;
    _positionController.value = 0.0;
    _valueAni.value = 0.0;
    super.resetValue();
  }

  @override
  Future<void> readyToRefresh() {
    return _positionController.animateTo(widget.distance / widget.height);
  }

  @override
  Future<void> endRefresh() {
    return _scaleFactor.animateTo(0.0);
  }

  @override
  void dispose() {
    _valueAni.dispose();
    _scaleFactor.dispose();
    _positionController.dispose();
    super.dispose();
  }
}
