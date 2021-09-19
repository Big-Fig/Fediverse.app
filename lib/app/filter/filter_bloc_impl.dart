import 'package:fedi/app/filter/filter_bloc.dart';
import 'package:fedi/app/filter/filter_model.dart';
import 'package:fedi/app/filter/repository/filter_repository.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger('filter_bloc_impl.dart');

class FilterBloc extends DisposableOwner implements IFilterBloc {
  @override
  bool get isExpired => filter.isExpired;

  @override
  Stream<bool> get isExpiredStream => filterStream.map(
        (filter) => filter.isExpired,
      );

  @override
  IFilter get filter => _filterSubject.value;

  @override
  Stream<IFilter> get filterStream => _filterSubject.stream.distinct();

  static FilterBloc createFromContext(
    BuildContext context,
    IFilter filter, {
    bool isNeedWatchLocalRepositoryForUpdates = true,
  }) =>
      FilterBloc(
        unifediApiFilterService:
            Provider.of<IUnifediApiFilterService>(context, listen: false),
        filterRepository: IFilterRepository.of(context, listen: false),
        filter: filter,
        needRefreshFromNetworkOnInit: false,
        isNeedWatchLocalRepositoryForUpdates:
            isNeedWatchLocalRepositoryForUpdates,
      );

  final BehaviorSubject<IFilter> _filterSubject;

  final IUnifediApiFilterService unifediApiFilterService;
  final IFilterRepository filterRepository;
  final bool isNeedWatchLocalRepositoryForUpdates;

  FilterBloc({
    required this.unifediApiFilterService,
    required this.filterRepository,
    required IFilter filter,
    bool needRefreshFromNetworkOnInit = false,
    this.isNeedWatchLocalRepositoryForUpdates =
        true, // todo: remove hack. Dont init when bloc quickly disposed. Help
    //  improve performance in timeline unnecessary recreations
    bool delayInit = true,
  }) : _filterSubject = BehaviorSubject.seeded(filter) {
    _filterSubject.disposeWith(this);

    if (delayInit) {
      Future.delayed(Duration(seconds: 1), () {
        _init(filter, needRefreshFromNetworkOnInit);
      });
    } else {
      _init(filter, needRefreshFromNetworkOnInit);
    }
  }

  void _init(IFilter filter, bool needRefreshFromNetworkOnInit) {
    if (!isDisposed) {
      if (isNeedWatchLocalRepositoryForUpdates) {
        filterRepository.watchByRemoteIdInAppType(filter.remoteId).listen(
          (updatedFilter) {
            if (updatedFilter != null) {
              _filterSubject.add(updatedFilter);
            }
          },
        ).disposeWith(this);
      }
      if (needRefreshFromNetworkOnInit) {
        refreshFromNetwork();
      }
    }
  }

  Future refreshFromNetwork() async {
    var remoteFilter =
        await unifediApiFilterService.getFilter(filterId: remoteId);

    return _updateByRemoteFilter(
      remoteFilter,
      batchTransaction: null,
    );
  }

  Future _updateByRemoteFilter(
    IUnifediApiFilter remoteFilter, {
    required Batch? batchTransaction,
  }) {
    return filterRepository.updateAppTypeByRemoteType(
      appItem: filter,
      remoteItem: remoteFilter,
      batchTransaction: batchTransaction,
    );
  }

  @override
  Future dispose() {
    _logger.finest(() => 'dispose');

    return super.dispose();
  }

  @override
  String get remoteId => filter.remoteId;
}
