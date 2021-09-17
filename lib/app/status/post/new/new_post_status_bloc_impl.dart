import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/status/post/post_status_bloc_impl.dart';
import 'package:fedi/app/status/post/post_status_bloc_proxy_provider.dart';
import 'package:fedi/app/status/post/post_status_model.dart';
import 'package:fedi/app/status/post/settings/post_status_settings_bloc.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/scheduled/repository/scheduled_status_repository.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class NewPostStatusBloc extends PostStatusBloc {
  NewPostStatusBloc({
    required IUnifediApiStatusService unifediApiStatusService,
    required IStatusRepository statusRepository,
    required IScheduledStatusRepository scheduledStatusRepository,
    required IUnifediApiMediaAttachmentService unifediApiMediaAttachmentService,
    required int? maximumMessageLength,
    required UnifediApiInstancePollLimits? pollLimits,
    required int? maximumFileSizeInBytes,
    required bool markMediaAsNsfwOnAttach,
    required bool isPleromaInstance,
    required IPostStatusData initialData,
  }) : super(
          isExpirePossible: isPleromaInstance,
          unifediApiStatusService: unifediApiStatusService,
          statusRepository: statusRepository,
          scheduledStatusRepository: scheduledStatusRepository,
          unifediApiMediaAttachmentService: unifediApiMediaAttachmentService,
          maximumMessageLength: maximumMessageLength,
          initialData: initialData,
          pollLimits: pollLimits,
          maximumFileSizeInBytes: maximumFileSizeInBytes,
          markMediaAsNsfwOnAttach: markMediaAsNsfwOnAttach,
          unfocusOnClear: true,
        );

  NewPostStatusBloc.withInitial({
    required IUnifediApiStatusService unifediApiStatusService,
    required IStatusRepository statusRepository,
    required IScheduledStatusRepository scheduledStatusRepository,
    required IUnifediApiMediaAttachmentService unifediApiMediaAttachmentService,
    required int? maximumMessageLength,
    required UnifediApiInstancePollLimits? pollLimits,
    required int? maximumFileSizeInBytes,
    required UnifediApiVisibility initialVisibility,
    required String? initialText,
    required String? initialSubject,
    required List<UnifediApiMediaAttachment>? initialMediaAttachments,
    required bool? markMediaAsNsfwOnAttach,
    required String? initialLanguage,
    required bool isPleromaInstance,
  }) : this(
          isPleromaInstance: isPleromaInstance,
          unifediApiStatusService: unifediApiStatusService,
          scheduledStatusRepository: scheduledStatusRepository,
          statusRepository: statusRepository,
          unifediApiMediaAttachmentService: unifediApiMediaAttachmentService,
          maximumMessageLength: maximumMessageLength,
          initialData: PostStatusBloc.defaultInitData.copyWith(
            visibilityString: initialVisibility.stringValue,
            language: initialLanguage,
            text: initialText,
            subject: initialSubject,
            mediaAttachments: initialMediaAttachments,
          ),
          pollLimits: pollLimits,
          maximumFileSizeInBytes: maximumFileSizeInBytes,
          markMediaAsNsfwOnAttach: markMediaAsNsfwOnAttach ?? false,
        );

  static NewPostStatusBloc createFromContextWithInitial(
    BuildContext context, {
    required String? initialText,
    required String? initialSubject,
    required List<UnifediApiMediaAttachment>? initialMediaAttachments,
  }) {
    var info = ICurrentAuthInstanceBloc.of(context, listen: false)
        .currentInstance!
        .info!;

    var postStatusSettingsBloc =
        IPostStatusSettingsBloc.of(context, listen: false);

    return NewPostStatusBloc.withInitial(
      unifediApiStatusService: Provider.of<IUnifediApiStatusService>(
        context,
        listen: false,
      ),
      statusRepository: IStatusRepository.of(
        context,
        listen: false,
      ),
      unifediApiMediaAttachmentService:
          Provider.of<IUnifediApiMediaAttachmentService>(
        context,
        listen: false,
      ),
      initialLanguage: postStatusSettingsBloc.defaultStatusLocale?.localeString,
      initialVisibility: postStatusSettingsBloc.defaultVisibilityAsUnifediApi,
      initialText: initialText,
      initialSubject: initialSubject,
      initialMediaAttachments: initialMediaAttachments,
      maximumMessageLength: info.limits?.status?.maxTootChars,
      pollLimits: info.limits?.poll,
      maximumFileSizeInBytes: info.limits?.media?.uploadLimit,
      markMediaAsNsfwOnAttach: postStatusSettingsBloc.markMediaAsNsfwOnAttach,
      isPleromaInstance: info.typeAsUnifediApi.isPleroma,
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
    required List<UnifediApiMediaAttachment>? initialMediaAttachments,
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
      unifediApiStatusService: Provider.of<IUnifediApiStatusService>(
        context,
        listen: false,
      ),
      statusRepository: IStatusRepository.of(
        context,
        listen: false,
      ),
      unifediApiMediaAttachmentService:
          Provider.of<IUnifediApiMediaAttachmentService>(
        context,
        listen: false,
      ),
      initialData: initialData,
      maximumMessageLength: info.maxTootChars,
      pollLimits: info.pollLimits,
      maximumFileSizeInBytes: info.uploadLimit,
      markMediaAsNsfwOnAttach: postStatusSettingsBloc.markMediaAsNsfwOnAttach,
      isPleromaInstance: info.typeAsUnifediApi.isPleroma,
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
