import 'package:easy_dispose/easy_dispose.dart';

import '../access/fediverse_api_access_model.dart';

abstract class IFediverseApiAccessBloc<T extends IFediverseApiAccess>
    implements IDisposable {
  T get access;

  Stream<T> get accessStream;
}
