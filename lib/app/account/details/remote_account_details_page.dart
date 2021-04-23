import 'package:collection/collection.dart';
import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/account/details/account_details_bloc.dart';
import 'package:fedi/app/account/details/account_details_bloc_impl.dart';
import 'package:fedi/app/account/details/account_details_page.dart';
import 'package:fedi/app/account/remote_account_bloc_impl.dart';
import 'package:fedi/app/async/pleroma_async_operation_helper.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/instance/remote/remote_instance_bloc.dart';
import 'package:fedi/app/instance/remote/remote_instance_bloc_impl.dart';
import 'package:fedi/app/instance/remote/remote_instance_error_data.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/status_model_adapter.dart';
import 'package:fedi/connection/connection_service.dart';
import 'package:fedi/dialog/async/async_dialog_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/api/account/pleroma_account_service.dart';
import 'package:fedi/pleroma/api/account/pleroma_account_service_impl.dart';
import 'package:fedi/pleroma/api/pagination/pleroma_pagination_model.dart';
import 'package:fedi/pleroma/api/status/pleroma_status_service_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pedantic/pedantic.dart';

void goToRemoteAccountDetailsPageBasedOnRemoteInstanceAccount(
  BuildContext context, {
  required IAccount remoteInstanceAccount,
}) {
  var isAcctRemoteDomainExist = remoteInstanceAccount.isAcctRemoteDomainExist;

  if (isAcctRemoteDomainExist) {
    // jumping from instance to instance
    goToRemoteAccountDetailsPageBasedOnLocalInstanceRemoteAccount(
      context,
      localInstanceRemoteAccount: remoteInstanceAccount,
    );
  } else {
    Navigator.push(
      context,
      createRemoteAccountDetailsPageRoute(
        account: remoteInstanceAccount,
      ),
    );
  }
}

Future goToRemoteAccountDetailsPageBasedOnLocalInstanceRemoteAccount(
  BuildContext context, {
  required IAccount? localInstanceRemoteAccount,
}) async {
  AsyncDialogResult<IAccount?> remoteInstanceAccountDialogResult =
      await PleromaAsyncOperationHelper.performPleromaAsyncOperation<IAccount?>(
    context: context,
    errorDataBuilders: [
      remoteInstanceLoadDataErrorAlertDialogBuilder,
    ],
    asyncCode: () async {
      IAccount? result;
      RemoteInstanceBloc? remoteInstanceBloc;
      PleromaStatusService? pleromaStatusService;
      PleromaAccountService? pleromaAccountService;
      try {
        var instanceUri = localInstanceRemoteAccount!.urlRemoteHostUri;

        remoteInstanceBloc = RemoteInstanceBloc(
          instanceUri: instanceUri,
          connectionService: IConnectionService.of(
            context,
            listen: false,
          ),
        );

        pleromaStatusService = PleromaStatusService(
          restService: remoteInstanceBloc.pleromaRestService,
        );
        pleromaAccountService = PleromaAccountService(
          restService: remoteInstanceBloc.pleromaRestService,
        );

        try {
          // load in Mastodon way. Extract account from status
          result = await loadRemoteInstanceAccountViaAccountInStatus(
            context,
            localInstanceRemoteAccount,
            pleromaStatusService,
          );
        } catch (e) {
          // load in Pleroma way. Use username as id
          var pleromaAccount = await pleromaAccountService.getAccount(
            accountRemoteId: localInstanceRemoteAccount.username,
          );
          result = pleromaAccount.toDbAccountWrapper();
        }
      } finally {
        unawaited(pleromaStatusService?.dispose());
        unawaited(pleromaAccountService?.dispose());
        unawaited(remoteInstanceBloc?.dispose());
      }

      return result;
    },
  );

  var remoteInstanceAccount = remoteInstanceAccountDialogResult.result;
  if (remoteInstanceAccount != null) {
    goToRemoteAccountDetailsPageBasedOnRemoteInstanceAccount(
      context,
      remoteInstanceAccount: remoteInstanceAccount,
    );
  }
}

Future<IAccount?> loadRemoteInstanceAccountViaAccountInStatus(
  BuildContext context,
  IAccount localInstanceRemoteAccount,
  PleromaStatusService pleromaStatusService,
) async {
  var remoteAccountAnyStatusOnLocalInstance =
      await loadRemoteAccountAnyStatusOnLocalInstance(
    context,
    localInstanceRemoteAccount,
  );

  IAccount? result;
  if (remoteAccountAnyStatusOnLocalInstance != null) {
    var remoteInstanceStatusRemoteId =
        remoteAccountAnyStatusOnLocalInstance.urlRemoteId;

    var remoteInstanceRemoteStatus = await pleromaStatusService.getStatus(
      statusRemoteId: remoteInstanceStatusRemoteId,
    );
    result = remoteInstanceRemoteStatus.account.toDbAccountWrapper();
  }

  return result;
}

Future<IStatus?> loadRemoteAccountAnyStatusOnLocalInstance(
  BuildContext context,
  IAccount localInstanceRemoteAccount,
) async {
  var localInstancePleromaAccountService =
      IPleromaAccountService.of(context, listen: false);

  var remoteStatuses =
      await localInstancePleromaAccountService.getAccountStatuses(
    accountRemoteId: localInstanceRemoteAccount.remoteId,
    pagination: PleromaPaginationRequest(limit: 1),
  );

  var firstPleromaStatus = remoteStatuses.singleOrNull;

  return firstPleromaStatus?.toDbStatusPopulatedWrapper();
}

MaterialPageRoute createRemoteAccountDetailsPageRoute({
  required IAccount account,
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
