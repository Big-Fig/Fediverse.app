import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/details/account_details_bloc.dart';
import 'package:fedi/app/account/details/account_details_bloc_impl.dart';
import 'package:fedi/app/account/details/account_details_page.dart';
import 'package:fedi/app/account/remote_account_bloc_impl.dart';
import 'package:fedi/app/async/pleroma_async_operation_helper.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/instance/remote/remote_instance_bloc.dart';
import 'package:fedi/app/instance/remote/remote_instance_bloc_impl.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/status_model_adapter.dart';
import 'package:fedi/connection/connection_service.dart';
import 'package:fedi/dialog/async/async_dialog_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/account/pleroma_account_service.dart';
import 'package:fedi/pleroma/pagination/pleroma_pagination_model.dart';
import 'package:fedi/pleroma/status/pleroma_status_service_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pedantic/pedantic.dart';

void goToRemoteAccountDetailsPageBasedOnRemoteInstanceAccount(
  BuildContext context, {
  @required IAccount remoteInstanceAccount,
}) {
  Navigator.push(
    context,
    createRemoteAccountDetailsPageRoute(
      account: remoteInstanceAccount,
    ),
  );
}

Future goToRemoteAccountDetailsPageBasedOnLocalInstanceRemoteAccount(
  BuildContext context, {
  @required IAccount localInstanceRemoteAccount,
}) async {
  var localInstancePleromaAccountService =
      IPleromaAccountService.of(context, listen: false);

  var remoteStatuses =
      await localInstancePleromaAccountService.getAccountStatuses(
    accountRemoteId: localInstanceRemoteAccount.remoteId,
    pagination: PleromaPaginationRequest(limit: 1),
  );

  IStatus localInstanceRemoteStatus =
      mapRemoteStatusToLocalStatus(remoteStatuses.first);

  var instanceUri = localInstanceRemoteStatus.urlRemoteHostUri;

  var remoteInstanceStatusRemoteId = localInstanceRemoteStatus.urlRemoteId;
  var remoteInstanceBloc = RemoteInstanceBloc(
    instanceUri: instanceUri,
    connectionService: IConnectionService.of(
      context,
      listen: false,
    ),
  );

  var pleromaStatusService = PleromaStatusService(
    restService: remoteInstanceBloc.pleromaRestService,
  );

  AsyncDialogResult<IStatus> remoteInstanceStatusDialogResult =
      await PleromaAsyncOperationHelper.performPleromaAsyncOperation<IStatus>(
    context: context,
    asyncCode: () async {
      var remoteInstanceRemoteStatus = await pleromaStatusService.getStatus(
          statusRemoteId: remoteInstanceStatusRemoteId);

      return mapRemoteStatusToLocalStatus(remoteInstanceRemoteStatus);
    },
  );

  IStatus remoteInstanceStatus = remoteInstanceStatusDialogResult.result;

  unawaited(pleromaStatusService.dispose());
  unawaited(remoteInstanceBloc.dispose());

  goToRemoteAccountDetailsPageBasedOnRemoteInstanceAccount(
    context,
    remoteInstanceAccount: remoteInstanceStatus.account,
  );
}

MaterialPageRoute createRemoteAccountDetailsPageRoute({
  @required IAccount account,
}) {
  return MaterialPageRoute(
    builder: (context) {
      return DisposableProvider<IRemoteInstanceBloc>(
        create: (context) {
          var instanceUri = account.urlRemoteHostUri;

          return RemoteInstanceBloc(
            instanceUri: instanceUri,
            connectionService: IConnectionService.of(
              context,
              listen: false,
            ),
          );
        },
        child: DisposableProvider<IAccountDetailsBloc>(
          create: (context) => AccountDetailsBloc(
            currentAuthInstanceBloc: ICurrentAuthInstanceBloc.of(
              context,
              listen: false,
            ),
          ),
          child: DisposableProvider<IAccountBloc>(
            create: (context) => RemoteAccountBloc.createFromContext(
              context,
              account: account,
              isNeedRefreshFromNetworkOnInit: false,
            ),
            child: const AccountDetailsPage(),
          ),
        ),
      );
    },
  );
}
