import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/status/post/post_status_bloc_impl.dart';
import 'package:fedi/app/status/post/post_status_bloc_proxy_provider.dart';
import 'package:fedi/app/status/post/post_status_model.dart';
import 'package:fedi/app/status/post/settings/post_status_settings_bloc.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/scheduled/repository/scheduled_status_repository.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class NewPostStatusBloc extends PostStatusBloc {
  NewPostStatusBloc({
    required IPleromaApiAuthStatusService pleromaAuthStatusService,
    required IStatusRepository statusRepository,
    required IScheduledStatusRepository scheduledStatusRepository,
    required IPleromaApiMediaAttachmentService pleromaMediaAttachmentService,
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
    required IPleromaApiMediaAttachmentService pleromaMediaAttachmentService,
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
            visibilityString: initialVisibility.toJsonValue(),
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
      pleromaAuthStatusService: Provider.of<IPleromaApiAuthStatusService>(
        context,
        listen: false,
      ),
      statusRepository: IStatusRepository.of(
        context,
        listen: false,
      ),
      pleromaMediaAttachmentService:
          Provider.of<IPleromaApiMediaAttachmentService>(
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
      pleromaAuthStatusService: Provider.of<IPleromaApiAuthStatusService>(
        context,
        listen: false,
      ),
      statusRepository: IStatusRepository.of(
        context,
        listen: false,
      ),
      pleromaMediaAttachmentService:
          Provider.of<IPleromaApiMediaAttachmentService>(
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
