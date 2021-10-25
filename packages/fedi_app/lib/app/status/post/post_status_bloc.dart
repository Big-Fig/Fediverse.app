import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/message/post_message_bloc.dart';
import 'package:fedi_app/app/status/post/poll/post_status_poll_bloc.dart';
import 'package:fedi_app/app/status/post/post_status_model.dart';
import 'package:fedi_app/app/status/status_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

abstract class IPostStatusBloc implements IPostMessageBloc {
  bool get isAnyTextEntered;

  Stream<bool> get isAnyTextEnteredStream;

  bool get isAnyDataEntered;

  static IPostStatusBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IPostStatusBloc>(
        context,
        listen: listen,
      );

  // ignore: no-magic-number
  static const Duration requiredDurationToScheduleDateTime =
      Duration(minutes: 5);
  static const Duration minimumExpireDuration = Duration(hours: 1);

  bool get isExpirePossible;

  List<String?>? get mentionedAccts;

  Stream<List<String?>> get mentionedAcctsStream;

  bool get isPossibleToChangeVisibility;

  UnifediApiVisibility? get visibility;

  Stream<UnifediApiVisibility> get visibilityStream;

  bool? get isNsfwSensitiveEnabled;

  Stream<bool?> get isNsfwSensitiveEnabledStream;

  TextEditingController get subjectTextController;

  FocusNode get subjectFocusNode;

  String? get subjectText;

  Stream<String?> get subjectTextStream;

  void addAccountMentions(List<IAccount?> accounts);

  void removeAccountMentions(List<IAccount> accounts);

  void removeMentionByAcct(String acct);

  void changeVisibility(UnifediApiVisibility visibility);

  // ignore: avoid_positional_boolean_parameters
  void changeNsfwSensitive(bool nsfwSensitive);

  void setScheduledAt(DateTime? dateTime);

  void clearScheduleAt();

  bool get isScheduledAtExist;

  Stream<bool> get isScheduledAtExistStream;

  DateTime? get scheduledAt;

  Stream<DateTime?> get scheduledAtStream;

  void setExpireDuration(Duration? duration);

  void clearExpireDuration();

  bool get isExpireDurationExist;

  Stream<bool> get isExpireDurationExistStream;

  Duration? get expireDuration;

  Stream<Duration?> get expireDurationStream;

  String? get inputWithoutMentionedAcctsText;

  Stream<String?> get inputWithoutMentionedAcctsTextStream;

  bool get isHaveMentionedAccts;

  Stream<bool> get isHaveMentionedAcctsStream;

  IStatus? get originInReplyToStatus;

  IPostStatusPollBloc get pollBloc;

  IPostStatusData calculateCurrentPostStatusData();
}
