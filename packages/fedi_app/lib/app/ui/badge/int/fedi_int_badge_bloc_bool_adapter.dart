import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/ui/badge/bool/fedi_bool_badge_bloc.dart';
import 'package:fedi_app/app/ui/badge/int/fedi_int_badge_bloc.dart';

class FediIntBadgeBlocBoolAdapter extends DisposableOwner
    implements IFediBoolBadgeBloc {
  final IFediIntBadgeBloc fediIntBadgeBloc;

  FediIntBadgeBlocBoolAdapter({
    required this.fediIntBadgeBloc,
  });

  @override
  Stream<bool> get badgeStream => fediIntBadgeBloc.badgeStream.map(
        (intValue) => intValue > 0,
      );
}
