import 'package:fedi/app/config/config_service.dart';
import 'package:fedi/app/ui/spacer/fedi_small_horizontal_spacer.dart';
import 'package:flutter/cupertino.dart';

class VersionPackageInfoWidget extends StatelessWidget {
  final TextStyle? textStyle;

  const VersionPackageInfoWidget({this.textStyle});

  @override
  Widget build(BuildContext context) {
    var configService = IConfigService.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Text(
          configService.appTitle,
          style: textStyle,
        ),
        const FediSmallHorizontalSpacer(),
        Text(
          configService.appVersionName + '(${configService.appVersionCode})',
          style: textStyle,
        ),
      ],
    );
  }
}
