import 'package:fedi/app/account/pagination/cached/account_cached_pagination_bloc_impl.dart';
import 'package:fedi/app/account/select/recent/recent_select_account_bloc.dart';
import 'package:fedi/app/account/select/recent/recent_select_account_bloc_impl.dart';
import 'package:fedi/app/account/select/select_account_list_bloc.dart';
import 'package:fedi/app/account/select/select_account_list_bloc_impl.dart';
import 'package:fedi/app/account/select/select_account_list_bloc_proxy_provider.dart';
import 'package:fedi/app/account/select/select_account_pagination_list_bloc.dart';
import 'package:fedi/app/account/select/single/single_select_account_widget.dart';
import 'package:fedi/app/account/select/suggestion/suggestion_select_account_bloc.dart';
import 'package:fedi/app/account/select/suggestion/suggestion_select_account_bloc_impl.dart';
import 'package:fedi/app/account/select/suggestion/suggestion_select_account_widget.dart';
import 'package:fedi/app/search/input/search_input_bloc.dart';
import 'package:fedi/app/search/input/search_input_widget.dart';
import 'package:fedi/app/share/select_account/recent/local_preferences/recent_share_select_account_local_preference_bloc.dart';
import 'package:fedi/app/share/select_account/recent/recent_share_select_account_widget.dart';
import 'package:fedi/app/share/select_account/share_select_account_item_send_action_widget.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:flutter/cupertino.dart';

class ShareSelectAccountWidget extends StatelessWidget {
  final bool alwaysShowHeader;
  final Widget header;
  final bool alwaysShowFooter;
  final Widget footer;

  const ShareSelectAccountWidget({
    this.header,
    this.footer,
    this.alwaysShowHeader,
    this.alwaysShowFooter,
  });

  @override
  Widget build(BuildContext context) {
    return SelectAccountListBloc.provideToContext(
      context,
      child: SelectAccountListBlocProxyProvider(
        child: DisposableProxyProvider<ISelectAccountListBloc,
            IRecentSelectAccountBloc>(
          update: (context, selectAccountListBloc, _) {
            return RecentSelectAccountBloc(
              selectAccountListBloc: selectAccountListBloc,
              recentSelectAccountLocalPreferenceBloc:
                  IRecentShareSelectAccountLocalPreferenceBloc.of(
                context,
                listen: false,
              ),
            );
          },
          child: _ShareSelectAccountBodyWidget(
            header: header,
            footer: footer,
            alwaysShowHeader: alwaysShowHeader,
            alwaysShowFooter: alwaysShowFooter,
          ),
        ),
      ),
      followingsOnly: false,
      excludeMyAccount: true,
      customRemoteAccountListLoader: null,
      customLocalAccountListLoader: null,
    );
  }
}

class _ShareSelectAccountBodyWidget extends StatelessWidget {
  const _ShareSelectAccountBodyWidget({
    Key key,
    @required this.header,
    @required this.footer,
    @required this.alwaysShowHeader,
    @required this.alwaysShowFooter,
  }) : super(key: key);

  final Widget header;
  final Widget footer;
  final bool alwaysShowHeader;
  final bool alwaysShowFooter;

  @override
  Widget build(BuildContext context) {
    var searchInputBloc = ISearchInputBloc.of(context);
    return StreamBuilder<bool>(
      stream: searchInputBloc.confirmedSearchTermIsEmptyStream,
      builder: (context, snapshot) {
        var confirmedSearchTermIsEmpty = snapshot.data ?? true;

        if (confirmedSearchTermIsEmpty) {
          var recentSelectAccountBloc = IRecentSelectAccountBloc.of(context);

          return StreamBuilder<bool>(
              stream: recentSelectAccountBloc
                  .isRecentSelectAccountListEmptyStream
                  .distinct(),
              builder: (context, snapshot) {
                var isRecentSelectAccountListEmpty = snapshot.data;

                if (isRecentSelectAccountListEmpty == null) {
                  return const SizedBox.shrink();
                }
                if (isRecentSelectAccountListEmpty) {
                  return DisposableProvider<ISuggestionSelectAccountBloc>(
                    create: (context) => SuggestionSelectAccountBloc(
                      accountCachedListBloc: ISelectAccountListBloc.of(
                        context,
                        listen: false,
                      ),
                    ),
                    child: SuggestionSelectAccountWidget(
                      headerPadding: FediPadding.horizontalMediumPadding,
                      itemPadding: FediPadding.allMediumPadding,
                      header:
                          _ShareSelectAccountSearchHeaderWithSearchInputWidget(
                              header: header),
                      footer: footer,
                      alwaysShowHeader: alwaysShowHeader,
                      alwaysShowFooter: alwaysShowFooter,
                      itemActions: [
                        const ShareSelectAccountItemSendActionWidget(),
                      ],
                      accountSelectedCallback: null,
                    ),
                  );
                } else {
                  return RecentShareSelectAccountWidget(
                    header:
                        _ShareSelectAccountSearchHeaderWithSearchInputWidget(
                            header: header),
                    footer: footer,
                    alwaysShowHeader: alwaysShowHeader,
                    alwaysShowFooter: alwaysShowFooter,
                    itemActions: [
                      const ShareSelectAccountItemSendActionWidget(),
                    ],
                  );
                }
              });
        } else {
          return _ShareSelectAccountSearchResultsWidget(
            header: header,
            footer: footer,
            alwaysShowHeader: alwaysShowHeader,
            alwaysShowFooter: alwaysShowFooter,
          );
        }
      },
    );
  }
}

class _ShareSelectAccountSearchResultsWidget extends StatelessWidget {
  final bool alwaysShowHeader;
  final Widget header;
  final bool alwaysShowFooter;
  final Widget footer;

  const _ShareSelectAccountSearchResultsWidget({
    this.header,
    this.footer,
    this.alwaysShowHeader,
    this.alwaysShowFooter,
  });

  @override
  Widget build(BuildContext context) {
    return AccountCachedPaginationBloc.provideToContext(
      context,
      child: SelectAccountPaginationListBloc.provideToContext(
        context,
        child: SingleSelectAccountWidget(
          accountActions: [
            const ShareSelectAccountItemSendActionWidget(),
          ],
          header: _ShareSelectAccountSearchHeaderWithSearchInputWidget(
              header: header),
          footer: footer,
          alwaysShowHeader: alwaysShowHeader,
          alwaysShowFooter: alwaysShowFooter,
          accountSelectedCallback: null,
        ),
      ),
    );
  }
}

class _ShareSelectAccountSearchHeaderWithSearchInputWidget
    extends StatelessWidget {
  const _ShareSelectAccountSearchHeaderWithSearchInputWidget({
    Key key,
    @required this.header,
  }) : super(key: key);

  final Widget header;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        header,
        const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: SearchInputWidget(),
        ),
      ],
    );
  }
}
