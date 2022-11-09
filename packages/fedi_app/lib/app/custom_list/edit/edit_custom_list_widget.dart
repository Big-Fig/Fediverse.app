import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/account/details/local_account_details_page.dart';
import 'package:fedi_app/app/account/pagination/cached/account_cached_pagination_bloc_impl.dart';
import 'package:fedi_app/app/account/pagination/network_only/account_network_only_pagination_bloc.dart';
import 'package:fedi_app/app/account/select/select_account_list_bloc.dart';
import 'package:fedi_app/app/account/select/select_account_list_bloc_proxy_provider.dart';
import 'package:fedi_app/app/account/select/select_account_pagination_list_bloc.dart';
import 'package:fedi_app/app/account/select/single/single_select_account_widget.dart';
import 'package:fedi_app/app/account/select/suggestion/suggestion_select_account_bloc.dart';
import 'package:fedi_app/app/account/select/suggestion/suggestion_select_account_bloc_impl.dart';
import 'package:fedi_app/app/account/select/suggestion/suggestion_select_account_widget.dart';
import 'package:fedi_app/app/async/unifedi/unifedi_async_operation_button_builder_widget.dart';
import 'package:fedi_app/app/custom_list/account_list/custom_list_account_list_widget.dart';
import 'package:fedi_app/app/custom_list/account_list/network_only/custom_list_account_list_network_only_list_bloc.dart';
import 'package:fedi_app/app/custom_list/account_list/network_only/custom_list_account_list_network_only_list_bloc_proxy_provider.dart';
import 'package:fedi_app/app/custom_list/edit/account_list/edit_custom_list_account_list_item_add_remove_action_widget.dart';
import 'package:fedi_app/app/custom_list/edit/account_list/edit_custom_list_account_list_pagination_list_bloc.dart';
import 'package:fedi_app/app/custom_list/edit/account_list/edit_custom_list_account_list_pagination_list_bloc_proxy_provider.dart';
import 'package:fedi_app/app/custom_list/edit/edit_custom_list_bloc.dart';
import 'package:fedi_app/app/custom_list/form/custom_list_form_widget.dart';
import 'package:fedi_app/app/search/input/search_input_bloc.dart';
import 'package:fedi_app/app/search/input/search_input_widget.dart';
import 'package:fedi_app/app/ui/button/text/with_border/fedi_transparent_text_button_with_border.dart';
import 'package:fedi_app/app/ui/description/fedi_note_description_widget.dart';
import 'package:fedi_app/app/ui/fedi_padding.dart';
import 'package:fedi_app/app/ui/form/fedi_form_header_widget.dart';
import 'package:fedi_app/app/ui/spacer/fedi_big_vertical_spacer.dart';
import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditCustomListWidget extends StatelessWidget {
  const EditCustomListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var editCustomListBloc = IEditCustomListBloc.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const CustomListFormWidget(),
        if (editCustomListBloc.isPossibleToDelete)
          const Padding(
            padding: FediPadding.allBigPadding,
            child: _EditCustomListDeleteButton(),
          ),
        const _EditCustomListAccountDescriptionWidget(),
        const Expanded(
          child: _EditCustomListBodyWidget(),
        ),
      ],
    );
  }
}

class _EditCustomListAccountDescriptionWidget extends StatelessWidget {
  const _EditCustomListAccountDescriptionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FediNoteDescriptionWidget(
        S.of(context).app_account_my_customList_edit_description,
      );
}

class _EditCustomListDeleteButton extends StatelessWidget {
  const _EditCustomListDeleteButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var editCustomListBloc = IEditCustomListBloc.of(context);

    return UnifediAsyncOperationButtonBuilderWidget(
      asyncButtonAction: () async {
        await editCustomListBloc.deleteList();
        Navigator.of(context).pop();
      },
      builder: (context, onPressed) => FediTransparentTextButtonWithBorder(
        S.of(context).app_account_my_customList_edit_action_delete_list,
        expanded: false,
        onPressed: onPressed,
        color: IFediUiColorTheme.of(context).error,
      ),
    );
  }
}

class _EditCustomListBodyWidget extends StatelessWidget {
  const _EditCustomListBodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      const _EditCustomListBodySearchToAddAccountsWidget(
        emptySearchChild: _EditCustomListEmptySearchChildWidget(),
      );
}

class _EditCustomListEmptySearchChildWidget extends StatelessWidget {
  const _EditCustomListEmptySearchChildWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var editCustomListBloc = IEditCustomListBloc.of(context);

    return StreamBuilder<bool>(
      stream: editCustomListBloc.isListContainsAccountsStream,
      initialData: editCustomListBloc.isListContainsAccounts,
      builder: (context, snapshot) {
        var isListContainsAccounts = snapshot.data;

        if (isListContainsAccounts == null) {
          return const SizedBox.shrink();
        }

        if (isListContainsAccounts) {
          return const _EditCustomListBodyAlreadyAddedAccountsWidget();
        } else {
          return DisposableProvider<ISuggestionSelectAccountBloc>(
            create: (context) => SuggestionSelectAccountBloc(
              accountCachedListBloc: editCustomListBloc.selectAccountListBloc,
            ),
            child: SuggestionSelectAccountWidget(
              itemActions: const [
                CustomListAccountListItemAddRemoveActionWidget(),
              ],
              accountSelectedCallback:
                  (BuildContext context, IAccount account) {
                goToLocalAccountDetailsPage(
                  context,
                  account: account,
                );
              },
              itemPadding: FediPadding.verticalSmallPadding,
              headerPadding: EdgeInsets.zero,
            ),
          );
        }
      },
    );
  }
}

class _EditCustomListBodyAlreadyAddedAccountsWidget extends StatelessWidget {
  const _EditCustomListBodyAlreadyAddedAccountsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ProxyProvider<IEditCustomListBloc,
          ICustomListAccountListNetworkOnlyListBloc>(
        update: (context, editCustomListBloc, previous) =>
            editCustomListBloc.customListAccountListNetworkOnlyListBloc,
        child: ProxyProvider<IEditCustomListBloc,
            IAccountNetworkOnlyPaginationBloc>(
          update: (context, editCustomListBloc, previous) =>
              editCustomListBloc.customListAccountListNetworkOnlyPaginationBloc,
          child: ProxyProvider<IEditCustomListBloc,
              IEditCustomListAccountListPaginationListBloc>(
            update: (context, editCustomListBloc, previous) =>
                editCustomListBloc.editCustomListAccountListPaginationListBloc,
            child: EditCustomListAccountListPaginationListBlocProxyProvider(
              child: CustomListAccountListNetworkOnlyListBlocProxyProvider(
                child: Column(
                  children: const [
                    _EditCustomListBodyAddedHeaderWidget(),
                    Expanded(
                      child: CustomListAccountListWidget(
                        itemActions: [
                          CustomListAccountListItemAddRemoveActionWidget(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}

class _EditCustomListBodyAddedHeaderWidget extends StatelessWidget {
  const _EditCustomListBodyAddedHeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FediFormHeaderWidget(
        text: S.of(context).app_account_my_customList_edit_added_header,
        isNeedAddDivider: true,
      );
}

class _EditCustomListBodySearchToAddAccountsWidget extends StatelessWidget {
  final Widget emptySearchChild;

  const _EditCustomListBodySearchToAddAccountsWidget({
    Key? key,
    required this.emptySearchChild,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IEditCustomListBloc, ISelectAccountListBloc>(
        update: (context, editCustomListBloc, _) =>
            editCustomListBloc.selectAccountListBloc,
        child: SelectAccountListBlocProxyProvider(
          child: ProxyProvider<ISelectAccountListBloc, ISearchInputBloc>(
            update: (context, selectAccountListBloc, _) =>
                selectAccountListBloc.searchInputBloc,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _EditCustomListBodySearchHeader(),
                const SearchInputWidget(
                  padding: EdgeInsets.zero,
                ),
                const FediBigVerticalSpacer(),
                Expanded(
                  child: _EditCustomListBodySearchToAddAccountsBodyWidget(
                    emptySearchChild: emptySearchChild,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

class _EditCustomListBodySearchToAddAccountsBodyWidget extends StatelessWidget {
  const _EditCustomListBodySearchToAddAccountsBodyWidget({
    Key? key,
    required this.emptySearchChild,
  }) : super(key: key);

  final Widget emptySearchChild;

  @override
  Widget build(BuildContext context) {
    var searchInputBloc = ISearchInputBloc.of(context);

    return StreamBuilder<bool>(
      stream: searchInputBloc.confirmedSearchTermIsNotEmptyStream,
      builder: (context, snapshot) {
        var confirmedSearchTermIsNotEmpty = snapshot.data ?? false;
        if (confirmedSearchTermIsNotEmpty) {
          return SelectAccountListBlocProxyProvider(
            child: AccountCachedPaginationBloc.provideToContext(
              context,
              child: SelectAccountPaginationListBloc.provideToContext(
                context,
                child: const SingleSelectAccountWidget(
                  accountSelectedCallback: _accountSelectedCallback,
                  itemPadding: FediPadding.verticalMediumPadding,
                  accountActions: [
                    CustomListAccountListItemAddRemoveActionWidget(),
                  ],
                ),
              ),
            ),
          );
        } else {
          return emptySearchChild;
        }
      },
    );
  }
}

// ignore: no-empty-block
void _accountSelectedCallback(BuildContext context, IAccount account) {
  // nothing
}

class _EditCustomListBodySearchHeader extends StatelessWidget {
  const _EditCustomListBodySearchHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FediFormHeaderWidget(
        text: S.of(context).app_account_my_customList_edit_search_header,
        isNeedAddDivider: false,
      );
}
