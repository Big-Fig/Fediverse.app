import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/auth/host/auth_host_model.dart';
import 'package:fedi/app/access/register/form/register_access_form_bloc.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IRegisterUnifediApiAccessBloc
    implements IDisposable, IAsyncInitLoadingBloc {
  static IRegisterUnifediApiAccessBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IRegisterUnifediApiAccessBloc>(
        context,
        listen: listen,
      );

  Uri get instanceBaseUri;

  bool get isReadyToSubmit;

  Stream<bool> get isReadyToSubmitStream;

  IRegisterUnifediApiAccessFormBloc get registerUnifediApiAccessFormBloc;

  Stream<AuthHostRegistrationResult> get registrationResultStream;

  Future<AuthHostRegistrationResult> submit();
}
