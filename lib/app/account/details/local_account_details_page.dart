import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/details/account_details_bloc.dart';
import 'package:fedi/app/account/details/account_details_bloc_impl.dart';
import 'package:fedi/app/account/details/account_details_page.dart';
import 'package:fedi/app/account/local_account_bloc_impl.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void goToLocalAccountDetailsPage(
  BuildContext context, {
  required IAccount? account,
}) {
  Navigator.push(
    context,
    createLocalAccountDetailsPageRoute(account),
  );
}

MaterialPageRoute createLocalAccountDetailsPageRoute(IAccount? account) {
  return MaterialPageRoute(
    builder: (context) => DisposableProvider<IAccountDetailsBloc>(
      create: (context) => AccountDetailsBloc(
        currentAuthInstanceBloc: ICurrentAuthInstanceBloc.of(
          context,
          listen: false,
        ),
      ),
      child: DisposableProvider<IAccountBloc>(
        create: (context) => LocalAccountBloc.createFromContext(
          context,
          isNeedWatchLocalRepositoryForUpdates: true,
          account: account!,
          isNeedRefreshFromNetworkOnInit: false,
          isNeedWatchWebSocketsEvents: false,
          isNeedPreFetchRelationship: true,
        ),
        child: const AccountDetailsPage(),
      ),
    ),
  );
}
