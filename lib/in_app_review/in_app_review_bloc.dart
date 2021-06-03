import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IInAppReviewBloc implements IDisposable {
  static IInAppReviewBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IInAppReviewBloc>(context, listen: listen);

  Future<bool> isAvailable();

  Future<void> requestReview();

  Future<void> openStoreListing();
}
