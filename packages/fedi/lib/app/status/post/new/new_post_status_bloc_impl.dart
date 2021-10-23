import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/access/current/current_access_bloc.dart';
import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/status/post/post_status_bloc_impl.dart';
import 'package:fedi/app/status/post/post_status_bloc_proxy_provider.dart';
import 'package:fedi/app/status/post/post_status_model.dart';
import 'package:fedi/app/status/post/settings/post_status_settings_bloc.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/scheduled/repository/scheduled_status_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

class NewPostStatusBloc extends PostStatusBloc {
  NewPostStatusBloc({
    required IUnifediApiStatusService unifediApiStatusService,
    required IStatusRepository statusRepository,
    required IScheduledStatusRepository scheduledStatusRepository,
    required IUnifediApiMediaAttachmentService unifediApiMediaAttachmentService,
    required int? maximumMessageLength,
    required IUnifediApiInstancePollLimits? pollLimits,
    required int? maximumFileSizeInBytes,
    required bool markMediaAsNsfwOnAttach,
    required bool dontUploadMediaDuringEditing,
    required bool isPleromaInstance,
    required IPostStatusData initialData,
    required int? maximumMediaAttachmentCount,
  }) : super(
          dontUploadMediaDuringEditing: dontUploadMediaDuringEditing,
          maximumMediaAttachmentCount: maximumMediaAttachmentCount,
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
    required IUnifediApiInstancePollLimits? pollLimits,
    required int? maximumFileSizeInBytes,
    required UnifediApiVisibility initialVisibility,
    required String? initialText,
    required String? initialSubject,
    required List<UnifediApiMediaAttachment>? initialMediaAttachments,
    required bool markMediaAsNsfwOnAttach,
    required bool dontUploadMediaDuringEditing,
    required String? initialLanguage,
    required bool isPleromaInstance,
    required int? maximumMediaAttachmentCount,
  }) : this(
          dontUploadMediaDuringEditing: dontUploadMediaDuringEditing,
          maximumMediaAttachmentCount: maximumMediaAttachmentCount,
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
          markMediaAsNsfwOnAttach: markMediaAsNsfwOnAttach,
        );

  static NewPostStatusBloc createFromContextWithInitial(
    BuildContext context, {
    required String? initialText,
    required String? initialSubject,
    required List<UnifediApiMediaAttachment>? initialMediaAttachments,
  }) {
    var info = ICurrentUnifediApiAccessBloc.of(context, listen: false)
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
      maximumMediaAttachmentCount:
          info.limits?.status?.maxMediaAttachmentsCount,
      markMediaAsNsfwOnAttach: postStatusSettingsBloc.markMediaAsNsfwOnAttach,
      dontUploadMediaDuringEditing:
          postStatusSettingsBloc.dontUploadMediaDuringEditing,
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
  }) =>
      DisposableProvider<IPostStatusBloc>(
        create: (context) => NewPostStatusBloc.createFromContextWithInitial(
          context,
          initialText: initialText,
          initialSubject: initialSubject,
          initialMediaAttachments: initialMediaAttachments,
        ),
        child: PostStatusMessageBlocProxyProvider(child: child),
      );

  static NewPostStatusBloc createFromContext(
    BuildContext context, {
    required IPostStatusData initialData,
  }) {
    var info = ICurrentUnifediApiAccessBloc.of(context, listen: false)
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
      maximumMessageLength: info.limits?.status?.maxTootChars,
      pollLimits: info.limits?.poll,
      maximumFileSizeInBytes: info.limits?.media?.uploadLimit,
      maximumMediaAttachmentCount:
          info.limits?.status?.maxMediaAttachmentsCount,
      markMediaAsNsfwOnAttach: postStatusSettingsBloc.markMediaAsNsfwOnAttach,
      dontUploadMediaDuringEditing:
          postStatusSettingsBloc.dontUploadMediaDuringEditing,
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
  }) =>
      DisposableProvider<IPostStatusBloc>(
        create: (context) => NewPostStatusBloc.createFromContext(
          context,
          initialData: initialData,
        ),
        child: PostStatusMessageBlocProxyProvider(child: child),
      );

  @override
  bool get isPossibleToChangeVisibility => true;
}
