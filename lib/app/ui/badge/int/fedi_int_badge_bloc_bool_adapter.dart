import 'package:fedi/app/ui/badge/bool/fedi_bool_badge_bloc.dart';
import 'package:fedi/app/ui/badge/int/fedi_int_badge_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';

class FediIntBadgeBlocBoolAdapter extends DisposableOwner
    implements IFediBoolBadgeBloc {
  final IFediIntBadgeBloc fediIntBadgeBloc;

  FediIntBadgeBlocBoolAdapter({
    @required this.fediIntBadgeBloc,
  });

  @override
  Stream<bool> get badgeStream => fediIntBadgeBloc.badgeStream.map(
        (intValue) {
          if (intValue == null) {
            return null;
          } else {
            return intValue > 0;
          }
        },
      );
}
