import 'package:collection/collection.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/access/current/current_access_bloc.dart';
import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/account/details/account_details_bloc.dart';
import 'package:fedi/app/account/details/account_details_bloc_impl.dart';
import 'package:fedi/app/account/details/account_details_page.dart';
import 'package:fedi/app/account/remote_account_bloc_impl.dart';
import 'package:fedi/app/async/pleroma/pleroma_async_operation_helper.dart';
import 'package:fedi/app/instance/remote/remote_instance_bloc.dart';
import 'package:fedi/app/instance/remote/remote_instance_bloc_impl.dart';
import 'package:fedi/app/instance/remote/remote_instance_error_data.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/status_model_adapter.dart';
import 'package:fedi/app/ui/async/fedi_async_init_loading_widget.dart';
import 'package:fedi/connection/connection_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

final _logger = Logger('remote_account_details_page.dart');

void goToRemoteAccountDetailsPageBasedOnRemoteInstanceAccount(
  BuildContext context, {
  required IAccount remoteInstanceAccount,
}) {
  var isAcctRemoteDomainExist = remoteInstanceAccount.isAcctRemoteDomainExist;

  _logger.finest(
    () => 'goToRemoteAccountDetailsPageBasedOnRemoteInstanceAccount'
        'isAcctRemoteDomainExist $isAcctRemoteDomainExist'
        'remoteInstanceAccount $remoteInstanceAccount',
  );

  var currentUnifediApiAccessBloc = ICurrentUnifediApiAccessBloc.of(
    context,
    listen: false,
  );
  var currentInstance = currentUnifediApiAccessBloc.currentInstance;

  if (isAcctRemoteDomainExist && currentInstance != null) {
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
  _logger.finest(
    () => 'goToRemoteAccountDetailsPageBasedOnLocalInstanceRemoteAccount'
        'localInstanceRemoteAccount $localInstanceRemoteAccount',
  );

  var remoteInstanceAccountDialogResult =
      await PleromaAsyncOperationHelper.performPleromaAsyncOperation<IAccount?>(
    context: context,
    errorDataBuilders: [
      remoteInstanceLoadDataErrorAlertDialogBuilder,
    ],
    asyncCode: () async {
      IAccount? result;
      RemoteInstanceBloc? remoteInstanceBloc;
      IUnifediApiStatusService? unifediApiStatusService;
      IUnifediApiAccountService? unifediApiAccountService;
      try {
        var instanceUri = localInstanceRemoteAccount!.urlRemoteHostUri;

        remoteInstanceBloc = RemoteInstanceBloc(
          instanceUri: instanceUri,
          connectionService: Provider.of(
            context,
            listen: false,
          ),
          unifediApiInstance: null,
        );

        await remoteInstanceBloc.performAsyncInit();

        unifediApiStatusService =
            remoteInstanceBloc.unifediApiManager.createStatusService();
        unifediApiAccountService =
            remoteInstanceBloc.unifediApiManager.createAccountService();

        try {
          // load in Mastodon way. Extract account from status
          result = await loadRemoteInstanceAccountViaAccountInStatus(
            context,
            localInstanceRemoteAccount,
            unifediApiStatusService,
          );
        } catch (e) {
          // load in Pleroma way. Use username as id
          var unifediApiAccount = await unifediApiAccountService.getAccount(
            accountId: localInstanceRemoteAccount.username,
            withRelationship: false,
          );
          result = unifediApiAccount.toDbAccountWrapper();
        }
      } finally {
        // ignore: unawaited_futures
        unifediApiStatusService?.dispose();
        // ignore: unawaited_futures
        unifediApiAccountService?.dispose();
        // ignore: unawaited_futures
        remoteInstanceBloc?.dispose();
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
  IUnifediApiStatusService unifediApiStatusService,
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

    var remoteInstanceRemoteStatus = await unifediApiStatusService.getStatus(
      statusId: remoteInstanceStatusRemoteId,
    );
    result = remoteInstanceRemoteStatus.account.toDbAccountWrapper();
  }

  return result;
}

Future<IStatus?> loadRemoteAccountAnyStatusOnLocalInstance(
  BuildContext context,
  IAccount localInstanceRemoteAccount,
) async {
  var localInstanceUnifediApiAccountService =
      Provider.of<IUnifediApiAccountService>(context, listen: false);

  var remoteStatuses =
      await localInstanceUnifediApiAccountService.getAccountStatuses(
    accountId: localInstanceRemoteAccount.remoteId,
    pagination: UnifediApiPagination(
      limit: 1,
      maxId: null,
      minId: null,
    ),
    excludeVisibilities: null,
    tagged: null,
    pinned: null,
    excludeReplies: null,
    excludeReblogs: null,
    withMuted: null,
    onlyWithMedia: null,
  );

  var firstUnifediApiStatus = remoteStatuses.firstOrNull;

  return firstUnifediApiStatus?.toDbStatusPopulatedWrapper();
}

MaterialPageRoute<void> createRemoteAccountDetailsPageRoute({
  required IAccount account,
}) {
  return MaterialPageRoute<void>(
    builder: (context) {
      return DisposableProvider<IRemoteInstanceBloc>(
        create: (context) {
          var instanceUri = account.urlRemoteHostUri;

          return RemoteInstanceBloc(
            instanceUri: instanceUri,
            connectionService: Provider.of<IConnectionService>(
              context,
              listen: false,
            ),
            unifediApiInstance: null,
          );
        },
        child: Builder(
          builder: (context) => FediAsyncInitLoadingWidget(
            asyncInitLoadingBloc: IRemoteInstanceBloc.of(context),
            // todo: remove hack
            loadingFinishedBuilder: (_) => DisposableProxyProvider<
                IRemoteInstanceBloc, IUnifediApiAccountService>(
              update: (context, value, previous) =>
                  value.unifediApiManager.createAccountService(),
              child: DisposableProvider<IAccountDetailsBloc>(
                create: (context) => AccountDetailsBloc(
                  unifediApiAccountService:
                      Provider.of<IUnifediApiAccountService>(
                    context,
                    listen: false,
                  ),
                  currentUnifediApiAccessBloc: ICurrentUnifediApiAccessBloc.of(
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
            ),
          ),
        ),
      );
    },
  );
}
