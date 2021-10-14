import 'package:fedi/app/config/config_service.dart';
import 'package:fedi/in_app_review/checker/in_app_review_checker_bloc.dart';
import 'package:fedi/in_app_review/in_app_review_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

var _logger = Logger('in_app_review_checker_widget.dart');

class InAppReviewCheckerWidget extends StatefulWidget {
  final Widget child;

  const InAppReviewCheckerWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  InAppReviewCheckerWidgetState createState() =>
      InAppReviewCheckerWidgetState();
}

class InAppReviewCheckerWidgetState extends State<InAppReviewCheckerWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    checkInAppReview();
  }

  Future checkInAppReview() async {
    var configService = IConfigService.of(context, listen: false);

    if (configService.askReviewEnabled) {
      var inAppReviewCheckerBloc =
          IInAppReviewCheckerBloc.of(context, listen: false);

      var isNeedAskPermission = inAppReviewCheckerBloc.isNeedAskPermission;
      _logger.finest(() => 'isNeedAskPermission $isNeedAskPermission');

      if (isNeedAskPermission) {
        // todo: refactor
        // ignore: no-magic-number
        Future.delayed(
          // todo: refactor
          // ignore: no-magic-number
          const Duration(milliseconds: 100),
          () async {
            await inAppReviewCheckerBloc.onUserAnswer(userAgreeToReview: true);
            await IInAppReviewBloc.of(context, listen: false).requestReview();
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
