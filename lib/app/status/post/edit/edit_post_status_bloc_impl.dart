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

typedef PostStatusDataCallback = Future<bool> Function(
  IPostStatusData postStatusData,
);

class EditPostStatusBloc extends PostStatusBloc {
  final PostStatusDataCallback postStatusDataCallback;

  EditPostStatusBloc({
    required IPleromaApiAuthStatusService pleromaAuthStatusService,
    required IStatusRepository statusRepository,
    required IScheduledStatusRepository scheduledStatusRepository,
    required IPleromaApiMediaAttachmentService pleromaMediaAttachmentService,
    required IPostStatusData initialData,
    required this.postStatusDataCallback,
    required int? maximumMessageLength,
    required PleromaApiInstancePollLimits? pleromaInstancePollLimits,
    required int? maximumFileSizeInBytes,
    required bool markMediaAsNsfwOnAttach,
    required bool isPleromaInstance,
  }) : super(
          isExpirePossible: isPleromaInstance,
          pleromaAuthStatusService: pleromaAuthStatusService,
          statusRepository: statusRepository,
          scheduledStatusRepository: scheduledStatusRepository,
          pleromaMediaAttachmentService: pleromaMediaAttachmentService,
          initialData: initialData,
          maximumMessageLength: maximumMessageLength,
          pleromaInstancePollLimits: pleromaInstancePollLimits,
          maximumFileSizeInBytes: maximumFileSizeInBytes,
          markMediaAsNsfwOnAttach: markMediaAsNsfwOnAttach,
          unfocusOnClear: true,
        );

  static EditPostStatusBloc createFromContext(
    BuildContext context, {
    required IPostStatusData initialData,
    required PostStatusDataCallback postStatusDataCallback,
  }) {
    var info = ICurrentAuthInstanceBloc.of(context, listen: false)
        .currentInstance!
        .info!;
    var postStatusSettingsBloc =
        IPostStatusSettingsBloc.of(context, listen: false);

    return EditPostStatusBloc(
      pleromaAuthStatusService: Provider.of<IPleromaApiAuthStatusService>(
        context,
        listen: false,
      ),
      statusRepository: IStatusRepository.of(context, listen: false),
      pleromaMediaAttachmentService:
          Provider.of<IPleromaApiMediaAttachmentService>(context,
              listen: false),
      initialData: initialData,
      postStatusDataCallback: postStatusDataCallback,
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
    required IPostStatusData? initialData,
    required PostStatusDataCallback postStatusDataCallback,
  }) {
    return DisposableProvider<IPostStatusBloc>(
      create: (context) => EditPostStatusBloc.createFromContext(
        context,
        initialData: initialData!,
        postStatusDataCallback: postStatusDataCallback,
      ),
      child: PostStatusMessageBlocProxyProvider(child: child),
    );
  }

  @override
  bool get isPossibleToChangeVisibility => true;

  @override
  Future<bool> internalPostStatusData(IPostStatusData postStatusData) =>
      postStatusDataCallback(postStatusData);
}
