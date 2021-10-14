import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/analytics/app/app_analytics_bloc.dart';
import 'package:fedi/app/config/config_service.dart';
import 'package:fedi/in_app_review/ask/local_preferences/ask_in_app_review_local_preference_bloc.dart';
import 'package:fedi/in_app_review/checker/in_app_review_checker_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

final _logger = Logger('in_app_review_checker_bloc_impl.dart');

class InAppReviewCheckerBloc extends DisposableOwner
    implements IInAppReviewCheckerBloc {
  final IConfigService configService;
  final IAppAnalyticsBloc appAnalyticsBloc;
  final IAskInAppReviewLocalPreferenceBloc askInAppReviewLocalPreferenceBloc;

  InAppReviewCheckerBloc({
    @required required this.appAnalyticsBloc,
    @required required this.configService,
    required this.askInAppReviewLocalPreferenceBloc,
  });

  @override
  Future onUserAnswer({
    required bool userAgreeToReview,
  }) async {
    await askInAppReviewLocalPreferenceBloc.setValue(true);
  }

  @override
  bool get isNeedAskPermission {
    if (configService.askReviewCountAppOpenedToShow == null) {
      return false;
    }

    final askReviewCountAppOpenedToShow =
        configService.askReviewCountAppOpenedToShow!;
    var askInAppReviewAsked = askInAppReviewLocalPreferenceBloc.value;
    var appOpenedCount = appAnalyticsBloc.appOpenedCount;
    var isNeedCheckPermission =
        !askInAppReviewAsked && appOpenedCount >= askReviewCountAppOpenedToShow;
    _logger.finest(
      () => ' askReviewCountAppOpenedToShow $askReviewCountAppOpenedToShow \n'
          ' askInAppReviewAsked $askInAppReviewAsked \n'
          ' appOpenedCount $appOpenedCount \n'
          ' isNeedCheckPermission $isNeedCheckPermission',
    );

    return isNeedCheckPermission;
  }

  static InAppReviewCheckerBloc createFromContext(
    BuildContext context,
  ) =>
      InAppReviewCheckerBloc(
        appAnalyticsBloc: IAppAnalyticsBloc.of(
          context,
          listen: false,
        ),
        configService: IConfigService.of(
          context,
          listen: false,
        ),
        askInAppReviewLocalPreferenceBloc:
            IAskInAppReviewLocalPreferenceBloc.of(
          context,
          listen: false,
        ),
      );

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
  }) =>
      DisposableProvider<IInAppReviewCheckerBloc>(
        create: (context) => InAppReviewCheckerBloc.createFromContext(
          context,
        ),
        child: child,
      );
}
