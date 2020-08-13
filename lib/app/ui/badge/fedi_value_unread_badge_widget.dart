import 'package:fedi/app/ui/badge/fedi_unread_badge_widget.dart';
import 'package:flutter/cupertino.dart';

class FediValueUnreadBadgeWidget extends FediUnreadBadgeWidget {
  final Stream<bool> valueStream;

  FediValueUnreadBadgeWidget({
    @required Widget child,
    @required this.valueStream,
    double offset = FediUnreadBadgeWidget.unreadBadgeDefaultOffset,
  }) : super(
          child: child,
          offset: offset,
        );

  @override
  Stream<bool> retrieveUnreadBadgeCountStream(BuildContext context) =>
      valueStream;
}
