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

  IStatus get startStatus;

  int get startStatusIndex;

  List<IStatus> get statuses;

  Stream<List<IStatus>> get statusesStream;

  List<String> get mentionAccts;

  Stream<List<String>> get mentionAcctsStream;

  String get mentionAcctsListString;

  Future<IStatus> sendMessageToAllMentionedAccounts(
      {@required String idempotencyKey, @required String text});

  Future<bool> refresh();
}
