import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/status/post/post_status_bloc_impl.dart';
import 'package:fedi/app/status/post/post_status_bloc_proxy_provider.dart';
import 'package:fedi/app/status/post/post_status_model.dart';
import 'package:fedi/app/status/post/settings/post_status_settings_bloc.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/scheduled/repository/scheduled_status_repository.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/instance/pleroma_instance_model.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_service.dart';
import 'package:fedi/pleroma/status/pleroma_status_service.dart';
import 'package:fedi/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:flutter/widgets.dart';

class NewPostStatusBloc extends PostStatusBloc {
  NewPostStatusBloc({
    @required IPleromaStatusService pleromaStatusService,
    @required IStatusRepository statusRepository,
    @required IScheduledStatusRepository scheduledStatusRepository,
    @required IPleromaMediaAttachmentService pleromaMediaAttachmentService,
    @required int maximumMessageLength,
    @required PleromaInstancePollLimits pleromaInstancePollLimits,
    @required int maximumFileSizeInBytes,
    @required bool markMediaAsNsfwOnAttach,
    @required bool isPleromaInstance,
    @required IPostStatusData initialData,
  }) : super(
          isExpirePossible: isPleromaInstance,
          pleromaAuthStatusService: pleromaStatusService,
          statusRepository: statusRepository,
          scheduledStatusRepository: scheduledStatusRepository,
          pleromaMediaAttachmentService: pleromaMediaAttachmentService,
          maximumMessageLength: maximumMessageLength,
          initialData: initialData,
          pleromaInstancePollLimits: pleromaInstancePollLimits,
          maximumFileSizeInBytes: maximumFileSizeInBytes,
          markMediaAsNsfwOnAttach: markMediaAsNsfwOnAttach,
          unfocusOnClear: true,
        );

  NewPostStatusBloc.withInitial({
    @required IPleromaStatusService pleromaStatusService,
    @required IStatusRepository statusRepository,
    @required IScheduledStatusRepository scheduledStatusRepository,
    @required IPleromaMediaAttachmentService pleromaMediaAttachmentService,
    @required int maximumMessageLength,
    @required PleromaInstancePollLimits pleromaInstancePollLimits,
    @required int maximumFileSizeInBytes,
    @required PleromaVisibility initialVisibility,
    @required String initialText,
    @required String initialSubject,
    @required List<PleromaMediaAttachment> initialMediaAttachments,
    @required bool markMediaAsNsfwOnAttach,
    @required String initialLanguage,
    @required bool isPleromaInstance,
  }) : this(
          isPleromaInstance: isPleromaInstance,
          pleromaStatusService: pleromaStatusService,
          scheduledStatusRepository: scheduledStatusRepository,
          statusRepository: statusRepository,
          pleromaMediaAttachmentService: pleromaMediaAttachmentService,
          maximumMessageLength: maximumMessageLength,
          initialData: PostStatusBloc.defaultInitData.copyWith(
            visibility: initialVisibility.toJsonValue(),
            language: initialLanguage,
            text: initialText,
            subject: initialSubject,
            mediaAttachments: initialMediaAttachments,
          ),
          pleromaInstancePollLimits: pleromaInstancePollLimits,
          maximumFileSizeInBytes: maximumFileSizeInBytes,
          markMediaAsNsfwOnAttach: markMediaAsNsfwOnAttach,
        );

  static NewPostStatusBloc createFromContextWithInitial(
    BuildContext context, {
    @required String initialText,
    @required String initialSubject,
    @required List<PleromaMediaAttachment> initialMediaAttachments,
  }) {
    var info = ICurrentAuthInstanceBloc.of(context, listen: false)
        .currentInstance
        .info;

    var postStatusSettingsBloc =
        IPostStatusSettingsBloc.of(context, listen: false);

    return NewPostStatusBloc.withInitial(
      pleromaStatusService: IPleromaStatusService.of(context, listen: false),
      statusRepository: IStatusRepository.of(context, listen: false),
      pleromaMediaAttachmentService:
          IPleromaMediaAttachmentService.of(context, listen: false),
      initialLanguage: postStatusSettingsBloc.defaultStatusLocale?.localeString,
      initialVisibility: postStatusSettingsBloc.defaultVisibility,
      initialText: initialText,
      initialSubject: initialSubject,
      initialMediaAttachments: initialMediaAttachments,
      maximumMessageLength: info.maxTootChars,
      pleromaInstancePollLimits: info.pollLimits,
      maximumFileSizeInBytes: info.uploadLimit,
      markMediaAsNsfwOnAttach: postStatusSettingsBloc.markMediaAsNsfwOnAttach,
      isPleromaInstance: info.isPleroma,
      scheduledStatusRepository: IScheduledStatusRepository.of(
        context,
        listen: false,
      ),
    );
  }

  static Widget provideToContextWithInitial(
    BuildContext context, {
    @required Widget child,
    @required String initialText,
    @required String initialSubject,
    @required List<PleromaMediaAttachment> initialMediaAttachments,
  }) {
    return DisposableProvider<IPostStatusBloc>(
      create: (context) => NewPostStatusBloc.createFromContextWithInitial(
        context,
        initialText: initialText,
        initialSubject: initialSubject,
        initialMediaAttachments: initialMediaAttachments,
      ),
      child: PostStatusMessageBlocProxyProvider(child: child),
    );
  }

  static NewPostStatusBloc createFromContext(
    BuildContext context, {
    @required PostStatusData initialData,
  }) {
    var info = ICurrentAuthInstanceBloc.of(context, listen: false)
        .currentInstance
        .info;

    var postStatusSettingsBloc =
        IPostStatusSettingsBloc.of(context, listen: false);

    return NewPostStatusBloc(
      pleromaStatusService: IPleromaStatusService.of(context, listen: false),
      statusRepository: IStatusRepository.of(context, listen: false),
      pleromaMediaAttachmentService:
          IPleromaMediaAttachmentService.of(context, listen: false),
      initialData: initialData,
      maximumMessageLength: info.maxTootChars,
      pleromaInstancePollLimits: info.pollLimits,
      maximumFileSizeInBytes: info.uploadLimit,
      markMediaAsNsfwOnAttach: postStatusSettingsBloc.markMediaAsNsfwOnAttach,
      isPleromaInstance: info.isPleroma,
      scheduledStatusRepository: IScheduledStatusRepository.of(
        context,
        listen: false,
      ),
    );
  }

  static Widget provideToContext(
    BuildContext context, {
    @required Widget child,
    @required IPostStatusData initialData,
  }) {
    return DisposableProvider<IPostStatusBloc>(
      create: (context) => NewPostStatusBloc.createFromContext(
        context,
        initialData: initialData,
      ),
      child: PostStatusMessageBlocProxyProvider(child: child),
    );
  }

  @override
  bool get isPossibleToChangeVisibility => true;
}
