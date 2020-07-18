import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/message/post_message_bloc.dart';
import 'package:fedi/app/status/post/post_status_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPostStatusBloc implements IPostMessageBloc {
  static IPostStatusBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IPostStatusBloc>(context, listen: listen);

  static final Duration requiredDurationToScheduleStatus = Duration(minutes: 5);

  List<String> get mentionedAccts;

  Stream<List<String>> get mentionedAcctsStream;

  FocusNode get focusNode;

  bool get isPossibleToChangeVisibility;

  PleromaVisibility get visibility;

  Stream<PleromaVisibility> get visibilityStream;

  bool get isNsfwSensitiveEnabled;

  Stream<bool> get isNsfwSensitiveEnabledStream;

  PostStatusSelectedAction get selectedAction;

  Stream<PostStatusSelectedAction> get selectedActionStream;

  void addMentionByAccount(IAccount account);

  void removeMentionByAccount(IAccount account);

  void removeMentionByAcct(String acct);

  void changeVisibility(PleromaVisibility visibility);

  void changeNsfwSensitive(bool nsfwSensitive);

  void schedule(DateTime dateTime);

  void clearSchedule();

  bool get isScheduled;

  Stream<bool> get isScheduledStream;

  DateTime get scheduledAt;

  Stream<DateTime> get scheduledAtStream;

  String get inputWithoutMentionedAcctsText;

  Stream<String> get inputWithoutMentionedAcctsTextStream;

  bool get isHaveMentionedAccts;

  Stream<bool> get isHaveMentionedAcctsStream;

  IStatus get originInReplyToStatus;

  IStatus get notCanceledOriginInReplyToStatus;

  Stream<IStatus> get notCanceledOriginInReplyToStatusStream;

  bool get originInReplyToStatusCanceled;

  Stream<bool> get originInReplyToStatusCanceledStream;

  void cancelOriginInReplyToStatus();
}
