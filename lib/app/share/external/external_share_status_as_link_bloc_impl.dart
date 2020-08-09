import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:fedi/app/share/external/external_share_helper.dart';
import 'package:fedi/app/share/status/share_status_bloc.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class ExternalShareStatusAsLinkBloc extends DisposableOwner
    implements IShareStatusBloc {
  final String popupTitle;
  @override
  final IStatus status;

  ExternalShareStatusAsLinkBloc({
    @required this.popupTitle,
    @required this.status,
  });

  @override
  Future share() async {
    var text = status.url;
    Share.text(
      popupTitle,
      text,
      ExternalShareHelper.textMimeType,
    );
  }

  @override
  bool get isPossibleToShare => true;

  @override
  Stream<bool> get isPossibleToShareStream => Stream.value(true);
}
