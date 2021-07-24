import 'package:easy_dispose/easy_dispose.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IInAppReviewCheckerBloc extends IDisposable {
  static IInAppReviewCheckerBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IInAppReviewCheckerBloc>(context, listen: listen);

  bool get isNeedAskPermission;

  Future onUserAnswer(bool result);
}
