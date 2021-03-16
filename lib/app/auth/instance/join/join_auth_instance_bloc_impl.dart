import 'package:fedi/app/auth/instance/join/join_auth_instance_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:flutter/cupertino.dart';

const _defaultInstanceDomain = "fedi.app";

class JoinAuthInstanceBloc extends DisposableOwner
    implements IJoinAuthInstanceBloc {
  @override
  final bool isFromScratch;
  @override
  final TextEditingController hostTextController = TextEditingController();

  JoinAuthInstanceBloc({required this.isFromScratch}) {
    addDisposable(textEditingController: hostTextController);
  }

  @override
  Uri extractCurrentUri() {
    var uriText = hostTextController.text;

    if (uriText?.isNotEmpty != true) {
      uriText = _defaultInstanceDomain;
    }

    var parsedUri = Uri.parse(uriText);

    Uri uri;
    var scheme = parsedUri.scheme;
    if (scheme?.isNotEmpty != true) {
      uri = Uri.parse("https://$uriText");
    } else {
      uri = parsedUri;
    }

    return uri;
  }
}
