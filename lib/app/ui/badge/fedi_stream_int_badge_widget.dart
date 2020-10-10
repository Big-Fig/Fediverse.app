import 'package:fedi/app/ui/badge/fedi_int_badge_widget.dart';
import 'package:flutter/cupertino.dart';

class FediStreamIntBadgeWidget extends FediIntBadgeWidget {
  final Stream<int> stream;

  FediStreamIntBadgeWidget({
    @required Widget child,
    @required this.stream,
    double offset = FediIntBadgeWidget.unreadBadgeDefaultOffset,
  }) : super(
          child: child,
          offset: offset,
        );

  @override
  Stream<int> retrieveIntStream(BuildContext context) =>
      stream;
}
