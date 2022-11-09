import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/account/pagination/cached/account_cached_pagination_bloc_impl.dart';
import 'package:fedi_app/app/account/pagination/list/account_pagination_list_bloc_impl.dart';
import 'package:fedi_app/app/account/pagination/list/account_pagination_list_widget.dart';
import 'package:fedi_app/app/account/select/suggestion/suggestion_select_account_bloc_proxy_provider.dart';
import 'package:fedi_app/app/ui/form/fedi_form_header_widget.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/widgets.dart';

class SuggestionSelectAccountWidget extends StatelessWidget {
  final List<Widget> itemActions;
  final AccountCallback? accountSelectedCallback;
  final bool? alwaysShowHeader;
  final Widget? header;
  final bool? alwaysShowFooter;
  final Widget? footer;
  final EdgeInsets itemPadding;
  final EdgeInsets headerPadding;

  const SuggestionSelectAccountWidget({
    Key? key,
    required this.itemActions,
    required this.accountSelectedCallback,
    required this.itemPadding,
    required this.headerPadding,
    this.header,
    this.footer,
    this.alwaysShowHeader,
    this.alwaysShowFooter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      SuggestionSelectAccountBlocProxyProvider(
        child: AccountCachedPaginationBloc.provideToContext(
          context,
          child: AccountPaginationListBloc.provideToContext(
            context,
            child: AccountPaginationListWidget(
              header: Column(
                children: [
                  if (header != null) header!,
                  Padding(
                    padding: headerPadding,
                    child: const SuggestionSelectAccountHeaderWidget(),
                  ),
                ],
              ),
              footer: footer,
              alwaysShowHeader: alwaysShowHeader,
              alwaysShowFooter: alwaysShowFooter,
              itemPadding: itemPadding,
              accountActions: itemActions,
              accountSelectedCallback: accountSelectedCallback,
            ),
          ),
        ),
      );
}

class SuggestionSelectAccountHeaderWidget extends StatelessWidget {
  const SuggestionSelectAccountHeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FediFormHeaderWidget(
        text: S.of(context).app_account_select_suggestion_header,
        isNeedAddDivider: true,
      );
}
