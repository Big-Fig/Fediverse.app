import 'package:fedi/app/status/draft/draft_status_model.dart';
import 'package:fedi/app/status/post/post_status_model.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IDraftStatusBloc implements Disposable {
  static IDraftStatusBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IDraftStatusBloc>(context, listen: listen);

  IDraftStatus get draftStatus;

  Stream<IDraftStatus> get draftStatusStream;

  DateTime get updatedAt;

  Stream<DateTime> get updatedAtStream;

  Future cancelDraft();

  IPostStatusData calculatePostStatusData();

  Future updatePostStatusData(PostStatusData postStatusData);
}
