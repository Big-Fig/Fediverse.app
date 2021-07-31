import 'dart:async';

import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/pagination/list/account_pagination_list_bloc.dart';
import 'package:fedi/app/account/pagination/list/account_pagination_list_bloc_impl.dart';
import 'package:fedi/app/account/pagination/network_only/account_network_only_pagination_bloc.dart';
import 'package:fedi/app/account/pagination/network_only/account_network_only_pagination_bloc_impl.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/account/select/select_account_list_bloc.dart';
import 'package:fedi/app/account/select/select_account_list_bloc_impl.dart';
import 'package:fedi/app/custom_list/account_list/network_only/custom_list_account_list_network_only_list_bloc.dart';
import 'package:fedi/app/custom_list/account_list/network_only/custom_list_account_list_network_only_list_bloc_impl.dart';
import 'package:fedi/app/custom_list/custom_list_model.dart';
import 'package:fedi/app/custom_list/custom_list_model_adapter.dart';
import 'package:fedi/app/custom_list/edit/account_list/edit_custom_list_account_list_pagination_list_bloc.dart';
import 'package:fedi/app/custom_list/edit/account_list/edit_custom_list_account_list_pagination_list_bloc_impl.dart';
import 'package:fedi/app/custom_list/edit/edit_custom_list_bloc.dart';
import 'package:fedi/app/custom_list/edit/edit_custom_list_bloc_proxy_provider.dart';
import 'package:fedi/app/custom_list/form/custom_list_form_bloc.dart';
import 'package:fedi/app/custom_list/form/custom_list_form_bloc_impl.dart';
import 'package:fedi/app/home/tab/timelines/storage/timelines_home_tab_storage_bloc.dart';
import 'package:fedi/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

final _logger = Logger('edit_custom_list_bloc_impl.dart');

class EditCustomListBloc extends DisposableOwner
    implements IEditCustomListBloc {
  static EditCustomListBloc createFromContext(
    BuildContext context, {
    required ICustomList initialValue,
    required Function(ICustomList customList)? onSubmit,
    required VoidCallback? onDelete,
  }) {
    var editCustomListBloc = EditCustomListBloc(
      customList: initialValue,
      statusRepository: IStatusRepository.of(context, listen: false),
      pleromaListService: Provider.of<IPleromaApiListService>(
        context,
        listen: false,
      ),
      myAccountBloc: IMyAccountBloc.of(
        context,
        listen: false,
      ),
      pleromaAuthAccountService: Provider.of<IPleromaApiAuthAccountService>(
        context,
        listen: false,
      ),
      accountRepository: IAccountRepository.of(
        context,
        listen: false,
      ),
      isPossibleToDelete: true,
      timelinesHomeTabStorageBloc: ITimelinesHomeTabStorageBloc.of(
        context,
        listen: false,
      ),
      paginationSettingsBloc: IPaginationSettingsBloc.of(
        context,
        listen: false,
      ),
    );

    if (onSubmit != null) {
      editCustomListBloc.submittedStream
          .listen(onSubmit)
          .disposeWith(editCustomListBloc);
    }
    if (onDelete != null) {
      editCustomListBloc.deletedStream
          .listen(
            (_) => onDelete(),
          )
          .disposeWith(editCustomListBloc);
    }

    return editCustomListBloc;
  }

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
    required ICustomList initialValue,
    required Function(ICustomList customList) onSubmit,
    required VoidCallback onDelete,
  }) {
    return DisposableProvider<IEditCustomListBloc>(
      create: (context) => EditCustomListBloc.createFromContext(
        context,
        initialValue: initialValue,
        onSubmit: onSubmit,
        onDelete: onDelete,
      ),
      child: EditCustomListBlocProxyProvider(child: child),
    );
  }

  final ICustomList? customList;

  final IPleromaApiListService pleromaListService;

  @override
  // ignore: avoid-late-keyword
  late ICustomListAccountListNetworkOnlyListBloc
      customListAccountListNetworkOnlyListBloc;

  @override
  // ignore: avoid-late-keyword
  late IAccountNetworkOnlyPaginationBloc
      customListAccountListNetworkOnlyPaginationBloc;

  // ignore: avoid-late-keyword
  late IAccountPaginationListBloc accountPaginationListBloc;

  @override
  // ignore: avoid-late-keyword
  late IEditCustomListAccountListPaginationListBloc
      editCustomListAccountListPaginationListBloc;

  @override
  final ICustomListFormBloc customListFormBloc;

  final IStatusRepository statusRepository;
  final ITimelinesHomeTabStorageBloc timelinesHomeTabStorageBloc;

  @override
  final ISelectAccountListBloc selectAccountListBloc;

  @override
  final bool isPossibleToDelete;
  final IPaginationSettingsBloc paginationSettingsBloc;

  EditCustomListBloc({
    required this.customList,
    required this.pleromaListService,
    required this.statusRepository,
    required this.isPossibleToDelete,
    required this.timelinesHomeTabStorageBloc,
    required this.paginationSettingsBloc,
    required IMyAccountBloc myAccountBloc,
    required IAccountRepository accountRepository,
    required IPleromaApiAuthAccountService pleromaAuthAccountService,
  })  : selectAccountListBloc = SelectAccountListBloc(
          pleromaAuthAccountService: pleromaAuthAccountService,
          accountRepository: accountRepository,
          myAccountBloc: myAccountBloc,
          excludeMyAccount: true,
          customEmptySearchRemoteAccountListLoader: null,
          customEmptySearchLocalAccountListLoader: null,
          followingsOnly: true,
        ),
        customListFormBloc = CustomListFormBloc(
          initialTitleValue: customList?.title,
        ) {
    customListAccountListNetworkOnlyListBloc =
        CustomListAccountListNetworkOnlyListBloc(
      pleromaListService: pleromaListService,
      customList: customList,
    );

    customListAccountListNetworkOnlyPaginationBloc =
        AccountNetworkOnlyPaginationBloc(
      listBloc: customListAccountListNetworkOnlyListBloc,
      maximumCachedPagesCount: null,
      paginationSettingsBloc: paginationSettingsBloc,
    );
    accountPaginationListBloc = AccountPaginationListBloc(
      paginationBloc: customListAccountListNetworkOnlyPaginationBloc,
    );

    accountPaginationListBloc.refreshWithoutController();

    editCustomListAccountListPaginationListBloc =
        EditCustomListAccountListPaginationListBloc(
      paginationListBloc: accountPaginationListBloc,
    );

    addDisposables(
      [
        selectAccountListBloc,
        customListFormBloc,
        customListAccountListNetworkOnlyListBloc,
        customListAccountListNetworkOnlyPaginationBloc,
        accountPaginationListBloc,
        editCustomListAccountListPaginationListBloc,
      ],
    );

    submittedStreamController.disposeWith(this);
    deletedStreamController.disposeWith(this);
  }

  @override
  bool get isReadyToSubmit => _calculateIsReadyToSubmit(
        customListFormBlocIsHaveAtLeastOneError:
            customListFormBloc.isHaveAtLeastOneError,
        customListFormBlocIsSomethingChanged:
            customListFormBloc.isSomethingChanged,
        editCustomListAccountListPaginationListBlocIsSomethingChanged:
            editCustomListAccountListPaginationListBloc.isSomethingChanged,
      );

  @override
  Stream<bool> get isReadyToSubmitStream => Rx.combineLatest3(
        customListFormBloc.isHaveAtLeastOneErrorStream,
        customListFormBloc.isSomethingChangedStream,
        editCustomListAccountListPaginationListBloc.isSomethingChangedStream,
        (
          dynamic customListFormBlocIsHaveAtLeastOneError,
          dynamic customListFormBlocIsSomethingChanged,
          dynamic editCustomListAccountListPaginationListBlocIsSomethingChanged,
        ) =>
            _calculateIsReadyToSubmit(
          customListFormBlocIsHaveAtLeastOneError:
              customListFormBlocIsHaveAtLeastOneError,
          customListFormBlocIsSomethingChanged:
              customListFormBlocIsSomethingChanged,
          editCustomListAccountListPaginationListBlocIsSomethingChanged:
              editCustomListAccountListPaginationListBlocIsSomethingChanged,
        ),
      );

  bool _calculateIsReadyToSubmit({
    required bool customListFormBlocIsHaveAtLeastOneError,
    required bool customListFormBlocIsSomethingChanged,
    required bool editCustomListAccountListPaginationListBlocIsSomethingChanged,
  }) {
    return !customListFormBlocIsHaveAtLeastOneError &&
        (customListFormBlocIsSomethingChanged ||
            editCustomListAccountListPaginationListBlocIsSomethingChanged);
  }

  @override
  Future<ICustomList> submit() async {
    var listRemoteId = customList!.remoteId;
    var pleromaList = await pleromaListService.updateList(
      listRemoteId: listRemoteId,
      title: customListFormBloc.titleField.currentValue,
    );

    if (editCustomListAccountListPaginationListBloc.isSomethingChanged) {
      var addedAccounts =
          editCustomListAccountListPaginationListBloc.addedItems;

      // TODO: remove hack
      // Pleroma issue: it is only possible to add one account in one request
      if (addedAccounts.isNotEmpty) {
        for (var addedAccount in addedAccounts) {
          await pleromaListService.addAccountsToList(
            listRemoteId: listRemoteId,
            accountIds: [
              addedAccount.remoteId,
            ],
          );
        }
      }

      var removedAccounts =
          editCustomListAccountListPaginationListBloc.removedItems;

      if (removedAccounts.isNotEmpty) {
        // TODO: remove hack
        // Pleroma issue: it is only possible to remove one account in one request
        for (var removedAccount in removedAccounts) {
          await pleromaListService.removeAccountsFromList(
            listRemoteId: listRemoteId,
            accountIds: [
              removedAccount.remoteId,
            ],
          );
        }
      }

      await editCustomListAccountListPaginationListBloc
          .clearChangesAndRefresh();
    }

    var localCustomList = pleromaList.toCustomList();

    submittedStreamController.add(localCustomList);

    return localCustomList;
  }

  @override
  Future deleteList() async {
    await pleromaListService.deleteList(listRemoteId: customList!.remoteId);

    deletedStreamController.add(null);

    var timelinesToRemove = <Timeline>[];

    for (var timelineStorageItem
        in timelinesHomeTabStorageBloc.timelineStorageItems) {
      var timeline = timelineStorageItem.timeline;
      var onlyInRemoteList = timeline.onlyInRemoteList;
      if (onlyInRemoteList != null &&
          onlyInRemoteList.id == customList!.remoteId) {
        timelinesToRemove.add(timeline);
      }
    }

    for (var timeline in timelinesToRemove) {
      await timelinesHomeTabStorageBloc.remove(timeline);
    }
  }

  final StreamController deletedStreamController = StreamController.broadcast();

  @override
  Stream get deletedStream => deletedStreamController.stream;

  final StreamController<ICustomList> submittedStreamController =
      StreamController.broadcast();

  @override
  Stream<ICustomList> get submittedStream => submittedStreamController.stream;

  @override
  bool get isListContainsAccounts => _calculateIsListContainsAccounts(
        editCustomListAccountListPaginationListBloc.items,
      );

  bool _calculateIsListContainsAccounts(List<IAccount>? items) {
    _logger.finest(
      () => '_calculateIsListContainsAccounts items size ${items?.length}',
    );

    return items?.isNotEmpty == true;
  }

  @override
  Stream<bool> get isListContainsAccountsStream =>
      editCustomListAccountListPaginationListBloc.itemsStream.map(
        (items) => _calculateIsListContainsAccounts(items),
      );
}
