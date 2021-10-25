import 'package:easy_dispose/easy_dispose.dart';
import 'package:rxdart/rxdart.dart';

import '../access/fediverse_api_access_bloc.dart';
import 'fediverse_api_access_model.dart';

abstract class FediverseApiAccessBloc<T extends IFediverseApiAccess>
    extends DisposableOwner implements IFediverseApiAccessBloc<T> {
  final BehaviorSubject<T> accessSubject;

  FediverseApiAccessBloc({
    required T access,
  }) : accessSubject = BehaviorSubject.seeded(
          access,
        ) {
    accessSubject.disposeWith(this);
  }

  @override
  T get access => accessSubject.value;

  @override
  Stream<T> get accessStream => accessSubject.stream;
}
