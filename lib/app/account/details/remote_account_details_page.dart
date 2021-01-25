import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/details/account_details_bloc.dart';
import 'package:fedi/app/account/details/account_details_bloc_impl.dart';
import 'package:fedi/app/account/details/account_details_page.dart';
import 'package:fedi/app/account/remote_account_bloc_impl.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void goToRemoteAccountDetailsPage(
  BuildContext context, {
  @required IAccount account,
}) {
  Navigator.push(
    context,
    createRemoteAccountDetailsPageRoute(account),
  );
}

MaterialPageRoute createRemoteAccountDetailsPageRoute(IAccount account) {
  return MaterialPageRoute(
    builder: (context) => DisposableProvider<IAccountDetailsBloc>(
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
}
