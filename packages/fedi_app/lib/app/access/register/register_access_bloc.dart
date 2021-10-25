import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/access/register/form/register_access_form_bloc.dart';
import 'package:fedi_app/app/access/register/response/register_access_response_model.dart';
import 'package:fedi_app/async/loading/init/async_init_loading_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IRegisterAccessBloc
    implements IDisposable, IAsyncInitLoadingBloc {
  static IRegisterAccessBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IRegisterAccessBloc>(
        context,
        listen: listen,
      );

  Uri get instanceBaseUri;

  bool get isReadyToSubmit;

  Stream<bool> get isReadyToSubmitStream;

  IRegisterAccessFormBloc get registerUnifediApiAccessFormBloc;

  Future<RegisterAccessResponse> register();
}
