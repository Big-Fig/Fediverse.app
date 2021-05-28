import 'package:fedi/app/instance/instance_bloc.dart';
import 'package:fedi/app/instance/location/instance_location_bloc.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc.dart';
import 'package:fedi/pleroma/api/instance/pleroma_api_instance_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class IInstanceActivityBloc
    implements IInstanceBloc, IAsyncInitLoadingBloc, IInstanceLocationBloc {
  static IInstanceActivityBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IInstanceActivityBloc>(context, listen: listen);

  RefreshController get refreshController;

  Future<List<IPleromaApiInstanceActivityItem>> refresh();

  Stream<List<IPleromaApiInstanceActivityItem>?> get activityStream;

  List<IPleromaApiInstanceActivityItem>? get activity;
}

extension IInstanceActivityBlocExtension on IInstanceActivityBloc {
  String get instanceUriDomain => instanceUri.host;
}
