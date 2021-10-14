import 'package:fedi/app/account/details/local_account_details_page.dart';
import 'package:fedi/app/account/details/remote_account_details_page.dart';
import 'package:fedi/app/account/list/account_list_bloc.dart';
import 'package:fedi/app/account/pagination/list/account_pagination_list_widget.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:flutter/cupertino.dart';

class InstanceDirectoryAccountListWidget extends StatelessWidget {
  const InstanceDirectoryAccountListWidget();

  @override
  Widget build(BuildContext context) => AccountPaginationListWidget(
        itemPadding: FediPadding.verticalMediumPadding,
        accountSelectedCallback: (context, account) {
          var accountListBloc = IAccountListBloc.of(context, listen: false);

          var isLocal =
              accountListBloc.instanceLocation == InstanceLocation.local;
          if (isLocal) {
            goToLocalAccountDetailsPage(
              context,
              account: account,
            );
          } else {
            goToRemoteAccountDetailsPageBasedOnRemoteInstanceAccount(
              context,
              remoteInstanceAccount: account,
            );
          }
        },
        key: const PageStorageKey('InstanceDirectoryAccountListWidget'),
      );
}
