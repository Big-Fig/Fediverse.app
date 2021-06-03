import 'package:fedi/app/package_info/package_info_helper.dart';
import 'package:fedi/app/ui/spacer/fedi_small_horizontal_spacer.dart';
import 'package:flutter/cupertino.dart';
import 'package:package_info/package_info.dart';

class VersionPackageInfoWidget extends StatelessWidget {
  final TextStyle? textStyle;

  const VersionPackageInfoWidget({this.textStyle});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PackageInfo>(
      future: PackageInfo.fromPlatform(),
      builder: (BuildContext context, AsyncSnapshot<PackageInfo> snapshot) {
        if (snapshot.hasData) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FutureBuilder<String>(
                future: FediPackageInfoHelper.getAppName(),
                builder: (context, snapshot) {
                  return Text(
                    snapshot.data ?? '',
                    style: textStyle,
                  );
                },
              ),
              const FediSmallHorizontalSpacer(),
              Text(
                snapshot.data!.version,
                style: textStyle,
              ),
            ],
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
