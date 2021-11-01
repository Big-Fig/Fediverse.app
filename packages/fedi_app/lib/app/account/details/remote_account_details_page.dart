import 'package:collection/collection.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/access/current/current_access_bloc.dart';
import 'package:fedi_app/app/account/account_bloc.dart';
import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/account/account_model_adapter.dart';
import 'package:fedi_app/app/account/details/account_details_bloc.dart';
import 'package:fedi_app/app/account/details/account_details_bloc_impl.dart';
import 'package:fedi_app/app/account/details/account_details_page.dart';
import 'package:fedi_app/app/account/remote_account_bloc_impl.dart';
import 'package:fedi_app/app/async/unifedi/unifedi_async_operation_helper.dart';
import 'package:fedi_app/app/config/config_service.dart';
import 'package:fedi_app/app/instance/remote/remote_instance_bloc.dart';
import 'package:fedi_app/app/instance/remote/remote_instance_bloc_impl.dart';
import 'package:fedi_app/app/instance/remote/remote_instance_error_data.dart';
import 'package:fedi_app/app/status/status_model.dart';
import 'package:fedi_app/app/status/status_model_adapter.dart';
import 'package:fedi_app/app/ui/async/fedi_async_init_loading_widget.dart';
import 'package:fedi_app/connection/connection_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

final _logger = Logger('remote_account_details_page.dart');

Future<void> goToRemoteAccountDetailsPageBasedOnRemoteInstanceAccount(
  BuildContext context, {
  required IAccount remoteInstanceAccount,
}) async {
  var isAcctRemoteDomainExist = remoteInstanceAccount.isAcctRemoteDomainExist;

  _logger.finest(
    () => 'goToRemoteAccountDetailsPageBasedOnRemoteInstanceAccount'
        'isAcctRemoteDomainExist $isAcctRemoteDomainExist'
        'remoteInstanceAccount $remoteInstanceAccount',
  );

  var currentUnifediApiAccessBloc = ICurrentAccessBloc.of(
    context,
    listen: false,
  );
  var currentInstance = currentUnifediApiAccessBloc.currentInstance;

  if (isAcctRemoteDomainExist && currentInstance != null) {
    // jumping from instance to instance
    await goToRemoteAccountDetailsPageBasedOnLocalInstanceRemoteAccount(
      context,
      localInstanceRemoteAccount: remoteInstanceAccount,
    );
  } else {
    var instanceUri = remoteInstanceAccount.urlRemoteHostUri;

    var remoteInstanceBloc = RemoteInstanceBloc(
      instanceUri: instanceUri,
      configService: IConfigService.of(
        context,
        listen: false,
      ),
      connectionService: Provider.of<IConnectionService>(
        context,
        listen: false,
      ),
      unifediApiInstance: null,
    );

    await remoteInstanceBloc.performAsyncInit();

    await Navigator.push(
      context,
      createRemoteAccountDetailsPageRoute(
        account: remoteInstanceAccount,
        remoteInstanceBloc: remoteInstanceBloc,
      ),
    );
  }
}

Future<void> goToRemoteAccountDetailsPageBasedOnLocalInstanceRemoteAccount(
  BuildContext context, {
  required IAccount? localInstanceRemoteAccount,
}) async {
  _logger.finest(
    () => 'goToRemoteAccountDetailsPageBasedOnLocalInstanceRemoteAccount'
        'localInstanceRemoteAccount $localInstanceRemoteAccount',
  );

  var remoteInstanceAccountDialogResult =
      await UnifediAsyncOperationHelper.performUnifediAsyncOperation<IAccount?>(
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
          configService: IConfigService.of(
            context,
            listen: false,
          ),
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
          // ignore: avoid_catches_without_on_clauses
        } catch (e) {
          // load in Unifedi way. Use username as id
          var unifediApiAccount = await unifediApiAccountService.getAccount(
            accountId: localInstanceRemoteAccount.username,
            withRelationship: null,
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
    await goToRemoteAccountDetailsPageBasedOnRemoteInstanceAccount(
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
    pagination: const UnifediApiPagination(
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
  required IRemoteInstanceBloc remoteInstanceBloc,
}) =>
    MaterialPageRoute<void>(
      builder: (context) => DisposableProvider<IRemoteInstanceBloc>(
        create: (context) => remoteInstanceBloc,
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
                  currentUnifediApiAccessBloc: ICurrentAccessBloc.of(
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
      ),
    );
