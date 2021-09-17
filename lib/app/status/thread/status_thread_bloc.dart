import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/status/list/status_list_bloc.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

abstract class IStatusThreadBloc
    implements IAsyncInitLoadingBloc, IStatusListBloc {
  static IStatusThreadBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IStatusThreadBloc>(context, listen: listen);

  List<IUnifediApiMention> get mentions;

  Stream<List<IUnifediApiMention>> get mentionsStream;

  IStatus? get initialStatusToFetchThread;

  IUnifediApiMediaAttachment? get initialMediaAttachment;

  int get initialStatusToFetchThreadIndex;

  bool? get firstStatusInThreadLoaded;

  Stream<bool> get firstStatusInThreadLoadedStream;

  IStatus? get firstStatusInThread;

  Stream<IStatus?> get firstStatusInThreadStream;

  IAccount? get firstStatusAccountInThread;

  Stream<IAccount?> get firstStatusAccountInThreadStream;

  List<IStatus> get statuses;

  Stream<List<IStatus>> get statusesStream;

  Stream<List<IStatus>> get statusesDistinctStream;

  List<String?> get mentionAccts;

  Stream<List<String?>> get mentionAcctsStream;

  String get mentionAcctsListString;

  Future<bool> refresh();

  bool isFirstStatusInThread(IStatus status);

  void addStatusInThread(IStatus status);

  Stream<IStatus> get onNewStatusAddedStream;

  ItemScrollController get itemScrollController;

  ItemPositionsListener get itemPositionListener;

  bool get isJumpedToStartState;

  void jumpToIndex(int startStatusIndex);

  void jumpToStartIndex();
}
