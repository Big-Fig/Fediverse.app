import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/access/current/current_access_bloc.dart';
import 'package:fedi_app/app/account/account_bloc.dart';
import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/account/details/account_details_bloc.dart';
import 'package:fedi_app/app/account/details/account_details_bloc_impl.dart';
import 'package:fedi_app/app/account/details/account_details_page.dart';
import 'package:fedi_app/app/account/local_account_bloc_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

void goToLocalAccountDetailsPage(
  BuildContext context, {
  required IAccount account,
}) {
  Navigator.push(
    context,
    createLocalAccountDetailsPageRoute(account),
  );
}

MaterialPageRoute<void> createLocalAccountDetailsPageRoute(IAccount account) =>
    MaterialPageRoute<void>(
      builder: (context) => DisposableProvider<IAccountDetailsBloc>(
        create: (context) => AccountDetailsBloc(
          unifediApiAccountService: Provider.of<IUnifediApiAccountService>(
            context,
            listen: false,
          ),
          currentUnifediApiAccessBloc: ICurrentAccessBloc.of(
            context,
            listen: false,
          ),
        ),
        child: DisposableProvider<IAccountBloc>(
          create: (context) => LocalAccountBloc.createFromContext(
            context,
            isNeedWatchLocalRepositoryForUpdates: true,
            account: account,
            isNeedRefreshFromNetworkOnInit: false,
            isNeedWatchWebSocketsEvents: false,
            isNeedPreFetchRelationship: true,
          ),
          child: const AccountDetailsPage(),
        ),
      ),
    );
