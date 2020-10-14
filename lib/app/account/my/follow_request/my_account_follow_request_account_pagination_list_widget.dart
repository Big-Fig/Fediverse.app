import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/my/follow_request/my_account_follow_request_network_only_account_list_bloc.dart';
import 'package:fedi/app/account/pagination/list/account_pagination_list_widget.dart';
import 'package:fedi/app/async/pleroma_async_operation_button_builder_widget.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class MyAccountFollowRequestAccountPaginationListWidget
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var myAccountFollowRequestNetworkOnlyAccountListBloc =
        IMyAccountFollowRequestNetworkOnlyAccountListBloc.of(context,
            listen: false);

    var paginationListBloc = IPaginationListBloc.of(context, listen: false);

    return AccountPaginationListWidget(
      accountActions: <Widget>[
        buildAcceptButton(
          paginationListBloc,
          myAccountFollowRequestNetworkOnlyAccountListBloc,
        ),
        buildRejectButton(
          paginationListBloc,
          myAccountFollowRequestNetworkOnlyAccountListBloc,
        ),
      ],
      accountSelectedCallback: (BuildContext context, IAccount account) {
        // nothing
      },
      key: PageStorageKey("MyAccountFollowRequestAccountPaginationListWidget"),
    );
  }

  Widget buildAcceptButton(
      IPaginationListBloc paginationListBloc,
      IMyAccountFollowRequestNetworkOnlyAccountListBloc
          myAccountFollowRequestNetworkOnlyAccountListBloc) {
    return Builder(
      builder: (context) => PleromaAsyncOperationButtonBuilderWidget(
        asyncButtonAction: () async {
          var account = Provider.of<IAccount>(context, listen: false);
          await myAccountFollowRequestNetworkOnlyAccountListBloc
              .acceptFollowRequest(account: account);
          paginationListBloc.refreshWithController();
        },
        builder: (BuildContext context, void Function() onPressed) {
          return FediIconButton(
            icon: Icon(FediIcons.check_circle),
            onPressed: onPressed,
          );
        },
      ),
    );
  }

  Widget buildRejectButton(
  IPaginationListBloc paginationListBloc,
      IMyAccountFollowRequestNetworkOnlyAccountListBloc
          myAccountFollowRequestNetworkOnlyAccountListBloc) {
    return Builder(
      builder: (context) => PleromaAsyncOperationButtonBuilderWidget(
        asyncButtonAction: () async {
          var account = Provider.of<IAccount>(context, listen: false);
          await myAccountFollowRequestNetworkOnlyAccountListBloc
              .rejectFollowRequest(account: account);
          paginationListBloc.refreshWithController();
        },
        builder: (BuildContext context, void Function() onPressed) {
          return FediIconButton(
            icon: Icon(FediIcons.remove_circle),
            onPressed: onPressed,
          );
        },
      ),
    );
  }
}
