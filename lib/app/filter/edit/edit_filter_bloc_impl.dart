import 'dart:async';

import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/filter/edit/edit_filter_bloc.dart';
import 'package:fedi/app/filter/edit/edit_filter_bloc_proxy_provider.dart';
import 'package:fedi/app/filter/filter_model.dart';
import 'package:fedi/app/filter/filter_model_adapter.dart';
import 'package:fedi/app/filter/form/filter_form_bloc.dart';
import 'package:fedi/app/filter/form/filter_form_bloc_impl.dart';
import 'package:fedi/app/home/tab/timelines/storage/timelines_home_tab_storage_bloc.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/account/pleroma_account_service.dart';
import 'package:fedi/pleroma/filter/pleroma_filter_model.dart';
import 'package:fedi/pleroma/filter/pleroma_filter_service.dart';
import 'package:flutter/widgets.dart';

class EditFilterBloc extends DisposableOwner implements IEditFilterBloc {
  static EditFilterBloc createFromContext(
    BuildContext context, {
    @required IFilter initialValue,
    @required Function(IFilter filter) onSubmit,
    @required VoidCallback onDelete,
  }) {
    var editFilterBloc = EditFilterBloc(
      filter: initialValue,
      statusRepository: IStatusRepository.of(context, listen: false),
      pleromaFilterService: IPleromaFilterService.of(
        context,
        listen: false,
      ),
      myAccountBloc: IMyAccountBloc.of(
        context,
        listen: false,
      ),
      pleromaAccountService: IPleromaAccountService.of(
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
      currentInstance: ICurrentAuthInstanceBloc.of(
        context,
        listen: false,
      ).currentInstance,
    );

    if (onSubmit != null) {
      editFilterBloc.addDisposable(
        streamSubscription: editFilterBloc.submittedStream.listen(onSubmit),
      );
    }
    if (onDelete != null) {
      editFilterBloc.addDisposable(
        streamSubscription:
            editFilterBloc.deletedStream.listen((_) => onDelete()),
      );
    }
    return editFilterBloc;
  }

  static Widget provideToContext(
    BuildContext context, {
    @required Widget child,
    @required IFilter initialValue,
    @required Function(IFilter filter) onSubmit,
    @required VoidCallback onDelete,
  }) {
    return DisposableProvider<IEditFilterBloc>(
      create: (context) => EditFilterBloc.createFromContext(
        context,
        initialValue: initialValue,
        onSubmit: onSubmit,
        onDelete: onDelete,
      ),
      child: EditFilterBlocProxyProvider(child: child),
    );
  }

  final IFilter filter;

  final IPleromaFilterService pleromaFilterService;

  @override
  final IFilterFormBloc filterFormBloc;

  final IStatusRepository statusRepository;
  final ITimelinesHomeTabStorageBloc timelinesHomeTabStorageBloc;

  @override
  final bool isPossibleToDelete;

  final AuthInstance currentInstance;

  EditFilterBloc({
    @required this.filter,
    @required this.pleromaFilterService,
    @required this.statusRepository,
    @required this.isPossibleToDelete,
    @required this.timelinesHomeTabStorageBloc,
    @required IMyAccountBloc myAccountBloc,
    @required IAccountRepository accountRepository,
    @required IPleromaAccountService pleromaAccountService,
    @required this.currentInstance,
  }) : filterFormBloc = FilterFormBloc(
          initialValue: filter,
          currentInstance: currentInstance,
        ) {
    addDisposable(disposable: filterFormBloc);

    addDisposable(streamController: submittedStreamController);
    addDisposable(streamController: deletedStreamController);
  }

  @override
  bool get isReadyToSubmit => filterFormBloc.isHaveChangesAndNoErrors;

  @override
  Stream<bool> get isReadyToSubmitStream =>
      filterFormBloc.isHaveChangesAndNoErrorsStream;

  @override
  Future<IFilter> submit() async {
    var listRemoteId = filter?.remoteId;
    var postPleromaFilter = filterFormBloc.calculateFormValue();
    var remoteFilter =
        await actuallySubmitFilter(listRemoteId, postPleromaFilter);

    var localFilter = mapRemoteFilterToLocalFilter(remoteFilter);

    submittedStreamController.add(localFilter);

    return localFilter;
  }

  Future<IPleromaFilter> actuallySubmitFilter(
    String listRemoteId,
    IPostPleromaFilter postPleromaFilter,
  ) async {
    var remoteFilter = await pleromaFilterService.updateFilter(
      filterRemoteId: listRemoteId,
      postPleromaFilter: postPleromaFilter,
    );

    return remoteFilter;
  }

  @override
  Future deleteList() async {
    await pleromaFilterService.deleteFilter(filterRemoteId: filter.remoteId);

    deletedStreamController.add(null);

    var timelinesToRemove = <Timeline>[];

    for (var timelineStorageItem
        in timelinesHomeTabStorageBloc.timelineStorageItems) {
      var timeline = timelineStorageItem.timeline;
      var onlyInRemoteList = timeline.onlyInRemoteList;
      if (onlyInRemoteList != null && onlyInRemoteList.id == filter.remoteId) {
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

  final StreamController<IFilter> submittedStreamController =
      StreamController.broadcast();

  @override
  Stream<IFilter> get submittedStream => submittedStreamController.stream;
}
