import 'package:fedi/app/ui/badge/fedi_bool_badge_widget.dart';
import 'package:flutter/cupertino.dart';

class FediStreamBoolBadgeWidget extends FediBoolBadgeWidget {
  final Stream<bool> stream;

  FediStreamBoolBadgeWidget({
    @required Widget child,
    @required this.stream,
    double offset = FediBoolBadgeWidget.unreadBadgeDefaultOffset,
  }) : super(
          child: child,
          offset: offset,
        );

  @override
  Stream<bool> retrieveBoolStream(BuildContext context) =>
      stream;
}
