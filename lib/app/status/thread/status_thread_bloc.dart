import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/status/list/status_list_bloc.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:fedi/pleroma/mention/pleroma_mention_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

abstract class IStatusThreadBloc implements IDisposable, IStatusListBloc {
  static IStatusThreadBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IStatusThreadBloc>(context, listen: listen);

  List<IPleromaMention> get mentions;

  Stream<List<IPleromaMention>> get mentionsStream;

  IStatus get initialStatusToFetchThread;

  IPleromaMediaAttachment get initialMediaAttachment;

  int get initialStatusToFetchThreadIndex;

  bool get firstStatusInThreadLoaded;

  Stream<bool> get firstStatusInThreadLoadedStream;

  IStatus get firstStatusInThread;

  Stream<IStatus> get firstStatusInThreadStream;

  IAccount get firstStatusAccountInThread;

  Stream<IAccount> get firstStatusAccountInThreadStream;

  List<IStatus> get statuses;

  Stream<List<IStatus>> get statusesStream;

  Stream<List<IStatus>> get statusesDistinctStream;

  List<String> get mentionAccts;

  Stream<List<String>> get mentionAcctsStream;

  String get mentionAcctsListString;

  Future<bool> refresh();

  bool isFirstStatusInThread(IStatus status);

  void addStatusInThread(IStatus status);

  Stream<IStatus> get onNewStatusAddedStream;

  ItemScrollController get itemScrollController;

  ItemPositionsListener get itemPositionListener;

  bool get isJumpedToStartState;

  void scrollToIndex(int startStatusIndex);

  void scrollToStartIndex();
}
