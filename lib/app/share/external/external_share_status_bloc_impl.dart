import 'package:fedi/app/html/html_text_helper.dart';
import 'package:fedi/app/share/external/external_share_bloc.dart';
import 'package:fedi/app/share/external/external_share_bloc_impl.dart';
import 'package:fedi/app/share/external/external_share_bloc_proxy_provider.dart';
import 'package:fedi/app/share/external/external_share_model.dart';
import 'package:fedi/app/share/external/external_share_service.dart';
import 'package:fedi/app/share/status/share_status_bloc.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ExternalShareStatusBloc extends ExternalShareBloc
    implements IShareStatusBloc {
  final String popupTitle;

  @override
  IStatus status;

  ExternalShareStatusBloc({
    required this.popupTitle,
    required this.status,
    required IExternalShareService externalShareService,
  }) : super(externalShareService: externalShareService);

  @override
  bool get isPossibleToShare => true;

  @override
  Stream<bool> get isPossibleToShareStream => Stream.value(true);

  @override
  Future share() {
    var asLink = asLinkBoolField.currentValue == true;
    var content = status.content?.extractRawStringFromHtmlString();
    var text = message ?? "";
    if (asLink) {
      text += " ${status.url}";
    } else {
      var spoilerText = status.spoilerText;
      if (spoilerText?.isNotEmpty == true) {
        text += " ${spoilerText?.extractRawStringFromHtmlString()}";
      }

      text += " $content";
    }

    return externalShareService.share(
      popupTitle: popupTitle,
      text: text,
      urlFiles: asLink
          ? null
          : status.mediaAttachments
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
    required IStatus status,
    required String popupTitle,
    required Widget child,
  }) {
    return DisposableProvider<ExternalShareStatusBloc>(
      create: (context) => createFromContext(
        context,
        status: status,
        popupTitle: popupTitle,
      ),
      child: ProxyProvider<ExternalShareStatusBloc, IExternalShareBloc>(
        update: (context, value, previous) => value,
        child: ProxyProvider<ExternalShareStatusBloc, IShareStatusBloc>(
          update: (context, value, previous) => value,
          child: ExternalShareBlocProxyProvider(
            child: child,
          ),
        ),
      ),
    );
  }

  static ExternalShareStatusBloc createFromContext(
    BuildContext context, {
    required IStatus status,
    required String popupTitle,
  }) =>
      ExternalShareStatusBloc(
        status: status,
        externalShareService: IExternalShareService.of(
          context,
          listen: false,
        ),
        popupTitle: popupTitle,
      );
}
