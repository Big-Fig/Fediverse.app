import 'package:fedi/app/instance/instance_bloc.dart';
import 'package:fedi/app/instance/location/instance_location_bloc.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:unifedi_api/unifedi_api.dart';

abstract class IInstanceActivityBloc
    implements IInstanceBloc, IAsyncInitLoadingBloc, IInstanceLocationBloc {
  static IInstanceActivityBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IInstanceActivityBloc>(context, listen: listen);

  RefreshController get refreshController;

  Future<List<IUnifediApiInstanceActivityItem>> refresh();

  Stream<List<IUnifediApiInstanceActivityItem>?> get activityStream;

  List<IUnifediApiInstanceActivityItem>? get activity;
}

extension IInstanceActivityBlocExtension on IInstanceActivityBloc {
  String get instanceUriDomain => instanceUri.host;
}
