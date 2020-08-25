import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:flutter/cupertino.dart';

class FediUltraLightGreyDivider extends StatelessWidget {
  final double height;


  const FediUltraLightGreyDivider({this.height = 1});

  @override
  Widget build(BuildContext context) =>
      Container(height: height, width: double.infinity, color: FediColors.ultraLightGrey);
}
