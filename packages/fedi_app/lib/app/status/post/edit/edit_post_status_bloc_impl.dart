import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/access/current/current_access_bloc.dart';
import 'package:fedi_app/app/status/post/edit/edit_post_status_bloc.dart';
import 'package:fedi_app/app/status/post/post_status_bloc.dart';
import 'package:fedi_app/app/status/post/post_status_bloc_impl.dart';
import 'package:fedi_app/app/status/post/post_status_bloc_proxy_provider.dart';
import 'package:fedi_app/app/status/post/post_status_model.dart';
import 'package:fedi_app/app/status/post/settings/post_status_settings_bloc.dart';
import 'package:fedi_app/app/status/repository/status_repository.dart';
import 'package:fedi_app/app/status/scheduled/repository/scheduled_status_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

typedef PostStatusDataCallback = Future<bool> Function(
  IPostStatusData postStatusData,
);

class EditPostStatusBloc extends PostStatusBloc implements IEditPostStatusBloc {
  final PostStatusDataCallback postStatusDataCallback;

  EditPostStatusBloc({
    required IUnifediApiStatusService unifediApiStatusService,
    required IStatusRepository statusRepository,
    required IScheduledStatusRepository scheduledStatusRepository,
    required IUnifediApiMediaAttachmentService unifediApiMediaAttachmentService,
    required IPostStatusData initialData,
    required this.postStatusDataCallback,
    required int? maximumMessageLength,
    required IUnifediApiInstancePollLimits? pollLimits,
    required int? maximumFileSizeInBytes,
    required bool markMediaAsNsfwOnAttach,
    required bool dontUploadMediaDuringEditing,
    required bool isPleromaInstance,
    required int? maximumMediaAttachmentCount,
  }) : super(
          dontUploadMediaDuringEditing: dontUploadMediaDuringEditing,
          maximumMediaAttachmentCount: maximumMediaAttachmentCount,
          isExpirePossible: isPleromaInstance,
          unifediApiStatusService: unifediApiStatusService,
          statusRepository: statusRepository,
          scheduledStatusRepository: scheduledStatusRepository,
          unifediApiMediaAttachmentService: unifediApiMediaAttachmentService,
          initialData: initialData,
          maximumMessageLength: maximumMessageLength,
          pollLimits: pollLimits,
          maximumFileSizeInBytes: maximumFileSizeInBytes,
          markMediaAsNsfwOnAttach: markMediaAsNsfwOnAttach,
          unfocusOnClear: true,
        );

  static EditPostStatusBloc createFromContext(
    BuildContext context, {
    required IPostStatusData initialData,
    required PostStatusDataCallback postStatusDataCallback,
  }) {
    var info =
        ICurrentAccessBloc.of(context, listen: false).currentInstance!.info!;
    var postStatusSettingsBloc =
        IPostStatusSettingsBloc.of(context, listen: false);

    return EditPostStatusBloc(
      unifediApiStatusService: Provider.of<IUnifediApiStatusService>(
        context,
        listen: false,
      ),
      statusRepository: IStatusRepository.of(context, listen: false),
      unifediApiMediaAttachmentService:
          Provider.of<IUnifediApiMediaAttachmentService>(
        context,
        listen: false,
      ),
      initialData: initialData,
      postStatusDataCallback: postStatusDataCallback,
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
    required IPostStatusData? initialData,
    required PostStatusDataCallback postStatusDataCallback,
  }) =>
      DisposableProvider<IPostStatusBloc>(
        create: (context) => EditPostStatusBloc.createFromContext(
          context,
          initialData: initialData!,
          postStatusDataCallback: postStatusDataCallback,
        ),
        child: PostStatusMessageBlocProxyProvider(child: child),
      );

  @override
  bool get isPossibleToChangeVisibility => true;

  @override
  Future<bool> internalPostStatusData(IPostStatusData postStatusData) =>
      postStatusDataCallback(postStatusData);
}
