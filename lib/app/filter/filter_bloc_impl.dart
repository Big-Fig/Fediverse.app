import 'package:fedi/app/filter/filter_bloc.dart';
import 'package:fedi/app/filter/filter_model.dart';
import 'package:fedi/app/filter/repository/filter_repository.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/filter/pleroma_filter_model.dart';
import 'package:fedi/pleroma/filter/pleroma_filter_service.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger("filter_bloc_impl.dart");

class FilterBloc extends DisposableOwner implements IFilterBloc {
  @override
  bool get isExpired => filter.isExpired;

  @override
  Stream<bool> get isExpiredStream => filterStream.map(
        (filter) => filter.isExpired,
      );

  @override
  IFilter get filter => _filterSubject.value!;

  @override
  Stream<IFilter> get filterStream => _filterSubject.stream.distinct();

  static FilterBloc createFromContext(
    BuildContext context,
    IFilter filter, {
    bool isNeedWatchLocalRepositoryForUpdates = true,
  }) =>
      FilterBloc(
        pleromaFilterService: IPleromaFilterService.of(context, listen: false),
        filterRepository: IFilterRepository.of(context, listen: false),
        filter: filter,
        needRefreshFromNetworkOnInit: false,
        isNeedWatchLocalRepositoryForUpdates:
            isNeedWatchLocalRepositoryForUpdates,
      );

  final BehaviorSubject<IFilter> _filterSubject;

  final IPleromaFilterService pleromaFilterService;
  final IFilterRepository filterRepository;
  final bool isNeedWatchLocalRepositoryForUpdates;

  FilterBloc({
    required this.pleromaFilterService,
    required this.filterRepository,
    required IFilter filter,
    bool needRefreshFromNetworkOnInit = false,
    this.isNeedWatchLocalRepositoryForUpdates =
        true, // todo: remove hack. Don't init when bloc quickly disposed. Help
    //  improve performance in timeline unnecessary recreations
    bool delayInit = true,
  }) : _filterSubject = BehaviorSubject.seeded(filter) {
    addDisposable(subject: _filterSubject);

    if (delayInit) {
      Future.delayed(Duration(seconds: 1), () {
        _init(filter, needRefreshFromNetworkOnInit);
      });
    } else {
      _init(filter, needRefreshFromNetworkOnInit);
    }
  }

  void _init(IFilter? filter, bool needRefreshFromNetworkOnInit) {
    if (!isDisposed) {
      if (isNeedWatchLocalRepositoryForUpdates) {
        addDisposable(
          streamSubscription:
              filterRepository.watchByRemoteId(filter!.remoteId).listen(
            (updatedFilter) {
              if (updatedFilter != null) {
                _filterSubject.add(updatedFilter);
              }
            },
          ),
        );
      }
      if (needRefreshFromNetworkOnInit) {
        refreshFromNetwork();
      }
    }
  }

  Future refreshFromNetwork() async {
    var remoteFilter =
        await pleromaFilterService.getFilter(filterRemoteId: remoteId);

    return _updateByRemoteFilter(remoteFilter);
  }

  Future _updateByRemoteFilter(IPleromaFilter remoteFilter) {
    return filterRepository.updateLocalFilterByRemoteFilter(
      oldLocalFilter: filter,
      newRemoteFilter: remoteFilter,
    );
  }

  @override
  Future dispose() {
    _logger.finest(() => "dispose");
    return super.dispose();
  }

  @override
  String? get remoteId => filter.remoteId;
}
