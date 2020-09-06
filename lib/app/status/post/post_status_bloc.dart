import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/message/post_message_bloc.dart';
import 'package:fedi/app/status/post/poll/post_status_poll_bloc.dart';
import 'package:fedi/app/status/post/post_status_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPostStatusBloc implements IPostMessageBloc {
  bool get isAnyDataEntered;

  static IPostStatusBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IPostStatusBloc>(context, listen: listen);

  static final Duration requiredDurationToScheduleStatus = Duration(minutes: 5);

  List<String> get mentionedAccts;

  Stream<List<String>> get mentionedAcctsStream;

  bool get isPossibleToChangeVisibility;

  PleromaVisibility get visibility;

  Stream<PleromaVisibility> get visibilityStream;

  bool get isNsfwSensitiveEnabled;

  Stream<bool> get isNsfwSensitiveEnabledStream;

  TextEditingController get subjectTextController;

  FocusNode get subjectFocusNode;

  String get subjectText;

  Stream<String> get subjectTextStream;

  void addAccountMentions(List<IAccount> accounts);

  void removeAccountMentions(List<IAccount> accounts);

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


  IPostStatusPollBloc get pollBloc;

  IPostStatusData calculateCurrentPostStatusData();
}
