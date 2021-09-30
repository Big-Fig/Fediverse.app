import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/media/attachment/reupload/media_attachment_reupload_service.dart';
import 'package:fedi/app/share/entity/settings/share_entity_settings_bloc.dart';
import 'package:fedi/app/share/entity/share_entity_bloc.dart';
import 'package:fedi/app/share/entity/share_entity_model.dart';
import 'package:fedi/app/share/external/external_share_bloc.dart';
import 'package:fedi/app/share/external/external_share_bloc_impl.dart';
import 'package:fedi/app/share/external/external_share_bloc_proxy_provider.dart';
import 'package:fedi/app/share/external/external_share_model.dart';
import 'package:fedi/app/share/external/external_share_service.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

class ExternalShareEntityBloc extends ExternalShareBloc
    implements IShareEntityBloc {
  final IUnifediApiMediaAttachmentService unifediApiMediaAttachmentService;
  final IMediaAttachmentReuploadService mediaAttachmentReuploadService;
  final IShareEntitySettingsBloc shareEntitySettingsBloc;
  final String popupTitle;

  @override
  ShareEntity shareEntity;

  ExternalShareEntityBloc({
    required this.popupTitle,
    required this.shareEntity,
    required this.shareEntitySettingsBloc,
    required this.mediaAttachmentReuploadService,
    required this.unifediApiMediaAttachmentService,
    required IExternalShareService externalShareService,
  }) : super(
          externalShareService: externalShareService,
        );

  @override
  bool get isPossibleToShare => true;

  @override
  Stream<bool> get isPossibleToShareStream => Stream.value(true);

  @override
  Future share() async {
    var text = convertAllItemsToRawText(
      settings: shareEntitySettingsBloc.shareEntitySettings,
    );
    var mediaAttachments = await convertAllItemsToMediaAttachments(
      settings: shareEntitySettingsBloc.shareEntitySettings,
      unifediApiMediaAttachmentService: unifediApiMediaAttachmentService,
      mediaAttachmentReuploadService: mediaAttachmentReuploadService,
      reUploadRequired: false,
    );

    return externalShareService.share(
      popupTitle: popupTitle,
      text: text,
      urlFiles: mediaAttachments
          ?.map(
            (mediaAttachment) => ShareUrlFile.fromUrl(
              url: mediaAttachment.url!,
            ),
          )
          .toList(),
    );
  }

  static Widget provideToContext(
    BuildContext context, {
    required ShareEntity shareEntity,
    required String popupTitle,
    required Widget child,
  }) {
    return DisposableProvider<ExternalShareEntityBloc>(
      create: (context) => createFromContext(
        context,
        shareEntity: shareEntity,
        popupTitle: popupTitle,
      ),
      child: ProxyProvider<ExternalShareEntityBloc, IExternalShareBloc>(
        update: (context, value, previous) => value,
        child: ProxyProvider<ExternalShareEntityBloc, IShareEntityBloc>(
          update: (context, value, previous) => value,
          child: ExternalShareBlocProxyProvider(
            child: child,
          ),
        ),
      ),
    );
  }

  static ExternalShareEntityBloc createFromContext(
    BuildContext context, {
    required ShareEntity shareEntity,
    required String popupTitle,
  }) =>
      ExternalShareEntityBloc(
        shareEntity: shareEntity,
        externalShareService: IExternalShareService.of(
          context,
          listen: false,
        ),
        shareEntitySettingsBloc: IShareEntitySettingsBloc.of(
          context,
          listen: false,
        ),
        popupTitle: popupTitle,
        unifediApiMediaAttachmentService:
            Provider.of<IUnifediApiMediaAttachmentService>(
          context,
          listen: false,
        ),
        mediaAttachmentReuploadService: IMediaAttachmentReuploadService.of(
          context,
          listen: false,
        ),
      );
}
