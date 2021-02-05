import 'package:fedi/app/ui/badge/int/fedi_int_badge_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

class FediIntBadgeBlocSumAdapter extends DisposableOwner
    implements IFediIntBadgeBloc {
  final List<IFediIntBadgeBloc> fediIntBadgeBlocs;

  FediIntBadgeBlocSumAdapter({
    @required this.fediIntBadgeBlocs,
  });

  @override
  Stream<int> get badgeStream {
    return Rx.combineLatest(
      fediIntBadgeBlocs.map((bloc) => bloc.badgeStream),
      (values) => values.fold(
        0,
        (previousValue, element) => previousValue + (element ?? 0),
      ),
    );
  }
}
