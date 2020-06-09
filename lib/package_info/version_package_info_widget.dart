import 'package:flutter/cupertino.dart';
import 'package:package_info/package_info.dart';

class VersionPackageInfoWidget extends StatelessWidget {
  final TextStyle textStyle;

  VersionPackageInfoWidget({this.textStyle});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PackageInfo>(
      future: PackageInfo.fromPlatform(),
      builder: (BuildContext context, AsyncSnapshot<PackageInfo> snapshot) {
        if (snapshot.hasData) {
          return Text(
            snapshot.data.version,
            style: textStyle,
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
