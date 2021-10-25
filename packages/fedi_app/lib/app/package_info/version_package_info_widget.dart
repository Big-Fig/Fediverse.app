import 'package:fedi_app/app/config/config_service.dart';
import 'package:fedi_app/app/ui/spacer/fedi_small_horizontal_spacer.dart';
import 'package:flutter/cupertino.dart';

class VersionPackageInfoWidget extends StatelessWidget {
  final TextStyle? textStyle;

  const VersionPackageInfoWidget({
    Key? key,
    this.textStyle,
  }) : super(key: key);

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
          configService.appVersionName,
          style: textStyle,
        ),
      ],
    );
  }
}
