import 'package:fedi/app/share/external/external_share_bloc.dart';
import 'package:fedi/app/share/external/external_share_bloc_impl.dart';
import 'package:fedi/app/share/external/external_share_bloc_proxy_provider.dart';
import 'package:fedi/app/share/external/external_share_model.dart';
import 'package:fedi/app/share/external/external_share_service.dart';
import 'package:fedi/app/share/media/share_media_bloc.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ExternalShareMediaBloc extends ExternalShareBloc
    implements IShareMediaBloc {
  final String popupTitle;

  @override
  final IPleromaMediaAttachment mediaAttachment;

  ExternalShareMediaBloc({
    required this.popupTitle,
    required this.mediaAttachment,
    required IExternalShareService externalShareService,
  }) : super(externalShareService: externalShareService);

  @override
  bool get isPossibleToShare => true;

  @override
  Stream<bool> get isPossibleToShareStream => Stream.value(true);

  @override
  Future share() {
    String? text;
    var asLink = asLinkBoolField.currentValue == true;
    if (message?.isNotEmpty == true || asLink) {
      text = message ?? "";
      if (asLink) {
        text += " ${mediaAttachment.url}";
      }
    }
    return externalShareService.share(
      popupTitle: popupTitle,
      text: text,
      urlFiles: asLink
          ? null
          : [
              ShareUrlFile.fromUrl(
                url: mediaAttachment.url,
              ),
            ],
    );
  }

  static Widget provideToContext(
    BuildContext context, {
    required IPleromaMediaAttachment mediaAttachment,
    required String popupTitle,
    required Widget child,
  }) {
    return DisposableProvider<ExternalShareMediaBloc>(
      create: (context) => createFromContext(
        context,
        mediaAttachment: mediaAttachment,
        popupTitle: popupTitle,
      ),
      child: ProxyProvider<ExternalShareMediaBloc, IExternalShareBloc>(
        update: (context, value, previous) => value,
        child: ProxyProvider<ExternalShareMediaBloc, IShareMediaBloc>(
          update: (context, value, previous) => value,
          child: ExternalShareBlocProxyProvider(
            child: child,
          ),
        ),
      ),
    );
  }

  static ExternalShareMediaBloc createFromContext(
    BuildContext context, {
    required IPleromaMediaAttachment mediaAttachment,
    required String popupTitle,
  }) =>
      ExternalShareMediaBloc(
        mediaAttachment: mediaAttachment,
        externalShareService: IExternalShareService.of(
          context,
          listen: false,
        ),
        popupTitle: popupTitle,
      );
}
