import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/status/sensitive/display_time_storage/status_sensitive_display_time_storage_bloc.dart';
import 'package:fedi_app/app/status/sensitive/settings/status_sensitive_settings_bloc.dart';
import 'package:fedi_app/app/status/sensitive/status_sensitive_bloc.dart';
import 'package:fedi_app/app/status/sensitive/status_sensitive_model.dart';
import 'package:fedi_app/app/status/status_bloc.dart';
import 'package:fedi_app/app/status/status_model.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

class StatusSensitiveBloc extends DisposableOwner
    implements IStatusSensitiveBloc {
  final IStatusBloc statusBloc;
  final IStatusSensitiveSettingsBloc statusSensitiveSettingsBloc;
  final IStatusSensitiveDisplayTimeStorageBloc
      statusSensitiveDisplayTimeStorageBloc;

  IStatus get status => statusBloc.status;

  bool get displayEnabled => _displayEnabledSubject.value;

  Stream<bool> get displayEnabledStream => _displayEnabledSubject.stream;

  bool get nsfwSensitive => statusBloc.nsfwSensitive;

  Stream<bool> get nsfwSensitiveStream => statusBloc.nsfwSensitiveStream;

  bool get containsSpoiler => statusBloc.containsSpoiler;

  Stream<bool> get containsSpoilerStream => statusBloc.containsSpoilerStream;

  // ignore: close_sinks, avoid-late-keyword
  late BehaviorSubject<bool> _displayEnabledSubject;

  StatusSensitiveBloc({
    required this.statusBloc,
    required this.statusSensitiveSettingsBloc,
    required this.statusSensitiveDisplayTimeStorageBloc,
    bool initialDisplayEnabled = false,
  }) {
    if (initialDisplayEnabled) {
      statusSensitiveDisplayTimeStorageBloc.onStatusDisplayEnabled(
        status: status,
      );
    }

    var statusLastDisplayEnabledTime = statusSensitiveDisplayTimeStorageBloc
        .findStatusLastDisplayEnabledTime(status: status);

    if (statusLastDisplayEnabledTime != null) {
      var diff = statusLastDisplayEnabledTime.difference(DateTime.now()).abs();

      var nsfwDisplayDelayDuration =
          statusSensitiveSettingsBloc.nsfwDisplayDelayDuration;
      if (nsfwDisplayDelayDuration != null && diff < nsfwDisplayDelayDuration) {
        initialDisplayEnabled = true;
      }
    }

    _displayEnabledSubject = BehaviorSubject.seeded(initialDisplayEnabled);
    _displayEnabledSubject.disposeWith(this);
  }

  @override
  void enableDisplay() {
    _displayEnabledSubject.add(true);
    statusSensitiveDisplayTimeStorageBloc.onStatusDisplayEnabled(
      status: status,
    );
  }

  @override
  bool get containsSpoilerAndDisplaySpoilerContentEnabled {
    if (containsSpoiler) {
      return displayEnabled;
    } else {
      return true;
    }
  }

  @override
  Stream<bool> get containsSpoilerAndDisplaySpoilerContentEnabledStream =>
      Rx.combineLatest2(
        containsSpoilerStream,
        displayEnabledStream,
        (bool containsSpoiler, bool displayEnabled) {
          if (containsSpoiler) {
            return displayEnabled;
          } else {
            return true;
          }
        },
      );

  @override
  bool get nsfwSensitiveAndDisplayNsfwContentEnabled {
    if (nsfwSensitive) {
      return displayEnabled;
    } else {
      return true;
    }
  }

  @override
  @override
  Stream<bool> get nsfwSensitiveAndDisplayNsfwContentEnabledStream =>
      Rx.combineLatest2(
        nsfwSensitiveStream,
        displayEnabledStream,
        (bool nsfwSensitive, bool displayEnabled) {
          if (nsfwSensitive) {
            return displayEnabled;
          } else {
            return true;
          }
        },
      );

  @override
  StatusSensitiveWarningState get statusWarningState =>
      StatusSensitiveWarningState(
        nsfwSensitive: nsfwSensitive,
        containsSpoiler: containsSpoiler,
        displayEnabled: displayEnabled,
      );

  @override
  Stream<StatusSensitiveWarningState> get statusWarningStateStream =>
      Rx.combineLatest3(
        nsfwSensitiveStream,
        containsSpoilerStream,
        displayEnabledStream,
        (
          bool nsfwSensitive,
          bool containsSpoiler,
          bool displayEnabled,
        ) =>
            StatusSensitiveWarningState(
          nsfwSensitive: nsfwSensitive,
          containsSpoiler: containsSpoiler,
          displayEnabled: displayEnabled,
        ),
      );

  @override
  bool get isAlwaysShowNsfw => statusSensitiveSettingsBloc.isAlwaysShowNsfw;

  @override
  bool get isAlwaysShowSpoiler =>
      statusSensitiveSettingsBloc.isAlwaysShowSpoiler;

  static StatusSensitiveBloc createFromContext({
    required BuildContext context,
    required IStatusBloc statusBloc,
    bool initialDisplayEnabled = false,
  }) =>
      StatusSensitiveBloc(
        statusBloc: statusBloc,
        statusSensitiveSettingsBloc: IStatusSensitiveSettingsBloc.of(
          context,
          listen: false,
        ),
        statusSensitiveDisplayTimeStorageBloc:
            IStatusSensitiveDisplayTimeStorageBloc.of(
          context,
          listen: false,
        ),
        initialDisplayEnabled: initialDisplayEnabled,
      );
}
