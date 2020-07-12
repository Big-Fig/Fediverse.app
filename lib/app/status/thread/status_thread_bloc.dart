import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/pleroma/mention/pleroma_mention_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IStatusThreadBloc implements Disposable {
  static IStatusThreadBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IStatusThreadBloc>(context, listen: listen);

  List<IPleromaMention> get mentions;

  Stream<List<IPleromaMention>> get mentionsStream;

  IStatus get initialStatusToFetchThread;

  int get initialStatusToFetchThreadIndex;

  bool get firstStatusInThreadLoaded;
  Stream<bool> get firstStatusInThreadLoadedStream;

  IStatus get firstStatusInThread;

  Stream<IStatus> get firstStatusInThreadStream;

  IAccount get firstStatusAccountInThread;

  Stream<IAccount> get firstStatusAccountInThreadStream;

  List<IStatus> get statuses;

  Stream<List<IStatus>> get statusesStream;

  List<String> get mentionAccts;

  Stream<List<String>> get mentionAcctsStream;

  String get mentionAcctsListString;

  Future<bool> refresh();

  bool isFirstStatusInThread(IStatus status);

  void addStatusInThread(IStatus status);
}
