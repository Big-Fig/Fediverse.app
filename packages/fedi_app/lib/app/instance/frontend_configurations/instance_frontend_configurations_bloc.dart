import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/async/loading/init/async_init_loading_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IInstanceFrontendConfigurationsBloc
    implements IAsyncInitLoadingBloc, IDisposable {
  static IInstanceFrontendConfigurationsBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IInstanceFrontendConfigurationsBloc>(
        context,
        listen: listen,
      );

  String? get backgroundImage;

  Stream<String?> get backgroundImageStream;

  Color? get brandColor;

  Stream<Color?> get brandColorStream;
}
