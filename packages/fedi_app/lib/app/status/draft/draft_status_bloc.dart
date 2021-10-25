import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/status/draft/draft_status_model.dart';
import 'package:fedi_app/app/status/post/post_status_model.dart';
import 'package:flutter/widgets.dart';
import 'package:moor/moor.dart';
import 'package:provider/provider.dart';

abstract class IDraftStatusBloc implements IDisposable {
  static IDraftStatusBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IDraftStatusBloc>(context, listen: listen);

  DraftStatusState? get state;

  Stream<DraftStatusState> get stateStream;

  IDraftStatus? get draftStatus;

  Stream<IDraftStatus> get draftStatusStream;

  DateTime? get updatedAt;

  Stream<DateTime?> get updatedAtStream;

  Future<void> cancelDraft();

  Future<void> postDraft(PostStatusData postStatusData);

  IPostStatusData? calculatePostStatusData();

  Future<void> updatePostStatusData(
    PostStatusData postStatusData, {
    required Batch? batchTransaction,
  });
}
