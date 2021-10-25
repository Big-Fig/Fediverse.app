import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/ui/badge/int/fedi_int_badge_bloc.dart';
import 'package:rxdart/rxdart.dart';

class FediIntBadgeBlocSumAdapter extends DisposableOwner
    implements IFediIntBadgeBloc {
  final List<IFediIntBadgeBloc> fediIntBadgeBlocs;

  FediIntBadgeBlocSumAdapter({
    required this.fediIntBadgeBlocs,
  });

  @override
  Stream<int> get badgeStream => Rx.combineLatest(
        fediIntBadgeBlocs.map((bloc) => bloc.badgeStream),
        (values) => values.fold(
          0,
          // todo improve code style
          (int previousValue, Object? element) =>
              previousValue + (element as int? ?? 0),
        ),
      );
}
