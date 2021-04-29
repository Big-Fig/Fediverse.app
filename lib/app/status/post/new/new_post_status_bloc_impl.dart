import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/status/post/post_status_bloc_impl.dart';
import 'package:fedi/app/status/post/post_status_bloc_proxy_provider.dart';
import 'package:fedi/app/status/post/post_status_model.dart';
import 'package:fedi/app/status/post/settings/post_status_settings_bloc.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/scheduled/repository/scheduled_status_repository.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/api/instance/pleroma_api_instance_model.dart';
import 'package:fedi/pleroma/api/media/attachment/pleroma_api_media_attachment_model.dart';
import 'package:fedi/pleroma/api/media/attachment/pleroma_api_media_attachment_service.dart';
import 'package:fedi/pleroma/api/status/auth/pleroma_api_auth_status_service.dart';
import 'package:fedi/pleroma/api/visibility/pleroma_api_visibility_model.dart';
import 'package:flutter/widgets.dart';

class NewPostStatusBloc extends PostStatusBloc {
  NewPostStatusBloc({
    required IPleromaApiAuthStatusService pleromaAuthStatusService,
    required IStatusRepository statusRepository,
    required IScheduledStatusRepository scheduledStatusRepository,
    required IPleromaMediaAttachmentService pleromaMediaAttachmentService,
    required int? maximumMessageLength,
    required PleromaApiInstancePollLimits? pleromaInstancePollLimits,
    required int? maximumFileSizeInBytes,
    required bool markMediaAsNsfwOnAttach,
    required bool isPleromaInstance,
    required IPostStatusData initialData,
  }) : super(
          isExpirePossible: isPleromaInstance,
          pleromaAuthStatusService: pleromaAuthStatusService,
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
    required IPleromaApiAuthStatusService pleromaAuthStatusService,
    required IStatusRepository statusRepository,
    required IScheduledStatusRepository scheduledStatusRepository,
    required IPleromaMediaAttachmentService pleromaMediaAttachmentService,
    required int? maximumMessageLength,
    required PleromaApiInstancePollLimits? pleromaInstancePollLimits,
    required int? maximumFileSizeInBytes,
    required PleromaApiVisibility initialVisibility,
    required String? initialText,
    required String? initialSubject,
    required List<PleromaApiMediaAttachment>? initialMediaAttachments,
    required bool? markMediaAsNsfwOnAttach,
    required String? initialLanguage,
    required bool isPleromaInstance,
  }) : this(
          isPleromaInstance: isPleromaInstance,
          pleromaAuthStatusService: pleromaAuthStatusService,
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
          markMediaAsNsfwOnAttach: markMediaAsNsfwOnAttach ?? false,
        );

  static NewPostStatusBloc createFromContextWithInitial(
    BuildContext context, {
    required String? initialText,
    required String? initialSubject,
    required List<PleromaApiMediaAttachment>? initialMediaAttachments,
  }) {
    var info = ICurrentAuthInstanceBloc.of(context, listen: false)
        .currentInstance!
        .info!;

    var postStatusSettingsBloc =
        IPostStatusSettingsBloc.of(context, listen: false);

    return NewPostStatusBloc.withInitial(
      pleromaAuthStatusService: IPleromaApiAuthStatusService.of(
        context,
        listen: false,
      ),
      statusRepository: IStatusRepository.of(
        context,
        listen: false,
      ),
      pleromaMediaAttachmentService: IPleromaMediaAttachmentService.of(
        context,
        listen: false,
      ),
      initialLanguage: postStatusSettingsBloc.defaultStatusLocale?.localeString,
      initialVisibility: postStatusSettingsBloc.defaultVisibilityAsPleromaApi,
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
    required Widget child,
    required String? initialText,
    required String? initialSubject,
    required List<PleromaApiMediaAttachment>? initialMediaAttachments,
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
    required IPostStatusData initialData,
  }) {
    var info = ICurrentAuthInstanceBloc.of(context, listen: false)
        .currentInstance!
        .info!;

    var postStatusSettingsBloc =
        IPostStatusSettingsBloc.of(context, listen: false);

    return NewPostStatusBloc(
      pleromaAuthStatusService: IPleromaApiAuthStatusService.of(
        context,
        listen: false,
      ),
      statusRepository: IStatusRepository.of(
        context,
        listen: false,
      ),
      pleromaMediaAttachmentService: IPleromaMediaAttachmentService.of(
        context,
        listen: false,
      ),
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
    required Widget child,
    required IPostStatusData initialData,
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
