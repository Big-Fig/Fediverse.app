import 'package:fedi/app/share/entity/settings/share_entity_settings_bloc.dart';
import 'package:fedi/app/share/entity/share_entity_bloc.dart';
import 'package:fedi/app/share/entity/share_entity_model.dart';
import 'package:fedi/app/share/external/external_share_bloc.dart';
import 'package:fedi/app/share/external/external_share_bloc_impl.dart';
import 'package:fedi/app/share/external/external_share_bloc_proxy_provider.dart';
import 'package:fedi/app/share/external/external_share_model.dart';
import 'package:fedi/app/share/external/external_share_service.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ExternalShareEntityBloc extends ExternalShareBloc
    implements IShareEntityBloc {
  final IShareEntitySettingsBloc shareEntitySettingsBloc;
  final String popupTitle;

  @override
  ShareEntity shareEntity;

  ExternalShareEntityBloc({
    required this.popupTitle,
    required this.shareEntity,
    required this.shareEntitySettingsBloc,
    required IExternalShareService externalShareService,
  }) : super(externalShareService: externalShareService);

  @override
  bool get isPossibleToShare => true;

  @override
  Stream<bool> get isPossibleToShareStream => Stream.value(true);

  @override
  Future share() async {
    var text = await combineAllItemsAsRawText(
      settings: shareEntitySettingsBloc.shareEntitySettings,
    );
    var mediaAttachments = await combineAllItemsAsMediaAttachments(
      settings: shareEntitySettingsBloc.shareEntitySettings,
    );

    return externalShareService.share(
      popupTitle: popupTitle,
      text: text,
      urlFiles: mediaAttachments
          ?.map(
            (mediaAttachment) => ShareUrlFile.fromUrl(
              url: mediaAttachment.url,
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
      );
}
