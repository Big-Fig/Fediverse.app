import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/in_app_review/in_app_review_bloc.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:logging/logging.dart';

final _logger = Logger('in_app_review_bloc_impl.dart');

class InAppReviewBloc extends DisposableOwner implements IInAppReviewBloc {
  final String appStoreId;

  InAppReviewBloc({
    required this.appStoreId,
  });

  final InAppReview inAppReview = InAppReview.instance;

  @override
  Future<bool> isAvailable() async {
    var available = await inAppReview.isAvailable();
    _logger.finest(() => 'isAvailable $available');

    return available;
  }

  @override
  Future<void> openStoreListing() {
    _logger.finest(() => 'openStoreListing');

    return inAppReview.openStoreListing(
      appStoreId: appStoreId,
    );
  }

  @override
  Future<void> requestReview() async {
    _logger.finest(() => 'requestReview');
    var available = await isAvailable();
    if (available) {
      return inAppReview.requestReview();
    }
  }
}
