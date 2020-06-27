import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachments_collection_bloc.dart';
import 'package:fedi/app/status/post/post_status_model.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPostStatusBloc implements Disposable {
  static IPostStatusBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IPostStatusBloc>(context, listen: listen);

  static final Duration requiredDurationToScheduleStatus = Duration(minutes: 5);

  List<String> get mentionedAccts;

  Stream<List<String>> get mentionedAcctsStream;

  TextEditingController get inputTextController;
  FocusNode get focusNode;

  bool get isPossibleToChangeVisibility;

  IUploadMediaAttachmentsCollectionBloc get mediaAttachmentGridBloc;

  PleromaVisibility get visibility;

  Stream<PleromaVisibility> get visibilityStream;

  bool get isNsfwSensitiveEnabled;

  Stream<bool> get isNsfwSensitiveEnabledStream;


  PostStatusSelectedAction get selectedAction;
  Stream<PostStatusSelectedAction> get selectedActionStream;

  bool get isAttachFileActionSelected;


  Stream<bool> get isAttachFileActionStream;
  bool get isAttachGalleryActionSelected;

  Stream<bool> get isAttachGalleryActionSelectedStream;

  void toggleAttachFileActionSelection();
  void toggleAttachGalleryActionSelection();

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

  void appendText(String text);
}
