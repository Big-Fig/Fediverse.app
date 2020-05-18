import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/media/attachment/upload/upload_media_attachment_grid_bloc.dart';
import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:fedi/refactored/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPostStatusBloc implements Disposable {
  static IPostStatusBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IPostStatusBloc>(context, listen: listen);

  static final Duration requiredDurationToScheduleStatus = Duration(minutes: 5);

  List<String> get mentionedAccts;

  Stream<List<String>> get mentionedAcctsStream;

  TextEditingController get inputTextController;

  bool get isPossibleToChangeVisibility;

  IUploadMediaAttachmentGridBloc get mediaAttachmentGridBloc;

  PleromaVisibility get visibility;

  Stream<PleromaVisibility> get visibilityStream;

  bool get nsfwSensitive;

  Stream<bool> get nsfwSensitiveStream;

  void addMentionByAccount(IAccount account);

  void removeMentionByAccount(IAccount account);

  void removeMentionByAcct(String acct);

  void changeVisibility(PleromaVisibility visibility);

  void changeNsfwSensitive(bool nsfwSensitive);

  void schedule(DateTime dateTime);

  void clearSchedule();

  bool get isReadyToPost;

  Stream<bool> get isReadyToPostStream;

  bool get isScheduled;

  Stream<bool> get isScheduledStream;

  DateTime get scheduledAt;

  Stream<DateTime> get scheduledAtStream;

  String get inputText;

  Stream<String> get inputTextStream;

  String get inputWithoutMentionedAcctsText;

  Stream<String> get inputWithoutMentionedAcctsTextStream;

  bool get isHaveMentionedAccts;

  Stream<bool> get isHaveMentionedAcctsStream;

  Future<bool> postStatus();
}
